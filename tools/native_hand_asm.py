#!/usr/bin/env python3
"""Verify genuine hand-authored assembly source as complete native objects."""
import json
import re

import build as B
import native_program as N
import sdk_link as S

OUT = B.BUILD / 'native_hand_asm'


def build():
    registry = json.loads((B.ROOT / 'configs/native_hand_asm.json').read_text())
    retail = (B.ROOT / 'rom/DIABPSX.BIN').read_bytes()
    retail_map = (B.ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1')
    receipts = []
    for segment, spec in registry.items():
        source_spec = {'source': spec['source'], 'image': spec['image'],
                       'assembler': spec['assembler']}
        folder = OUT / segment
        compiled = N.compile_object(segment, source_spec, folder)
        raw = (B.ROOT / compiled['object']).read_bytes()
        region = (int(spec['va'], 0), spec['size'])
        blocks, linked_map = S.native_link(segment, raw, {spec['section']: region}, {},
                                           output_dir=folder)
        va, size = region
        if blocks[spec['section']] != retail[va - 0x80010000:va - 0x80010000 + size]:
            raise ValueError(f'{segment}: native assembly bytes differ')
        if set(compiled['exports']) != set(spec['exports']):
            raise ValueError(f'{segment}: native assembly exports differ')
        exports = {}
        for name in spec['exports']:
            pattern = r'^\s*([0-9A-Fa-f]{8})\s+' + re.escape(name) + r'\s*$'
            actual = {int(value, 16) for value in re.findall(pattern, linked_map, re.M)}
            expected = {int(value, 16) for value in re.findall(pattern, retail_map, re.M)}
            if actual != expected or actual != {va}:
                raise ValueError(f'{segment}/{name}: export address differs')
            exports[name] = f'0x{va:08X}'
        receipt = {**compiled, 'retail_bytes_exact': True,
                   'diagnostic_placement': {'va': f'0x{va:08X}', 'size': size},
                   'verified_exports': exports, 'payload_bridge_emitted': False}
        receipts.append(receipt)
        print(f'{segment}: genuine hand assembly, {size} bytes and '
              f'{len(exports)} coequal exports exact')
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / 'receipts.json').write_text(json.dumps(receipts, indent=2) + '\n')
    return receipts


if __name__ == '__main__':
    build()
