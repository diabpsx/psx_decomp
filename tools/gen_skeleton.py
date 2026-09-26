#!/usr/bin/env python3
"""gen_skeleton.py — the LINKED skeleton: one file per ORIGINAL source file (SYM paths, e.g.
skel/PSXSRC/GMAN.CPP, skel/SOURCE/CONTROL.CPP, skel/GLIBDEV/SOURCE/GAL.C) holding every function
of that file in VA order as

    /* ---- <va> <name>  <file>:<lines>  seg <seg> ---- */
    /* <SYM signature>  regs: ...  blocks: ... */
    INCLUDE_ASM("asm/nonmatchings/<seg>", <mangled>);      <- links byte-identical today
    #if 0 /* m2c */  ... #endif                            <- draft from refs/m2c/<seg>.c
    #if 0 /* ida */  ... #endif                            <- draft from refs/ida/<image>.c

plus skel/sym_types.h (every struct/union/enum/typedef the SYM records, as C).  Reconstruction =
replace one INCLUDE_ASM with C and re-run tools/verify_asm.py; the file keeps linking meanwhile.

    python tools/gen_skeleton.py            # regenerates skel/ (hand-written recon lives in recon/, untouched)
"""
import re, sys
from pathlib import Path
from collections import defaultdict

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
import symtypes as ST

SKEL = ROOT / "skel"
M2C = ROOT.parent / "refs" / "m2c"
IDA = ROOT.parent / "refs" / "ida"
REGS = ST.REGS

# ---- name -> segment dir (splat oracle location) --------------------------------------------
seg_of = {}
for p in (ROOT / "asm" / "nonmatchings").glob("*/*.s"):
    seg_of.setdefault(p.stem, p.parent.name)

def sanitize(n):
    return n.replace("_._", "___").replace("$", "_S_").replace(".", "_")

va_of = {}    # first instruction VA -> oracle stem (MAP-named oracles like StrDate vs SYM GetVersionString__FPc)
for p in (ROOT / "asm" / "nonmatchings").glob("*/*.s"):
    m = re.search(r"^\s*/\* [0-9A-F]+ ([0-9A-F]{8}) ", p.read_text(encoding="utf-8", errors="replace"), re.M)
    if m: va_of.setdefault((p.parent.name, int(m.group(1), 16)), p.stem)

stems_at = defaultdict(list)
for (seg, v), stem in va_of.items(): stems_at[v].append(stem)

def oracle_name(name, va, seg_hint=None):
    """oracle stem for a SYM function: match by VA first (header copies share a name across TUs,
    overlays share VAs across images), then by name"""
    s = sanitize(name)
    cands = stems_at.get(va, [])
    if len(cands) == 1: return cands[0]
    for c in cands:
        if c == s or c.startswith(s + "_"): return c
    for cand in (s, f"{s}_{va:08x}", f"{s}_ci"):
        if cand in seg_of and va in [v for (sg, v), st in va_of.items() if st == cand]: return cand
    return cands[0] if cands else None

# ---- segment -> image (for the IDA draft file) ----------------------------------------------
seg_image = {}
for ov, img in (("frontend", "FRONTEND.BIN"), ("pregame", "PREGAME.BIN"), ("game", "GAME.BIN"), ("fmv", "FMV.BIN")):
    y = (ROOT / "configs" / f"{ov}.yaml").read_text()
    for n in re.findall(r"- \[0x[0-9A-F]+, c, (\w+)\]", y): seg_image[n] = img

# ---- draft bodies ---------------------------------------------------------------------------
def parse_defs(path):
    """{name: body} for every function definition in a C file (m2c or Hex-Rays export)"""
    out = {}
    if not path.exists(): return out
    lines = path.read_text(encoding="utf-8", errors="replace").split("\n")
    i = 0
    while i < len(lines):
        ln = lines[i]
        m = re.match(r"^[A-Za-z_][^;{}=#]*?[ *&]([A-Za-z_]\w*)\((.*)\)\s*(\{)?\s*$", ln)
        if m and not ln.rstrip().endswith(";") and (m.group(3) or (i + 1 < len(lines) and lines[i + 1].strip() == "{")):
            j = i + 1
            while j < len(lines) and lines[j] != "}": j += 1
            out.setdefault(m.group(1), "\n".join(lines[i:j + 1]))
            i = j + 1
        else:
            i += 1
    return out

m2c_cache, ida_cache = {}, {}
def m2c_body(seg, oname):
    if seg not in m2c_cache: m2c_cache[seg] = parse_defs(M2C / f"{seg}.c")
    return m2c_cache[seg].get(oname)
def ida_body(seg, oname):
    img = seg_image.get(seg, "DIABPSX.BIN")
    if img not in ida_cache: ida_cache[img] = parse_defs(IDA / f"{img}.c")
    return ida_cache[img].get(oname)

# ---- SYM signature ---------------------------------------------------------------------------
def demangle_head(name):
    """'SetUVTpGT3__7TextDatP9FRAME_HDR' -> ('SetUVTpGT3', 'TextDat', const?) ; ctor/dtor handled"""
    if name.startswith("_._"):
        return ("~" + re.sub(r"^\d+", "", name[3:]), re.sub(r"^\d+", "", name[3:]), False)
    if "__" not in name: return (name, None, False)
    base, rest = name.split("__", 1)
    const = rest.startswith("C") and rest[1:2].isdigit()
    if const: rest = rest[1:]
    m = re.match(r"(\d+)", rest)
    cls = None
    if m:
        n = int(m.group(1)); cls = rest[len(m.group(1)):len(m.group(1)) + n]
    if base == "": base = cls or name
    return (base, cls, const)

def signature(f, fnrec):
    base, cls, const = demangle_head(f["name"])
    params, seen = [], set()
    for r in f["recs"]:
        if r["cls"] in ("REGPARM", "ARG") and r["name"] not in seen:
            seen.add(r["name"])
            if r["name"] == "this": continue
            params.append(ST.ctype(r))
    ret = ST.ctype(dict(fnrec, typ=(fnrec["typ"][4:].strip() or "VOID"), name="")).strip() if fnrec else "?"   # drop the leading FCN
    qual = f"{cls}::" if cls else ""
    return f"{ret} {qual}{base}({', '.join(params) or 'void'}){' const' if const else ''}"

def regs_line(f):
    parts = []
    for r in f["recs"]:
        if r["cls"] in ("REGPARM", "REG"):
            parts.append(f"{r['name']}=${REGS[r['val']] if r['val'] < 32 else r['val']}")
        elif r["cls"] == "AUTO":
            parts.append(f"{r['name']}@sp{r['val'] - 2**32 if r['val'] >= 2**31 else r['val']:+#x}")
        elif r["cls"] == "STAT":
            parts.append(f"{r['name']}@0x{r['val']:08X}")
    return " ".join(parts)

# ---- function records (return types) from the SYM -------------------------------------------
fnrec_by = {}
for ln in ST.LINES:
    r = ST.parse(ln)
    if r and r["typ"].startswith("FCN"):
        fnrec_by.setdefault((r["val"], r["name"]), r)

# ---- group SYM functions by original file ---------------------------------------------------
by_file = defaultdict(list)
for f in ST.fn_blocks():
    by_file[f["file"]].append(f)

def rel_path(sym_path):
    p = sym_path.replace("\\", "/")
    p = re.sub(r"^[A-Za-z]:/diabpsx/", "", p, flags=re.I)
    return p

def seg_map():
    """seg -> skeleton file when every non-.H function of the segment comes from one file"""
    seg_files = defaultdict(lambda: defaultdict(int))
    for file, fns in by_file.items():
        for f in fns:
            on = oracle_name(f["name"], f["va"]); seg = seg_of.get(on) if on else None
            if seg and not file.upper().endswith(".H"): seg_files[seg][rel_path(file)] += 1
    m = {seg: next(iter(files)) for seg, files in seg_files.items() if len(files) == 1}
    # a file that feeds several segments (overlay TUs split into pieces around carved data tables) cannot be
    # one link object: those segments stay on the src/<seg>.c scaffolds
    from collections import Counter
    multi = {f for f, n in Counter(m.values()).items() if n > 1}
    return {seg: f for seg, f in m.items() if f not in multi}, seg_files

def main():
    n_fn = n_m2c = n_ida = n_noasm = 0
    mapping, seg_files = seg_map()
    # header-defined methods (.H files) are compiled into every including TU: link their copies from the
    # skeleton file of the segment they sit in, and leave the .H skeleton as a drafts-only reading file
    extra = defaultdict(list)
    for file, fns in by_file.items():
        if not file.upper().endswith(".H"): continue
        for f in fns:
            on = oracle_name(f["name"], f["va"]); seg = seg_of.get(on) if on else None
            tgt = mapping.get(seg) if seg else None
            if tgt: extra[tgt].append(dict(f, hdr_from=rel_path(file)))
    for file, fns in sorted(by_file.items()):
        rel = rel_path(file)
        fns = sorted(fns + extra.get(rel, []), key=lambda f: f["va"])
        out = SKEL / rel
        out.parent.mkdir(parents=True, exist_ok=True)
        text = [f"/* {rel} — linked skeleton generated by tools/gen_skeleton.py from DIABPSX.SYM ({len(fns)} functions).",
                " * Each function: SYM signature/registers, INCLUDE_ASM of the retail oracle (links byte-identical),",
                " * then the m2c and Hex-Rays drafts under #if 0.  Replace one INCLUDE_ASM at a time with C. */",
                '#include "common.h"', ""]
        for f in fns:
            oname = oracle_name(f["name"], f["va"])
            seg = seg_of.get(oname) if oname else None
            fnrec = fnrec_by.get((f["va"], f["name"]))
            src_note = f"{Path(f['hdr_from']).name} (header copy)" if f.get("hdr_from") else Path(rel).name
            text.append(f"/* ---- 0x{f['va']:08X}  {f['name']}  {src_note}:{f['line']}-{f['endline']}  seg {seg or '?'}  fsize {f['fsize']} ---- */")
            text.append(f"/* {signature(f, fnrec)}")
            rl = regs_line(f)
            if rl: text.append(f" *   {rl}")
            if f["blocks"]:
                text.append(" *   blocks: " + " ".join(f"{'{' if k == 'start' else '}'}{ln}" for va, k, ln in f["blocks"]))
            text.append(" */")
            n_fn += 1
            if seg and mapping.get(seg) == rel:
                text.append(f'INCLUDE_ASM("asm/nonmatchings/{seg}", {oname});')
            elif seg and rel.upper().endswith(".H"):
                text.append(f'/* linked from the including TU skeleton ({mapping.get(seg, "src/" + seg + ".c scaffold")}) — reading copy only */')
            elif seg:
                text.append(f'/* linked from build/src/{seg}.c.o (segment {seg} mixes several source files) — INCLUDE_ASM("asm/nonmatchings/{seg}", {oname}) */')
            if seg:
                b = m2c_body(seg, oname)
                if b: n_m2c += 1; text += ["#if 0 /* m2c */", b, "#endif"]
                b = ida_body(seg, oname)
                if b: n_ida += 1; text += ["#if 0 /* ida */", b, "#endif"]
            else:
                n_noasm += 1
                text.append(f"/* no splat oracle found for {f['name']} (0x{f['va']:08X}) */")
            text.append("")
        out.write_text("\n".join(text), encoding="utf-8")
    # types header
    types = ["/* skel/sym_types.h — every struct/union/enum/typedef recorded in DIABPSX.SYM (tools/symtypes.py rendering).",
             " * Reading reference: names repeat across TUs (e.g. BOOL is UCHAR in GLIB C, bool in the C++ TUs). */", ""]
    seen = set()
    for ln in ST.LINES:
        r = ST.parse(ln)
        if not r: continue
        if r["cls"] in ("STRTAG", "UNTAG") and r["name"] not in seen:
            seen.add(r["name"]); types.append(ST.struct(r["name"])); types.append("")
        elif r["cls"] == "ENTAG" and ("enum", r["name"]) not in seen:
            seen.add(("enum", r["name"])); types.append(enum_text(r["name"])); types.append("")
        elif r["cls"] == "TPDEF" and ("td", r["name"]) not in seen:
            seen.add(("td", r["name"])); types.append(f"typedef {ST.ctype(r)};")
    (SKEL / "sym_types.h").write_text("\n".join(types) + "\n", encoding="utf-8")
    rows = ["# segment -> skeleton file (link unit)  [generated by tools/gen_skeleton.py]", "",
            "| segment | skeleton file | functions | link object |", "|---|---|---|---|"]
    for seg in sorted(seg_files):
        files = seg_files[seg]
        if len(files) == 1:
            (fn, n), = files.items()
            rows.append(f"| {seg} | {fn} | {n} | build/skel/{fn}.o |")
        else:
            rows.append(f"| {seg} | ({len(files)} files: {', '.join(sorted(files))}) | {sum(files.values())} | build/src/{seg}.c.o (scaffold) |")
    (SKEL / "SEGMENTS.md").write_text("\n".join(rows) + "\n", encoding="utf-8")
    (SKEL / "segments.json").write_text(__import__("json").dumps(mapping, indent=1), encoding="utf-8")
    print(f"skeleton: {len(by_file)} files, {n_fn} functions, {n_m2c} m2c drafts, {n_ida} ida drafts, {n_noasm} without oracle -> {SKEL}")

def enum_text(name):
    out = [f"enum {name} {{"]; inside = False
    for ln in ST.LINES:
        r = ST.parse(ln)
        if not r: continue
        if r["cls"] == "ENTAG" and r["name"] == name: inside = True; continue
        if inside:
            if r["cls"] == "MOE": out.append(f"    {r['name']} = {r['val']},")
            elif r["cls"] == "EOS": break
    out.append("};")
    return "\n".join(out)

if __name__ == "__main__":
    main()
