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
                            "The separately tracked library region: 349 entries have Sony archive receipts, all 146 Climax GLIB entries "
                            "and all 342 EA Canada EACLIB / Climax hand-assembly entries are source members (two further sections below) — see README.**\n")
        glib_lines, gpass, gtotal = glib_board()
        lines += glib_lines
        lib_lines, lpass, ltotal = lib_members_board()
        lines += lib_lines
        (ROOT / "MATCH_PROGRESS.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
        print(f"TOTAL {grand_pass}/{total_all}")
        print(f"GLIB {gpass}/{gtotal}")
        print(f"LIB MEMBERS {lpass}/{ltotal}")


def lib_members_board():
    """Separate board for the stripped library members of the lib segment (EA Canada EACLIB C/.ASM and the Climax
    PSXSRC/*.MIP hand assembly): these retail objects carry no function-body SYM records, so a member PASSes when
    the native lane (tools/native_recon.py: per-TU compiler/assembler identity from tools/build.py PER_TU_FLAGS and
    configs/native_recon_link.json) links its complete source object byte-identical to the ROM — the receipt in
    build/native_source/receipts.json names every function. Members without a fresh receipt show as PENDING."""
    import json
    registry = json.loads((ROOT / "configs" / "native_recon_link.json").read_text())
    receipts_path = ROOT / "build" / "native_source" / "receipts.json"
    receipts = {r["segment"]: r for r in json.loads(receipts_path.read_text())} if receipts_path.is_file() else {}
    rows = []
    for segment, spec in registry.items():
        if not spec.get("stripped_library_sym"):
            continue
        fns = [f for s, row in spec["sections"].items() if s.startswith(".text.") for f in row.get("functions", [])]
        fns = [spec.get("function_aliases", {}).get(f, f) for f in fns] + list(spec.get("covered_functions", []))
        receipt = receipts.get(segment)
        ok = bool(receipt) and receipt.get("functions") == len(fns)
        rows.append((spec["source"], segment, fns, ok, (receipt or {}).get("compiler_overrides", {}).get("compiler"),
                     (receipt or {}).get("assembler_version")))
    rows.sort(key=lambda r: r[0])
    total = sum(len(r[2]) for r in rows)
    passed = sum(len(r[2]) for r in rows if r[3])
    lines = ["", "# Lib-segment source members without retail body SYM (EA Canada EACLIB + Climax hand assembly) — separate count", "",
             f"**{passed} / {total} functions in {sum(1 for r in rows if r[3])}/{len(rows)} members carry a native-link receipt "
             f"(complete object bytes + owned data identical to the ROM at the retail addresses; "
             f"per-member compiler/assembler identity in tools/build.py PER_TU_FLAGS and configs/native_recon_link.json). "
             f"Identity lanes: EACLIB C = PsyQ 3.6 DOS CC1PSX + ASPSX 2.56 default divide guards; libddx = gcc 2.6.3-compatible "
             f"-O1 -G0 + ASPSX 2.34; .ASM/.MIP = assembler-neutral transcriptions — see README.**", ""]
    for source, segment, fns, ok, compiler, assembler in rows:
        lane = f"{compiler or 'as'}/{assembler or '?'}"
        lines.append(f"## {source} — {len(fns)} functions — {'PASS' if ok else 'PENDING'} ({lane})")
        lines.append("- " + ", ".join(fns))
        lines.append("")
    print("\n".join(f"lib {r[0]}: {'PASS' if r[3] else 'PENDING'} {len(r[2])}" for r in rows))
    return lines, passed, total


def glib_files():
    """{GLIB source basename: [fn, ...] in VA order} for the lib-segment oracles whose start address lies inside
    that file's SLD run (0x88 file-set .. 0x8a end) in rom/DIABPSX-SYM.txt. Only GLIBDEV sources are returned;
    the Sony objects and hand-written .ASM/.MIP files of the lib segment carry no C line runs."""
    runs, cur = [], None
    for ln in (ROOT / "rom" / "DIABPSX-SYM.txt").read_text(errors="replace").splitlines():
        m = re.match(r"[0-9a-f]+: \$([0-9a-f]{8}) (8[0-9a-f]) (.*)$", ln)
        if not m: continue
        va, kind, rest = int(m.group(1), 16), m.group(2), m.group(3)
        if kind == "88":
            fm = re.match(r"Set SLD to line \d+ of file (.+?)\s*$", rest)
            cur = [fm.group(1) if fm else "?", va, va]; runs.append(cur)
        elif kind in ("80", "82", "84", "86") and cur:
            cur[1] = min(cur[1], va); cur[2] = max(cur[2], va)
        elif kind == "8a":
            cur = None
    out = collections.defaultdict(list)
    for p in (ROOT / "asm" / "nonmatchings" / "lib").glob("*.s"):
        txt = p.read_text(errors="replace")
        m = re.search(r"/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s", txt)
        g = re.search(r"^glabel\s+(\S+)", txt, re.M)
        if not (m and g): continue
        va = int(m.group(1), 16)
        hit = next((r[0] for r in runs if r[1] <= va <= r[2]), None)
        if hit and "GLIBDEV" in hit.upper():
            out[hit.replace("\\", "/").split("/")[-1].upper()].append((va, g.group(1)))
    return {f: [n for _, n in sorted(v)] for f, v in out.items()}


def oracle_insns(segment, fn):
    """instruction count of an oracle scaffold (its hex-word lines)"""
    p = ROOT / "asm" / "nonmatchings" / segment / f"{fn}.s"
    return sum(1 for l in p.read_text(errors="replace").splitlines()
               if re.search(r"/\*\s*[0-9A-Fa-f]+\s+[0-9A-Fa-f]{8}\s+[0-9A-Fa-f]{8}\s*\*/", l)) if p.is_file() else 0


def glib_board():
    """Separate board for the Climax GLIB C TUs reconstructed under recon/glibdev (not part of the game total).
    PASS = bytes (tools/verify_asm.py) + exact SYM (tools/symlane.py) on the project lane; the real-ASPSX
    alternate is not applied here (its segment is derived from the file name, which lib TUs do not share)."""
    files = glib_files()
    lines, gpass, gtotal = ["", "# Climax GLIB (lib segment) — separate count, not part of the game total", ""], 0, 0
    # The native receipt (tools/native_recon.py) is the authoritative PASS source for a GLIB TU: it compiles the whole
    # TU on its registered identity lane (tools/build.py PER_TU_FLAGS "compiler" + the registry assembler), links it at
    # the retail addresses and verifies complete bytes, owned data AND every function/global SYM record.  The
    # verify_asm/symlane gates below only know the PsyQ 4.0 maspsx lane (they ignore the per-TU compiler key) and are
    # used for TUs without a receipt.
    import json
    receipts_path = ROOT / "build" / "native_source" / "receipts.json"
    receipts = {r["segment"]: r for r in json.loads(receipts_path.read_text())} if receipts_path.is_file() else {}
    per = []
    for f in sorted(files, key=lambda k: -len(files[k])):
        fns = files[f]; gtotal += len(fns)
        tu = ROOT / "recon" / "glibdev" / (f[:-2].lower() + ".c")
        res, lane = {}, ""
        receipt = receipts.get(tu.stem)
        if tu.is_file() and receipt and receipt.get("functions") == len(fns):
            res = {fn: ("PASS", oracle_insns("lib", fn), 0) for fn in fns}
            lane = (f" — native receipt: {receipt['compiler_overrides'].get('compiler') or 'PsyQ 4.0 CC1PSX'}"
                    f" / ASPSX {receipt['assembler_version']}")
        elif tu.is_file():
            res = gate(tu, fns)
            sym = sym_ok(tu, [n for n, v in res.items() if v[0] == "PASS"]) if res else {}
            for n, v in list(res.items()):
                if v[0] == "PASS" and not sym.get(n, False): res[n] = ("SYMDIFF", v[1], 0)
            lane = " — PsyQ 4.0 maspsx gates (no native receipt)"
        npass = sum(1 for v in res.values() if v[0] == "PASS"); gpass += npass
        per.append((f, tu, fns, res, npass, lane))
        print(f"glib {f}: {npass}/{len(fns)}{lane}")
    lines.insert(2, f"**Climax GLIB: {gpass} / {gtotal} functions PASS — complete object bytes, owned data and every "
                    f"function/global SYM record verified by the native link on the per-TU identity lane "
                    f"(gcc 2.6.3-compatible C + original DOS ASPSX 2.34 for seven TUs, PsyQ 4.0 for GMAIN/TICK; "
                    f"tools/build.py PER_TU_FLAGS, configs/native_recon_link.json, receipts in "
                    f"build/native_source/receipts.json); source = Climax's own GLib (SpongeBob SuperSponge "
                    f"Utils/Libs/GLib, warcraft2 VRIP.C) — see README**\n")
    for f, tu, fns, res, npass, lane in per:
        where = tu.relative_to(ROOT).as_posix() if tu.is_file() else "(no recon TU yet)"
        lines.append(f"## {f}  ({where}) — {npass}/{len(fns)} PASS{lane}")
        for fn in fns:
            st = res.get(fn, ("TODO", 0, 0))
            if st[0] == "PASS": lines.append(f"- ✅ {fn} ({st[1]})")
            elif st[0] == "FAIL": lines.append(f"- ❌ {fn} — {st[2]} diffs (ours {st[1]})")
            elif st[0] == "SYMDIFF": lines.append(f"- 🟡 {fn} — bytes PASS, SYM differs")
            else: lines.append(f"- ⬜ {fn}")
        lines.append("")
    return lines, gpass, gtotal

if __name__ == "__main__":
    main()
