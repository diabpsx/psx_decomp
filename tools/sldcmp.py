"""Per-function SLD compare: retail rom/DIABPSX-SYM.txt vs a per-TU symlane dump (build/sn/<seg>_g.sym.txt)
or a whole-program munged dump (pass its path).  usage: sldcmp.py <seg>|<dump.txt> [-v] [-q]
Points are (offset from function start, line); -q prints only the per-file totals."""
import re, sys, collections
ROOT = r'C:\temp\diablo-psx\psx_decomp'
seg = sys.argv[1]; verbose = '-v' in sys.argv
rec = re.compile(r'^([0-9a-f]+): \$([0-9a-f]{8}) (\S+)(.*)$')
def load(path):
    recs = []
    for raw in open(path, encoding='latin-1'):
        m = rec.match(raw)
        if m: recs.append([int(m.group(2), 16), m.group(3), m.group(4).strip(), []])
        elif recs and raw.strip(): recs[-1][3].append(raw.strip())
    return recs
def functions(recs):
    """name -> [start, end, startline, points, file]; SLD points gathered from the whole stream by address."""
    pts = []; line = None; file = None; out = {}; cur = None
    for a, t, txt, extra in recs:
        if t == '88':
            m = re.search(r'line (\d+) of file (.*)$', txt); line = int(m.group(1)); file = m.group(2).split(chr(92))[-1].upper()
        elif t in ('80', '82', '84'):
            line = int(re.search(r'\(to (\d+)\)', txt).group(1))
        elif t == '86':
            line = int(re.search(r'to (\d+)', txt).group(1))
        if t in ('80', '82', '84', '86', '88'):
            pts.append((a, line, file))
        if t == '8c':
            d = dict(e.partition('=')[::2] for e in extra); d = {k.strip(): v.strip() for k, v in d.items()}
            cur = d['name']; out[cur] = [a, None, int(d['line']), [], d['file'].split(chr(92))[-1].upper()]
        elif t == '8e' and cur:
            out[cur][1] = a; cur = None
    for name, f in out.items():
        f[3] = [(a - f[0], ln, fl) for a, ln, fl in pts if f[0] <= a < f[1]]
    return out
R = functions(load(ROOT + r'\rom\DIABPSX-SYM.txt'))
O = functions(load(seg if seg.endswith('.txt') else ROOT + r'uild\sn' + seg + '_g.sym.txt'))
quiet = '-q' in sys.argv
ok = bad = 0
for name in O:
    if name not in R: print('  not in retail:', name); continue
    r, o = R[name], O[name]
    rp = sorted(set(r[3])); op = sorted(set(o[3]))
    same = rp == op and r[2] == o[2] and r[4] == o[4]
    ok += same; bad += not same
    if (not same or verbose) and not quiet:
        print(f'{"ok " if same else "SLD"} {name}: file {r[4]} / {o[4]}  start line {r[2]} / {o[2]}  size {r[1]-r[0]} / {o[1]-o[0]}  points {len(rp)} / {len(op)}')
        if not same or verbose:
            print('   retail', [(hex(off), ln) if f == r[4] else (hex(off), ln, f) for off, ln, f in rp])
            print('   ours  ', [(hex(off), ln) if f == o[4] else (hex(off), ln, f) for off, ln, f in op])
print(f'{seg[-40:]}: SLD exact {ok}/{ok+bad}')
if quiet:
    import collections
    byfile = collections.Counter(); tot = collections.Counter()
    for name in O:
        if name in R:
            r, o = R[name], O[name]; tot[r[4]] += 1
            if sorted(set(r[3])) == sorted(set(o[3])) and r[2] == o[2]: byfile[r[4]] += 1
    print('per file SLD-exact/total:', sorted(((f, byfile[f], tot[f]) for f in tot), key=lambda x: x[2]-x[1], reverse=True)[:25])
