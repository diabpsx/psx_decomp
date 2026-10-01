#!/usr/bin/env python3
"""Read-only original-archive search; exported names are candidates, never seals."""
import json
from pathlib import Path
import subprocess
import hashlib
import struct

import build as B
import psyq_extract as P
from sdk_provenance import oracle, compare_words


def screen_member(raw, names):
    """Conservative same-name screening; never substitutes for native linkage."""
    obj = P.parse_obj(raw)
    if any(raw[obj['consumed']:]):
        raise ValueError('object has unparsed nonzero bytes')
    marks = obj['xdefs'] + obj['locals']
    results = []
    for name in names:
        starts = [m for m in obj['xdefs'] if m['name'] == name and 'bss' not in m
                  and P.is_code_section(obj['sections'][m['sect']])]
        if len(starts) != 1:
            raise ValueError('export is not one code symbol: ' + name)
        start = starts[0]
        section, offset = start['sect'], start['off']
        data = obj['code'][section]
        stop = min([m['off'] for m in marks if m['sect'] == section and m['off'] > offset] or [len(data)])
        patches = [(p['off'] - offset, p['type']) for p in obj['patches']
                   if p['sect'] == section and offset <= p['off'] < stop]
        va, retail = oracle(B.ROOT/'asm/nonmatchings/lib'/(name+'.s'))
        same, reason = compare_words(data[offset:stop], retail, patches)
        results.append({'name': name, 'size': stop-offset, 'retail_size': len(retail),
                        'candidate': same, 'reason': reason})
    return results


def main():
    roots = [Path('C:/temp/diablo-psx/refs'), Path('C:/Temp/ps1-decomp-refs')]
    imported = {name for row in json.loads((B.BUILD/'sdk/native/receipts.json').read_text())
                for name in row['exports']}
    pending = {p.stem for p in (B.ROOT/'asm/nonmatchings/lib').glob('*.s')} - imported
    run = subprocess.run(['rg', '--files', '--hidden', '--no-ignore', '-g', '*.[lL][iI][bB]',
                          '-g', '*.[aA]', *map(str, roots)], capture_output=True, text=True)
    if run.returncode not in (0, 1) or run.stderr:
        raise ValueError('archive discovery failed: ' + run.stderr)
    report = {'screening_only': True, 'roots': list(map(str, roots)),
              'pending_entries': len(pending), 'archives': [], 'errors': []}
    matched = set()
    for filename in sorted(run.stdout.splitlines()):
        path = Path(filename)
        with path.open('rb') as stream:
            magic = stream.read(4)
        row = {'path': str(path), 'magic': magic.hex()}
        if magic == b'LIB\x01':
            data = path.read_bytes()
            try:
                members, consumed = P.lib_members(data)
                if consumed != len(data):
                    raise ValueError('archive parse did not consume whole file')
                row['sha256'] = hashlib.sha256(data).hexdigest()
                row['members'] = len(members)
                row['candidates'] = []
                for member in members:
                    names = sorted(pending.intersection(member['exports']))
                    if names:
                        item = {'member': member['name'], 'exports': names,
                                'object_sha256': hashlib.sha256(member['data']).hexdigest()}
                        try:
                            item['screening'] = screen_member(member['data'], names)
                        except (ValueError, IndexError, KeyError, struct.error, P.Desync) as error:
                            item['screening_error'] = str(error)
                        row['candidates'].append(item)
                        matched.update(names)
            except (ValueError, IndexError, AssertionError) as error:
                report['errors'].append({'path': str(path), 'error': str(error)})
        report['archives'].append(row)
    report['matched_names'] = sorted(matched)
    out = B.BUILD/'sdk_archive_inventory.json'
    out.write_text(json.dumps(report, indent=2) + '\n')
    print(f"{len(report['archives'])} archives inspected; "
          f"{sum('members' in r for r in report['archives'])} complete SN archives; "
          f"{len(report['errors'])} archive parse errors")
    print('Pending exported names: ' + ', '.join(sorted(matched)))
    screened = [s for a in report['archives'] for c in a.get('candidates', []) for s in c.get('screening', [])]
    print(f"{len(screened)} candidate/export pairs screened; {sum(s['candidate'] for s in screened)} byte candidates")
    print('Unresolved object parses: ' + str(sum('screening_error' in c for a in report['archives'] for c in a.get('candidates', []))))
    print('Screening report: ' + str(out))
    return bool(report['errors'])


if __name__ == '__main__':
    raise SystemExit(main())
