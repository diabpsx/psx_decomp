"""Re-insert the comment lines the early relayout passes dropped (before dropped comments were kept
above the function anchor): every comment line present in the pre-layout tree (git revision BASE)
and absent from the current file is placed directly above the `#line` anchor of the function that
follows its original position.  usage: relayout_recover_comments.py [--apply] [BASE]"""
import sys, subprocess, pathlib, re
HERE = pathlib.Path(__file__).resolve().parent; ROOT = HERE.parent
sys.path.insert(0, str(HERE)); import relayout as RL
apply = '--apply' in sys.argv
base = next((a for a in sys.argv[1:] if not a.startswith('--')), 'af73636')
changed = subprocess.run(['git', 'diff', '--name-only', base, 'HEAD', '--', 'recon'], capture_output=True, text=True, cwd=ROOT).stdout.split()
total = 0
for rel in changed:
    if not rel.endswith(('.cpp', '.h')): continue
    old = subprocess.run(['git', 'show', f'{base}:{rel}'], capture_output=True, cwd=ROOT).stdout.decode('latin-1').replace('\r\n', '\n').split('\n')
    src = RL.Source(ROOT / rel); cur = src.lines
    if not any(l.startswith('#line') for l in cur): continue
    old_code = RL.code_only(old); cur_code = RL.code_only(cur)
    old_comments = [(i, l) for i, l in enumerate(old) if l.strip() and old_code[i].strip() == '' and not l.strip().startswith('#')]
    present = set(l.strip() for i, l in enumerate(cur) if cur_code[i].strip() == '')
    missing = [(i, l) for i, l in old_comments if l.strip() not in present]
    if not missing: continue
    # map each missing comment to the function that follows it in the old file: the next line that opens a
    # function body (`{` alone after a signature) -> that function's signature text -> anchor in the current file
    sigs = {}
    for i, l in enumerate(old):
        if old_code[i].strip() == '{' and i > 0 and old_code[i - 1].strip() and not old_code[i - 1].rstrip().endswith((';', '{', '}')):
            sigs[i] = old_code[i - 1].strip()
    inserts = {}   # current index of the anchor -> comment lines
    unplaced = 0
    for i, l in missing:
        nxt = next((k for k in sorted(sigs) if k > i), None)
        if nxt is None: unplaced += 1; continue
        sig = sigs[nxt]
        hit = next((k for k in range(len(cur)) if cur_code[k].strip() == sig and k > 0 and cur[k - 1].startswith('#line')), None)
        if hit is None: unplaced += 1; continue
        inserts.setdefault(hit - 1, []).append(l)
    if not inserts: continue
    n = sum(len(v) for v in inserts.values()); total += n
    print(f'{rel}: {n} comment lines to restore, {unplaced} unplaced')
    if apply:
        for k in sorted(inserts, reverse=True):
            cur[k:k] = inserts[k]
        src.save()
print('TOTAL', total, '[applied]' if apply else '')
