#!/usr/bin/env python3
"""gen_ld.py — linker script in TRUE ROM ORDER from a splat yaml (splat's own script groups input
sections by type, which breaks an image whose text/data/rodata interleave).  Every subsegment is
pinned with `. = <vram>;` so a wrong-sized object fails the link at the culprit instead of
shifting everything after it.

    python tools/gen_ld.py [diabpsx|frontend|pregame|game|fmv ...]   -> linkers/<name>.ld

Object naming follows splat: c -> build/src/<name>.c.o, asm -> build/asm/<name>.s.o,
data/rodata/sdata/bss -> build/asm/data/<name>.<kind>.s.o.  A c subsegment contributes .text,
Data sections come from splat objects unless configs/recon_data_link.json
explicitly selects a whole source-emitted section at that retail placement.
The linker asserts its exact extent; no compiler output is patched or sliced.
Named cross-image functions are supplied only from explicit bindings validated
against the other image's retail symbol map; PROVIDE never overrides definitions."""
import re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
import json
_sm = ROOT / "skel" / "segments.json"
SKEL_MAP = json.loads(_sm.read_text()) if _sm.exists() else {}   # seg -> skeleton file (1:1 link units)
_rl = ROOT / "configs" / "recon_link.json"
RECON_MAP = json.loads(_rl.read_text()) if _rl.exists() else {}   # seg -> recon TU whose .text replaces the skeleton (bytes-proven TUs)
_rd = ROOT / "configs" / "recon_data_link.json"
DATA_MAP = json.loads(_rd.read_text()) if _rd.exists() else {}
_sd = ROOT / "configs/sdk_link.json"
SDK_DATA = {placement["scaffold"]
            for member in (json.loads(_sd.read_text()).values() if _sd.exists() else [])
            for placement in member.get("data_sections", {}).values()}
_na = ROOT / "configs/native_archive_link.json"
NATIVE_ARCHIVES = json.loads(_na.read_text()) if _na.exists() else {}
_nr = ROOT / "configs" / "native_recon_link.json"
NATIVE_RECON = json.loads(_nr.read_text()) if _nr.exists() else {}
_rb = ROOT / 'configs/recon_bss_link.json'
RECON_BSS = json.loads(_rb.read_text()) if _rb.exists() else {}
_ha = ROOT / 'configs/native_hand_asm.json'
NATIVE_HAND_ASM = json.loads(_ha.read_text()) if _ha.exists() else {}
SECT = {"data": ".data", "rodata": ".rodata", "sdata": ".sdata", "bss": ".bss", "sbss": ".sbss"}

def is_native_zero_section(section):
    return section in ('.sbss', '.bss') or bool(re.fullmatch(r'\.(?:s?bss)\.\w+', section))

def cross_image_provisions(name):
    registry = ROOT / "configs" / "cross_image_symbols.json"
    if not registry.exists():
        return []
    bindings = json.loads(registry.read_text()).get(name, {})
    if not isinstance(bindings, dict):
        raise ValueError("cross-image bindings must be an image-to-function-list mapping")
    out, seen = [], set()
    for home, names in bindings.items():
        if home == name or home not in ("diabpsx", "frontend", "pregame", "game", "fmv"):
            raise ValueError(f"invalid cross-image home: {home}")
        if not isinstance(names, list):
            raise ValueError(f"{home}: cross-image symbols must be a list")
        symbol_file = "symbol_addrs.txt" if home == "diabpsx" else f"symbol_addrs_{home}.txt"
        symbols = (ROOT / "configs" / symbol_file).read_text()
        for symbol in names:
            if not isinstance(symbol, str) or not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_.$]*", symbol) or symbol in seen:
                raise ValueError(f"invalid/duplicate cross-image symbol: {symbol}")
            addresses = {int(value, 16) for value in re.findall(
                r"^" + re.escape(symbol) + r"\s*=\s*0x([0-9A-Fa-f]+);\s*//\s*type:func\b",
                symbols, re.M)}
            if len(addresses) != 1:
                raise ValueError(f"{symbol}: expected one retail function address in {symbol_file}")
            seen.add(symbol)
            out.append(f"PROVIDE({symbol} = 0x{addresses.pop():08X}); /* {home} retail export */")
    return out

def validate_data_bindings(subs, end, bindings, vram=0):
    if not isinstance(bindings, dict):
        raise ValueError("source data bindings must be a segment mapping")
    code = {n for off, kind, n in subs if kind == "c"}
    by_name = {n: (i, off, kind) for i, (off, kind, n) in enumerate(subs)}
    used = set()
    for name, binding in bindings.items():
        if name not in by_name or not isinstance(binding, dict):
            raise ValueError(f"invalid source data segment: {name}")
        i, offset, kind = by_name[name]
        owner, section, size = binding.get("owner"), binding.get("section"), binding.get("size")
        if kind not in SECT or section != SECT[kind]:
            raise ValueError(f"{name}: input section must match the retail data kind")
        if owner not in code or owner not in RECON_MAP:
            raise ValueError(f"{name}: data owner must have reconstructed text in this image")
        limit = subs[i + 1][0] if i + 1 < len(subs) else end
        if not isinstance(size, int) or isinstance(size, bool) or size <= 0 or size != limit - offset:
            raise ValueError(f"{name}: source extent must equal the whole retail fragment")
        payload = binding.get("payload_size", size)
        alignment = binding.get("alignment", 1)
        if (not isinstance(payload, int) or isinstance(payload, bool) or payload <= 0
                or not isinstance(alignment, int) or isinstance(alignment, bool)
                or alignment not in (1, 2, 4, 8, 16)
                or (vram + offset) % alignment
                or (payload + alignment - 1) // alignment * alignment != size):
            raise ValueError(f"{name}: source payload and alignment must exactly fill the retail fragment")
        key = (RECON_MAP[owner], section)
        padding = binding.get('padding_hex')
        if 'padding_hex' in binding and (not isinstance(padding, str) or payload >= size
                                    or not re.fullmatch(r'[0-9a-fA-F]+', padding)
                                    or len(padding) != 2 * (size - payload)):
            raise ValueError(f'{name}: explicit alignment bytes must exactly fill the padding')
        if key in used:
            raise ValueError(f"{name}: a source section cannot be placed twice in one image")
        used.add(key)


def gen(name: str):
    provisions = cross_image_provisions(name)  # validate before writing the generated script
    y = (ROOT / "configs" / f"{name}.yaml").read_text()
    vram = int(re.search(r"^\s+vram: (0x[0-9A-F]+)", y, re.M).group(1), 16)
    gp = re.search(r"gp_value: (0x[0-9A-F]+)", y).group(1)
    subs = [(int(o, 16), k, n) for o, k, n in re.findall(r"^\s+- \[0x([0-9A-F]+), (\w+), (\w+)\]", y, re.M)]
    end = int(re.search(r"^\s+- \[0x([0-9A-F]+)\]\s*$", y, re.M).group(1), 16)
    if name == 'diabpsx':
        from image_trailer import runtime_segments
        subs, end = runtime_segments(subs, end)
    data_bindings = DATA_MAP.get(name, {})
    validate_data_bindings(subs, end, data_bindings, vram)
    native = {segment: spec for segment, spec in NATIVE_RECON.items() if spec["image"] == name}
    native_whole = {segment for segment,spec in native.items() if '.text' in spec['sections']}
    extra_text = {row['segment'] for spec in NATIVE_RECON.values()
                  for section, row in spec['sections'].items()
                  if section.startswith('.text.') and row.get('image', spec['image']) == name}
    native_data = {scaffold for spec in NATIVE_RECON.values()
                   for section, row in spec["sections"].items()
                   if section != ".text" and not is_native_zero_section(section) and not section.startswith('.text.')
                   and row.get("image", spec["image"]) == name and row.get('scaffold')
                   for scaffold in (row['scaffold'] if isinstance(row['scaffold'], list) else [row['scaffold']])}
    archive_data = {scaffold: row for spec in NATIVE_ARCHIVES.values()
                    if spec.get("image") == name
                    for scaffold, row in spec.get("sections", {}).items()}
    if name == 'diabpsx':
        native_data.update(row['scaffold'] for spec in NATIVE_RECON.values()
                           for row in spec.get('common_symbols',{}).values() if 'scaffold' in row)
    native_raw = {}
    for owner, spec in NATIVE_RECON.items():
        composition = spec.get('composed_group', {})
        span = composition.get('raw_export_span') if isinstance(composition, dict) else None
        if not span or composition.get('image') != name:
            continue
        first = int(composition['va'], 0) + span['offset'] - vram
        limit = first + span['size']
        cursor = first
        for off, kind, target in subs:
            if first <= off < limit and kind == span['kind'] and target.startswith(span['target_prefix']):
                next_off = next((row[0] for row in subs if row[0] > off), end)
                stop = min(next_off, limit)
                if off != cursor:
                    raise ValueError('native raw span has a linker-layout gap')
                key = f'{target}.{kind}'
                if key in native_raw:
                    raise ValueError('duplicate native raw fragment')
                native_raw[key] = (owner, target, kind)
                cursor = stop
        if cursor != limit:
            raise ValueError('native raw span is incomplete in linker layout')
    native_raw_c = {}
    for owner, spec in NATIVE_RECON.items():
        for section, row in spec['sections'].items():
            target = row.get('raw_segment')
            if not target or row.get('image', spec['image']) != name:
                continue
            if row.get('raw_kind') != 'c' or target in native_raw_c:
                raise ValueError('invalid or duplicate native raw code segment')
            native_raw_c[target] = (owner, target, row['raw_kind'])
    if set(NATIVE_RECON) & set(RECON_MAP):
        raise ValueError("source TU cannot use both GNU and native source inputs")
    if extra_text & (native_whole | set(RECON_MAP)):
        raise ValueError('mixed native text cannot overlap a whole-TU source selection')
    if (native_whole | extra_text | set(native_raw_c)) - {n for off, kind, n in subs if kind == "c"}:
        raise ValueError("native source owner has no retail text fragment")
    available = {f"{n}.{kind}" for off, kind, n in subs if kind in SECT}
    sdk_data = SDK_DATA if name == "diabpsx" else set()
    if (sdk_data | native_data | set(native_raw) | set(archive_data)) - available:
        raise ValueError("native data placement names a missing retail fragment")
    # Native source may compose its exact ranges on top of the freshly generated
    # SDK bridge. gen_ld selects that one combined wrapper below; independent
    # native/conventional ownership of the same fragment remains forbidden.
    if any(f"{n}.{kind}" in sdk_data | native_data and n in data_bindings for off, kind, n in subs):
        raise ValueError("native and reconstructed data cannot own the same fragment")
    bss = re.search(r"bss_size: (0x[0-9A-F]+)", y)
    if RECON_BSS.get(name) and (not bss or name != 'diabpsx'):
        raise ValueError('conventional BSS requires main runtime zero-fill placement')
    out = ["/* generated by tools/gen_ld.py: true ROM order, every subsegment pinned to its retail address */",
           "SECTIONS", "{", f"    _gp = {gp};", f"    __romPos = 0;",
           f"    .{name} 0x{vram:08X} : AT(0) SUBALIGN(4)", "    {"]
    for i, (off, kind, n) in enumerate(subs):
        va = vram + off
        out.append(f"        . = 0x{off:X};   /* 0x{va:08X} */")   # inside an output section `.` is the offset from its start
        if kind == "c":
            skel = SKEL_MAP.get(n)
            if n in native_raw_c:
                owner, target, raw_kind = native_raw_c[n]
                out.append(f"        build/native_source/{owner}.raw_{target}.{raw_kind}.s.o(.text);   /* verified native raw segment */")
            elif n in native_whole or n in extra_text:
                out.append(f"        build/native_source/{n}.text.s.o(.text);   /* verified native-assembled source */")
            elif n in RECON_MAP:
                out.append(f"        build/{RECON_MAP[n]}.o(.text);   /* reconstructed TU */")
            else:
                out.append(f"        build/skel/{skel}.o(.text);" if skel else f"        build/src/{n}.c.o(.text);")
        elif kind == "asm":
            if n in NATIVE_HAND_ASM:
                spec = NATIVE_HAND_ASM[n]
                if spec['image'] != name or int(spec['va'], 0) != va or spec['size'] != (subs[i + 1][0] - off):
                    raise ValueError(f'{n}: native hand-assembly placement differs')
                out.append(f"        build/{spec['source']}.o({spec['section']});   /* genuine hand-authored source */")
            else:
                out.append(f"        build/asm/{n}.s.o(.text);")
        elif kind in SECT:
            binding = data_bindings.get(n)
            if binding:
                marker = f"__recon_{name}_{n}_start"
                out.extend([f"        {marker} = .;",
                            f"        build/{RECON_MAP[binding['owner']]}.o({binding['section']});   /* source-owned data */"])
                payload = binding.get("payload_size", binding["size"])
                if payload != binding["size"]:
                    out.append(f'        ASSERT(. - {marker} == 0x{payload:X}, "wrong source payload extent: {n}");')
                    if 'padding_hex' in binding:
                        out.extend(f'        BYTE(0x{byte:02X}); /* preserved retail alignment byte */'
                                   for byte in bytes.fromhex(binding['padding_hex']))
                    else:
                        out.extend(["        FILL(0);", f"        . = ALIGN({binding['alignment']});"])
                out.append(f"        ASSERT(. - {marker} == 0x{binding['size']:X}, \"wrong source data extent: {n}\");")
            elif f"{n}.{kind}" in native_raw:
                owner, target, raw_kind = native_raw[f"{n}.{kind}"]
                out.append(f"        build/native_source/{owner}.raw_{target}.{raw_kind}.s.o(.{raw_kind});   /* verified native raw span */")
            elif f"{n}.{kind}" in native_data:
                out.append(f"        build/native_source/{n}.{kind}.s.o({SECT[kind]});   /* verified native source data */")
            elif f"{n}.{kind}" in archive_data:
                row = archive_data[f"{n}.{kind}"]
                if row["output_section"] != SECT[kind]:
                    raise ValueError(f"{n}: native archive output section differs")
                out.append(f"        build/native_archive/{n}.{kind}.s.o({SECT[kind]});   /* original native archive group */")
            elif name == "diabpsx" and f"{n}.{kind}" in SDK_DATA:
                out.append(f"        build/sdk/native/{n}.{kind}.s.o({SECT[kind]});   /* original SDK data bridge */")
            else:
                out.append(f"        build/asm/data/{n}.{kind}.s.o({SECT[kind]});")
        else:
            sys.exit(f"{name}: unknown subsegment kind {kind} ({n})")
    out.append(f"        . = 0x{end:X};   /* image end 0x{vram + end:08X} */")
    if bss:
        out.append(f"        {name}_BSS_START = .;")
        if name == 'diabpsx':
            out.append('        D_8011C604 = .; /* startup zero-fill boundary, not file checksum */')
        limit = end + int(bss.group(1), 16)
        if name == "diabpsx":
            from sdk_link import bss_placements
            from native_recon import bss_placements as source_bss, check_bss_overlap
            sdk_bss = bss_placements(json.loads(_sd.read_text()) if _sd.exists() else {}, vram + end, vram + limit)
            native_bss = source_bss(NATIVE_RECON, vram + end, vram + limit)
            from recon_bss import placements as conventional_bss
            gnu_bss = conventional_bss(RECON_BSS.get(name, {}), RECON_MAP, vram + end, vram + limit)
            check_bss_overlap(native_bss + gnu_bss, sdk_bss)
            placed = [(a, z, e, s, f'build/sdk/native/{e}{s}.s.o', 'sdk') for a,z,e,s in sdk_bss]
            placed += [(a, z, e, s, f'build/native_source/{e}{s}.s.o', 'source') for a,z,e,s in native_bss]
            placed += [(a, z, e, s, f'build/{RECON_MAP[e]}.o', 'recon') for a,z,e,s in gnu_bss]
            for address, size, entry, section, obj, owner in sorted(placed):
                marker = f"__{owner}_{entry}_{section[1:]}_start"
                out.extend([f"        . = 0x{address - vram:X};",
                            f"        {marker} = .;",
                            f"        {obj}({section});",
                            f'        ASSERT(. - {marker} == 0x{size:X}, "wrong BSS extent: {entry}{section}");'])
        out.append(f"        . = 0x{limit:X};   /* remaining .sbss + .bss zero fill */")
    out += ["    }", "    /DISCARD/ : { *(.reginfo) *(.mdebug*) *(.comment) *(.pdr) *(.gnu.attributes) *(.MIPS.abiflags) }", "}", *provisions]
    (ROOT / "linkers" / f"{name}.ld").write_text("\n".join(out) + "\n")
    print(f"{name}: {len(subs)} subsegments -> linkers/{name}.ld")

if __name__ == "__main__":
    for n in (sys.argv[1:] or ["diabpsx", "frontend", "pregame", "game", "fmv"]):
        gen(n)
