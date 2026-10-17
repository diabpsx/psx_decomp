"""Relayout driver: per TU, refresh the per-TU SYM dump (tools/symlane.py) so our SLD lines are current,
then run tools/relayout.py against it.  usage: relayout_all.py [--apply] [--whole] [FILE.CPP ...]
--whole uses the whole-program dump instead of refreshing per-TU dumps (first pass only)."""
import sys, pathlib, collections, re, subprocess
import pathlib as _p; sys.path.insert(0, str(_p.Path(__file__).resolve().parent)); import relayout as RL
apply = '--apply' in sys.argv; whole = '--whole' in sys.argv; safe = '--safe' in sys.argv
pick = [a.upper() for a in sys.argv[1:] if not a.startswith('--')]
retail = RL.functions(RL.load(RL.RETAIL))
whole_dump = RL.functions(RL.load(RL.ROOT / 'build/native_program/link/diabpsx.munged.sym.txt'))
files = sorted({f['file'] for f in whole_dump.values() if f['file'].endswith('.CPP')})
if pick: files = [f for f in files if f in pick]
total = collections.Counter(); reasons = collections.Counter(); perfile = {}
for base in files:
    cands = [p for d in ('recon/psxsrc', 'recon/source') for p in [pathlib.Path(d) / base.lower()] if p.is_file()]
    if not cands: print('no source for', base); continue
    path = cands[0]
    if whole:
        ours = whole_dump
    else:
        r = subprocess.run([sys.executable, 'tools/symlane.py', str(path)], capture_output=True, text=True)
        dump = RL.ROOT / 'build' / 'sn' / (path.stem + '_g.sym.txt')
        if not dump.is_file():
            print('symlane failed for', base, r.stdout[-300:], r.stderr[-300:]); continue
        ours = RL.functions(RL.load(dump))
    src = RL.Source(path); RL.MANUAL.clear()
    rep, notes = RL.relayout(src, retail, ours, apply=apply, safe=safe)
    if apply and sum(v for k, v in rep.items() if k not in ('manual', 'already exact', 'cannot locate')): src.save()
    total.update(rep); perfile[base] = dict(rep)
    for n, why in RL.MANUAL: reasons[re.sub(r'\d+', 'N', why)[:70]] += 1
    for n in notes: reasons['NOTE ' + n[1]] += 1
    print(base, dict(rep), flush=True)
print('TOTAL', dict(total))
for why, n in reasons.most_common(12): print(f'{n:5d}  {why}')
