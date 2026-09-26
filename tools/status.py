#!/usr/bin/env python3
"""status.py — progress board: for every recon TU, gate every function of its splat
segment (the INCLUDE_ASM list in src/<seg>.c) and write MATCH_PROGRESS.md.

    python tools/status.py [seg ...]        # default: every seg that has a recon TU

Mapping recon TU -> segment: recon/<dir>/<seg>.c or .cpp  (seg = splat subsegment name =
lowercased MAP section name, e.g. recon/psxsrc/gman.cpp <-> src/gman.c <-> asm/nonmatchings/gman/).
Per-function verdict comes from tools/verify_asm.py (the sole gate)."""
import re, subprocess, sys, collections
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PY = sys.executable

def seg_functions(seg):
    """every function of the segment in VA order: the oracle .s files (splat writes trivial bodies such as an
    empty `jr ra` function as C in src/<seg>.c, so the INCLUDE_ASM list alone undercounts)"""
    d = ROOT / "asm" / "nonmatchings" / seg
    if not d.is_dir(): return []
    fns = []
    for p in d.glob("*.s"):
        m = re.search(r'/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s', p.read_text())
        g = re.search(r'^glabel\s+(\S+)', p.read_text(), re.M)
        if g: fns.append((int(m.group(1), 16) if m else 0, g.group(1)))
    return [n for _, n in sorted(fns)]

def recon_tus():
    out = {}
    for p in list((ROOT / "recon").rglob("*.c")) + list((ROOT / "recon").rglob("*.cpp")):
        out[p.stem.lower()] = p
    return out

def gate(tu: Path, fns):
    r = subprocess.run([PY, str(ROOT / "tools" / "verify_asm.py"), str(tu.relative_to(ROOT)), ",".join(fns)],
                       cwd=ROOT, capture_output=True, text=True)
    res = {}
    for m in re.finditer(r"^\s+(\S+): (PASS \((\d+) insns\)|FAIL (\d+) diffs \(ours (\d+) / oracle (\d+)\)|NOT IN OBJECT|NO ORACLE)", r.stdout, re.M):
        name = m.group(1)
        if m.group(2).startswith("PASS"): res[name] = ("PASS", int(m.group(3)), 0)
        elif m.group(2).startswith("FAIL"): res[name] = ("FAIL", int(m.group(6)), int(m.group(4)))
        else: res[name] = (m.group(2), 0, 0)
    if not res and r.returncode:
        print(f"[{tu}] gate error:\n{r.stdout}{r.stderr}", file=sys.stderr)
    return res

def sym_ok(tu: Path, fns):
    """{fn: True/False} from tools/symlane.py (the SYM receipt of the PASS rule)"""
    r = subprocess.run([PY, str(ROOT / "tools" / "symlane.py"), str(tu.relative_to(ROOT)), ",".join(fns)],
                       cwd=ROOT, capture_output=True, text=True)
    out = {}
    for m in re.finditer(r"^\s+(\S+): (SYM ok|SYM n/a|SYM DIFF|NO RETAIL SYM|NOT IN OBJECT)", r.stdout, re.M):
        out[m.group(1)] = m.group(2) in ("SYM ok", "SYM n/a")
    return out

def main():
    tus = recon_tus()
    segs = sys.argv[1:] or sorted(tus)
    total_all = sum(len(seg_functions(s)) for s in sorted(p.stem for p in (ROOT / "src").glob("*.c")))
    lines = ["# Match progress — PASS = bytes identical (tools/verify_asm.py) AND SYM records identical (tools/symlane.py); 🟡 = bytes only", ""]
    grand_pass = 0
    for seg in segs:
        fns = seg_functions(seg)
        if seg not in tus or not fns: continue
        res = gate(tus[seg], fns)
        sym = sym_ok(tus[seg], [f for f, v in res.items() if v[0] == "PASS"]) if any(v[0] == "PASS" for v in res.values()) else {}
        for f, v in list(res.items()):
            if v[0] == "PASS" and not sym.get(f, False):
                res[f] = ("SYMDIFF", v[1], 0)
        npass = sum(1 for v in res.values() if v[0] == "PASS")
        grand_pass += npass
        lines.append(f"## {seg}  ({tus[seg].relative_to(ROOT).as_posix()}) — {npass}/{len(fns)} PASS")
        for fn in fns:
            st = res.get(fn, ("TODO", 0, 0))
            if st[0] == "PASS": lines.append(f"- ✅ {fn} ({st[1]})")
            elif st[0] == "FAIL": lines.append(f"- ❌ {fn} — {st[2]} diffs (ours {st[1]})")
            elif st[0] == "SYMDIFF": lines.append(f"- 🟡 {fn} — bytes PASS, SYM differs")
            elif st[0] == "NOT IN OBJECT": lines.append(f"- ⬜ {fn}")
            else: lines.append(f"- ⬜ {fn} ({st[0]})")
        lines.append("")
        print(f"{seg}: {npass}/{len(fns)}")
    lines.insert(2, f"**Main image: {grand_pass} / {total_all} functions byte-matched ({100.0*grand_pass/total_all:.1f}%)**\n")
    (ROOT / "MATCH_PROGRESS.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"TOTAL {grand_pass}/{total_all}")

if __name__ == "__main__":
    main()
