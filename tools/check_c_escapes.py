#!/usr/bin/env python3
"""Reject unknown C/C++ escapes in reconstructed literals, ignoring comments.

PsyQ silently discards some invalid escape backslashes. Instruction-only
matching normalizes their string addresses, so it cannot detect this defect.
This check supplements (never replaces) exact relocated-data verification.
"""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
TOKENS = re.compile(r'//[^\n]*|/\*[\s\S]*?\*/|"(?:\\[\s\S]|[^"\\])*"|\'(?:\\[\s\S]|[^\'\\])*\'')
ESCAPES = re.compile(r'\\([\s\S])')


def invalid_escapes(source):
    """Return (line, escape) for unknown escapes in string/character tokens."""
    result = []
    for token in TOKENS.finditer(source):
        if token[0].startswith('/'):
            continue
        for escape in ESCAPES.finditer(token[0]):
            if escape[1] not in "abfnrtv\\\"'?01234567xuU\n":
                line = source.count('\n', 0, token.start() + escape.start()) + 1
                result.append((line, escape[0]))
    return result


def main():
    roots = [Path(p) for p in sys.argv[1:]] or [ROOT / 'recon']
    if any(not root.exists() for root in roots):
        raise SystemExit('C escape scan input does not exist')
    files = sorted({p for root in roots for p in (root.rglob('*') if root.is_dir() else [root])
                    if p.suffix in ('.c', '.cpp', '.h')})
    if not files:
        raise SystemExit('C escape scan found no source files')
    failures = 0
    for path in files:
        for line, escape in invalid_escapes(path.read_text(encoding='latin-1')):
            print(f'{path}:{line}: unknown escape {escape!r}')
            failures += 1
    print(f'C escapes: {len(files)} files checked, {failures} unknown escapes')
    return int(bool(failures))


if __name__ == '__main__':
    sys.exit(main())
