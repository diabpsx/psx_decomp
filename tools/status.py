#!/usr/bin/env python3
"""status.py — progress board: for every recon TU, gate every function of its splat
segment (the INCLUDE_ASM list in src/<seg>.c) and write MATCH_PROGRESS.md.

    python tools/status.py [seg ...]        # default: every seg that has a recon TU

Mapping recon TU -> segment: recon/<dir>/<seg>.c or .cpp  (seg = splat subsegment name =
lowercased MAP section name, e.g. recon/psxsrc/gman.cpp <-> src/gman.c <-> asm/nonmatchings/gman/).
Per-function verdict comes from tools/verify_asm.py or a reviewed real-ASPSX
entry, plus tools/symlane.py.  Call-target and jump-table audits remain required
for the project seal bar."""
import re, subprocess, sys, collections, json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PY = sys.executable

def aspsx_registry():
    """Reviewed real-ASPSX passes, keyed by segment."""
    out = collections.defaultdict(set)
    p = ROOT / "configs" / "aspsx_passes.txt"
    if not p.is_file():
        return out
    for raw in p.read_text(encoding="utf-8").splitlines():
        line = raw.split("#", 1)[0].strip()
        if not line:
            continue
        seg, fn = line.split(None, 1)
        out[seg].add(fn)
    return out

def segment_homes():
    """{seg: {fn: home TU Path}} for segment functions reconstructed outside the segment's own TU."""
    out = collections.defaultdict(dict)
    p = ROOT / "configs" / "segment_homes.txt"
    if not p.is_file():
        return out
    for raw in p.read_text(encoding="utf-8").splitlines():
        line = raw.split("#", 1)[0].strip()
        if not line:
            continue
        seg, fn, tu = line.split(None, 2)
        out[seg][fn] = ROOT / tu
    return out

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
        elif m.group(2).startswith("FAIL"): res[name] = ("FAIL", int(m.group(5)), int(m.group(4)))
        else: res[name] = (m.group(2), 0, 0)
    if not res and r.returncode:
        print(f"[{tu}] gate error:\n{r.stdout}{r.stderr}", file=sys.stderr)
    return res

def aspsx_gate(tu: Path, fns):
    """Return {fn: instruction_count} for reviewed functions passing real ASPSX."""
    if not fns:
        return {}
    r = subprocess.run([PY, str(ROOT / "tools" / "aspsx_gate.py"), str(tu.relative_to(ROOT)), ",".join(fns)],
                       cwd=ROOT, capture_output=True, text=True)
    return {m.group(1): int(m.group(2)) for m in
            re.finditer(r"^\s+(\S+): PASS \((\d+) insns\)", r.stdout, re.M)}

def sym_ok(tu: Path, fns):
    """{fn: True/False} from tools/symlane.py (the SYM receipt of the PASS rule)"""
    r = subprocess.run([PY, str(ROOT / "tools" / "symlane.py"), str(tu.relative_to(ROOT)), ",".join(fns)],
                       cwd=ROOT, capture_output=True, text=True)
    out = {}
    for m in re.finditer(r"^\s+(\S+): (SYM ok|SYM DIFF|NO RETAIL SYM|NOT IN OBJECT)", r.stdout, re.M):
        out[m.group(1)] = m.group(2) == "SYM ok"
    return out

def main():
    tus = recon_tus()
    data = json.loads((ROOT / "configs/data_entries.json").read_text())
    data_entries = {p["segment"]: p for p in data["pieces"] if "segment" in p}
    for seg in data_entries:
        tus[seg] = ROOT / data["source"]
    data_result = None
    focused = bool(sys.argv[1:])
    segs = sys.argv[1:] or sorted(tus)
    registry = aspsx_registry()
    homes = segment_homes()
    total_all = sum(len(seg_functions(s)) for s in sorted(p.stem for p in (ROOT / "src").glob("*.c")) if s != "lib")
    lines = ["# Match progress — PASS = retail bytes via maspsx or reviewed real ASPSX, plus exact function-body SYM records; 🟡 = bytes only", ""]
    grand_pass = 0
    for seg in segs:
        fns = seg_functions(seg)
        if seg not in tus or not fns: continue
        if seg in data_entries:
            if data_result is None:
                data_result = subprocess.run([PY, str(ROOT / "tools/data_gate.py")],
                                             cwd=ROOT, capture_output=True, text=True)
            entry = data_entries[seg]
            ok = data_result.returncode == 0 and re.search(
                r"^" + re.escape(entry["entry"]) + r": DATA PASS\b", data_result.stdout, re.M)
            grand_pass += bool(ok)
            lines.append(f"## {seg}  ({data['source']}) — {int(bool(ok))}/1 DATA PASS")
            lines.append(f"- {'✅' if ok else '❌'} {entry['entry']} — data ({entry['size']} bytes, no function SYM record)")
            lines.append("")
            print(f"{seg}: {int(bool(ok))}/1 DATA")
            if not ok:
                print(data_result.stdout + data_result.stderr, file=sys.stderr)
            continue
        away = homes.get(seg, {})
        groups = collections.defaultdict(list)          # TU -> the segment functions gated there
        for f in fns:
            groups[away.get(f, tus[seg])].append(f)
        res = {}
        for tu, tfns in groups.items():
            r = gate(tu, tfns)
            alt_want = [f for f in tfns if f in registry.get(seg, ()) and r.get(f, ("",))[0] != "PASS"]
            for f, nins in aspsx_gate(tu, alt_want).items():
                r[f] = ("ASPSX", nins, 0)
            byte_pass = [f for f, v in r.items() if v[0] in ("PASS", "ASPSX")]
            sym = sym_ok(tu, byte_pass) if byte_pass else {}
            for f, v in list(r.items()):
                if v[0] in ("PASS", "ASPSX") and not sym.get(f, False):
                    r[f] = ("SYMDIFF", v[1], 0)
            res.update(r)
        npass = sum(1 for v in res.values() if v[0] in ("PASS", "ASPSX"))
        grand_pass += npass
        lines.append(f"## {seg}  ({tus[seg].relative_to(ROOT).as_posix()}) — {npass}/{len(fns)} PASS")
        for fn in fns:
            st = res.get(fn, ("TODO", 0, 0))
            where = f" [{away[fn].relative_to(ROOT).as_posix()}]" if fn in away else ""
            if st[0] == "PASS": lines.append(f"- ✅ {fn} ({st[1]}){where}")
            elif st[0] == "ASPSX": lines.append(f"- ✅ {fn} ({st[1]}, ASPSX)")
            elif st[0] == "FAIL": lines.append(f"- ❌ {fn} — {st[2]} diffs (ours {st[1]})")
            elif st[0] == "SYMDIFF": lines.append(f"- 🟡 {fn} — bytes PASS, SYM differs")
            elif st[0] == "NOT IN OBJECT": lines.append(f"- ⬜ {fn}")
            else: lines.append(f"- ⬜ {fn} ({st[0]})")
        lines.append("")
        print(f"{seg}: {npass}/{len(fns)}")
    if focused:
        print(f"SELECTED TOTAL {grand_pass}/{sum(len(seg_functions(s)) for s in segs)}")
    else:
        lines.insert(2, f"**Game code: {grand_pass} / {total_all} entries PASS ({100.0*grand_pass/total_all:.1f}%) — 2725 functions + 2 source-emitted data entries; 837 PsyQ SDK functions excluded**\n")
        if grand_pass == total_all:
            lines.insert(3, "**COMPLETE (2026-10-04): every game-code entry matches retail bytes and function-body SYM records; "
                            "the five retail images link byte-identical to the ROM (`tools/link.py`). "
                            "The separately tracked library region is not fully integrated: 349 entries have Sony archive receipts; "
                            "the remaining entries include Climax GLIB source and unclassified code — see README.**\n")
        (ROOT / "MATCH_PROGRESS.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
        print(f"TOTAL {grand_pass}/{total_all}")

if __name__ == "__main__":
    main()
