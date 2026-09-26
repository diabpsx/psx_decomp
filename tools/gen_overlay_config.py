#!/usr/bin/env python3
"""gen_overlay_config.py — splat configs + symbol files for the four LUMP overlays
(rom/FRONTEND.BIN $b, PREGAME.BIN $c, GAME.BIN $d, FMV.BIN $e), all loaded at 0x80139BF8.

    python tools/gen_overlay_config.py            # writes configs/<ov>.yaml + configs/symbol_addrs_<ov>.txt

Sections come from the MAP group (configs/sections.json: frontend_text / pregame_text / game_text /
fmv_text); symbols come from the SYM text, scoped by its `set overlay $N` records (function and data
records between one `set overlay` and the next belong to that overlay).  The main-image symbol file is
listed first so calls/loads into DIABPSX.BIN resolve.  Segment names are checked against the main image
so every asm/nonmatchings/<seg> directory stays unique (verify_asm.py resolves oracles by name)."""
import json, re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VRAM = 0x80139BF8
OVERLAYS = {   # name: (SYM id, MAP group, image)
    "frontend": (0xB, "frontend_text", "FRONTEND.BIN"),
    "pregame":  (0xC, "pregame_text",  "PREGAME.BIN"),
    "game":     (0xD, "game_text",     "GAME.BIN"),
    "fmv":      (0xE, "fmv_text",      "FMV.BIN"),
}
secs = json.load(open(ROOT / "configs" / "sections.json"))
symtxt = (ROOT / "rom" / "DIABPSX-SYM.txt").read_text(encoding="latin-1").splitlines()
main_yaml = (ROOT / "configs" / "diabpsx.yaml").read_text()
main_segs = set(re.findall(r"^\s+- \[0x[0-9A-F]+, (?:c|asm|data|rodata|sdata), (\w+)\]", main_yaml, re.M))
main_syms = set(re.findall(r"^(\w+) = ", (ROOT / "configs" / "symbol_addrs.txt").read_text(), re.M))
gp = re.search(r"gp_value: (0x[0-9A-F]+)", main_yaml).group(1)
# true function extents (SYM function blocks) -- sizes for splat + the "is this func_ label inside a real
# function" test (a func_ split inside a SYM function is a splat boundary guess, NOT data-as-code)
FN_END = {(f["va"], f["name"]): f["end"] for f in json.load(open(ROOT.parent / "sym_fns.json"))}

def sym_scope(ovid):
    """(va, name, is_func, size) records that sit under `set overlay $ovid` in the SYM"""
    cur = None; out = []
    for ln in symtxt:
        m = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) set overlay", ln)
        if m: cur = int(m[1], 16); continue
        if cur != ovid: continue
        m = re.match(r"^[0-9a-f]+: \$([0-9a-f]{8}) 9[46] Def2? class (EXT|STAT) type (\S+)(.*?) size (\d+).*? name (\S+)$", ln)
        if not m: continue
        va = int(m[1], 16)
        if va < VRAM: continue
        out.append((va, m[6], m[3] == "FCN", int(m[5])))
    return out

for ov, (ovid, group, image) in OVERLAYS.items():
    img_size = (ROOT / "rom" / image).stat().st_size
    recs = sym_scope(ovid)
    # sized data objects the linker left inside the *_text sections (const tables, e.g. DRLG L5ConvTbl,
    # CreditsText): carve them into rodata subsegments so splat does not disassemble them as functions
    data_iv = sorted((va, va + size) for va, name, is_fn, size in recs if not is_fn and size)
    # The SYM names EVERY function of the game (full debug build), so code splat had to label `func_<va>`
    # inside an overlay is data-as-code (unsized tables, e.g. DRLG_L4 @0x8014D7F8): carve [va, next symbol).
    fn_vas = sorted(va for va, name, is_fn, size in recs if is_fn)
    fn_spans = [(va, FN_END[(va, name)]) for va, name, is_fn, size in recs if is_fn and (va, name) in FN_END]
    all_vas = sorted(va for va, name, is_fn, size in recs)
    # persisted list: a carved label has no .s after the next split, so remember every data-as-code VA ever seen
    dac_file = ROOT / "configs" / "overlay_dataascode.txt"
    dac = set(int(x, 16) for x in dac_file.read_text().split()) if dac_file.exists() else set()
    dac |= set(int(f.stem[5:], 16) for f in (ROOT / "asm" / "nonmatchings").rglob("func_*.s"))
    dac_file.write_text(chr(10).join(f"{v:08X}" for v in sorted(dac)) + chr(10))
    for va in sorted(dac):
        if va < VRAM or va in fn_vas: continue
        if any(a < va < b for a, b in fn_spans): continue      # mid-function split, real code
        seg_ok = any(x["group"] == group and x["start"] <= va <= x["stop"] for x in secs)
        if not seg_ok: continue
        nxt = min([v for v in all_vas if v > va] + [max(x["stop"] + 1 for x in secs if x["group"] == group)])
        data_iv.append((va, nxt))
    data_iv.sort()
    merged = []
    for a, b in data_iv:
        if merged and a <= merged[-1][1]: merged[-1][1] = max(merged[-1][1], b)
        else: merged.append([a, b])
    sub = []
    seen_names = set()
    for s in [x for x in secs if x["group"] == group and x["len"]]:
        va, n = s["start"], s["name"]
        if n.startswith("$"):
            # the overlay-id word sits first; FMV then has libpress rdata/data BEFORE text, so its order is
            # rodata,data,text and the word must be rodata to stay first — elsewhere it is text-ordered asm
            kind, name = "data", f"{ov}_hdr"
        elif n.startswith("libpress."):
            kind = {"rdata": "rodata", "data": "data", "text": "c"}[n.split(".")[1]]
            name = "libpress" if kind == "c" else f"libpress_{n.split('.')[1]}"
        else:
            kind, name = "c", n[1:-5].lower()
        if name in main_segs or name in seen_names:
            name = f"{ov}_{name}"
        seen_names.add(name)
        if kind != "c":
            sub.append((va - VRAM, kind, name)); continue
        cur = va; piece = 0; stop = s["stop"] + 1
        for a, b in merged:
            if b <= va or a >= stop: continue
            a = max(a, va); b = min((b + 3) & ~3, stop)
            if a > cur:
                sub.append((cur - VRAM, "c", name if piece == 0 else f"{name}_{piece}")); piece += 1
            sub.append((a - VRAM, "rodata", f"{name}_rodata_{a:08x}"))
            cur = b
        if cur < stop:
            sub.append((cur - VRAM, "c", name if piece == 0 else f"{name}_{piece}"))
    sub.sort()
    y = [f"name: Diablo (Japan) overlay {ov.upper()} (SYM id ${ovid:x}) - rom/{image}",
         "options:", "  base_path: ..", f"  basename: {ov}", f"  target_path: rom/{image}",
         "  platform: psx", "  compiler: GCC", "  asm_path: asm", "  src_path: src", "  build_path: build",
         f"  ld_script_path: linkers/{ov}.ld", f"  gp_value: {gp}",
         "  global_vram_start: 0x80010000", "  global_vram_end: 0x80200000",
         "  use_legacy_include_asm: False", "  asm_function_macro: glabel", "  asm_jtbl_label_macro: jlabel",
         "  asm_data_macro: dlabel", "  generate_asm_macros_files: False",
         "  symbol_addrs_path:", "    - configs/symbol_addrs.txt", f"    - configs/symbol_addrs_{ov}.txt",
         f"  undefined_funcs_auto_path: linkers/undefined_funcs_auto_{ov}.txt",
         f"  undefined_syms_auto_path: linkers/undefined_syms_auto_{ov}.txt",
         "  section_order: [.text, .data, .rodata, .sdata, .sbss, .bss]",
         "  find_file_boundaries: False", "  disasm_unknown: True", "",
         "segments:", f"  - name: {ov}", "    type: code", "    subalign: 4", "    start: 0x0", f"    vram: 0x{VRAM:08X}",
         "    subsegments:"]
    y += [f"      - [0x{o:06X}, {k}, {n}]" for o, k, n in sub]
    y.append(f"  - [0x{img_size:06X}]")
    (ROOT / "configs" / f"{ov}.yaml").write_text("\n".join(y) + "\n")

    out = [f"// overlay {ov} (SYM id ${ovid:x}) symbols scoped by the SYM `set overlay` record; main-image symbols come from symbol_addrs.txt"]
    used = set(main_syms); n_fn = 0
    for va, name, is_fn, size in sorted(recs):
        orig = name
        name = name.replace("_._", "___").replace("$", "_S_").replace(".", "_")
        if name in used: name = f"{name}_{va:08x}"
        used.add(name)
        if is_fn: n_fn += 1
        fsz = FN_END.get((va, orig), 0) - va if is_fn and (va, orig) in FN_END else 0
        out.append(f"{name} = 0x{va:08X}; //{' type:func' if is_fn else ''}{f' size:0x{fsz:X}' if fsz else ''}{f' size:0x{size:X}' if size and not is_fn else ''}")
    (ROOT / "configs" / f"symbol_addrs_{ov}.txt").write_text("\n".join(out) + "\n")
    print(f"{ov}: {len(sub)} subsegments, {n_fn} fns + {len(recs) - n_fn} data syms -> configs/{ov}.yaml, symbol_addrs_{ov}.txt")
