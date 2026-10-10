#!/usr/bin/env python3
"""Attribute checkpoint data names to explicit retail MAP object boundaries.

An enclosing section is not proof of an individual object's type or size.
Merged small-data/BSS pools are deliberately not assigned a guessed source owner.
"""
import re
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
# Overlay context: (overlay image, source TU, layout fragment, retail MAP object, typed-SYM name).
# The overlays share one address range, so a VA alone names several enclosing objects; the
# overlay's own layout fragment plus the retail object markers and a typed SYM record pick the
# owner.  A name with no typed record of its own is an alias of the typed name given last
# (CharBlockBuf is CharDataStruct's byte view, D_80157B68 a field inside it, func_80161F58 the
# address of StartAutomap).
OVERLAY_CONTEXT = {
    'ClassStrTbl': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_801435e8', 'DLG', 'ClassStrTbl'),
    'McLoadGameMenu': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_8014364c', 'DLG', 'McLoadGameMenu'),
    'McLoadCard1Menu': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_8014364c', 'DLG', 'McLoadCard1Menu'),
    'McLoadCard2Menu': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_8014364c', 'DLG', 'McLoadCard2Menu'),
    'save_buffer': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_801436ec', 'DLG', 'save_buffer'),
    'CharDataStruct': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_801436ec', 'DLG', 'CharDataStruct'),
    'CharBlockBuf': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_801436ec', 'DLG', 'CharDataStruct'),
    'D_80157B68': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_801436ec', 'DLG', 'CharDataStruct'),
    'TempStr': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_801436ec', 'DLG', 'TempStr'),
    'AlertStr': ('frontend', 'DLG.CPP', 'rodata', 'dlg_rodata_801436ec', 'DLG', 'AlertStr'),
    'func_80161F58': ('game', 'AUTOMAP.CPP', 'c', 'automap', 'AUTOMAP', 'StartAutomap__Fv'),
}
DLG_FRONTEND_FRAGMENTS = {name: row[3] for name, row in OVERLAY_CONTEXT.items() if row[0] == 'frontend'}


def overlay_layouts():
    return {image: (ROOT / 'configs' / f'{image}.yaml').read_text(encoding='utf-8')
            for image in ('frontend', 'pregame', 'game', 'fmv')}


def contextual_candidates(name, va, candidates, declarations, frontend, layouts=None):
    """Use verified overlay context instead of overlapping VA ranges alone.

    `declarations` are the typed SYM records of the context's typed name (the name itself, or
    the typed object an alias belongs to)."""
    context = OVERLAY_CONTEXT.get(name)
    if context is None:
        return candidates, False
    image, _, kind, fragment, owner, _ = context
    layout = frontend if image == 'frontend' else (layouts or overlay_layouts())[image]
    base = re.search(r'^\s+vram:\s*(0x[0-9A-Fa-f]+)\s*$', layout, re.M)
    segments = [(int(offset, 16), kind_, label.strip()) for offset, kind_, label in
                re.findall(r'^\s+- \[(0x[0-9A-Fa-f]+),\s*(\w+),\s*([^\]]+)\]', layout, re.M)]
    end = re.search(r'^\s+- \[(0x[0-9A-Fa-f]+)\]\s*$', layout, re.M)
    if end:
        segments.append((int(end[1], 16), 'end', ''))   # the image extent bounds the last fragment
    locations = [i for i, row in enumerate(segments) if row[1:] == (kind, fragment)]
    if base is None or len(locations) != 1 or not declarations:
        raise ValueError(f'{name}: missing {image.upper()}/SYM ownership evidence')
    index = locations[0]
    if index + 1 >= len(segments):
        raise ValueError(f'{name}: {image.upper()} fragment has no end boundary')
    origin = int(base[1], 16)
    if not origin + segments[index][0] <= va < origin + segments[index+1][0]:
        raise ValueError(f'{name}: VA is outside its verified {image.upper()} fragment')
    selected = [row for row in candidates if row[2:] == (owner, 'text')]
    if len(selected) != 1:
        raise ValueError(f'{name}: missing or ambiguous retail {owner} object bounds')
    return selected, True


def link_order_bounds(va, map_symbols, owners_by_export):
    """Nearest retail MAP symbols below and above `va` whose source owner is known from the
    native inventory.  PSYLINK lays each object's small-data/BSS contiguously in link order, so
    a name between two symbols of one owner belongs to that owner; between two different owners
    it belongs to one of the objects linked between them."""
    known = sorted((address, symbol, owners_by_export[symbol][0])
                   for symbol, addresses in map_symbols.items() if symbol in owners_by_export
                   and len(owners_by_export[symbol]) == 1 for address in addresses)
    below = max((row for row in known if row[0] < va), default=None)
    above = min((row for row in known if row[0] > va), default=None)
    return below, above


def build():
    checkpoint = (ROOT / 'docs/SOURCE_DEFINITIONS_CHECKPOINT_143.md').read_text(encoding='utf-8')
    names = re.findall(r'^\| `([^`]+)` \| `(0x[0-9A-F]+)` \|', checkpoint, re.M)
    map_text = (ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1')
    symbols = {}
    for address, name in re.findall(r'^\s*([0-9A-F]{8})\s+(\S+)\s*$', map_text, re.M):
        symbols.setdefault(name, set()).add(int(address, 16))
    regions = []
    for name, addresses in symbols.items():
        match = re.fullmatch(r'__(.+)_(data|rdata|text|bss|sbss|sdata)_obj', name)
        if not match:
            continue
        ends = symbols.get(name + 'end', set())
        if len(addresses) == len(ends) == 1:
            origin = name[:-3] + 'org'
            if (symbols.get(origin) != addresses
                    or symbols.get(origin + 'end') != ends):
                raise ValueError(f'{name}: object and origin bounds disagree')
            start, end = next(iter(addresses)), next(iter(ends))
            if end > start:
                regions.append((start, end, match[1], match[2]))
    sym_text = (ROOT / 'rom/DIABPSX-SYM.txt').read_text(encoding='latin-1')
    frontend = (ROOT / 'configs/frontend.yaml').read_text(encoding='utf-8')
    records = {}
    for address, declaration, name in re.findall(
            r'^\w+: \$([0-9a-fA-F]+) 9[46] (Def2? class .*?) name (\S+)\s*$',
            sym_text, re.M):
        records.setdefault((name, int(address, 16)), set()).add(declaration)
    inventory = json.loads((ROOT / 'build/native_program/inventory.json').read_text())
    if inventory['scope'] != 'complete':
        raise ValueError('ownership status requires a complete raw inventory')
    link_computed = set(inventory.get('link_computed_definitions', {}))
    restored = {name for name, address in names} - set(inventory['missing_source_definitions']) - link_computed
    owners_by_export = {}
    for row in inventory['objects']:
        for export in row['exports']:
            owners_by_export.setdefault(export, []).append(row['owner'])
    layouts = overlay_layouts()
    lines = ['# Retail MAP ownership of missing-source checkpoint', '',
             'Generated by `python tools/map_source_owners.py` from retail MAP/SYM and',
             'the preserved 143-name checkpoint. Explicit object bounds prove section',
             'candidate ownership; they do not establish initializer values or individual extents.',
             'Shared pools without object bounds remain unassigned. Multiple enclosing',
             'objects are shown, not silently disambiguated by address alone.', '',
             'ClassStrTbl and the three McLoad*Menu structures are confirmed as',
             'DLG.CPP-owned FRONTEND data using that overlay\'s fragment bounds,',
             'retail DLG object markers and typed SYM records; the same context',
             'rule covers the other FRONTEND DLG.CPP names (save_buffer, TempStr,',
             'AlertStr, CharDataStruct and its aliases CharBlockBuf / D_80157B68)',
             'and func_80161F58, the GAME-overlay address of StartAutomap.', '',
             'PSYLINK link options and group symbols (FirstFreeByte and the',
             'OVERINFO/LNKOPT words) are defined by the link itself',
             '(tools/link_symbols.py), not by any source object.', '',
             'Names in the shared small-data/BSS pools carry no object boundary;',
             'for them the nearest retail MAP symbols with a known native owner',
             'bound the owner by link order (one owner when both neighbours agree,',
             'otherwise the objects linked between the two).', '',
             f'{len(restored)} checkpoint names are resolved in the complete raw inventory;',
             f'{len(inventory["missing_source_definitions"])} missing source references remain.',
             'All 60 single-MAP-candidate task entries are resolved (the TONY literal is',
             'patched in place through a local pointer). Native ownership receipts are',
             'isolated proofs, not a strict whole-program native link seal.', '',
             '| Name | Retail VA | MAP object/section candidates | Retail typed SYM | Status |',
             '| --- | --- | --- | --- | --- |']
    assigned = 0
    unique = 0
    for name, address in names:
        va = int(address, 16)
        if name in symbols and va not in symbols[name]:
            raise ValueError(f'{name}: checkpoint address differs from retail MAP')
        candidates = [row for row in sorted(regions) if row[0] <= va < row[1]]
        context = OVERLAY_CONTEXT.get(name)
        typed_name = context[5] if context else name
        typed = {declaration for (record_name, _), declarations in records.items()
                 if record_name == typed_name for declaration in declarations} if context else records.get((name, va), set())
        candidates, confirmed = contextual_candidates(name, va, candidates, typed, frontend, layouts)
        prefix = f'{context[1]} / {context[0].upper()}: ' if confirmed else ''
        owners = [prefix + f'{owner}.{section} (`0x{start:08X}`–`0x{end:08X}`, exclusive end)'
                  for start, end, owner, section in candidates]
        bounded = None
        if not owners and name not in link_computed:
            below, above = link_order_bounds(va, symbols, owners_by_export)
            if below and above:
                owners = [f'link order: after `{below[1]}` (`0x{below[0]:08X}`, {below[2]}) '
                          f'before `{above[1]}` (`0x{above[0]:08X}`, {above[2]})']
                bounded = below[2] if below[2] == above[2] else f'{below[2]}..{above[2]}'
        assigned += bool(owners)
        unique += len(owners) == 1
        declaration = '; '.join(sorted(records.get((name, va), set()))) or 'No same-name typed record'
        if context and typed_name != name:
            declaration += f' (alias of `{typed_name}`)'
        status = 'Resolved; native owner verified' if name in restored else 'Current unresolved'
        if name in link_computed:
            status = 'Resolved; link-computed symbol'
            owners = ['defined by the link script (tools/link_symbols.py)']
        elif confirmed and name not in restored:
            status = 'Owner confirmed; source definition unresolved'
        elif bounded and name not in restored:
            status = f'Owner bounded by link order ({bounded}); source definition unresolved'
        lines.append(f'| `{name}` | `{address}` | {"; ".join(owners) or "No explicit object boundary"} | {declaration} | {status} |')
    lines += ['', f'{assigned}/{len(names)} checkpoint names have an enclosing MAP object or link-order bound;',
              f'{unique} have one candidate and {assigned - unique} have ambiguous overlapping candidates.', '']
    output = ROOT / 'docs/REMAINING_SOURCE_OWNERS.md'
    output.write_text('\n'.join(lines), encoding='utf-8', newline='\n')
    print(f'{assigned}/{len(names)} names attributed; report: {output}')
    definitions = ROOT / 'docs/REMAINING_SOURCE_DEFINITIONS.md'
    missing = inventory['missing_source_definitions']
    rows = ['# Remaining missing source definitions - %d entries' % len(missing), '',
            'Generated by `python tools/map_source_owners.py` from build/native_program/inventory.json',
            '(%d untouched native objects). A name is listed when some object references it and no object' % len(inventory['objects']),
            'or link-computed symbol defines it; link-computed symbols (tools/link_symbols.py) are excluded.',
            'The original 143-name checkpoint is preserved in SOURCE_DEFINITIONS_CHECKPOINT_143.md.',
            'This inventory does not prove a strict whole-program native link.', '',
            '| Name | Referenced by |', '| --- | --- |']
    rows += [f'| `{name}` | {", ".join(owners)} |' for name, owners in sorted(missing.items())]
    definitions.write_text('\n'.join(rows) + '\n', encoding='utf-8', newline='\n')
    print(f'{len(missing)} missing definitions; doc: {definitions}')


if __name__ == '__main__':
    build()
