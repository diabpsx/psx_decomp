#!/usr/bin/env python3
"""pc_twins.py — work-order helper (rule: PC-twinned functions first).  For every SYM function, look for a
definition of the same base name in refs/devilution/Source (1.09 layout) and refs/devilutionx/Source; write
skel/PC_TWINS.md (TUs ranked by twin coverage, then the per-function table) and skel/pc_twins.json.

    python tools/pc_twins.py
"""
import json, re, sys
from pathlib import Path
from collections import defaultdict

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
import symtypes as ST
import gen_skeleton as GS      # demangle_head, oracle_name, seg_of, rel_path, by_file

REFS = ROOT.parent / "refs"
DEF = re.compile(r"^[A-Za-z_][\w \t*&:<>,]*?\b([A-Za-z_]\w*)\s*\([^;{}]*\)\s*(?:const\s*)?\{", re.M)

def defs(root):
    names = defaultdict(set)
    for p in root.rglob("*.cpp"):
        try: t = p.read_text(encoding="utf-8", errors="replace")
        except Exception: continue
        for m in DEF.finditer(t):
            names[m.group(1).lower()].add(p.relative_to(root).as_posix())
    return names

def main():
    dev = defs(REFS / "devilution" / "Source")
    devx = defs(REFS / "devilutionx" / "Source")
    rows, per_tu = [], defaultdict(lambda: [0, 0])
    for file, fns in GS.by_file.items():
        rel = GS.rel_path(file)
        for f in fns:
            base, cls, const = GS.demangle_head(f["name"])
            key = base.lower()
            a, b = dev.get(key), devx.get(key)
            on = GS.oracle_name(f["name"], f["va"]); seg = GS.seg_of.get(on) if on else "?"
            rows.append((rel, f["va"], f["name"], seg, sorted(a)[0] if a else "", sorted(b)[0] if b else ""))
            per_tu[rel][1] += 1
            if a or b: per_tu[rel][0] += 1
    rows.sort(key=lambda r: (r[0], r[1]))
    ranked = sorted(per_tu.items(), key=lambda kv: (-kv[1][0] / kv[1][1], -kv[1][0]))
    out = ["# PC twins (devilution / devilutionx) — work order helper", "",
           "Rule: match the twinned functions first.  Coverage = SYM functions of the TU with a same-named definition in a PC port.", "",
           "| TU | twinned | functions | coverage |", "|---|---|---|---|"]
    for tu, (n, t) in ranked:
        out.append(f"| {tu} | {n} | {t} | {100 * n // t}% |")
    out += ["", "## Functions", "", "| TU | VA | function | seg | devilution | devilutionx |", "|---|---|---|---|---|---|"]
    for rel, va, name, seg, a, b in rows:
        out.append(f"| {rel} | 0x{va:08X} | {name} | {seg} | {a} | {b} |")
    (ROOT / "skel" / "PC_TWINS.md").write_text("\n".join(out) + "\n", encoding="utf-8")
    (ROOT / "skel" / "pc_twins.json").write_text(json.dumps({r[2]: {"tu": r[0], "devilution": r[4], "devilutionx": r[5]} for r in rows}, indent=1), encoding="utf-8")
    tw = sum(n for n, t in per_tu.values()); tot = sum(t for n, t in per_tu.values())
    print(f"twinned {tw}/{tot} functions; top TUs: " + ", ".join(f"{tu} {n}/{t}" for tu, (n, t) in ranked[:12]))

if __name__ == "__main__":
    main()
