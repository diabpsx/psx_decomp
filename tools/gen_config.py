#!/usr/bin/env python3
"""gen_config.py — generate configs/diabpsx.yaml (splat) + configs/symbol_addrs.txt
from the retail DIABPSX.MAP section table (configs/sections.json) and the SYM
function/data records (configs/sym_fns.json + rom/DIABPSX-SYM.txt + rom/DIABPSX.MAP).

    python tools/gen_config.py [--gp 0xVALUE]

Layout facts (MAP): image = rom/DIABPSX.BIN, flat, loaded at 0x80010000, no PS-X header.
"""
import json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VRAM = 0x80010000
IMG = ROOT / "rom" / "DIABPSX.BIN"
img_size = IMG.stat().st_size
from image_trailer import map_extents, decode
payload_size, runtime_bss_size = map_extents((ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1'))
decode(IMG.read_bytes(), payload_size)
IMG_END = VRAM + payload_size

secs = json.load(open(ROOT / "configs" / "sections.json"))
fns = json.load(open(ROOT / "configs" / "sym_fns.json"))
gp = 0
if "--gp" in sys.argv:
    gp = int(sys.argv[sys.argv.index("--gp") + 1], 16)

def off(va): return va - VRAM

# ---- splat subsegments ------------------------------------------------------
sub = []
def add(va, kind, name):
    sub.append((off(va), kind, name))

text_secs = [s for s in secs if s["start"] < 0x800B0D00 and s["start"] >= VRAM and s["stop"] < 0x800B0D00]
seen = set()
for s in text_secs:
    n = s["name"]; g = s["group"]; va = s["start"]
    if s["len"] == 0 or va in seen: continue
    seen.add(va)
    if g == "(default)":            add(va, "asm", "header_code")
    elif g == "boot_text":          add(va, "data", "boot_text")
    elif n.startswith("$"):         add(va, "data", n[1:].lower() + "_hdr")   # `$startup_text` overlay-id word   # `$startup_text`: the overlay-id word
    elif n == ".text":              add(va, "c", "lib")          # PsyQ + GLIB library region
    elif n.endswith("_text"):       add(va, "c", n[1:-5].lower())
    elif n in (".ctors", ".dtors"): add(va, "data", n[1:])
    elif n.startswith("$"):         continue
    else:                           add(va, "asm", n.strip(".$").lower())
# data / rdata / sdata: one subsegment per MAP section keeps TU attribution
for s in secs:
    va = s["start"]
    if va < 0x800B0D00 or va >= IMG_END or s["len"] == 0 or va in seen: continue
    seen.add(va)
    n = s["name"]; g = s["group"]
    base = n.strip(".$").lower().replace("_data", "").replace("_rdata", "").replace("_sdata", "")
    if g == "data":    add(va, "data", "data_" + base if base != "data" else "data")
    elif g == "rdata": add(va, "rodata", "rodata_" + base if base != "rdata" else "rodata")
    elif g == "sdata": add(va, "sdata", "sdata_" + base if base != "sdata" else "sdata")
# carve sized SYM data objects that the linker left INSIDE text sections (e.g. VERSION.CPP's StrDate/StrTime
# strings before GetVersionString) into rodata subsegments, so splat does not swallow the following code
_data_iv = []
for va, typ, size, name in re.findall(r"^[0-9a-f]+: \$([0-9a-f]{8}) 9[46] Def2? class (?:EXT|STAT) type (?!FCN)(.*?) size (\d+).*? name (\S+)$",
                                     (ROOT / "rom" / "DIABPSX-SYM.txt").read_text(encoding="latin-1"), re.M):
    v = int(va, 16); sz = int(size)
    if sz and VRAM <= v < 0x800B0D00: _data_iv.append((v, v + sz))
_data_iv.sort()
_merged = []
for a, b in _data_iv:
    if _merged and a <= _merged[-1][1]: _merged[-1][1] = max(_merged[-1][1], b)
    else: _merged.append([a, b])
_sub2 = []
_bounds = sorted(o for o, k, n in sub) + [0x800B0D00 - VRAM]
for o, k, n in sub:
    if k != "c": _sub2.append((o, k, n)); continue
    va = VRAM + o; stop = VRAM + _bounds[_bounds.index(o) + 1]
    cur = va; piece = 0
    for a, b in _merged:
        if b <= va or a >= stop: continue
        a = max(a, va); b = min((b + 3) & ~3, stop)
        if a > cur:
            _sub2.append((cur - VRAM, "c", n if piece == 0 else f"{n}_{piece}")); piece += 1
        _sub2.append((a - VRAM, "rodata", f"{n}_rodata_{a:08x}"))
        cur = b
    if cur < stop: _sub2.append((cur - VRAM, "c", n if piece == 0 else f"{n}_{piece}"))
sub = sorted(_sub2)   # carve
bss_start = 0x8011C604
bss_end = 0x80139BF4
yaml = [
 "name: Diablo (Japan, SLPS-01416) - DIABPSX.BIN main image",
 "options:",
 "  base_path: ..",
 "  basename: diabpsx",
 "  target_path: rom/DIABPSX.BIN",
 "  platform: psx",
 "  compiler: GCC",
 "  asm_path: asm",
 "  src_path: src",
 "  build_path: build",
 "  ld_script_path: linkers/diabpsx.ld",
 f"  gp_value: 0x{gp:08X}",
 f"  global_vram_start: 0x{VRAM:08X}",
 "  global_vram_end: 0x80200000",
 "  use_legacy_include_asm: False",
 "  asm_function_macro: glabel",
 "  asm_jtbl_label_macro: jlabel",
 "  asm_data_macro: dlabel",
 "  generate_asm_macros_files: False",
 "  symbol_addrs_path:",
 "    - configs/symbol_addrs.txt",
 "  undefined_funcs_auto_path: linkers/undefined_funcs_auto.txt",
 "  undefined_syms_auto_path: linkers/undefined_syms_auto.txt",
 "  section_order: [.text, .data, .rodata, .sdata, .sbss, .bss]",
 "  find_file_boundaries: False",
 "  disasm_unknown: True",
 "",
 "segments:",
 "  - name: diabpsx",
 "    type: code",
 "    subalign: 4",   # retail sections sit at 4-byte boundaries (lib .text @0x8001000C); splat default SUBALIGN(16) would shift everything
 "    start: 0x0",
 f"    vram: 0x{VRAM:08X}",
 f"    bss_size: 0x{bss_end - IMG_END:X}   # .sbss+.bss 0x{IMG_END:08X}..0x{bss_end:08X} (zero-fill, not in file)",
 "    subsegments:",
]
for o, k, n in sub:
    yaml.append(f"      - [0x{o:06X}, {k}, {n}]")
yaml.append(f"  - [0x{payload_size:06X}, bin, diabpsx_checksum]")
yaml.append(f"  - [0x{img_size:06X}]")
(ROOT / "configs" / "diabpsx.yaml").write_text("\n".join(yaml) + "\n")
print("subsegments:", len(sub))

# ---- symbol_addrs -----------------------------------------------------------
names = {}   # va -> (name, kind, size)
for f in fns:
    names[f["va"]] = (f["name"], "func", f["end"] - f["va"])
symtxt = (ROOT / "rom" / "DIABPSX-SYM.txt").read_text(encoding="latin-1")
for va, typ, size, name in re.findall(r"^[0-9a-f]+: \$([0-9a-f]{8}) 9[46] Def2? class EXT type (?!FCN)(.*?) size (\d+).*? name (\S+)", symtxt, re.M):
    v = int(va, 16)
    if v not in names and v >= VRAM: names[v] = (name, "data", int(size))
# MAP address table (lib fns w/o SYM records, statics, data labels)
skip = re.compile(r"^_*(text|boot|data|rdata|sdata|sbss|bss|startup|map|last|ctors|dtors|frontend|pregame|game|fmv)?_?(obj|org|objend|orgend|text|data)$|^__?(text|boot_text|.*_(obj|org|objend|orgend))$|^LNK_")
in_table = False
for ln in (ROOT / "rom" / "DIABPSX.MAP").read_text(encoding="latin-1").splitlines():
    if "Names alphabetically" in ln: in_table = True; continue
    if not in_table: continue
    m = re.match(r"\s*([0-9A-F]{8})\s+(\S+)", ln)
    if not m: continue
    v = int(m[1], 16); n = m[2]
    if v < VRAM or v in names or skip.match(n) or not re.match(r"^[A-Za-z_][A-Za-z0-9_$.]*$", n): continue
    kind = "func" if v < 0x800B0D00 else "data"
    names[v] = (n, kind, 0)
out = ["// generated by tools/gen_config.py from DIABPSX.SYM + DIABPSX.MAP -- edit names via the generator",
       "// NOTE: header-defined (.H) methods are compiled once per including TU; 2nd+ copies get a _<va> suffix"]
n_ov = 0
used = set(); used_ci = set()   # case-insensitive: SaveGP.s / savegp.s would be ONE file on Windows
for v in sorted(names):
    name, kind, size = names[v]
    name = name.replace('_._', '___')            # cfront dtor -> SN spelling (build.py rewrites the same)
    name = name.replace('$', '_S_').replace('.', '_')
    if name in used:
        name = f"{name}_{v:08x}"
    elif kind == "func" and name.lower() in used_ci:
        name = f"{name}_ci"                       # case-only clash (SaveGP / savegp): keep a plain suffix
    used.add(name); used_ci.add(name.lower())
    if v >= bss_end:  # overlay space (80139BF8+): separate binaries, not in this image
        n_ov += 1; continue
    extra = f" size:0x{size:X}" if size else ""
    ty = " type:func" if kind == "func" else ""
    out.append(f"{name} = 0x{v:08X}; //{ty}{extra}")
(ROOT / "configs" / "symbol_addrs.txt").write_text("\n".join(out) + "\n")
print("symbols:", len(out) - 1, "| overlay-space skipped:", n_ov)
