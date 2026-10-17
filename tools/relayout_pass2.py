"""Relayout pass 2: the unsafe moves (one-line statement reorders, footprint-less statement hoists),
one function at a time, each kept only if the TU's bytes+SYM gate and its SLD still pass.
usage: relayout_pass2.py [FILE.CPP ...]"""
import sys, pathlib, collections, subprocess, json, io, contextlib
HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE)); import relayout as RL
import native_recon as R
ROOT = RL.ROOT
pick = [a.upper() for a in sys.argv[1:] if not a.startswith('--')]
retail = RL.functions(RL.load(RL.RETAIL))
whole = RL.functions(RL.load(ROOT / 'build/native_program/link/diabpsx.munged.sym.txt'))
registry = json.load(open(ROOT / 'configs/native_recon_link.json'))
files = sorted({f['file'] for f in whole.values() if f['file'].endswith('.CPP')})
if pick: files = [f for f in files if f in pick]


def symlane(path):
    r = subprocess.run([sys.executable, str(HERE / 'symlane.py'), str(path)], capture_output=True, text=True, cwd=ROOT)
    dump = ROOT / 'build' / 'sn' / (path.stem + '_g.sym.txt')
    return RL.functions(RL.load(dump)) if dump.is_file() else None


def gate(seg):
    buf = io.StringIO()
    try:
        with contextlib.redirect_stdout(buf), contextlib.redirect_stderr(buf):
            R.build(only=[seg])
        return True, ''
    except BaseException as e:
        return False, (str(e) or buf.getvalue())[-200:]


total = collections.Counter()
for base in files:
    path = next((p for d in ('recon/psxsrc', 'recon/source') for p in [ROOT / d / base.lower()] if p.is_file()), None)
    if path is None: continue
    seg = path.stem if path.stem in registry else ('dlg_2' if path.stem == 'dlg' else None)
    if seg is None:
        print(base, 'no registry segment; skipped'); continue
    ours = symlane(path)
    if ours is None: print(base, 'no dump'); continue
    src = RL.Source(path); RL.MANUAL.clear()
    rep, _ = RL.relayout(src, retail, ours, apply=False, safe=False)
    # candidates: functions the unsafe mode can lay out that the safe mode cannot
    safe_src = RL.Source(path); RL.MANUAL.clear()
    RL.relayout(safe_src, retail, ours, apply=False, safe=True)
    deferred = {n for n, why in RL.MANUAL if 'deferred' in why or 'cannot reach' in why}
    RL.MANUAL.clear()
    cands = []
    for n in deferred:
        s = RL.Source(path); RL.MANUAL.clear()
        rep1, _ = RL.relayout(s, retail, ours, apply=False, safe=False, only=[n])
        if rep1.get('manual', 0) == 0 and rep1.get('cannot locate', 0) == 0 and sum(rep1.values()):
            cands.append(n)
    if not cands:
        print(base, 'no candidates', flush=True); continue
    kept = []
    for n in cands:
        before = path.read_bytes()
        s = RL.Source(path); RL.MANUAL.clear()
        RL.relayout(s, retail, ours, apply=True, safe=False, only=[n]); s.save()
        ok, why = gate(seg)
        if ok:
            fresh = symlane(path)
            r, o = retail[n], fresh.get(n) if fresh else None
            ok = o is not None and r['points'] == o['points'] and r['line'] == o['line']
            why = 'SLD not exact after move' if not ok else ''
        if ok:
            kept.append(n); ours = fresh   # later functions locate against the fresh dump
        else:
            path.write_bytes(before)
            print(f'  {base} {n}: reverted ({why.strip()[:120]})', flush=True)
    total['kept'] += len(kept); total['reverted'] += len(cands) - len(kept)
    print(base, 'kept', len(kept), 'of', len(cands), flush=True)
print('TOTAL', dict(total))
