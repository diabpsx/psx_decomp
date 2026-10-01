"""Native whole-section linkage for SDK objects with section-boundary expressions.

Surrounding bytes remain explicitly identified retail scaffold. Only complete
sections supplied by the unchanged SDK member are exported as library payloads.
"""
import hashlib
import json
import subprocess

import sdk_link as N


SNMAIN_LAYOUT = {
    '.text': (0x8001000C, 0x20170),
    '.ctors': (0x800B0C98, 60), '.dtors': (0x800B0CD4, 44),
    '.data': (0x800B0D00, 0x6388), '.sdata': (0x8011A780, 0x1E84),
    '.sbss': (0x8011C604, 0x4DC), '.bss': (0x8011CAE0, 0x1D118),
}
SNMAIN_OWNED = {'.text': (0x80010F20, 384), '.data': (0x800B4290, 36),
                '.sbss': (0x8011C908, 4)}


def carrier_parts(layout, owned, retail):
    if set(owned) - set(layout):
        raise ValueError('SDK section is absent from whole-link layout')
    parts, expected = {}, {}
    for section, (start, size) in layout.items():
        address, length = owned.get(section, (start + size, 0))
        before, after = address - start, start + size - address - length
        if min(before, after, length) < 0 or size <= 0:
            raise ValueError('SDK section exceeds whole-link bounds')
        if section in ('.bss', '.sbss'):
            data = bytes(size)
        else:
            offset = start - 0x80010000
            if offset < 0 or offset + size > len(retail):
                raise ValueError('whole-link scaffold exceeds retail image')
            data = retail[offset:offset + size]
        expected[section] = data
        parts[section] = (data[:before], data[before + length:])
    return parts, expected


def link_snmain(entry, raw, owned, bindings, retail):
    if entry != '__SN_ENTRY_POINT' or owned != SNMAIN_OWNED:
        raise ValueError('SNMAIN layout requires the complete original member')
    out = N.OUT / 'snmain_layout'
    out.mkdir(parents=True, exist_ok=True)
    parts, expected = carrier_parts(SNMAIN_LAYOUT, owned, retail)
    commands = []
    for i, (section, (start, size)) in enumerate(SNMAIN_LAYOUT.items()):
        commands += [f'g{i} group org(${start:08X})', f'\tsection {section},g{i}']
    for side, label in enumerate(('prefix', 'suffix')):
        lines = []
        for section, pieces in parts.items():
            data = pieces[side]
            lines.append(f'\t.section {section}')
            if section in ('.bss', '.sbss'):
                lines.append(f'\t.space {len(data)}')
            else:
                lines.extend('.byte ' + ','.join(str(x) for x in data[i:i+32])
                             for i in range(0, len(data), 32))
        source = out / (label + '.s')
        source.write_bytes(('\r\n'.join(lines) + '\r\n').encode())
        run = subprocess.run([str(N.SL.ASPSX), '-q', '-o', str(out / (label + '.obj')), str(source)],
                             env=N.SL.ENV, capture_output=True, text=True)
        if run.returncode:
            raise ValueError(run.stdout + run.stderr)
    (out / 'member.obj').write_bytes(raw)
    commands += [f'{name} equ ${address:08X}' for name, address in bindings.items()]
    commands += ['\tinclude prefix.obj', '\tinclude member.obj', '\tinclude suffix.obj']
    (out / 'link.lnk').write_bytes(('\r\n'.join(commands) + '\r\n').encode())
    run = subprocess.run([str(N.SL.PSYLINK), '/c', '/m', '@link.lnk,image.cpe,image.sym,image.map'],
                         cwd=out, env=N.SL.ENV, capture_output=True, text=True)
    if run.returncode or '0 error(s)' not in run.stdout:
        raise ValueError(run.stdout + run.stderr)
    blocks = N.cpe_regions((out / 'image.cpe').read_bytes(), SNMAIN_LAYOUT)
    if blocks != expected:
        raise ValueError('SNMAIN whole-section link differs from retail scaffold/member bytes')
    receipt = {'object_sha256': hashlib.sha256(raw).hexdigest(),
               'scaffold_carriers': {s: [hashlib.sha256(x).hexdigest() for x in p]
                                     for s, p in parts.items()},
               'layout': SNMAIN_LAYOUT, 'owned': owned}
    (out / 'receipt.json').write_text(json.dumps(receipt, indent=2) + '\n')
    payloads = {s: blocks[s][va-SNMAIN_LAYOUT[s][0]:va-SNMAIN_LAYOUT[s][0]+size]
                for s, (va, size) in owned.items()}
    return payloads, (out / 'image.map').read_text()
