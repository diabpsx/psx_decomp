#!/usr/bin/env python3
"""Link complete SDK text members with original PSYLINK at retail VAs.

The GNU scaffold consumes the verified CPE payload through an incbin format
bridge. This lane accepts text-only archive members with explicitly declared
external function bindings from the authoritative retail symbol map;
it neither reconstructs SDK functions nor modifies their instructions.
"""
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess

import build as B
import psyq_extract as P
import symlane as SL
from sdk_provenance import oracle as scaffold_bytes

ARCHIVES = Path("C:/Temp/PSYQ/psyq-400/PSX/LIB")
SDK410 = Path("C:/Temp/PSYQ/psyq-410/PSX/LIB")
ARCHIVE_ROOTS = {"4.0": ARCHIVES, "4.1": SDK410}
DEFAULT_SDK = "4.0"
OUT = B.BUILD / "sdk/native"


def cpe_bytes(data, va, size):
    return cpe_regions(data, {"text": (va, size)})["text"]


def cpe_regions(data, regions, allow_zero_holes=()):
    """Require exact coverage of every declared section, without unknown chunks."""
    if data[:4] != b"CPE\x01":
        raise ValueError("invalid CPE magic")
    ordered = sorted(regions.values())
    if (not ordered or any(size <= 0 for va, size in ordered)
            or any(a + n > b for (a, n), (b, m) in zip(ordered, ordered[1:]))):
        raise ValueError("CPE regions must be nonempty and nonoverlapping")
    result = {name: bytearray(size) for name, (va, size) in regions.items()}
    seen = {name: set() for name in regions}
    cursor, ended = 4, False
    while cursor < len(data):
        tag = data[cursor]
        cursor += 1
        if tag == 0:
            ended = True
            break
        if tag == 1:
            if cursor + 8 > len(data):
                raise ValueError("truncated CPE chunk header")
            address, length = struct.unpack_from("<II", data, cursor)
            cursor += 8
            owners = [name for name, (va, size) in regions.items()
                      if va <= address and address + length <= va + size]
            if cursor + length > len(data) or len(owners) != 1:
                raise ValueError("CPE chunk is truncated or outside the declared SDK member")
            name = owners[0]
            va, size = regions[name]
            for i, value in enumerate(data[cursor:cursor + length], address - va):
                if i in seen[name]:
                    raise ValueError("overlapping CPE chunks")
                seen[name].add(i)
                result[name][i] = value
            cursor += length
        elif tag in (2, 3, 8):
            cursor += {2: 4, 3: 6, 8: 1}[tag]
            if cursor > len(data):
                raise ValueError("truncated CPE metadata")
        else:
            raise ValueError(f"unsupported CPE tag {tag}")
    allow_zero_holes = set(allow_zero_holes)
    if allow_zero_holes - set(regions):
        raise ValueError("unknown CPE zero-hole region")
    if (not ended or any(data[cursor:])
            or any(len(seen[name]) != size for name, (va, size) in regions.items()
                   if name not in allow_zero_holes)):
        raise ValueError("CPE is unterminated, has trailing data, or leaves uncovered bytes")
    return {name: bytes(payload) for name, payload in result.items()}


def native_link(entry, raw, regions, bindings, prefix_objects=(), output_dir=None,
                overlay_text=False, composed_groups=None, allow_zero_holes=()):
    """Link an unchanged original object, with explicitly placed complete sections."""
    if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", entry):
        raise ValueError("invalid SDK output name")
    if type(overlay_text) is not bool:
        raise ValueError('native overlay selection must be Boolean')
    composed_groups = {} if composed_groups is None else composed_groups
    if not isinstance(composed_groups, dict):
        raise ValueError('native composed groups must be a mapping')
    composed_sections = []
    for name, row in composed_groups.items():
        if (not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', name)
                or not isinstance(row, dict) or set(row) != {'sections', 'va', 'size'}
                or not isinstance(row['sections'], list) or not row['sections']
                or any(not re.fullmatch(r'\.[A-Za-z_][A-Za-z0-9_.]*', section)
                       for section in row['sections'])
                or type(row['va']) is not int or type(row['size']) is not int
                or row['va'] % 4 or row['size'] <= 0):
            raise ValueError('invalid native composed group')
        composed_sections.extend(row['sections'])
    if len(composed_sections) != len(set(composed_sections)) or set(composed_sections) & set(regions):
        raise ValueError('native composed sections overlap ordinary placements')
    if overlay_text:
        overlay_composed = list(composed_groups.items())
        if len(overlay_composed) > 1:
            raise ValueError('native overlay supports one composed text group')
        if ((not overlay_composed and '.text' not in regions)
                or (overlay_composed and not any(
                    section == '.text' or re.fullmatch(r'\.text\.[A-Za-z_][A-Za-z0-9_.]*', section)
                    for section in overlay_composed[0][1]['sections']))
                or any(s not in ('.text', '.rdata', '.data', '.sdata', '.sbss', '.bss')
                       and not re.fullmatch(r'\.(?:rdata|data|sdata|sbss|bss)\.[A-Za-z_][A-Za-z0-9_.]*', s)
                       for s in regions)):
            raise ValueError('native overlay requires text and resident initialized pools')
        rows = sorted(regions.values())
        start, length = (overlay_composed[0][1]['va'], overlay_composed[0][1]['size']) if overlay_composed else regions['.text']
        if (start < 4 or start % 4 or length % 4
                or any(type(a) is not int or type(n) is not int or n <= 0 for a,n in rows)
                or any(a+n > b for (a,n),(b,m) in zip(rows,rows[1:]))
                or any(a < start and a+n > start-4 for a,n in rows)):
            raise ValueError('native overlay has invalid/overlapping regions or ID header')
        SL.require_symmunge()
    out = OUT if output_dir is None else Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)
    prefix_objects = [Path(prefix).resolve() for prefix in prefix_objects]
    if any(prefix == (out / f"{entry}.obj").resolve() for prefix in prefix_objects):
        raise ValueError("native prefix object cannot alias the linked object's output path")
    (out / f"{entry}.obj").write_bytes(raw)
    commands, files, composed_files = [], {}, {}
    if overlay_text:
        commands.append(f'overlay_anchor group org(${start-4:08X}),file("{entry}_anchor.bin")')
    for index, (section, (va, size)) in enumerate(regions.items()):
        if not re.fullmatch(r"\.[A-Za-z_][A-Za-z0-9_.]*", section):
            raise ValueError("invalid SDK section name")
        if overlay_text:
            filename = out / f'{entry}_group{index}.bin'
            files[section] = filename
            placement = 'over(overlay_anchor)' if section == '.text' and not composed_groups else f'org(${va:08X})'
            commands.append(f'sdk_{index} group {placement},file("{filename.name}")')
            commands.append(f'\tsection {section},sdk_{index}')
        else:
            commands.extend([f"sdk_{index} group org(${va:08X})", f"\tsection {section},sdk_{index}"])
    for index, (name, row) in enumerate(composed_groups.items()):
        if overlay_text:
            filename = out / f'{entry}_composed{index}.bin'
            composed_files[name] = filename
            commands.append(f'sdk_comp_{index} group over(overlay_anchor),file("{filename.name}")')
        else:
            commands.append(f'sdk_comp_{index} group org(${row["va"]:08X})')
        commands.extend(f'\tsection {section},sdk_comp_{index}' for section in row['sections'])
    for name, address in bindings.items():
        if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name):
            raise ValueError("invalid SDK binding name")
        commands.append(f"{name} equ ${address:08X}")
    for prefix in prefix_objects:
        prefix = Path(prefix).resolve()
        if not prefix.is_file() or '"' in str(prefix):
            raise ValueError("invalid native prefix object")
        commands.append(f'\tinclude "{prefix}"')
    commands.append(f"\tinclude {entry}.obj")
    (out / f"{entry}.lnk").write_bytes(("\r\n".join(commands) + "\r\n").encode("ascii"))
    sym_name = f'{entry}.raw.sym' if overlay_text else f'{entry}.sym'
    run = subprocess.run([str(SL.PSYLINK), "/c", "/m", *(['/v'] if overlay_text else []),
                          f"@{entry}.lnk,{entry}.cpe,{sym_name},{entry}.map"],
                         cwd=out, env=SL.ENV, capture_output=True, text=True)
    if run.returncode or "0 error(s)" not in run.stdout:
        raise ValueError("native SDK link failed: " + run.stdout + run.stderr)
    if overlay_text:
        map_text = (out / f'{entry}.map').read_text()
        payloads = list(files.values()) + list(composed_files.values()) + [out / f'{entry}_anchor.bin']
        raw_text = SL.compact_overlay_sym(out / sym_name, out / f'{entry}.sym', payloads)
        headers = [(int(a,16),int(n,16),int(i,16)) for a,n,i in re.findall(
            r'^\w+: \$([0-9a-f]{8}) overlay length \$([0-9a-f]{8}) id \$([0-9a-f]+)', raw_text,re.M|re.I)]
        blocks = {}
        for section,path in files.items():
            va,size = regions[section]
            data = path.read_bytes()
            if section == '.text':
                ids = [i for a,n,i in headers if (a,n)==(va-4,size+4)]
                if len(ids)!=1 or len(data)!=size+4 or data[:4]!=struct.pack('<I',ids[0]):
                    raise ValueError('native overlay ID metadata does not match its payload')
                # Remove only the vendor file-format header, never source code.
                data = data[4:]
            actual = re.findall(r'^\s*([0-9a-f]{8})\s+[0-9a-f]{8}\s+([0-9a-f]{8})\s+'
                                r'[0-9a-f]{8}\s+\w+\s+'+re.escape(section)+r'\s*$',map_text,re.M|re.I)
            if len(data)!=size or [(int(a,16),int(n,16)) for a,n in actual]!=[(va,size)]:
                raise ValueError('native overlay section extent/placement differs')
            blocks[section] = data
        for name,path in composed_files.items():
            row = composed_groups[name]
            data = path.read_bytes()
            ids = [i for a,n,i in headers if (a,n)==(row['va']-4,row['size']+4)]
            if len(ids)!=1 or len(data)!=row['size']+4 or data[:4]!=struct.pack('<I',ids[0]):
                raise ValueError('native composed overlay ID metadata does not match its payload')
            blocks[name] = data[4:]
        anchor = (out/f'{entry}_anchor.bin').read_bytes()
        ids = [i for a,n,i in headers if (a,n)==(start-4,4)]
        if len(ids)!=1 or anchor!=struct.pack('<I',ids[0]):
            raise ValueError('native overlay anchor metadata differs')
        return blocks, map_text
    output_regions = dict(regions)
    output_regions.update({name: (row['va'], row['size']) for name, row in composed_groups.items()})
    holes = set(composed_groups) | set(allow_zero_holes)
    return (cpe_regions((out / f"{entry}.cpe").read_bytes(), output_regions,
                        allow_zero_holes=holes),
            (out / f"{entry}.map").read_text())


def member_text(obj, entry, externs=(), exports=None, allow_prefix=False, data_sections=None,
                bss_sections=None, bss_exports=(), fixed_commons=None, data_exports=()):
    sections = [index for index, name in obj["sections"].items() if name == ".text"]
    if len(sections) != 1:
        raise ValueError("expected one SDK text section")
    section = sections[0]
    if len(set(externs)) != len(externs) or set(obj["xrefs"]) != set(externs):
        raise ValueError("SDK external bindings do not match the complete member's references")
    if any(obj["sections"].get(index) not in (".bss", ".sbss") for index in obj["bss"]):
        raise ValueError("SDK BSS uses an undeclared or initialized section")
    storage = {obj["sections"][index]: size for index, size in obj["bss"].items() if size}
    commons = [x for x in obj["xdefs"] if "bss" in x]
    fixed_commons = fixed_commons or {}
    if (len(set(bss_exports)) != len(bss_exports) or set(bss_exports) & set(fixed_commons)
            or {x["name"] for x in commons} != set(bss_exports) | set(fixed_commons)):
        raise ValueError("SDK common exports need exact declarations")
    for export in commons:
        if obj["sections"].get(export["sect"]) not in (".bss", ".sbss") or export["bss"] <= 0:
            raise ValueError("SDK common export has an invalid section or extent")
        if export["name"] in fixed_commons:
            if export["bss"] != fixed_commons[export["name"]]:
                raise ValueError("SDK common allocation differs from the original declaration")
            continue
        name = obj["sections"][export["sect"]]
        storage[name] = storage.get(name, 0) + export["bss"]
    if storage != (bss_sections or {}):
        raise ValueError("SDK BSS needs exact explicit placement")
    if any(index not in obj["sections"] for index in obj["code"]):
        raise ValueError("SDK payload uses an undeclared section")
    initialized = {obj["sections"][index]: len(data) for index, data in obj["code"].items()
                   if index != section and data and index not in obj["bss"]}
    if initialized != (data_sections or {}):
        raise ValueError("SDK member data sections need exact explicit placement")
    payload = obj["code"].get(section, b"")
    if not payload or len(payload) % 4:
        raise ValueError("SDK text is empty or not word aligned")
    expected = [entry] if exports is None else exports
    data_defs = [x for x in obj["xdefs"] if "bss" not in x and x["sect"] != section]
    if (len(set(data_exports)) != len(data_exports) or len(data_defs) != len(data_exports)
            or {x["name"] for x in data_defs} != set(data_exports)):
        raise ValueError("SDK initialized data exports need exact declarations")
    for export in data_defs:
        extent = (data_sections or {}).get(obj["sections"].get(export["sect"]), 0)
        if export["off"] < 0 or export["off"] >= extent:
            raise ValueError("SDK data export lies outside its declared section")
    actual = [x for x in obj["xdefs"] if "bss" not in x and x["sect"] == section]
    if (len(set(expected)) != len(expected) or len(actual) != len(expected)
            or {x["name"] for x in actual} != set(expected)):
        raise ValueError("SDK member exports do not match the complete declared set")
    offsets = [x["off"] for x in actual]
    if (len(set(offsets)) != len(offsets)
            or any(x["sect"] != section or x["off"] < 0 or x["off"] >= len(payload)
                   or x["off"] % 4 for x in actual)
            or not any(x["name"] == entry and x["off"] == min(offsets) for x in actual)
            or (min(offsets) != 0 and not allow_prefix)):
        raise ValueError("SDK exports need unique aligned offsets and an explicitly owned prefix")
    return payload


def bss_placements(registry, start, end):
    placements = []
    for entry, spec in registry.items():
        if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", entry):
            raise ValueError("invalid SDK BSS owner")
        regions = [(entry, section, region) for section, region in spec.get("bss_sections", {}).items()]
        for name, region in spec.get("common_symbols", {}).items():
            if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name):
                raise ValueError("invalid SDK common name")
            regions.append((entry + "_" + name, ".bss", region))
        for owner, section, region in regions:
            va, size = int(region["va"], 0), region["size"]
            if (section not in (".bss", ".sbss") or not isinstance(size, int)
                    or isinstance(size, bool) or size <= 0 or va % 4
                    or va < start or va + size > end):
                raise ValueError("SDK BSS placement is outside the image's zero-fill region")
            placements.append((va, size, owner, section))
    placements.sort()
    if any(a + n > b for (a, n, _, _), (b, _, _, _) in zip(placements, placements[1:])):
        raise ValueError("overlapping SDK BSS placements")
    return placements


def function_address(symbols, name):
    if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name):
        raise ValueError("invalid SDK function name")
    addresses = {int(v, 16) for v in re.findall(
        r"^" + re.escape(name) + r"\s*=\s*0x([0-9A-Fa-f]+);\s*//\s*type:func\b", symbols, re.M)}
    if len(addresses) != 1:
        raise ValueError(f"{name}: SDK binding needs one authoritative retail function address")
    return addresses.pop()


def partition_entries(exports, internal_names, va, size, prefix_owners=()):
    entries = [dict(export) for export in exports]
    seen = {export["name"] for export in exports}
    for name in internal_names:
        match = re.fullmatch(r"func_([0-9A-Fa-f]{8})", name)
        if not match or name in seen:
            raise ValueError("SDK internal entry must be a unique anonymous scaffold function")
        address, data = scaffold_bytes(B.ROOT / "asm/nonmatchings/lib" / (name + ".s"))
        offset = address - va
        if (address != int(match[1], 16) or offset < 0 or offset >= size or offset % 4
                or (offset + len(data) > size and name not in prefix_owners)):
            raise ValueError("SDK internal scaffold lies outside its complete member")
        entries.append({"name": name, "off": offset, "internal": True})
        seen.add(name)
    entries.sort(key=lambda x: x["off"])
    if len({entry["off"] for entry in entries}) != len(entries):
        raise ValueError("SDK internal entry overlaps an archive export")
    return entries


def data_address(symbols, name):
    if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name):
        raise ValueError("invalid SDK data binding name")
    rows = re.findall(r"^" + re.escape(name) + r"\s*=\s*0x([0-9A-Fa-f]+);\s*//([^\n]*)", symbols, re.M)
    addresses = {int(address, 16) for address, comment in rows}
    if len(addresses) != 1 or any("type:func" in comment for address, comment in rows):
        raise ValueError("SDK data binding needs one authoritative non-function address")
    return addresses.pop()


_GAS_ESCAPES = {'n': 10, 't': 9, 'r': 13, 'b': 8, 'f': 12, 'a': 7, 'v': 11, '\\': 92, '"': 34, "'": 39}


def gas_string_bytes(literal):
    """Bytes of a GAS string literal body (without the implicit NUL): C escapes, octal \\NNN and hex \\xHH
    decoded exactly as the assembler does; None for anything non-ASCII or malformed (the caller fails closed)."""
    out, i = bytearray(), 0
    while i < len(literal):
        c = literal[i]
        if c != '\\':
            if ord(c) > 127:
                return None
            out.append(ord(c)); i += 1; continue
        i += 1
        if i >= len(literal):
            return None
        c = literal[i]
        if c in _GAS_ESCAPES:
            out.append(_GAS_ESCAPES[c]); i += 1
        elif c in '01234567':
            digits = re.match(r'[0-7]{1,3}', literal[i:])[0]
            out.append(int(digits, 8) & 0xFF); i += len(digits)
        elif c == 'x':
            digits = re.match(r'[0-9A-Fa-f]{1,2}', literal[i + 1:])
            if not digits:
                return None
            out.append(int(digits[0], 16)); i += 1 + len(digits[0])
        else:
            return None
    return bytes(out)


def data_bridge(source, regions):
    """Import SDK data while preserving labels, including inside a scaffold object."""
    pattern = re.compile(r"^dlabel (\w+)\r?\n(.*?)^enddlabel \1\s*$", re.M | re.S)
    labels = []
    for match in pattern.finditer(source):
        address = re.search(r"/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\b", match[2])
        if address:
            labels.append((match, int(address[1], 16)))
    replacements, used = [], set()
    for va, size, filename in regions:
        if size <= 0:
            raise ValueError("SDK data region must have a positive extent")
        selected = [(i, match, address) for i, (match, address) in enumerate(labels)
                    if va <= address < va + size]
        last = selected[-1][0] if selected else -1
        whole = (selected and selected[0][2] == va and last + 1 < len(labels)
                 and labels[last + 1][1] == va + size)
        if not whole:
            # Library sections can begin/end inside a splat data label. Only
            # exact scalar rows and ASCII strings with only escaped-backslash
            # pairs are supported
            # there; extents are never inferred from address gaps.
            words = list(re.finditer(
                r"^[ \t]*/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})(?:\s+([0-9A-Fa-f]{8}))?\s*\*/[ \t]*\.(word|short|byte)[ \t]+[^,\r\n]+$",
                source, re.M))
            strings = list(re.finditer(
                r'^[ \t]*/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s*\*/[ \t]*\.asciz[ \t]+"((?:[^"\\\r\n]|\\.)*)"[ \t]*$',
                source, re.M))
            partial, cursor = [], va
            for i, match, address in selected:
                if i + 1 >= len(labels) or labels[i + 1][1] > va + size:
                    break
                end = labels[i + 1][1]
                if address > cursor:
                    partial.append((cursor, address))
                if end <= address:
                    raise ValueError("unordered SDK data labels")
                replacements.append((match.start(2), match.end(2),
                                     f'    .incbin "{filename}", {address - va}, {end - address}\n'))
                cursor = end
            if cursor < va + size:
                partial.append((cursor, va + size))
            for first, limit in partial:
                rows = [(match, int(match[1], 16), {'word': 4, 'short': 2, 'byte': 1}[match[3]])
                        for match in words if first <= int(match[1], 16) < limit
                        and (match[3] != 'word' or match[2] is not None)]
                rows += [(match, int(match[1], 16), len(gas_string_bytes(match[2])) + 1)
                         for match in strings if first <= int(match[1], 16) < limit
                         and gas_string_bytes(match[2]) is not None]
                rows.sort(key=lambda row: row[1])
                position = first
                for match, address, width in rows:
                    if address != position:
                        raise ValueError("data boundaries need contiguous explicit scalar rows")
                    used_width = min(width,limit-address)
                    suffix = ''
                    if used_width != width:
                        # A byte-array payload may end inside a literal word
                        # holding its existing alignment bytes. Preserve those
                        # exact bytes as scaffold; do not claim them as source.
                        if match.re.groups!=3 or match[3]!='word' or not match[2]:
                            raise ValueError('partial data tail requires a literal word')
                        try:
                            literal = int(match[0].split('.word',1)[1].strip(),0)
                            original = bytes.fromhex(match[2])
                            if not -(1<<31)<=literal<(1<<32) or (literal & 0xffffffff).to_bytes(4,'little') != original:
                                raise ValueError('word literal disagrees with byte annotation')
                        except ValueError:
                            raise ValueError('partial data tail requires verified literal bytes')
                        suffix = '\n    .byte '+','.join(f'0x{v:02X}' for v in original[used_width:])
                    position += used_width
                    replacements.append((match.start(), match.end(),
                                         f'    .incbin "{filename}", {address - va}, {used_width}'+suffix))
                if position != limit:
                    raise ValueError("data boundaries need contiguous explicit scalar rows")
            continue
        for i, match, address in selected:
            end = labels[i + 1][1]
            if match.start() in used or end <= address or end > va + size:
                raise ValueError("overlapping or unordered SDK data placement")
            used.add(match.start())
            body = f'    .incbin "{filename}", {address - va}, {end - address}\n'
            replacements.append((match.start(2), match.end(2), body))
    ordered = sorted(replacements)
    if any(end > next_start for (start, end, body), (next_start, next_end, next_body) in zip(ordered, ordered[1:])):
        raise ValueError("overlapping SDK data replacements")
    for start, end, body in reversed(ordered):
        source = source[:start] + body + source[end:]
    return source


def prefix_tails(plans):
    """Map a member's leading bytes to the preceding scaffold that contains them."""
    tails = {}
    owners = {p["exports"][-1]["name"]: p for p in plans}
    for plan in plans:
        prefix = plan["exports"][0]["off"]
        owner = plan.get("prefix_owner")
        if bool(prefix) != bool(owner):
            raise ValueError("SDK prefix ownership must be explicit and nonempty")
        if not prefix:
            continue
        if owner not in owners or owner in tails:
            raise ValueError("SDK prefix owner is missing or multiply claimed")
        previous = owners[owner]
        if previous is plan or previous["va"] + previous["size"] != plan["va"]:
            raise ValueError("SDK prefix is not contiguous with its owner's complete member")
        tails[owner] = plan
    return tails


def validate_scaffold_extents(exports, va, size, tails=None):
    """Do not discard unnamed data/padding attached to an old function fragment."""
    for index, export in enumerate(exports):
        end = exports[index + 1]["off"] if index + 1 < len(exports) else size
        actual_va, data = scaffold_bytes(
            B.ROOT / "asm/nonmatchings/lib" / (export["name"] + ".s"))
        tail = (tails or {}).get(export["name"])
        extra = tail["exports"][0]["off"] if tail else 0
        if tail and (tail["va"] != va + end or data[-extra:] != tail["linked"][:extra]):
            raise ValueError("SDK member prefix does not match its containing scaffold")
        if actual_va != va + export["off"] or len(data) != end - export["off"] + extra:
            raise ValueError(f"{export['name']}: SDK/scaffold extents differ; surrounding data needs explicit placement")


def local_label_aliases(source, entry, va, size):
    """Retain labels referenced by other scaffolds without changing native bytes."""
    aliases = []
    pattern = r"^\s*(?:(\.L[0-9A-Fa-f]{8}):|(?:alabel|dlabel|jlabel)\s+((?:D_|\.L)[0-9A-Fa-f]{8}))\s*$"
    for local, global_name in re.findall(pattern, source, re.M):
        label = local or global_name
        address = label[2:]
        offset = int(address, 16) - va
        if offset < 0 or offset > size or offset % 4:
            raise ValueError("scaffold local label is outside the native function slice")
        if global_name:
            aliases.append(f".global {label}\n")
        aliases.append(f".set {label}, {entry} + {offset}\n")
    return "".join(aliases)


def build():
    registry = json.loads((B.ROOT / "configs/sdk_link.json").read_text())
    symbols = (B.ROOT / "configs/symbol_addrs.txt").read_text()
    retail = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
    image = (B.ROOT / "configs/diabpsx.yaml").read_text()
    bss_size = int(re.search(r"bss_size:\s*(0x[0-9A-Fa-f]+)", image)[1], 16)
    from image_trailer import map_extents, decode
    payload_size, map_bss = map_extents((B.ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1'))
    decode(retail, payload_size)
    if bss_size != map_bss:
        raise ValueError('configured BSS size differs from retail MAP')
    bss_placements(registry, 0x80010000 + payload_size, 0x80010000 + payload_size + bss_size)
    OUT.mkdir(parents=True, exist_ok=True)
    receipts, selected, plans, bridges = [], set(), [], {}
    prefix_owners = {spec["prefix_owner"] for spec in registry.values() if spec.get("prefix_owner")}
    for entry, spec in registry.items():
        if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", entry):
            raise ValueError("invalid SDK entry name")
        library, member = spec["library"], spec["member"]
        if Path(library).name != library:
            raise ValueError("SDK archive must be a filename")
        sdk = spec.get("sdk", DEFAULT_SDK)
        archive = (ARCHIVE_ROOTS[sdk] / library).read_bytes()
        members, consumed = P.lib_members(archive)
        matches = [m for m in members if m["name"] == member]
        if consumed != len(archive) or len(matches) != 1:
            raise ValueError("archive member is missing, ambiguous, or archive parse is incomplete")
        raw = matches[0]["data"]
        obj = P.parse_obj(raw)
        if any(raw[obj["consumed"]:]):
            raise ValueError("SDK object has unparsed bytes")
        externs = spec.get("externs", [])
        data_externs = spec.get("data_externs", [])
        sections = spec.get("data_sections", {})
        storage = spec.get("bss_sections", {})
        fixed_commons = spec.get("common_symbols", {})
        common_names = [name for region in storage.values() for name in region.get("exports", [])]
        payload = member_text(obj, entry, externs + data_externs, spec.get("exports"),
                              bool(spec.get("prefix_owner") or spec.get("internal_entries")), {k: v["size"] for k, v in sections.items()},
                              {k: v["size"] for k, v in storage.items()}, common_names,
                              {k: v["size"] for k, v in fixed_commons.items()}, spec.get("data_exports", []))
        exports = sorted([x for x in obj["xdefs"] if "bss" not in x and obj["sections"][x["sect"]] == ".text"], key=lambda x: x["off"])
        va = function_address(symbols, entry) - exports[0]["off"]
        archive_exports = [x["name"] for x in exports]
        exports = partition_entries(exports, spec.get("internal_entries", []), va, len(payload), prefix_owners)
        for export in exports:
            name = export["name"]
            if name in selected or (not export.get("internal") and function_address(symbols, name) != va + export["off"]):
                raise ValueError("SDK export is duplicated or its retail offset differs")
            selected.add(name)
        bindings = {name: function_address(symbols, name) for name in externs}
        bindings.update({name: data_address(symbols, name) for name in data_externs})
        for name, allocation in fixed_commons.items():
            address = data_address(symbols, name)
            if address != int(allocation["va"], 0):
                raise ValueError("SDK common placement differs from retail")
            bindings[name] = address
        regions = {".text": (va, len(payload))}
        for section, placement in sections.items():
            if section not in (".rdata", ".data"):
                raise ValueError("unsupported initialized SDK section")
            regions[section] = (int(placement["va"], 0), placement["size"])
        regions.update({section: (int(placement["va"], 0), placement["size"])
                        for section, placement in storage.items()})
        if spec.get('whole_layout'):
            if spec['whole_layout'] != 'snmain':
                raise ValueError('unknown whole-link SDK layout')
            from sdk_layout import link_snmain
            linked_sections, map_text = link_snmain(entry, raw, regions, bindings, retail)
        else:
            linked_sections, map_text = native_link(entry, raw, regions, bindings)
        linked = linked_sections[".text"]
        for section, block in linked_sections.items():
            if section in storage:
                if any(block):
                    raise ValueError("native SDK BSS is not zero initialized")
                anchor = f"__sdk_{entry}_{section[1:]}"
                assembly = f'.section {section}\n{anchor}:\n.space {len(block)}\n'
                for export in (x for x in obj["xdefs"] if "bss" in x and x["name"] not in fixed_commons
                               and obj["sections"][x["sect"]] == section):
                    name = export["name"]
                    address = data_address(symbols, name)
                    offset = address - regions[section][0]
                    mapped = {int(v, 16) for v in re.findall(r"^\s*([0-9A-Fa-f]{8})\s+" + re.escape(name) + r"\s*$", map_text, re.M)}
                    if mapped != {address} or offset < 0 or offset + export["bss"] > len(block):
                        raise ValueError("native SDK BSS export differs from retail")
                    assembly += f'.global {name}\n.set {name}, {anchor} + {offset}\n.size {name}, {export["bss"]}\n'
                (OUT / f"{entry}{section}.s").write_text(assembly)
                continue
            start = regions[section][0] - 0x80010000
            if start < 0 or start + len(block) > len(retail) or block != retail[start:start + len(block)]:
                raise ValueError(f"{entry} {section}: native SDK link differs from retail")
            if section != ".text":
                filename = f"build/sdk/native/{entry}{section}.bin"
                (B.ROOT / filename).write_bytes(block)
                scaffold = sections[section]["scaffold"]
                kind = "rodata" if section == ".rdata" else "data"
                if not re.fullmatch(r"\w+\." + kind, scaffold):
                    raise ValueError("invalid SDK data scaffold")
                bridges.setdefault(scaffold, []).append((*regions[section], filename))
        for name, allocation in fixed_commons.items():
            mapped = {int(v, 16) for v in re.findall(r"^\s*([0-9A-Fa-f]{8})\s+" + re.escape(name) + r"\s*$", map_text, re.M)}
            if mapped != {bindings[name]}:
                raise ValueError("native SDK common binding differs")
            (OUT / f"{entry}_{name}.bss.s").write_text(
                f'.section .bss\n.global {name}\n{name}:\n.space {allocation["size"]}\n.size {name}, {allocation["size"]}\n')
        for name in spec.get("data_exports", []):
            definition = next(x for x in obj["xdefs"] if x["name"] == name)
            address = data_address(symbols, name)
            native_address = regions[obj["sections"][definition["sect"]]][0] + definition["off"]
            mapped = {int(v, 16) for v in re.findall(r"^\s*([0-9A-Fa-f]{8})\s+" + re.escape(name) + r"\s*$", map_text, re.M)}
            if native_address != address or mapped != {address}:
                raise ValueError("native SDK initialized data export differs from retail")
        for export in exports:
            if export.get("internal"):
                continue
            mapped = {int(v, 16) for v in re.findall(r"^\s*([0-9A-Fa-f]{8})\s+" + re.escape(export["name"]) + r"\s*$", map_text, re.M)}
            if mapped != {va + export["off"]}:
                raise ValueError("native SDK export address differs")
        (OUT / f"{entry}.bin").write_bytes(linked)
        plans.append({"entry": entry, "exports": exports, "va": va, "size": len(linked),
                      "linked": linked, "prefix_owner": spec.get("prefix_owner")})
        for index, export in enumerate(exports):
            name, offset = export["name"], export["off"]
            end = exports[index + 1]["off"] if index + 1 < len(exports) else len(linked)
            # Partition the complete verified member: no bytes removed or changed.
            (OUT / f"{name}.s").write_text(
                f'glabel {name}\n.incbin "build/sdk/native/{entry}.bin", {offset}, {end - offset}\nendlabel {name}\n')
        receipts.append({"entry": entry, "sdk": sdk, "library": library, "member": member,
                         "whole_layout": spec.get('whole_layout'),
                         "archive_exports": archive_exports,
                         "internal_entries": spec.get("internal_entries", []),
                         "prefix_owner": spec.get("prefix_owner"),
                         "bss_sections": storage,
                         "common_symbols": fixed_commons,
                         "data_exports": {name: f"0x{data_address(symbols, name):08X}" for name in spec.get("data_exports", [])},
                         "data_sections": {section: {**sections[section], "sha256": hashlib.sha256(linked_sections[section]).hexdigest()}
                                           for section in sections},
                         "exports": {x["name"]: f"0x{va + x['off']:08X}" for x in exports},
                         "externs": {name: f"0x{address:08X}" for name, address in bindings.items()},
                         "va": f"0x{va:08X}", "size": len(linked),
                         "archive_sha256": hashlib.sha256(archive).hexdigest(),
                         "object_sha256": hashlib.sha256(raw).hexdigest(),
                         "linked_sha256": hashlib.sha256(linked).hexdigest()})
        print(f"{entry}: native SDK link matches retail ({len(linked)} bytes)")
    tails = prefix_tails(plans)
    for plan in plans:
        validate_scaffold_extents(plan["exports"], plan["va"], plan["size"], tails)
    for owner, plan in tails.items():
        wrapper = OUT / f"{owner}.s"
        wrapper.write_text(wrapper.read_text() +
                           f'.incbin "build/sdk/native/{plan["entry"]}.bin", 0, {plan["exports"][0]["off"]}\n')
    for plan in plans:
        for export in plan["exports"]:
            name = export["name"]
            original = B.ROOT / "asm/nonmatchings/lib" / f"{name}.s"
            address, data = scaffold_bytes(original)
            # Extents above prove the complete wrapper, including any owned
            # neighbor prefix. Its internal labels are safe to retain only now.
            aliases = local_label_aliases(original.read_text(), name, address, len(data))
            wrapper = OUT / f"{name}.s"
            wrapper.write_text(wrapper.read_text() + aliases)
    for scaffold, regions in bridges.items():
        source = (B.ROOT / "asm/data" / (scaffold + ".s")).read_text()
        (OUT / (scaffold + ".s")).write_text(data_bridge(source, regions))
    (OUT / "receipts.json").write_text(json.dumps(receipts, indent=2) + "\n")
    return selected


if __name__ == "__main__":
    build()
