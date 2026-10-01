#!/usr/bin/env python3
"""Capture a reproducible, function-scoped allocator diagnostic (never a PASS gate).

Example: python tools/instr/match_probe.py recon/psxsrc/dialog.cpp
         DialogPrint__Fiiiiiiiiii --function DialogPrint --gates
Use an isolated diagnostic source explicitly when the stock frontend ICEs;
isolation can change compiler state and must be checked separately.
"""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
from instr.compare_tu import normalize
from instr.real_rtl import DUMPS

STOCK = Path('C:/temp/dmt-cc1/gccbuild-ecoff/cc1plus.exe')
INSTRUMENTED = Path('C:/temp/dmt-cc1/gccbuild-instr/cc1plus.exe')


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def dump_selection(value):
    names = value.split(',')
    if not names or len(set(names)) != len(names) or any(n not in DUMPS for n in names):
        raise argparse.ArgumentTypeError('choose unique comma-separated dumps: '+','.join(DUMPS))
    return names


def assembly_function(text, symbol):
    text = normalize(text)
    pattern = r'^\s*\.ent\s+' + re.escape(symbol) + r'\s*$'
    starts = list(re.finditer(pattern, text, re.M))
    if len(starts) != 1:
        raise ValueError(f'expected one assembly entry for {symbol}, got {len(starts)}')
    tail = text[starts[0].start():]
    end = re.search(r'^\s*\.end\s+' + re.escape(symbol) + r'\s*$', tail, re.M)
    if end is None:
        raise ValueError(f'missing assembly end for {symbol}')
    return tail[:end.end()]


def trace_function(text, function):
    headings = list(re.finditer(r'^===== FUNCTION (.*?) =====\s*$', text, re.M))
    matches = [i for i, h in enumerate(headings) if h[1] == function]
    if not matches:
        pattern = r'(?:^|\s|::)' + re.escape(function) + r'\s*\('
        matches = [i for i, h in enumerate(headings) if re.search(pattern, h[1])]
    if len(matches) != 1:
        raise ValueError(f'expected one trace heading for {function}, got {len(matches)}; use the full heading for overloads')
    i = matches[0]
    return text[headings[i].start():headings[i+1].start() if i+1 < len(headings) else len(text)]


def parse_allocations(trace):
    """Keep ranks and every attempt; do not infer source variable names or final bindings."""
    rows = {}
    orders = [line for line in trace.splitlines() if line.startswith('[allocno_compare]')]
    if len(orders) != 1:
        raise ValueError(f'expected one global allocation order, got {len(orders)}')
    for rank, match in enumerate(re.finditer(r'(\d+)/(\d+):(\d+)/(\d+)/(\d+)/(\d+)=(-?\d+)', orders[0]), 1):
        allocno, pseudo, refs, live, calls, size, priority = map(int, match.groups())
        if pseudo in rows:
            raise ValueError('duplicate pseudo in allocation order')
        rows[pseudo] = dict(rank=rank, allocno=allocno, pseudo=pseudo, refs=refs,
                            live=live, calls=calls, size=size, priority=priority, attempts=[])
    pattern = (r'\[find_reg\]\s+allocno (\d+) pseudo (\d+) refs (\d+) live (\d+) calls (\d+) '
               r'size (\d+) alt (\d+) ccl (\d+) retry (\d+) -> reg (-?\d+)')
    for match in re.finditer(pattern, trace):
        allocno, pseudo, refs, live, calls, size, alt, ccl, retry, register = map(int, match.groups())
        if pseudo not in rows or rows[pseudo]['allocno'] != allocno:
            raise ValueError('allocation attempt has no matching ordered pseudo')
        rows[pseudo]['attempts'].append(dict(register=register, alt=alt, call_clobbered=ccl,
                                            retry=retry, refs=refs, live=live, calls=calls, size=size))
    return list(rows.values())


def local_events(trace):
    """Quantities are block-local: preserve event order rather than merging reused IDs."""
    events = []
    for number, line in enumerate(trace.splitlines(), 1):
        order = re.match(r'\[(qty_sugg_order|qty_order)\s*\]', line)
        if order:
            rows = []
            for m in re.finditer(r'(\d+)/(\d+):(\d+)/(\d+)/(\d+)/(\d+)/(\d+)=(-?\d+)', line):
                rows.append(dict(zip(('qty','pseudo','refs','live','calls','suggestions','call_suggestions','priority'), map(int,m.groups()))))
            events.append(dict(line=number, kind=order[1], quantities=rows))
        elif line.startswith(('[find_free_reg]', '[qty_combine]', '[qty_sugg]', '[caller-save]')):
            events.append(dict(line=number, kind=line.split(']',1)[0][1:], detail=line))
    return events


def run_saved(command, folder, env=None):
    command = list(map(str, command))
    try:
        result = subprocess.run(command, cwd=folder, env=env, capture_output=True,
                                text=True, errors='replace', timeout=180)
        code, stdout, stderr = result.returncode, result.stdout, result.stderr
    except (OSError, subprocess.TimeoutExpired) as error:
        code, stdout, stderr = 2, '', str(error)
    (folder/'stdout.txt').write_text(stdout, encoding='utf-8')
    (folder/'stderr.txt').write_text(stderr, encoding='utf-8')
    return dict(command=command, returncode=code)


def report_text(report):
    lines = ['DIAGNOSTIC ONLY — not a retail matching seal',
             'Stock vs PsyQ target: ' + str(report.get('stock_matches_real')),
             'Instrumented vs stock target: ' + str(report.get('instrumented_matches_stock')),
             'Trace validated for this target: ' + str(report.get('trace_validated', False))]
    lines.extend('WARNING: '+e for e in report['errors'])
    lines.extend('NOTE: '+e for e in report.get('notes', []))
    for lane, frame in report.get('frames', {}).items():
        lines.append(lane+' frame: '+frame)
    lines.append('Local allocator events retained: '+str(len(report.get('local_events', []))))
    lines.append('rank pseudo refs live calls priority last-attempt-register')
    for row in report.get('allocations', []):
        attempts = row['attempts']
        register = attempts[-1]['register'] if attempts else 'unreported'
        lines.append(' '.join(str(row[k]) for k in ('rank','pseudo','refs','live','calls','priority'))+' '+str(register))
    for name, gate in report.get('gates', {}).items():
        lines.append(f'{name}: exit {gate["returncode"]}; see its saved output')
    return '\n'.join(lines)+'\n'


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('source', type=Path)
    parser.add_argument('symbol', help='exact compiler assembly symbol, not a suffixed board alias')
    parser.add_argument('--function', required=True, help='bare trace name or full trace heading')
    parser.add_argument('--stock', type=Path, default=STOCK)
    parser.add_argument('--instrumented', type=Path, default=INSTRUMENTED)
    parser.add_argument('--dump', type=dump_selection, default=['greg','lreg'],
                        help='comma-separated RTL passes; default greg,lreg; use jump2 for late tail merging')
    parser.add_argument('--gates', action='store_true', help='also run byte/SYM/call checks on this exact source')
    parser.add_argument('--gate-source', type=Path, help='original TU for gate checks when source is an explicitly isolated copy; requires --gates')
    args = parser.parse_args(argv)
    source = args.source.resolve()
    if args.gate_source and not args.gates:
        parser.error('--gate-source requires --gates')
    gate_source = args.gate_source.resolve() if args.gate_source else source
    if not source.is_file() or source.suffix.lower() != '.cpp':
        parser.error('this instrumented lane requires an existing C++ source')
    try:
        source.relative_to(B.ROOT)
        gate_source.relative_to(B.ROOT)
    except ValueError:
        parser.error('source must be inside the project')
    if not gate_source.is_file():
        parser.error('gate source does not exist')
    base = B.BUILD/'probes'
    base.mkdir(parents=True, exist_ok=True)
    out = Path(tempfile.mkdtemp(prefix='a-', dir=base))
    report = dict(source=str(source), source_sha256=sha(source), symbol=args.symbol,
                  function=args.function, diagnostic_only=True, errors=[], notes=[], compilers={}, frames={})
    if gate_source != source:
        report['notes'].append('Trace validation applies ONLY to the diagnostic source. Isolation equivalence to the gate source is NOT established.')
    cpp = run_saved([B.CPP, '-x', 'c', '-D__cplusplus=1', *B.CPP_FLAGS, source, '-o', out/'input.i'], out)
    report['preprocessor'] = cpp
    if cpp['returncode']:
        report['errors'].append('preprocessing failed; see stdout/stderr')
    else:
        report['preprocessed_sha256'] = sha(out/'input.i')
        overrides = B.per_tu_flags(source)
        flags = [f'-G{overrides.get("g_value", B.G_VALUE)}' if f == f'-G{B.G_VALUE}' else f
                 for f in B.CC1PL_FLAGS] + overrides.get('extra', [])
        report['flags'] = flags
        report['dumps'] = args.dump
        bodies = {}
        for lane, compiler in [('real', B.CC1PL), ('stock', args.stock.resolve()), ('instrumented', args.instrumented.resolve())]:
            folder = out/lane
            folder.mkdir()
            (folder/'input.i').write_bytes((out/'input.i').read_bytes())
            env = B._cc1_env()
            env.pop('GCC_TRACE_ALLOC', None)
            if lane == 'instrumented':
                env['GCC_TRACE_ALLOC'] = '1'
            result = run_saved([compiler, *flags, *(DUMPS[name][0] for name in args.dump),
                                'input.i', '-o', 'output.s'], folder, env)
            result['binary_sha256'] = sha(compiler) if compiler.is_file() else None
            report['compilers'][lane] = result
            if result['returncode']:
                report['errors'].append(lane+' compiler failed; diagnostics retained')
                continue
            missing = [name for name in args.dump if not (folder/('input.i'+DUMPS[name][1])).is_file()]
            if missing:
                report['errors'].append(lane+' missing requested dumps: '+','.join(missing))
            try:
                bodies[lane] = assembly_function((folder/'output.s').read_text(errors='replace'), args.symbol)
                (folder/'target.s.txt').write_text(bodies[lane])
                frame = re.search(r'^\s*\.frame[^\n]*', bodies[lane], re.M)
                report['frames'][lane] = frame[0].strip() if frame else 'not emitted'
            except (ValueError, OSError) as error:
                report['errors'].append(lane+': '+str(error))
        for left, right, field in [('real','stock','stock_matches_real'), ('stock','instrumented','instrumented_matches_stock')]:
            report[field] = bodies[left] == bodies[right] if left in bodies and right in bodies else None
            if report[field] is False:
                (out/(field+'.diff')).write_text(''.join(difflib.unified_diff(
                    bodies[left].splitlines(True), bodies[right].splitlines(True), fromfile=left, tofile=right)))
                report['errors'].append(field+' is false; trace is not validated for this target')
        try:
            trace = trace_function((out/'instrumented/stderr.txt').read_text(), args.function)
            (out/'target.trace.txt').write_text(trace)
            report['allocations'] = parse_allocations(trace) if '[allocno_compare]' in trace else []
            report['local_events'] = local_events(trace)
            if not report['allocations'] and not report['local_events']:
                raise ValueError('no allocator events found for the selected function')
        except (OSError, ValueError) as error:
            report['errors'].append(str(error))
        report['trace_validated'] = (report.get('stock_matches_real') is True and
                                     report.get('instrumented_matches_stock') is True and
                                     bool(report.get('allocations') or report.get('local_events')) and not report['errors'])
    if args.gates and not cpp['returncode']:
        report['gates'] = {}
        report['gate_source'] = dict(path=str(gate_source), sha256=sha(gate_source))
        for tool in ('verify_asm.py','aspsx_gate.py','symlane.py','callaudit.py'):
            folder = out/tool[:-3]
            folder.mkdir()
            # Gate tools own their usual build paths: do not run concurrent gates for the same TU.
            report['gates'][tool] = run_saved([sys.executable, B.ROOT/'tools'/tool, gate_source, args.symbol], folder)
    (out/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    (out/'report.txt').write_text(report_text(report), encoding='utf-8')
    print(f'Report: {out / "report.txt"}')
    print(f'Trace validated: {report.get("trace_validated", False)}; errors: {len(report["errors"])}')
    return 0 if report.get('trace_validated') and all(g['returncode'] == 0 for g in report.get('gates', {}).values()) else 1


if __name__ == '__main__':
    sys.exit(main())
