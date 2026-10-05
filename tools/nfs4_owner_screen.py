#!/usr/bin/env python3
"""Screen Diablo's unresolved source names against authoritative NFS4 sources.

The search is exact and case-sensitive. Generated binaries, scratch/permuter
trees, generic word matches and comments are kept separate from source owners.
"""
import json
from pathlib import Path
import re

import build as B

NFS4 = Path('C:/Temp/nfs4-decomp')
OUT = B.BUILD / 'nfs4_owner_screen.json'
ORIGINAL_SPECIALS = {'_ctype_', '_stacksize', 'nullfunction'}
MEANINGFUL = {
    '_ctype_': 'recon/syslib/psx/libc/CTYPE0.c',
    '_stacksize': 'recon/syslib/psx/libsn/SNDEF.c',
    'nullfunction': 'recon/eaclib/psx/eacpsxz/nullfunc.c',
}


def category(path, line, name):
    clean = line.split('//', 1)[0]
    if path.suffix.lower() in ('.c', '.cpp', '.s', '.asm'):
        if re.search(r'^\s*' + re.escape(name) + r'\s*:', clean):
            return 'definition'
        if ('extern' not in clean and re.search(
                r'\b' + re.escape(name) + r'\s*(?:\[[^]]*\]\s*)?(?:=|;)', clean)):
            return 'definition_candidate'
    if 'extern' in clean:
        return 'extern_declaration'
    return 'reference_or_comment'


def build():
    inventory = json.loads((B.BUILD / 'native_program/inventory.json').read_text())
    current = set(inventory['missing_source_definitions'])
    names = sorted(current | ORIGINAL_SPECIALS)
    expression = re.compile(r'(?<![A-Za-z0-9_])(?:'
                            + '|'.join(map(re.escape, sorted(names, key=len, reverse=True)))
                            + r')(?![A-Za-z0-9_])')
    files = []
    for folder in ('recon', 'configs', 'docs', 'tools/psyq_pipe'):
        root = NFS4 / folder
        if root.is_dir():
            files += [path for path in root.rglob('*')
                      if path.suffix.lower() in ('.c', '.cpp', '.h', '.s', '.asm',
                                                 '.txt', '.json', '.md')
                      and path.stat().st_size < 2_000_000]
    occurrences = {name: [] for name in names}
    for path in files:
        text = path.read_text(encoding='utf-8', errors='ignore')
        relative = path.relative_to(NFS4).as_posix()
        for number, line in enumerate(text.splitlines(), 1):
            for match in expression.finditer(line):
                name = match.group(0)
                occurrences[name].append({'path': relative, 'line': number,
                                          'category': category(path, line, name),
                                          'text': line.strip()})
    meaningful = {}
    for name, expected in MEANINGFUL.items():
        rows = [row for row in occurrences[name] if row['path'] == expected]
        if not rows:
            raise ValueError(f'{name}: expected NFS4 owner evidence is absent')
        meaningful[name] = {'owner': expected, 'occurrences': rows}
    false_matches = {name: rows for name, rows in occurrences.items()
                     if rows and name not in meaningful}
    no_exact_match = sorted(name for name, rows in occurrences.items() if not rows)
    data_only = []
    for path in (NFS4 / 'recon').rglob('*.c'):
        head = '\n'.join(path.read_text(encoding='utf-8', errors='ignore').splitlines()[:12])
        if re.search(r'data[- ]only', head, re.I):
            data_only.append(path.relative_to(NFS4).as_posix())
    report = {
        'target_names': len(names),
        'current_missing_names': len(current),
        'meaningful_exact_owners': meaningful,
        'false_or_incidental_exact_matches': false_matches,
        'no_exact_match': no_exact_match,
        'authoritative_files_scanned': len(files),
        'nfs4_data_only_modules': sorted(data_only),
        'conclusion': ('NFS4 supplies exact ownership evidence for _ctype_, '
                       '_stacksize and nullfunction. Other Diablo names require '
                       'different-name structural matching or Diablo gold sources.'),
    }
    OUT.write_text(json.dumps(report, indent=2) + '\n')
    print(f'NFS4: {len(meaningful)} meaningful exact owners; '
          f'{len(false_matches)} incidental matches; {len(no_exact_match)} no exact match')
    return report


if __name__ == '__main__':
    build()
