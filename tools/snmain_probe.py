#!/usr/bin/env python3
"""Diagnostic only: link original SNMAIN with whole-section extent carriers.

Carriers are zero-filled layout placeholders, NOT reconstructed/runtime code.
Only the original member's text/data are compared; this is not a final-link
receipt and does not add SDK imports or alter any original object bytes.
"""
import json
import hashlib
import subprocess

import sdk_link as N
import psyq_extract as P
import symlane as S


def main():
    out = N.B.BUILD / 'snmain_layout_probe'
    out.mkdir(parents=True, exist_ok=True)
    archive = (N.ARCHIVE_ROOTS['4.1'] / 'LIBSN.LIB').read_bytes()
    members, consumed = P.lib_members(archive)
    assert consumed == len(archive)
    member, = [m for m in members if m['name'].upper() == 'SNMAIN']
    raw = member['data']
    parsed = P.parse_obj(raw)
    extents = {parsed['sections'][key]: len(data) for key, data in parsed['code'].items()}
    if extents != {'.text': 384, '.data': 36, '.sbss': 4}:
        raise ValueError('unexpected SNMAIN member section extents')
    (out / 'snmain.obj').write_bytes(raw)
    # Section extents from retail MAP; startup includes four alignment bytes
    # after .bss at 0x80139BF4 before the heap/overlay boundary 0x80139BF8.
    regions = {
        '.text': (0x8001000C, 0x20170),
        '.ctors': (0x800B0C98, 60), '.dtors': (0x800B0CD4, 44),
        '.data': (0x800B0D00, 0x6388),
        '.sdata': (0x8011A780, 0x1E84),
        '.sbss': (0x8011C604, 0x4DC), '.bss': (0x8011CAE0, 0x1D118),
    }
    owned = {'.text': (0x80010F20, 384), '.data': (0x800B4290, 36),
             '.sbss': (0x8011C908, 4)}
    commands = []
    prefix, suffix = [], []
    for i, (section, (start, size)) in enumerate(regions.items()):
        commands += [f'g{i} group org(${start:08X})', f'\tsection {section},g{i}']
        address, length = owned.get(section, (start + size, 0))
        before, after = address - start, start + size - address - length
        assert before >= 0 and after >= 0
        prefix += [f'\t.section {section}', f'\t.space {before}']
        suffix += [f'\t.section {section}', f'\t.space {after}']
    for label, assembly in [('prefix', prefix), ('suffix', suffix)]:
        source = out / (label + '.s')
        source.write_bytes(('\r\n'.join(assembly) + '\r\n').encode())
        run = subprocess.run([str(S.ASPSX), '-q', '-o', str(out / (label + '.obj')), str(source)],
                             env=S.ENV, capture_output=True, text=True)
        if run.returncode:
            raise ValueError(run.stdout + run.stderr)
    symbols = (N.B.ROOT / 'configs/symbol_addrs.txt').read_text()
    for name in ['InitHeap', 'main']:
        commands.append(f'{name} equ ${N.function_address(symbols, name):08X}')
    for name in ['_stacksize', '_ramsize']:
        commands.append(f'{name} equ ${N.data_address(symbols, name):08X}')
    commands += ['\tinclude prefix.obj', '\tinclude snmain.obj', '\tinclude suffix.obj']
    (out / 'probe.lnk').write_bytes(('\r\n'.join(commands) + '\r\n').encode())
    run = subprocess.run([str(S.PSYLINK), '/c', '/m', '@probe.lnk,probe.cpe,probe.sym,probe.map'],
                         cwd=out, env=S.ENV, capture_output=True, text=True)
    if run.returncode or '0 error(s)' not in run.stdout:
        raise ValueError(run.stdout + run.stderr)
    blocks = N.cpe_regions((out / 'probe.cpe').read_bytes(), regions)
    retail = (N.B.ROOT / 'rom/DIABPSX.BIN').read_bytes()
    report = {}
    for section, (address, size) in owned.items():
        offset = address - regions[section][0]
        data = blocks[section][offset:offset + size]
        expected = bytes(size) if section == '.sbss' else retail[address - 0x80010000:address - 0x80010000 + size]
        diffs = [i for i in range(size) if data[i] != expected[i]]
        report[section] = {'size': size, 'differing_bytes': len(diffs), 'first_offsets': diffs[:20]}
    receipt = {'diagnostic_only': True, 'archive': 'PsyQ 4.1 LIBSN.LIB',
               'archive_sha256': hashlib.sha256(archive).hexdigest(),
               'member_sha256': hashlib.sha256(raw).hexdigest(), 'sections': report}
    (out / 'report.json').write_text(json.dumps(receipt, indent=2) + '\n')
    print(json.dumps(report, indent=2))
    if any(row['differing_bytes'] for row in report.values()):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
