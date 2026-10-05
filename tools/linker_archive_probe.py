#!/usr/bin/env python3
"""Compare PSYLINK and slink using direct retail LIBPRESS archive resolution.

Only the group base and section order are supplied. A separate diagnostic root
object requests the three retail members; it contributes no bytes to the region
under comparison. No archive object is extracted or rewritten.
"""
import hashlib
import json
from pathlib import Path
import re
import subprocess

import build as B
import native_archive as A
import psyq_extract as P
import sdk_link as S
import symlane as SL

SLINK = Path('C:/Temp/ps1-decomp-refs/Spongebob_SuperSponge/tools/psyq/bin/slink.exe')
OUT = B.BUILD / 'linker_archive_probe'


def build(prefix=False):
    OUT.mkdir(parents=True, exist_ok=True)
    spec = json.loads(A.REGISTRY.read_text())['libpress']
    archive = S.ARCHIVE_ROOTS[spec['sdk']] / spec['library']
    if hashlib.sha256(archive.read_bytes()).hexdigest() != spec['archive_sha256']:
        raise ValueError('retail LIBPRESS archive hash differs')
    headers = A.verified_headers(spec)
    root = OUT / 'roots.s'
    root.write_bytes(('.section .probe\r\n'
                      '.word DecDCTReset\r\n'
                      '.word DecDCTvlc2\r\n'
                      '.word DecDCTvlcBuild\r\n').encode('ascii'))
    obj = OUT / 'roots.obj'
    assembled = SL.assemble_native(SL.ASPSX, ['-q'], root, obj, False)
    if assembled.returncode or not obj.exists():
        raise ValueError(assembled.stdout + assembled.stderr)
    symbols = (B.ROOT / 'configs/symbol_addrs.txt').read_text()
    section_prefix = 'libpress.' if prefix else '.'
    commands = ['libpress group org($80139BFC)',
                f'\tsection {section_prefix}rdata,libpress',
                f'\tsection {section_prefix}data,libpress',
                f'\tsection {section_prefix}text,libpress',
                f'\tsection {section_prefix}sdata,libpress',
                f'\tsection {section_prefix}ctors,libpress',
                f'\tsection {section_prefix}dtors,libpress',
                'empty_bss group bss',
                f'\tsection {section_prefix}sbss,empty_bss',
                f'\tsection {section_prefix}bss,empty_bss',
                'diagnostic_roots group', '\tsection .probe,diagnostic_roots']
    commands += [f'{name} equ ${S.function_address(symbols, name):08X}'
                 for name in spec['externals']]
    commands += ['\tinclude roots.obj', f'\tinclib "{archive}"' + (',libpress' if prefix else '')]
    suffix = '_prefixed' if prefix else ''
    script = OUT / f'direct{suffix}.lnk'
    script.write_bytes(('\r\n'.join(commands) + '\r\n').encode('ascii'))
    retail_map = (B.ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1')
    members, consumed = P.lib_members(archive.read_bytes())
    if consumed != archive.stat().st_size:
        raise ValueError('archive parse is incomplete')
    exports = {row['name'] for member in members if member['name'] in spec['members']
               for row in P.parse_obj_complete(member['data'])['xdefs']}
    expected = (B.ROOT / 'rom/FMV.BIN').read_bytes()[4:7140]
    results = []
    for name, linker, flags in [('psylink', SL.PSYLINK, ['/c', '/m']),
                                ('slink', SLINK, ['/psx', '/c', '/m'])]:
        output = name + suffix
        run = subprocess.run([str(linker), *flags,
                              f'@{script.name},{output}.cpe,{output}.sym,{output}.map'],
                             cwd=OUT, capture_output=True, text=True, env=SL.ENV)
        if run.returncode:
            raise ValueError(f'{name}: {run.stdout}{run.stderr}')
        # Include the diagnostic root object in CPE coverage validation, then
        # compare just the complete naturally laid out archive group.
        blocks = S.cpe_regions((OUT / f'{output}.cpe').read_bytes(), {
            'libpress': (0x80139BFC, 7136), 'roots': (0x8013B7DC, 12)})
        map_text = (OUT / f'{output}.map').read_text()
        if blocks['libpress'] != expected:
            raise ValueError(f'{name}: direct archive bytes differ')
        for symbol in exports:
            if A._map_address(map_text, symbol) != A._map_address(retail_map, symbol):
                raise ValueError(f'{name}: export {symbol} differs')
        results.append({'linker': name,
                        'linker_sha256': hashlib.sha256(linker.read_bytes()).hexdigest(),
                        'archive_sha256': spec['archive_sha256'],
                        'headers': headers,
                        'bytes': 7136, 'exports': len(exports), 'exact': True,
                        'direct_inclib': True,
                        'native_section_prefix': 'libpress' if prefix else None,
                        'section_order': ['.rdata', '.data', '.text']})
        print(f'{output}: direct inclib, 7136 bytes and {len(exports)} exports exact')
    (OUT / f'report{suffix}.json').write_text(json.dumps(results, indent=2) + '\n')
    return results


def compare_debug_object(segment):
    """Compare an existing native diagnostic object with both linkers.

    This check retains the diagnostic script's existing placements. It tests
    linker compatibility, and does not establish natural whole-program layout.
    """
    folder = B.BUILD / 'native_source'
    original = folder / f'{segment}.lnk'
    script = folder / f'{segment}_slink_probe.lnk'
    commands = re.sub(r'file\("([^\"]+)"\)',
                      lambda match: f'file("slink_probe_{match[1]}")',
                      original.read_text())
    script.write_bytes(commands.replace('\r\n', '\n').replace('\n', '\r\n').encode('ascii'))
    stem = f'{segment}_slink_probe'
    overlay = 'over(' in commands
    raw_name = f'{stem}.raw.sym' if overlay else f'{stem}.sym'
    run = subprocess.run([str(SLINK), '/psx', '/c', '/m',
                          *(['/v'] if overlay else []),
                          f'@{script.name},{stem}.cpe,{raw_name},{stem}.map'],
                         cwd=folder, capture_output=True, text=True, env=SL.ENV)
    if run.returncode:
        raise ValueError(run.stdout + run.stderr)
    if overlay:
        payloads = [folder / name for name in re.findall(r'file\("([^\"]+)"\)', commands)]
        try:
            SL.compact_overlay_sym(folder / raw_name, folder / f'{stem}.sym', payloads)
        except SystemExit as error:
            result = {'segment': segment, 'overlay': True, 'sym_exact': False,
                      'linker_sha256': hashlib.sha256(SLINK.read_bytes()).hexdigest(),
                      'compaction_error': str(error), 'natural_layout_proven': False}
            (OUT / f'{segment}_debug_report.json').write_text(json.dumps(result, indent=2) + '\n')
            print(f'{segment}: slink overlay SYM is incompatible with retail SYMMUNGE: {error}')
            return result
    dumps = []
    for sym in (folder / f'{stem}.sym', folder / f'{segment}.sym'):
        dumped = subprocess.run([str(SL.DUMPSYM), str(sym)],
                                capture_output=True, text=True, env=SL.ENV)
        if dumped.returncode:
            raise ValueError(dumped.stdout + dumped.stderr)
        dumps.append(SL.functions(dumped.stdout))
    ours, reference = dumps
    differences = [(name, SL.compare(value, reference[name])[1])
                   for name, value in ours.items()
                   if name in reference and not SL.compare(value, reference[name])[0]]
    missing = sorted(set(reference) - set(ours))
    if not reference or missing or differences:
        raise ValueError(f'{segment}: missing={missing}, differences={differences}')
    result = {'segment': segment, 'functions': len(reference), 'sym_exact': True,
              'overlay': overlay, 'natural_layout_proven': False,
              'linker_sha256': hashlib.sha256(SLINK.read_bytes()).hexdigest()}
    print(f'{segment}: slink matches {len(reference)} reference function SYM records')
    (OUT / f'{segment}_debug_report.json').write_text(json.dumps(result, indent=2) + '\n')
    return result


if __name__ == '__main__':
    build()
    build(prefix=True)
    compare_debug_object('gman')
    compare_debug_object('fmv')
