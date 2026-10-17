"""Explain a function's SLD residue: our source lines with their retail target lines, the retail
points we lack / have extra, and the PC twin's text when a twin file exists.
usage: sldwhy.py <recon/.../x.cpp> <function-name> [...]   (per-TU dump build/sn/<stem>_g.sym.txt must be fresh)"""
import sys, re, pathlib
HERE = pathlib.Path(__file__).resolve().parent; ROOT = HERE.parent
sys.path.insert(0, str(HERE)); import relayout as RL
path = pathlib.Path(sys.argv[1]); names = sys.argv[2:]
retail = RL.functions(RL.load(RL.RETAIL)); ours = RL.functions(RL.load(ROOT / 'build' / 'sn' / (path.stem + '_g.sym.txt')))
src = RL.Source(path); lg = src.logical()
twin = None
for cand in (ROOT.parent / 'refs' / 'devilution' / 'Source' / (path.stem + '.cpp'), ROOT.parent / 'refs' / 'devilution' / 'Source' / (path.stem + '.c')):
    if cand.is_file(): twin = cand.read_text(encoding='latin-1', errors='replace').split('\n'); break
for name in names:
    if name not in ours or name not in retail: print('??', name); continue
    r, o = retail[name], ours[name]; rp = dict(r['points']); op = dict(o['points'])
    print(f'===== {name}: retail {{ line {r["line"]}, ours {{ line {o["line"]}; blocks retail {[(b[1], b[2]) for b in r["blocks"]]} ours {[(b[1], b[2]) for b in o["blocks"]]}')
    by_line = {}
    for off, ln in o['points']: by_line.setdefault(ln, []).append((off, rp.get(off)))
    extra_retail = [(off, ln) for off, ln in r['points'] if off not in op]
    hits = src.physical_of(o['line'], lg)
    if len(hits) != 1: print('  cannot locate'); continue
    code = RL.code_only(src.lines); close = RL.find_function_end(code, hits[0])
    for i in range(hits[0] - 1, close + 1):
        ln = lg[i]; tags = by_line.get(ln)
        t = ''
        if tags: t = '  -> ' + ','.join(str(x[1]) if x[1] is not None else f'(none @+{x[0]:#x})' for x in tags)
        print(f'  {ln:5d}{t:28s}| {src.lines[i][:100]}')
    if extra_retail:
        print('  retail-only points (offset -> retail line):', [(hex(a), l) for a, l in extra_retail])
    if twin:
        base = re.sub(r'__.*$', '', name)
        for j, l in enumerate(twin):
            if re.match(r'^\w[\w\s\*]*\b' + re.escape(base) + r'\s*\(', l) and not l.rstrip().endswith(';'):
                k = j
                while k < len(twin) and not twin[k].startswith('}'): k += 1
                print('  --- twin ---'); print('\n'.join('  | ' + x[:100] for x in twin[j:k + 1][:80])); break
