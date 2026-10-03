#!/usr/bin/env python3
"""Explain standalone USEs in real GCC flow/combine dumps (diagnostic, not a gate).

First capture: python tools/instr/real_rtl.py SOURCE FUNCTION --dump flow,combine
Then inspect: python tools/instr/combine_uses.py build/rtl/TU-ID/input.i FUNCTION
The input prefix selects sibling .flow and .combine files from the same capture.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from instr.real_rtl import extract_function

TOKEN = re.compile(r'"(?:\\.|[^"\\])*"|[()\[\]]|[^()\[\]\s]+')
ROOT = re.compile(r'^\((?:insn|jump_insn|call_insn|note|code_label|barrier)\s+\d+\b', re.M)


def parse_form(text):
    """Parse one complete printed RTL form, including vectors and quoted strings."""
    tokens = TOKEN.findall(text)
    def read(index):
        if index >= len(tokens):
            raise ValueError('truncated RTL form')
        token = tokens[index]
        if token not in ('(', '['):
            if token in (')', ']'):
                raise ValueError('unexpected RTL closing delimiter')
            return token, index + 1
        closing = ')' if token == '(' else ']'
        result = [] if token == '(' else ['vector']
        index += 1
        while index < len(tokens) and tokens[index] != closing:
            value, index = read(index)
            result.append(value)
        if index == len(tokens):
            raise ValueError('truncated RTL form')
        return result, index + 1
    form, end = read(0)
    if end != len(tokens):
        raise ValueError('unexpected data after RTL form')
    return form


def opcode(node):
    if not isinstance(node, list) or not node or not isinstance(node[0], str):
        return ''
    return node[0].split(':', 1)[0].split('/', 1)[0]


def register(node):
    if opcode(node) == 'reg':
        return int(node[1])
    return None


def destination(node):
    """A MEM address register is a read, never a register destination."""
    while opcode(node) in ('subreg', 'strict_low_part', 'zero_extract', 'sign_extract'):
        node = node[1]
    return register(node)


def writes(node):
    op = opcode(node)
    if op in ('set', 'clobber'):
        reg = destination(node[1])
        if reg is not None:
            yield op, reg
    if isinstance(node, list):
        for child in node[1:]:
            if isinstance(child, list):
                yield from writes(child)


def records(text):
    text = re.sub(r'^;;.*$', '', text, flags=re.M)
    starts = list(ROOT.finditer(text))
    location = None
    seen = set()
    result = []
    for index, match in enumerate(starts):
        end = starts[index + 1].start() if index + 1 < len(starts) else len(text)
        raw = text[match.start():end].strip()
        node = parse_form(raw)
        uid = int(node[1])
        if uid in seen:
            raise ValueError('duplicate RTL instruction UID %d' % uid)
        seen.add(uid)
        if opcode(node) == 'note' and len(node) >= 6 and str(node[5]).isdigit():
            filename = node[4]
            if isinstance(filename, list) and len(filename) == 1:
                filename = filename[0]
            if int(node[5]) > 0 and isinstance(filename, str) and filename.startswith('"'):
                location = {'file':filename[1:-1], 'line':int(node[5])}
        result.append({'uid':uid, 'node':node, 'location':location,
                       'rtl':' '.join(raw.split())})
    if not result:
        raise ValueError('no RTL instruction records')
    return result


def analyze(flow, combine, function):
    before = records(extract_function(flow, function))
    after = records(extract_function(combine, function))
    before_writes, after_writes = {}, {}
    for items, table in ((before, before_writes), (after, after_writes)):
        for item in items:
            node = item['node']
            if opcode(node) not in ('insn', 'jump_insn', 'call_insn'):
                continue
            for kind, reg in writes(node[4]):
                table.setdefault(reg, []).append({'kind':kind, 'uid':item['uid'],
                                                   'location':item['location'], 'rtl':item['rtl']})
    groups = {}
    for item in after:
        node = item['node']
        if opcode(node) != 'insn' or opcode(node[4]) != 'use':
            continue
        reg = register(node[4][1])
        if reg is not None:
            groups.setdefault(reg, []).append(item['uid'])
    rows = []
    for reg, uses in sorted(groups.items()):
        prior = before_writes.get(reg, [])
        remaining = after_writes.get(reg, [])
        rows.append({'register':reg, 'use_uids':uses,
                     'flow_writes':prior, 'combine_writes':remaining,
                     'lost_all_sets':any(x['kind']=='set' for x in prior)
                                     and not any(x['kind']=='set' for x in remaining)})
    return {'function':function, 'standalone_uses':sum(len(x) for x in groups.values()),
            'registers_with_lost_sets':sum(row['lost_all_sets'] for row in rows),
            'registers':rows,
            'caution':'Missing SETs are combine evidence, not proof of a reload slot, frame size, '
                      'source variable, or retail match. Check real reload/assembly and SYM separately.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', type=Path, help='capture prefix, normally input.i')
    parser.add_argument('function', help='exact or unambiguous RTL function heading')
    args = parser.parse_args()
    paths = {name:Path(str(args.input)+'.'+name) for name in ('flow','combine')}
    try:
        data = {name:path.read_bytes() for name,path in paths.items()}
        report = analyze(data['flow'].decode('utf-8'), data['combine'].decode('utf-8'), args.function)
        report['inputs'] = {name:{'path':str(paths[name].resolve()),
                                 'sha256':hashlib.sha256(blob).hexdigest()}
                            for name,blob in data.items()}
        capture = args.input.parent/'capture.json'
        report['capture'] = verify_capture(capture, data) if capture.is_file() else None
        if report['capture'] is None:
            report['provenance_warning'] = 'No capture receipt: same-compiler/same-input provenance is unverified.'
    except (OSError, UnicodeError, ValueError, IndexError) as exc:
        parser.exit(1, str(exc)+'\n')
    print(json.dumps(report, indent=2, ensure_ascii=True))


def verify_capture(path, data):
    receipt = json.loads(path.read_text(encoding='utf-8'))
    for name, blob in data.items():
        if receipt.get('dump_sha256', {}).get(name) != hashlib.sha256(blob).hexdigest():
            raise ValueError('capture receipt does not match '+name+' dump')
    return receipt


if __name__ == '__main__':
    main()
