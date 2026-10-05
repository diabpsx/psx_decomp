#!/usr/bin/env python3
"""Verify data-only PsyQ archive members through direct PSYLINK inclib.

The archive is passed intact to PSYLINK. A separate diagnostic object creates
unresolved references and lives outside every retail region. No member is
extracted, rewritten, or inserted into the game image by this proof.
"""
import hashlib
import json
from pathlib import Path
import re
import subprocess

import build as B
import psyq_extract as P
import sdk_link as S
import symlane as SL

REGISTRY = B.ROOT / 'configs/native_archive_data.json'
OUT = B.BUILD / 'native_archive_data'


def build():
    registry = json.loads(REGISTRY.read_text())
    OUT.mkdir(parents=True, exist_ok=True)
    root_lines = ['.section .probe']
    commands = []
    expected_regions = {'roots': (0x80200000, 4 * sum(len(x['exports']) for x in registry.values()))}
    parsed_archives = {}
    for owner, spec in registry.items():
        archive = S.ARCHIVE_ROOTS[spec['sdk']] / spec['library']
        raw = archive.read_bytes()
        if hashlib.sha256(raw).hexdigest() != spec['archive_sha256']:
            raise ValueError(f'{owner}: archive provenance hash differs')
        members, consumed = P.lib_members(raw)
        matches = [row for row in members if row['name'] == spec['member']]
        if consumed != len(raw) or len(matches) != 1:
            raise ValueError(f'{owner}: archive member is missing or ambiguous')
        obj = P.parse_obj_complete(matches[0]['data'])
        sections = {obj['sections'][index]: data for index, data in obj['code'].items() if data}
        if (set(sections) != {spec['section']} or len(sections[spec['section']]) != spec['size']
                or {row['name'] for row in obj['xdefs']} != set(spec['exports'])
                or obj['xrefs'] or any(obj['bss'].values())):
            raise ValueError(f'{owner}: complete archive member shape differs')
        parsed_archives[(spec['sdk'], spec['library'])] = archive
        prefix = owner + '.'
        commands += [f'{owner} group org(${int(spec["va"], 0):08X})',
                     f'\tsection {prefix}{spec["section"][1:]},{owner}']
        expected_regions[owner] = (int(spec['va'], 0), spec['size'])
        root_lines += [f'.word {name}' for name in spec['exports']]
    commands += ['roots group org($80200000)', '\tsection .probe,roots']
    root_source = OUT / 'roots.s'
    root_source.write_bytes(('\r\n'.join(root_lines) + '\r\n').encode('ascii'))
    root_obj = OUT / 'roots.obj'
    run = SL.assemble_native(SL.ASPSX, ['-q'], root_source, root_obj, False)
    if run.returncode or not root_obj.is_file():
        raise ValueError(run.stdout + run.stderr)
    commands.append('\tinclude roots.obj')
    for (sdk, library), archive in parsed_archives.items():
        owners = [name for name, spec in registry.items()
                  if (spec['sdk'], spec['library']) == (sdk, library)]
        if len(owners) != 1:
            raise ValueError('one direct archive data owner per library is required')
        commands.append(f'\tinclib "{archive}",{owners[0]}')
    script = OUT / 'archive_data.lnk'
    script.write_bytes(('\r\n'.join(commands) + '\r\n').encode('ascii'))
    result = subprocess.run([str(SL.PSYLINK), '/c', '/m',
                             '@archive_data.lnk,archive_data.cpe,archive_data.sym,archive_data.map'],
                            cwd=OUT, env=SL.ENV, capture_output=True, text=True)
    if result.returncode or '0 error(s)' not in result.stdout:
        raise ValueError(result.stdout + result.stderr)
    blocks = S.cpe_regions((OUT / 'archive_data.cpe').read_bytes(), expected_regions)
    retail = (B.ROOT / 'rom/DIABPSX.BIN').read_bytes()
    retail_map = (B.ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1')
    linked_map = (OUT / 'archive_data.map').read_text()
    receipts = []
    for owner, spec in registry.items():
        va = int(spec['va'], 0)
        if blocks[owner] != retail[va - 0x80010000:va - 0x80010000 + spec['size']]:
            raise ValueError(f'{owner}: direct archive data differs from retail')
        exports = {}
        for name in spec['exports']:
            pattern = r'^\s*([0-9A-Fa-f]{8})\s+' + re.escape(name) + r'\s*$'
            actual = {int(value, 16) for value in re.findall(pattern, linked_map, re.M)}
            expected = {int(value, 16) for value in re.findall(pattern, retail_map, re.M)}
            if actual != expected or len(actual) != 1:
                raise ValueError(f'{owner}/{name}: direct archive export differs')
            exports[name] = f'0x{actual.pop():08X}'
        receipt = {**spec, 'owner': owner, 'direct_inclib': True,
                   'retail_bytes_exact': True, 'verified_exports': exports,
                   'payload_bridge_emitted': False}
        receipts.append(receipt)
        print(f'{owner}: direct {spec["library"]}({spec["member"]}), '
              f'{spec["size"]} bytes and {len(exports)} exports exact')
    (OUT / 'receipts.json').write_text(json.dumps(receipts, indent=2) + '\n')
    return receipts


if __name__ == '__main__':
    build()
