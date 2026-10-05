#!/usr/bin/env python3
"""Compile and verify whole source TUs with native ASPSX/PSYLINK.

The GP prefix is existing retail DATA scaffold, never reconstructed code.
Only the compiled TU's verified bytes are exported as source payloads.
The final-image linker consumes generated wrappers only after all checks pass.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

import build as B
import sdk_link as N
import symlane as S
import return_type_audit as RTA
import psyq_extract as P
import psyq_rewrite as PR
import native_commons as C

OUT = B.BUILD / 'native_source'
IMAGES = {'diabpsx': 'DIABPSX.BIN', 'pregame': 'PREGAME.BIN',
          'frontend': 'FRONTEND.BIN', 'game': 'GAME.BIN', 'fmv': 'FMV.BIN'}


def source_assembler(spec):
    version = spec.get('assembler', '2.56')
    choices = {
        '2.34': Path(os.environ.get('DIAB_ASPSX234', 'C:/Temp/nfs2-clean/psyq350/PSYQ/ASPSX.EXE')),
        '2.56': S.ASPSX,
        '2.67': Path('C:/Temp/PSYQ/psyq-410/PSSN/ASPSX.EXE'),
    }
    if not isinstance(version, str) or version not in choices:
        raise ValueError('unreviewed native source assembler version')
    return version, choices[version]


def source_assembler_options(spec):
    """(version, executable, runs under DOSBox, flags). `divide_guard` keeps ASPSX's default div/rem
    zero-divide expansion (no -0): ASPSX 2.34's only mode, and the measured EA Canada EACLIB lane
    on ASPSX 2.56 (bnez/nop/break 7 after every divide); PsyQ 4.0 game objects were assembled -0."""
    version, assembler = source_assembler(spec)
    guard = spec.get('divide_guard', version == '2.34')
    if not isinstance(guard, bool) or (version == '2.34' and not guard):
        raise ValueError('unreviewed native source divide-guard option')
    return version, assembler, version == '2.34', [] if guard else ['-0']


def is_zero_section(section):
    return section in ('.sbss', '.bss') or bool(re.fullmatch(r'\.(?:s?bss)\.\w+', section))


def compile_source(source, assembler, assembler_dos, assembler_flags, section_prefixes=None):
    if source.suffix.lower() != '.s':
        return S.compile_g(source, assembler=assembler, assembler_dos=assembler_dos,
                           assembler_flags=assembler_flags, section_prefixes=section_prefixes)
    if section_prefixes:
        raise ValueError('assembly source cannot consume a generated section prefix')
    flags = B.per_tu_flags(source)
    g = str(flags.get('g_value', B.G_VALUE))
    obj = S.OUT / (source.stem + '.g.obj')
    assembly = S.OUT / (source.stem + '.g.s')
    text = source.read_bytes().replace(b'\r\n', b'\n').replace(b'\n', b'\r\n')
    assembly.write_bytes(text)
    run = S.assemble_native(assembler, ['-q', '-g', *assembler_flags, f'-G{g}'], assembly, obj,
                            assembler_dos)
    if run.returncode or not obj.is_file():
        raise ValueError('native assembly source failed: ' + run.stdout + run.stderr)
    return obj


def image_layout(name):
    if name not in IMAGES:
        raise ValueError('unknown native source image')
    text = (B.ROOT / 'configs' / (name + '.yaml')).read_text()
    base = int(re.search(r'^\s+vram: (0x[0-9A-F]+)', text, re.M)[1], 16)
    rows = [(int(a, 16), kind, label) for a, kind, label in re.findall(
        r'^\s+- \[0x([0-9A-F]+), (\w+), (\w+)\]', text, re.M)]
    end = int(re.search(r'^\s+- \[0x([0-9A-F]+)\]\s*$', text, re.M)[1], 16)
    if name == 'diabpsx':
        from image_trailer import runtime_segments
        rows, end = runtime_segments(rows, end)
    layout = {(kind, label): (base + off, (rows[i + 1][0] if i + 1 < len(rows) else end) - off)
              for i, (off, kind, label) in enumerate(rows)}
    bss = re.search(r'bss_size:\s*(0x[0-9A-Fa-f]+)', text)
    if bss:
        layout[('bss', '__zero_fill')] = (base + end, int(bss[1], 16))
    return layout, base


def bss_placements(registry, start, end):
    result = []
    for segment, spec in registry.items():
        if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', segment):
            raise ValueError('invalid native BSS owner')
        for section, row in spec['sections'].items():
            if not is_zero_section(section):
                continue
            va, size = int(row['va'], 0), row['size']
            if (row.get('image', spec['image']) != 'diabpsx' or type(size) is not int
                    or size <= 0 or va % 4 or va < start or va + size > end):
                raise ValueError('native BSS outside main zero-fill region')
            result.append((va, size, segment, section))
        for name, row in spec.get('common_symbols', {}).items():
            if row.get('storage') != 'bss':
                continue
            va, size = int(row['va'], 0), row['size']
            if (type(size) is not int or size <= 0 or va % 4 or va < start or va + size > end
                    or not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', name)):
                raise ValueError('native common BSS outside main zero-fill region')
            result.append((va, size, segment + '.common_' + name, '.bss'))
    result.sort()
    if any(a + n > b for (a, n, _, _), (b, _, _, _) in zip(result, result[1:])):
        raise ValueError('overlapping native BSS placements')
    return result


def check_bss_overlap(native, sdk):
    rows = sorted(native + sdk)
    if any(a + n > b for (a, n, _, _), (b, _, _, _) in zip(rows, rows[1:])):
        raise ValueError('overlapping SDK/native BSS placements')


def validate_placements(segment, spec, layouts):
    sections = spec['sections']
    text_sections = [s for s in sections if s == '.text' or re.fullmatch(r'\.text\.\w+',s)]
    if not text_sections or any(s not in {'.text', '.rdata', '.sdata', '.data', '.sbss', '.bss', '.ctors', '.dtors'}
                                and not re.fullmatch(r'\.(?:text|rdata|data|sdata|sbss|bss)\.\w+', s) for s in sections):
        raise ValueError('unsupported native source section set')
    homes, regions, limits = {}, {}, {}
    for section, row in sections.items():
        home = row.get('image', spec['image'])
        if home not in layouts or (section == '.text' and home != spec['image']):
            raise ValueError('invalid native source section image')
        if (section.startswith('.sdata') or is_zero_section(section)) and home != 'diabpsx':
            raise ValueError('native small data requires main-image placement')
        size, va = row['size'], int(row['va'], 0)
        if type(size) is not int or size <= 0:
            raise ValueError('native source section needs a positive extent')
        if 'raw_segment' in row:
            if (set(row) - {'va', 'size', 'source_section', 'raw_segment', 'raw_kind',
                            'allow_zero_tail', 'image'}
                    or row.get('raw_kind') != 'c'
                    or not re.fullmatch(r'\w+', row.get('raw_segment', ''))
                    or type(row.get('allow_zero_tail', 0)) is not int
                    or not 0 <= row.get('allow_zero_tail', 0) < size):
                raise ValueError('invalid native raw-segment placement')
            key = ('c', row['raw_segment'])
        elif section == '.text':
            key = ('c', segment)
        elif section.startswith('.text.'):
            target = row.get('segment', '')
            same_segment_route = (target == segment and spec.get('routed_only') is True
                                  and '.text' not in sections)
            if (not re.fullmatch(r'\w+', target) or (target == segment and not same_segment_route)
                    or va % 4 or size % 4):
                raise ValueError('extra source text requires a distinct aligned retail segment')
            key = ('c', target)
        elif is_zero_section(section):
            if va % 4:
                raise ValueError('native BSS must be word aligned')
            key = ('bss', '__zero_fill')
        else:
            kind = ('data' if section in ('.ctors', '.dtors') or section.startswith('.data.') else 'rodata' if section.startswith('.rdata')
                    else 'sdata' if section.startswith('.sdata.') else section[1:])
            if section in ('.ctors', '.dtors') and (va % 4 or size % 4):
                raise ValueError('native constructor/destructor tables must be word aligned')
            scaffold = row['scaffold']
            if not re.fullmatch(r'\w+\.' + kind, scaffold):
                raise ValueError('invalid native source data scaffold')
            key = (kind, scaffold.rsplit('.', 1)[0])
        extent = layouts[home].get(key)
        if extent is None or not (extent[0] <= va < va + size <= sum(extent)):
            raise ValueError('native source section is outside its declared retail fragment')
        if section == '.text' and (va, size) != extent:
            raise ValueError('native source text must fill the complete retail TU')
        homes[section], regions[section], limits[section] = home, (va, size), sum(extent)
        source_section = row.get('source_section', section)
        if not isinstance(source_section, str) or not re.fullmatch(r'\.[A-Za-z_][A-Za-z0-9_.]*', source_section):
            raise ValueError('invalid native object-section alias')
    aliases = [row.get('source_section', section) for section, row in sections.items()]
    if len(aliases) != len(set(aliases)):
        raise ValueError('native object-section aliases must be unique')
    return homes, regions, limits


def bounded_data_bridge(source, regions, end):
    opened = None
    for action, label in re.findall(r'^(dlabel|enddlabel)\s+(\w+)\s*$', source, re.M):
        if action == 'dlabel':
            if opened is not None:
                raise ValueError('native data scaffold has an unclosed label')
            opened = label
        elif opened != label:
            raise ValueError('native data scaffold has unmatched label boundaries')
        else:
            opened = None
    if opened is not None:
        raise ValueError('native data scaffold has an unclosed label')
    # Give the existing label-preserving parser the YAML-proven final boundary.
    # The sentinel is parser metadata only and never emitted into a wrapper.
    marker = '__native_source_end_boundary'
    if marker in source or any(va + size > end for va, size, _ in regions):
        raise ValueError('invalid native data boundary')
    suffix = f'\ndlabel {marker}\n /* 0 {end:08X} 00000000 */ .word 0\nenddlabel {marker}\n'
    result = N.data_bridge(source + suffix, regions)
    return result[:result.index('\ndlabel ' + marker)]


def sha(data):
    return hashlib.sha256(data).hexdigest()


def resolve_bindings(names, symbol_text):
    result = {}
    for name in names:
        if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', name) or name in result:
            raise ValueError('invalid or duplicate native source binding')
        values = {int(v, 16) for v in re.findall(
            r'^' + re.escape(name) + r'\s*=\s*0x([0-9A-Fa-f]+);', symbol_text, re.M)}
        if len(values) != 1:
            raise ValueError(f'{name}: expected one authoritative retail address')
        result[name] = values.pop()
    return result


def resolve_retail_data_bindings(names, retail_sym):
    """Resolve file-static cross-section references from the retail SYM oracle."""
    result = {}
    for name in names:
        if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', name) or name in result:
            raise ValueError('invalid or duplicate retail data binding')
        records = list(data_records(retail_sym, name))
        values = {row[0] for row in records}
        if len(records) != 1 or len(values) != 1:
            raise ValueError(f'{name}: expected one authoritative retail data record')
        result[name] = values.pop()
    return result


def resolve_scaffold_bindings(rows):
    """Resolve unnamed retail-pool labels from one explicitly named scaffold."""
    if not isinstance(rows, dict):
        raise ValueError('scaffold bindings must be a mapping')
    result = {}
    for name, scaffold in rows.items():
        if (not re.fullmatch(r'D_[0-9A-Fa-f]{8}', name)
                or not isinstance(scaffold, str) or not re.fullmatch(r'\w+\.\w+', scaffold)):
            raise ValueError('invalid scaffold binding')
        path = B.ROOT / 'asm/data' / (scaffold + '.s')
        if not path.is_file():
            raise ValueError('scaffold binding source is absent')
        text = path.read_text()
        match = re.search(r'^dlabel\s+' + re.escape(name) + r'\s*$(.*?)^enddlabel\s+' +
                          re.escape(name) + r'\s*$', text, re.M | re.S)
        if match is None:
            raise ValueError('scaffold binding label is absent or ambiguous')
        addresses = re.findall(r'/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\b', match[1])
        if not addresses:
            raise ValueError('scaffold binding has no retail address')
        address = int(addresses[0], 16)
        if address != int(name[2:], 16):
            raise ValueError('scaffold binding name disagrees with its retail address')
        result[name] = address
    return result


def prefix_bytes(retail, gp, start, small_end):
    if not (0x80010000 <= gp <= start < small_end <= 0x80010000 + len(retail)):
        raise ValueError('GP prefix must stay within the initialized small-data range')
    if gp % 4:
        raise ValueError('GP base must be word aligned')
    return retail[gp - 0x80010000:start - 0x80010000]


def small_data_group(rows, end):
    indices = [i for i, row in enumerate(rows) if row[1] == 'sdata']
    if not indices or indices != list(range(indices[0], indices[-1] + 1)):
        raise ValueError('small-data fragments must form one contiguous group')
    first, last = indices[0], indices[-1]
    stop = rows[last + 1][0] if last + 1 < len(rows) else end
    if stop <= rows[first][0]:
        raise ValueError('invalid small-data group extent')
    return 0x80010000 + rows[first][0], 0x80010000 + stop


def gp_carrier_plan(regions, retail, gp, small_end, anchor=False):
    combined = dict(regions)
    if '.sdata' in regions:
        va, size = regions['.sdata']
        prefix = prefix_bytes(retail, gp, va, small_end)
        combined['.sdata'] = (gp, len(prefix) + size)
        return prefix, combined, 'prefix'
    if '.sbss' in regions or anchor:
        # `anchor`: a -G8 TU whose only small data are externally bound commons still patches them
        # gp-relative, so PSYLINK needs the GP base established by the same verified scaffold word.
        # PSYLINK bases internal GP patches on the .sdata group even when
        # the source only owns .sbss. A verified scaffold word anchors it.
        prefix = prefix_bytes(retail, gp, gp + 4, small_end)
        combined['.sdata'] = (gp, 4)
        return prefix, combined, 'anchor'
    return b'', combined, 'none'


def data_records(text, name):
    records = set()
    for line in text.splitlines():
        m = S.REC.match(line)
        if m and m[9] == name and m[3] in ('EXT', 'STAT'):
            records.add((int(m[1], 16), m[3], m[4].strip(), int(m[5]),
                         (m[7] or '').strip(), m[8] or '', m[9]))
    return records


def verify_data_map(map_text, symbols, retail_text, name, alias=None, expected_address=None):
    records = data_records(retail_text, name)
    if expected_address is not None:
        records = {row for row in records if row[0] == expected_address}
    if len(records) != 1:
        raise ValueError('native data needs one authoritative retail record')
    addresses = {int(v, 16) for v in re.findall(
        r'^\s*([0-9A-Fa-f]{8})\s+' + re.escape(name) + r'\s*$', map_text, re.M)}
    authority = N.data_address(symbols, alias if alias is not None else name)
    if authority != next(iter(records))[0] or addresses != {authority}:
        raise ValueError(f'{name}: native source map differs')


def verify_untyped_export(map_text, symbols, retail_text, compiled_text, name, alias):
    if data_records(retail_text, name):
        raise ValueError('available retail data types must use the typed verification path')
    actual = data_records(compiled_text, name)
    if len(actual) > 1:
        raise ValueError('untyped export has ambiguous compiler declarations')
    record = next(iter(actual)) if actual else None
    if name in S.functions(compiled_text) or (record and (record[1] != 'EXT' or record[2].startswith('FCN '))):
        raise ValueError('untyped export must be public data, not a function')
    authority = N.data_address(symbols, alias)
    retail_addresses = {int(a, 16) for a in re.findall(
        r'^[0-9a-f]+: \$([0-9a-f]{8}) 2 ' + re.escape(name) + r'\s*$', retail_text, re.M)}
    native_addresses = {int(a, 16) for a in re.findall(
        r'^\s*([0-9A-Fa-f]{8})\s+' + re.escape(name) + r'\s*$', map_text, re.M)}
    compiled_addresses = {int(a, 16) for a in re.findall(
        r'^[0-9a-f]+: \$([0-9a-f]{8}) 2 ' + re.escape(name) + r'\s*$', compiled_text, re.M)}
    # the native -g object records the export either as a plain `2` name record or (commons, -G8 small
    # data) as a typed EXT declaration; either must sit at the retail address
    if (retail_addresses != {authority} or native_addresses != {authority}
            or (compiled_addresses and compiled_addresses != {authority})
            or (not compiled_addresses and not record) or (record and record[0] != authority)):
        raise ValueError('untyped export addresses disagree')
    return {'address': f'0x{authority:08X}', 'alias': alias,
            'compiler_type': record[2] if record else None, 'retail_type_record': False}


def verify_sym(text, segment, data_symbols, retail_text, extra_paths=(), routed_only=False,
               data_record_addresses=None):
    ours = S.functions(text)
    retail = S.functions(retail_text, every=True)
    our_declarations = RTA.declarations(text)
    retail_declarations = RTA.declarations(retail_text)
    expected = set()
    count = 0
    base_paths = [] if routed_only else sorted((B.ROOT / 'asm/nonmatchings' / segment).glob('*.s'))
    for path in base_paths + list(extra_paths):
        name = re.sub(r'_(?:[0-9a-f]{8}|ci)$', '', path.stem)
        va = S.oracle_va(path.parent.name, path.stem)
        retail_name = name
        if retail_name not in retail and name.startswith('___'):
            retail_name = '_._' + name[3:]  # Same cfront spelling alias as symlane.
        if retail_name not in retail and re.fullmatch(r'_GLOBAL__[ID]_\w+', name):
            retail_name = name.replace('_GLOBAL__I_', '_GLOBAL_.I.').replace('_GLOBAL__D_', '_GLOBAL_.D.')
        copies = [f for f in retail.get(retail_name, []) if f['start'] == va]
        if name not in ours or len(copies) != 1 or ours[name]['start'] != va:
            raise ValueError(f'{name}: missing/ambiguous native function or wrong placement')
        key = RTA.canonical(name)
        actual, wanted = our_declarations.get(key, set()), retail_declarations.get(key, set())
        if not RTA.unrecorded_compiler_thunk(name, actual, wanted):
            same, reason = RTA.compare(actual, wanted)
            if not same:
                raise ValueError(f'{name}: native return declaration differs: {reason}')
        ok, reason = S.compare(S.normalize_embedded_text_table(ours[name], name),
                               S.normalize_embedded_text_table(copies[0], name))
        if not ok:
            raise ValueError(f'{name}: native SYM differs: {reason}')
        expected.add(name)
        count += 1
    if not count or set(ours) != expected:
        raise ValueError('native source function set differs from the complete TU')
    data_record_addresses = {} if data_record_addresses is None else data_record_addresses
    for name in data_symbols:
        actual, wanted = data_records(text, name), data_records(retail_text, name)
        if name in data_record_addresses:
            address = data_record_addresses[name]
            actual = {row for row in actual if row[0] == address}
            wanted = {row for row in wanted if row[0] == address}
        if len(actual) != 1 or len(wanted) != 1 or actual != wanted:
            raise ValueError(f'{name}: native global data SYM differs')
    return count


def verify_stripped_library_members(obj, spec, regions, map_text, retail_text, paths):
    """Verify source members whose retail library objects have no body-SYM records."""
    if spec.get('stripped_library_sym') is not True:
        raise ValueError('stripped library verification must be explicit')
    wanted = []
    for section, placement in spec['sections'].items():
        if section.startswith('.text.'):
            wanted.extend(placement.get('functions', []))
    if len(wanted) != len(set(wanted)) or set(wanted) != {path.stem for path in paths}:
        raise ValueError('stripped library member list differs from routed text')
    # Oracle scaffolds are named by splat labels; a retail `2` name record may spell the exported
    # symbol differently (func_80025254 = internalupdateasyncqueue), and one oracle span may hold a
    # second exported function with no scaffold of its own (localasyncreader + PSXiasyncreader,
    # setdirentrycallback + asyncdirentrycallback).  Those are declared explicitly and verified by
    # their retail name-record address; their bytes are inside the whole-section retail compare.
    aliases = spec.get('function_aliases', {})
    covered = spec.get('covered_functions', [])
    if (not isinstance(aliases, dict) or not isinstance(covered, list)
            or any(not isinstance(k, str) or not isinstance(v, str) or k not in wanted for k, v in aliases.items())
            or any(not isinstance(n, str) or not re.fullmatch(r'\w+', n) for n in covered)
            or len(set(covered)) != len(covered)):
        raise ValueError('invalid stripped library function aliases or covered functions')
    # hand-assembly helpers that retail kept file-local and the assembler records under no symbol at all
    # (CRUNCH.MIP func_8001xxxx): their scaffolds still tile the text and their bytes are inside the
    # whole-section retail compare, so they are declared explicitly and need no symbol receipt.
    statics = spec.get('static_functions', [])
    if (not isinstance(statics, list) or len(set(statics)) != len(statics)
            or any(s not in wanted or s in aliases for s in statics)):
        raise ValueError('invalid stripped library static functions')
    symbols = {aliases.get(name, name) for name in wanted if name not in statics}
    if len(symbols) != len(wanted) - len(statics) or symbols & set(covered):
        raise ValueError('stripped library exported names must be distinct')
    retail_functions = S.functions(retail_text, every=True)
    if any(name in retail_functions for name in list(symbols) + covered):
        raise ValueError('available retail body SYM must use the full verifier')
    source_section = next(spec['sections'][section].get('source_section', section)
                          for section in spec['sections'] if section.startswith('.text.'))
    section_ids = [index for index, name in obj['sections'].items() if name == source_section]
    if len(section_ids) != 1:
        raise ValueError('stripped library object has ambiguous text section')
    section_id = section_ids[0]
    definitions = {row['name']: row for row in obj['xdefs']
                   if 'bss' not in row and row['sect'] == section_id}
    # retail-static helpers carry a SYM `2` name record but no MAP entry; they are file-local here too
    local_definitions = {row['name']: row for row in obj.get('locals', ())
                         if 'bss' not in row and row['sect'] == section_id}
    if set(definitions) != (symbols | set(covered)) - set(local_definitions):
        raise ValueError('stripped library exports differ from the complete object')
    logical = next(section for section in spec['sections'] if section.startswith('.text.'))
    base, size = regions[logical]

    def check(symbol, address, length):
        row = definitions.get(symbol) or local_definitions[symbol]
        if row['off'] != address - base or row['off'] < 0 or row['off'] + length > size:
            raise ValueError(symbol + ': stripped library object offset differs')
        if symbol in local_definitions:
            addresses = {int(a, 16) for a in re.findall(
                r'^[0-9a-f]+: \$([0-9a-f]{8}) 2 ' + re.escape(symbol) + r'\s*$', retail_text, re.M)}
            if addresses != {address}:
                raise ValueError(symbol + ': retail name record address differs')
            return
        mapped = {int(value, 16) for value in re.findall(
            r'^\s*([0-9A-Fa-f]{8})\s+' + re.escape(symbol) + r'\s*$', map_text, re.M)}
        if mapped != {address}:
            raise ValueError(symbol + ': stripped library map address differs')

    for path in paths:
        address, data = N.scaffold_bytes(path)
        if path.stem in statics:
            if not base <= address < address + len(data) <= base + size:
                raise ValueError(path.stem + ': static helper outside the member text')
            continue
        check(aliases.get(path.stem, path.stem), address, len(data))
    for symbol in covered:
        addresses = {int(a, 16) for a in re.findall(
            r'^[0-9a-f]+: \$([0-9a-f]{8}) 2 ' + re.escape(symbol) + r'\s*$', retail_text, re.M)}
        if len(addresses) != 1:
            raise ValueError(symbol + ': covered function needs one retail name record')
        check(symbol, addresses.pop(), 4)
    return len(wanted) + len(covered)


def text_bridge(segment, va, size):
    parts = []
    for path in (B.ROOT / 'asm/nonmatchings' / segment).glob('*.s'):
        address, data = N.scaffold_bytes(path)
        source = path.read_text()
        labels = re.findall(r'^glabel\s+(\S+)\s*$', source, re.M)
        if len(labels) != 1:
            raise ValueError('native source text needs one scaffold entry per fragment')
        parts.append((address, data, labels[0], source))
    cursor = va
    output = ['.include "macro.inc"\n.section .text\n']
    for address, data, label, source in sorted(parts):
        if address != cursor or address + len(data) > va + size:
            raise ValueError('native source text fragments must cover the complete TU exactly')
        output.append(f'glabel {label}\n.incbin "build/native_source/{segment}.text.bin", '
                      f'{address - va}, {len(data)}\nendlabel {label}\n')
        output.append(N.local_label_aliases(source, label, address, len(data)))
        cursor += len(data)
    if cursor != va + size:
        raise ValueError('native source text has an uncovered suffix')
    return ''.join(output)


def build(only=None):
    """Compile, link and verify every registered native source TU; write the link bridges + receipts.
    `only` = iterable of segment names: verify just those (all cross-TU placement checks still run) and
    return their receipts WITHOUT writing bridges or receipts.json (validation of new registry entries)."""
    registry = json.loads((B.ROOT / 'configs/native_recon_link.json').read_text())
    sdk_registry = json.loads((B.ROOT/'configs/sdk_link.json').read_text())
    sdk_scaffolds = {row['scaffold'] for spec in sdk_registry.values()
                     for row in spec.get('data_sections',{}).values()}
    image = (B.ROOT / 'configs/diabpsx.yaml').read_text()
    subs = [(int(a, 16), kind, name) for a, kind, name in re.findall(
        r'^\s+- \[0x([0-9A-F]+), (\w+), (\w+)\]', image, re.M)]
    end = int(re.search(r'^\s+- \[0x([0-9A-F]+)\]\s*$', image, re.M)[1], 16)
    gp = int(re.search(r'gp_value:\s*(0x[0-9A-Fa-f]+)', image)[1], 16)
    small_start, small_end = small_data_group(subs, end)
    if gp != small_start:
        raise ValueError('native source GP group requires the verified small-data start')
    retail = (B.ROOT / 'rom/DIABPSX.BIN').read_bytes()
    symbol_text = '\n'.join(p.read_text() for p in (B.ROOT / 'configs').glob('symbol_addrs*.txt'))
    retail_sym = S.RETAIL.read_text(encoding='latin-1')
    OUT.mkdir(parents=True, exist_ok=True)
    layouts, bases = {}, {}
    for name in IMAGES:
        layouts[name], bases[name] = image_layout(name)
    retail_images = {name: (B.ROOT / 'rom' / filename).read_bytes() for name, filename in IMAGES.items()}
    bss_start, bss_size = layouts['diabpsx'][('bss', '__zero_fill')]
    native_bss = bss_placements(registry, bss_start, bss_start + bss_size)
    sdk_bss = N.bss_placements(json.loads((B.ROOT / 'configs/sdk_link.json').read_text()),
                               bss_start, bss_start + bss_size)
    check_bss_overlap(native_bss, sdk_bss)
    receipts, bridges, bridge_limits, occupied = [], {}, {}, []
    extra_bridges, extra_limits = {}, {}
    for segment, spec in registry.items():
        if only is not None and segment not in set(only):
            continue
        source = (B.ROOT / spec['source']).resolve()
        source.relative_to(B.ROOT)
        if source.stem != segment:
            raise ValueError('native source requires a same-name whole TU')
        assembler_version, assembler, assembler_dos, assembler_flags = source_assembler_options(spec)
        homes, regions, limits = validate_placements(segment, spec, layouts)
        source_sections = {section: row.get('source_section', section)
                           for section, row in spec['sections'].items()}
        reverse_sections = {source: section for section, source in source_sections.items()}
        composition = spec.get('composed_group')
        composed_exports = {}
        composed_link = None
        raw_exports = []
        raw_payloads = {}
        if composition is not None:
            required_composition = {'name', 'sections', 'image', 'va', 'size', 'exports'}
            if (not isinstance(composition, dict)
                    or set(composition) - (required_composition | {'raw_export_span'})
                    or not required_composition <= set(composition)
                    or not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', composition['name'])
                    or not isinstance(composition['sections'], list) or not composition['sections']
                    or len(composition['sections']) != len(set(composition['sections']))
                    or any(not re.fullmatch(r'\.[A-Za-z_][A-Za-z0-9_.]*', value)
                           for value in composition['sections'])
                    or composition['image'] not in layouts
                    or type(composition['size']) is not int or composition['size'] <= 0
                    or not isinstance(composition['exports'], dict)):
                raise ValueError('invalid native composed-group declaration')
            composed_va = int(composition['va'], 0)
            if composed_va % 4:
                raise ValueError('native composed group must be word aligned')
            for section, row in composition['exports'].items():
                if (section not in regions or not isinstance(row, dict)
                        or set(row) != {'offset', 'size'} or type(row['offset']) is not int
                        or type(row['size']) is not int or row['offset'] < 0 or row['size'] <= 0
                        or row['offset'] + row['size'] > composition['size']
                        or regions[section] != (composed_va + row['offset'], row['size'])
                        or homes[section] != composition['image']):
                    raise ValueError('invalid native composed-group export')
                composed_exports[section] = row
            if '.text' not in composed_exports:
                raise ValueError('native composed group must export the complete text section')
            raw_span = composition.get('raw_export_span')
            if raw_span is not None:
                if (not isinstance(raw_span, dict)
                        or set(raw_span) != {'offset', 'size', 'kind', 'target_prefix'}
                        or type(raw_span['offset']) is not int or raw_span['offset'] < 0
                        or type(raw_span['size']) is not int or raw_span['size'] <= 0
                        or raw_span['offset'] + raw_span['size'] > composition['size']
                        or raw_span['kind'] not in ('rodata', 'data')
                        or not isinstance(raw_span['target_prefix'], str)
                        or not re.fullmatch(r'\w+', raw_span['target_prefix'])):
                    raise ValueError('invalid native raw-export span')
                first = composed_va + raw_span['offset']
                limit = first + raw_span['size']
                candidates = sorted((extent[0], sum(extent), name) for (kind, name), extent
                                    in layouts[composition['image']].items()
                                    if kind == raw_span['kind'] and name.startswith(raw_span['target_prefix'])
                                    and first <= extent[0] < sum(extent) <= limit)
                cursor = first
                for start, stop, target in candidates:
                    if start != cursor:
                        raise ValueError('native raw-export span has a retail-layout gap')
                    raw_exports.append({'target': target, 'kind': raw_span['kind'],
                                        'offset': start - composed_va, 'size': stop - start})
                    cursor = stop
                if cursor != limit:
                    raise ValueError('native raw-export span is not completely declared')
            composed_link = {composition['name']: {
                'sections': composition['sections'], 'va': composed_va,
                'size': composition['size']}}
        extra_paths = []
        from native_text import validate_members, render_mixed
        routed = {}
        for line in (B.ROOT/'configs/segment_homes.txt').read_text().splitlines():
            line = line.split('#', 1)[0].strip()
            if line:
                home_segment, function, owner = line.split()
                routed[(home_segment, function)] = owner
        for section, row in spec['sections'].items():
            if not section.startswith('.text.'):
                continue
            target = row['segment']
            entries = {p.stem: (N.scaffold_bytes(p)[0], len(N.scaffold_bytes(p)[1]))
                       for p in (B.ROOT/'asm/nonmatchings'/target).glob('*.s')}
            validate_members(*regions[section], row.get('functions'), entries)
            for function in row['functions']:
                if routed.get((target, function)) != spec['source']:
                    raise ValueError('extra function does not belong to this source TU')
                extra_paths.append(B.ROOT/'asm/nonmatchings'/target/(function+'.s'))
                if function in extra_bridges.setdefault(target, {}):
                    raise ValueError('duplicate extra source function ownership')
                extra_bridges[target][function] = (*regions[section], f'build/native_source/{segment}{section}.bin')
            extra_limits[target] = layouts[homes[section]][('c', target)]
        for section, (va, size) in regions.items():
            if any(home == homes[section] and va < stop and start < va + size
                   for home, start, stop in occupied):
                raise ValueError('overlapping native source payloads')
            occupied.append((homes[section], va, va + size))
        prefix, combined, carrier_mode = gp_carrier_plan(regions, retail, gp, small_end,
                                                         anchor=str(B.per_tu_flags(source).get('g_value', B.G_VALUE)) != '0')
        post_split_spec = spec.get('post_assemble_section_split')
        post_split_specs = ([] if post_split_spec is None else
                            post_split_spec if isinstance(post_split_spec, list) else [post_split_spec])
        post_split_pieces = {}
        for split_spec in post_split_specs:
            if isinstance(split_spec, dict):
                for row in split_spec.get('pieces', []):
                    post_split_pieces.setdefault(row.get('name'), row)
        borrowed_prefixes = {}
        object_prefixes = {}
        for section, row in spec['sections'].items():
            amount = row.get('borrowed_prefix', 0)
            if type(amount) is not int or amount < 0 or (amount and section == '.sdata'):
                raise ValueError('invalid borrowed native section prefix')
            if not amount:
                continue
            va, size = regions[section]
            home = homes[section]
            kind = ('rodata' if section.startswith('.rdata') else
                    'data' if section.startswith('.data') else
                    'sdata' if section.startswith('.sdata') else section[1:])
            extent = layouts[home][(kind, row['scaffold'].rsplit('.', 1)[0])]
            if va - amount < extent[0]:
                raise ValueError('borrowed native section prefix leaves its retail fragment')
            at = va - amount - bases[home]
            data = retail_images[home][at:at + amount]
            source_section = row.get('source_section', section)
            if source_section in object_prefixes:
                raise ValueError('duplicate borrowed native object-section prefix')
            borrowed_prefixes[section] = data
            split_piece = post_split_pieces.get(source_section)
            if split_piece is not None:
                try:
                    supplied = bytes.fromhex(split_piece.get('prefix_hex', ''))
                except (TypeError, ValueError):
                    raise ValueError('invalid post-assemble borrowed prefix')
                if supplied != data:
                    raise ValueError('post-assemble borrowed prefix differs from retail')
            else:
                object_prefixes[source_section] = data
            combined[section] = (va - amount, size + amount)
        prefix_objects = []
        embedded_prefix = bool(prefix and regions.get('.sdata', (0, 0))[0] % 4)
        if prefix and not embedded_prefix:
            prefix_source = OUT / f'{segment}_gp_prefix.s'
            assembly = '.sdata\n' + ''.join('.byte ' + ','.join(f'0x{b:02x}' for b in prefix[i:i+16]) + '\n'
                                           for i in range(0, len(prefix), 16))
            prefix_source.write_bytes(assembly.replace('\n', '\r\n').encode('ascii'))
            prefix_obj = prefix_source.with_suffix('.obj')
            run = S.assemble_native(assembler, ['-q'], prefix_source, prefix_obj, assembler_dos)
            if run.returncode:
                raise ValueError('GP scaffold assembly failed: ' + run.stdout + run.stderr)
            prefix_objects.append(prefix_obj)
        if embedded_prefix:
            if '.sdata' in object_prefixes:
                raise ValueError('GP and explicit section prefixes overlap')
            object_prefixes['.sdata'] = prefix
        original_obj = compile_source(
            source, assembler, assembler_dos, assembler_flags,
            section_prefixes=object_prefixes or None)
        raw = original_obj.read_bytes()
        if raw[:4] != b'LNK\x02':
            raise ValueError('compiler did not produce a native LNK object')
        post_split = post_split_spec
        for split_spec in post_split_specs:
            if (not isinstance(split_spec, dict)
                    or set(split_spec) - {'section', 'pieces', 'allow_zero_gaps'}
                    or not {'section', 'pieces'} <= set(split_spec)
                    or not isinstance(split_spec['section'], str)
                    or not isinstance(split_spec['pieces'], list)
                    or type(split_spec.get('allow_zero_gaps', False)) is not bool):
                raise ValueError('invalid post-assemble section split')
            raw = PR.split_section(raw, split_spec['section'], split_spec['pieces'],
                                   split_spec.get('allow_zero_gaps', False))
        obj = P.parse_obj_complete(raw)
        declared_data_symbols = spec['data_symbols']
        if declared_data_symbols == 'all':
            data_symbols = sorted({row['name'] for row in obj['xdefs'] + obj['locals']
                                   if not P.is_code_section(obj['sections'].get(row['sect']))})
            if not data_symbols or any(len(data_records(retail_sym, name)) != 1
                                       for name in data_symbols):
                raise ValueError('automatic native data-symbol inventory lacks unique retail records')
        elif (not isinstance(declared_data_symbols, list)
              or any(not isinstance(name, str) for name in declared_data_symbols)):
            raise ValueError('invalid native data-symbol inventory')
        else:
            data_symbols = declared_data_symbols
        # A common needs a receipt for its retail address: a typed SYM record (data_symbols) or, for
        # stripped library members, the retail `2` name record + MAP address (untyped_data_symbols).
        receipted = data_symbols + list(spec.get('untyped_data_symbols', {}))
        commons = C.placements(obj, spec['common_symbols'], symbol_text,
                               layouts, receipted) if 'common_symbols' in spec else {}
        for row in commons.values():
            va, size = row['va'], row['size']
            if any(home == 'diabpsx' and va < stop and start < va+size for home,start,stop in occupied):
                raise ValueError('source common overlaps another native payload')
            occupied.append(('diabpsx',va,va+size))
        external_aliases = spec.get('external_binding_aliases', {})
        if (not isinstance(external_aliases, dict) or set(external_aliases) - set(spec['externals'])
                or any(not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_.]*', name)
                       or not isinstance(alias, str)
                       or not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_.]*', alias)
                       for name, alias in external_aliases.items())):
            raise ValueError('invalid native external binding alias')
        absolute_bindings = spec.get('absolute_bindings', {})
        if (not isinstance(absolute_bindings, dict)
                or set(absolute_bindings) - set(spec['externals'])
                or any(not re.fullmatch(r'(?:D|func)_[0-9A-Fa-f]{8}', name)
                       or not isinstance(value, str)
                       or not re.fullmatch(r'0x[0-9A-Fa-f]{8}', value)
                       or int(name.rsplit('_', 1)[1], 16) != int(value, 0)
                       for name, value in absolute_bindings.items())):
            raise ValueError('invalid native absolute binding')
        bindings = {}
        for name in spec['externals']:
            if name in absolute_bindings:
                bindings[name] = int(absolute_bindings[name], 0)
                continue
            authority = external_aliases.get(name, name)
            bindings[name] = resolve_bindings([authority], symbol_text)[authority]
        static_bindings = resolve_retail_data_bindings(
            spec.get('retail_data_bindings', []), retail_sym)
        scaffold_bindings = resolve_scaffold_bindings(spec.get('scaffold_bindings', {}))
        if set(bindings) & (set(static_bindings) | set(scaffold_bindings)) or set(static_bindings) & set(scaffold_bindings):
            raise ValueError('native data binding declarations overlap')
        bindings.update(static_bindings)
        bindings.update(scaffold_bindings)
        if set(commons) & set(bindings):
            raise ValueError('source common cannot also be an external binding')
        bindings.update({name: row['va'] for name,row in commons.items()})
        bindings['_gp'] = gp
        compaction = spec.get('symbol_compaction')
        if compaction not in (None,'overlay_text'):
            raise ValueError('unknown native symbol-compaction route')
        if compaction and (not S.overlay_group(source) or spec['image']=='diabpsx'
                           or any(home not in ('diabpsx', spec['image'])
                                  for section,home in homes.items() if section!='.text')):
            raise ValueError('native overlay compaction requires overlay text and resident pools')
        link_regions = {source_sections.get(section, section): region
                        for section, region in combined.items() if section not in composed_exports}
        allowed_holes = {source_sections.get(section, section)
                         for section, row in spec['sections'].items()
                         if row.get('allow_zero_tail', 0)}
        blocks, map_text = N.native_link(segment, raw, link_regions, bindings,
                                         prefix_objects=prefix_objects, output_dir=OUT,
                                         overlay_text=bool(compaction), composed_groups=composed_link,
                                         allow_zero_holes=allowed_holes)
        blocks = {reverse_sections.get(section, section): data for section, data in blocks.items()}
        if composition is not None:
            group = blocks.pop(composition['name'], None)
            if group is None:
                raise ValueError('native composed group payload is absent')
            home = composition['image']
            at = int(composition['va'], 0) - bases[home]
            if at < 0 or group != retail_images[home][at:at + composition['size']]:
                raise ValueError(f'{segment} composed group differs from retail')
            for section, row in composed_exports.items():
                blocks[section] = group[row['offset']:row['offset'] + row['size']]
            for row in raw_exports:
                raw_payloads[(row['target'], row['kind'])] = group[
                    row['offset']:row['offset'] + row['size']]
        payloads = {}
        for section, data in blocks.items():
            home = homes.get(section, 'diabpsx')
            at = combined[section][0] - bases[home]
            expected = bytes(len(data)) if is_zero_section(section) else retail_images[home][at:at+len(data)]
            if at < 0 or data != expected:
                raise ValueError(f'{segment} {section}: native bytes differ from retail')
            if section not in regions:
                continue  # Verified GP anchor is scaffold only, never exported.
            strip = len(prefix) if section == '.sdata' else len(borrowed_prefixes.get(section, b''))
            payloads[section] = data[strip:]
        run = subprocess.run([str(S.DUMPSYM), str(OUT / f'{segment}.sym')],
                             capture_output=True, text=True)
        if run.returncode:
            raise ValueError('native source SYM decoding failed')
        record_addresses = spec.get('data_record_addresses', {})
        if (not isinstance(record_addresses, dict) or set(record_addresses) - set(data_symbols)
                or any(not isinstance(value, str) or not re.fullmatch(r'0x[0-9A-Fa-f]{8}', value)
                       for value in record_addresses.values())):
            raise ValueError('invalid native data-record address selection')
        record_addresses = {name: int(value, 0) for name, value in record_addresses.items()}
        if spec.get('stripped_library_sym'):
            if data_symbols:
                raise ValueError('stripped library data needs an explicit verification lane')
            count = verify_stripped_library_members(obj, spec, regions, map_text, retail_sym, extra_paths)
        else:
            count = verify_sym(run.stdout, segment, data_symbols, retail_sym, extra_paths,
                               routed_only=spec.get('routed_only') is True,
                               data_record_addresses=record_addresses)
        aliases = spec.get('data_symbol_aliases', {})
        if not isinstance(aliases, dict) or set(aliases) - set(data_symbols):
            raise ValueError('native data aliases must name verified source globals')
        for name in data_symbols:
            if next(iter(data_records(run.stdout, name)))[1] == 'STAT':
                continue  # Exact static type/address already proved by the native SYM record.
            verify_data_map(map_text, symbol_text, retail_sym, name, aliases.get(name),
                            record_addresses.get(name))
        untyped = spec.get('untyped_data_symbols', {})
        if not isinstance(untyped, dict) or set(untyped) & set(data_symbols):
            raise ValueError('typed and untyped source data declarations must be disjoint')
        untyped_receipts = {name: verify_untyped_export(map_text, symbol_text, retail_sym, run.stdout, name, alias)
                            for name, alias in untyped.items()}
        common_payloads, common_allocation = C.allocate(
            segment, commons, retail, assembler, OUT,
            assemble=lambda tool, flags, src, obj: S.assemble_native(tool, flags, src, obj, assembler_dos))
        for name, row in commons.items():
            if row['storage'] != 'bss':
                continue
            wrapper = OUT / f'{segment}.common_{name}.bss.s'
            wrapper.write_text(f'.section .bss, "aw", @nobits\n.global {name}\n{name}:\n.space {row["size"]}\n')
        for name,data in common_payloads.items():
            row = commons[name]
            filename = f'build/native_source/{segment}.common_{name}.bin'
            (B.ROOT/filename).write_bytes(data)
            bridges.setdefault(row['scaffold'],[]).append((row['va'],row['size'],filename))
            bridge_limits[row['scaffold']] = row['limit']
        for section, data in payloads.items():
            (OUT / f'{segment}{section}.bin').write_bytes(data)
            if is_zero_section(section):
                (OUT / f'{segment}{section}.s').write_text(
                    f'.section {section}, "aw", @nobits\n' + f'.space {len(data)}\n')
            elif section != '.text' and not section.startswith('.text.'):
                raw_target = spec['sections'][section].get('raw_segment')
                if raw_target:
                    kind = spec['sections'][section]['raw_kind']
                    stem = f'{segment}.raw_{raw_target}.{kind}'
                    (OUT / (stem + '.s')).write_text(
                        f'.section .text\n.incbin "{(OUT / f"{segment}{section}.bin").as_posix()}"\n')
                    continue
                scaffold = spec['sections'][section]['scaffold']
                kind = ('data' if section in ('.ctors', '.dtors') or section.startswith('.data.') else 'rodata' if section.startswith('.rdata')
                        else 'sdata' if section.startswith('.sdata.') else section[1:])
                if not re.fullmatch(r'\w+\.' + kind, scaffold):
                    raise ValueError('invalid native source data scaffold')
                filename = f'build/native_source/{segment}{section}.bin'
                bridges.setdefault(scaffold, []).append((*regions[section], filename))
                bridge_limits[scaffold] = limits[section]
        for (target, kind), data in raw_payloads.items():
            stem = f'{segment}.raw_{target}.{kind}'
            payload = OUT / (stem + '.bin')
            payload.write_bytes(data)
            (OUT / (stem + '.s')).write_text(
                f'.section .{kind}\n.incbin "{payload.as_posix()}"\n')
        if '.text' in regions:
            (OUT / f'{segment}.text.s').write_text(text_bridge(segment, *regions['.text']))
        (OUT / f'{segment}.sym.txt').write_text(run.stdout)
        receipts.append({'segment': segment, 'source': spec['source'], 'functions': count,
                         'assembler_version': assembler_version, 'assembler_sha256': sha(assembler.read_bytes()),
                         'compiler_sha256': (None if source.suffix.lower() == '.s' else
                                             sha(S.compiler_for(source, source.suffix.lower() != '.c').read_bytes())),
                         'compiler_overrides': B.per_tu_flags(source),
                         'post_assemble_section_split': post_split,
                         'symbol_compaction': compaction,
                         'symmunge_sha256': S.SYMMUNGE_SHA256 if compaction else None,
                         'common_symbols': {
                             name: {'va':hex(row['va']),'size':row['size'],'storage':row['storage'],
                                    'sha256':sha(common_payloads[name]) if name in common_payloads else sha(bytes(row['size']))}
                             for name,row in commons.items()},
                         'common_allocation': common_allocation,
                         'composed_sdk_scaffolds': sorted({row['scaffold'] for section,row in spec['sections'].items()
                                                          if section != '.text' and not is_zero_section(section)
                                                          and not section.startswith('.text.')
                                                          and row.get('scaffold') in sdk_scaffolds}),
                         'untyped_data_symbols': untyped_receipts,
                         'source_sha256': sha(source.read_bytes()), 'object_sha256': sha(raw),
                         'preprocessed_sha256': (None if source.suffix.lower() == '.s' else
                                                 sha((S.OUT / (source.stem + '.i')).read_bytes())),
                         'sections': {s: {'image': homes[s], 'va': f'0x{regions[s][0]:08X}', 'size': len(b), 'sha256': sha(b)}
                                      for s, b in payloads.items()},
                         'scaffold_gp_prefix': {'va': f'0x{gp:08X}', 'size': len(prefix), 'sha256': sha(prefix),
                                                'mode': 'embedded_prefix' if embedded_prefix else carrier_mode},
                         'borrowed_section_prefixes': {
                             section: {'size': len(data), 'sha256': sha(data)}
                             for section, data in borrowed_prefixes.items()},
                         'raw_exports': [
                             {'target': target, 'kind': kind, 'size': len(data), 'sha256': sha(data)}
                             for (target, kind), data in raw_payloads.items()],
                         'bindings': {n: f'0x{v:08X}' for n, v in bindings.items()}})
        proof = 'stripped library members' if spec.get('stripped_library_sym') else 'SYM records'
        print(f'{segment}: native source bytes and {count} {proof} match retail; {len(prefix)} borrowed GP-prefix carrier bytes')
    if only is not None:
        return receipts
    for target, owned in extra_bridges.items():
        parts = []
        for path in (B.ROOT/'asm/nonmatchings'/target).glob('*.s'):
            address, data = N.scaffold_bytes(path)
            source = path.read_text()
            labels = re.findall(r'^glabel\s+(\S+)\s*$', source, re.M)
            if len(labels) != 1:
                raise ValueError('mixed text needs one entry label per oracle')
            parts.append((address, data, labels[0], source, path.relative_to(B.ROOT).as_posix(), path.stem))
        (OUT/(target+'.text.s')).write_text(render_mixed(parts, owned, *extra_limits[target]))
    for scaffold, regions in bridges.items():
        source_path = (B.BUILD/'sdk/native'/(scaffold+'.s') if scaffold in sdk_scaffolds
                       else B.ROOT/'asm/data'/(scaffold+'.s'))
        if not source_path.is_file():
            raise ValueError('shared SDK/native data requires a fresh SDK bridge')
        source = source_path.read_text()
        (OUT / (scaffold + '.s')).write_text(bounded_data_bridge(source, regions, bridge_limits[scaffold]))
    (OUT / 'receipts.json').write_text(json.dumps(receipts, indent=2) + '\n')
    return receipts


if __name__ == '__main__':
    build()
