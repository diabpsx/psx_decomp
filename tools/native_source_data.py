#!/usr/bin/env python3
"""Verify complete native data-only source objects without inventing text.

Section origins are isolated diagnostic placements. The whole-program compiler
uses the untouched objects directly. This tool emits no payload insertion bridge.
"""
import json
import argparse
from pathlib import Path
import re

import build as B
import native_program as N
import psyq_extract as P
import sdk_link as S
import native_recon as R

OUT = B.BUILD / 'native_source_data'


def build(owners=None):
    registry = json.loads((B.ROOT / 'configs/native_source_data.json').read_text())
    retail = (B.ROOT / 'rom/DIABPSX.BIN').read_bytes()
    retail_map = (B.ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1')
    retail_sym = (B.ROOT / 'rom/DIABPSX-SYM.txt').read_text(encoding='latin-1')
    receipts = []
    selected = list(registry) if owners is None else owners
    if len(selected) != len(set(selected)) or set(selected) - set(registry):
        raise ValueError('unknown or duplicate data-only source owner')
    for owner in selected:
        spec = registry[owner]
        folder = OUT / owner
        compiled = N.compile_object(owner, spec, folder)
        raw = (B.ROOT / compiled['object']).read_bytes()
        obj = P.parse_obj_complete(raw)
        payloads = {obj['sections'][index]: data for index, data in obj['code'].items() if data}
        regions = {section: (int(row['va'], 0), row['size'])
                   for section, row in spec['sections'].items()}
        declared_refs = spec.get('externals', [])
        if (set(obj['xrefs']) != set(declared_refs)
                or any(P.is_code_section(section) for section in payloads)
                or any(obj['sections'][index] in ('.bss', '.sbss') and size
                       for index, size in obj['bss'].items())
                or any('bss' in row for row in obj['xdefs'])
                or set(payloads) != set(regions)
                or any(len(data) != regions[section][1] for section, data in payloads.items())):
            raise ValueError(f'{owner}: data-only source has unexpected code, storage or dependencies')
        # Initialized .space reservations may leave holes in CPE, including
        # zero fields in mixed tables. Full-byte comparison below remains exact;
        # an omitted nonzero retail byte still fails (never mask a difference).
        zero_sections = [obj['sections'][index] for index, size in obj['bss'].items()
                         if size and obj['sections'][index] in payloads]
        bindings = {}
        for name in declared_refs:
            addresses = {int(value, 16) for value in re.findall(
                r'^\s*([0-9A-Fa-f]{8})\s+' + re.escape(name) + r'\s*$', retail_map, re.M)}
            if len(addresses) != 1:
                raise ValueError(f'{owner}/{name}: ambiguous retail external binding')
            bindings[name] = next(iter(addresses))
        blocks, linked_map = S.native_link(owner, raw, regions, bindings, output_dir=folder,
                                           allow_zero_holes=zero_sections)
        for section, block in blocks.items():
            va, size = regions[section]
            if block != retail[va - 0x80010000:va - 0x80010000 + size]:
                raise ValueError(f'{owner}/{section}: native data bytes differ')
        exports = {}
        for row in obj['xdefs']:
            name = row['name']
            pattern = r'^\s*([0-9A-Fa-f]{8})\s+' + re.escape(name) + r'\s*$'
            expected = {int(value, 16) for value in re.findall(pattern, retail_map, re.M)}
            actual = {int(value, 16) for value in re.findall(pattern, linked_map, re.M)}
            section = obj['sections'][row['sect']]
            address = regions[section][0] + row['off']
            if expected != {address} or actual != expected:
                raise ValueError(f'{owner}/{name}: native export address differs')
            exports[name] = f'0x{address:08X}'
        data_symbols = spec.get('data_symbols', [])
        if data_symbols:
            debug = N.checked_run([N.S.DUMPSYM, folder / f'{owner}.sym']).stdout
            if N.S.functions(debug):
                raise ValueError(f'{owner}: data-only debug output unexpectedly contains functions')
            for name in data_symbols:
                wanted, actual = R.data_records(retail_sym, name), R.data_records(debug, name)
                if len(wanted) != 1 or len(actual) != 1 or wanted != actual:
                    raise ValueError(f'{owner}/{name}: native data SYM differs')
        receipts.append({**compiled, 'retail_data_match_proven': True,
                         'diagnostic_placements': spec['sections'],
                         'verified_exports': exports, 'verified_data_sym': data_symbols,
                         'whole_program_placement_proven': False})
        print(f'{owner}: {sum(size for va, size in regions.values())} native data bytes '
              f'and {len(exports)} exports match retail; no text or carrier')
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / ('receipts.json' if owners is None else 'selected_receipts.json')).write_text(
        json.dumps(receipts, indent=2) + '\n')
    return receipts


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('owners', nargs='*')
    args = parser.parse_args()
    build(args.owners or None)
