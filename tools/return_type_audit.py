#!/usr/bin/env python3
"""Compare emitted function declaration return types with retail SYM.

Function-body SYM records and C/C++ call targets do not encode this complete
contract: in particular, an ignored int result can have the same code as void.
This is an additional seal check, not a replacement for bytes/SYM/call audits.
"""
from pathlib import Path
import re
import sys
import symlane as S
import status


def canonical(name):
    return re.sub(r'_(?:[0-9a-fA-F]{8}|ci)$', '', name.replace('_._', '___'))


def declarations(text):
    result = {}
    for line in text.splitlines():
        m = S.REC.match(line)
        if m and m[3] in ('EXT', 'STAT') and m[4].startswith('FCN '):
            record = (m[4].strip(), int(m[5]), (m[7] or '').strip(), S.norm_tag(m[8] or ''))
            result.setdefault(canonical(m[9]), set()).add(record)
    return result


def compare(actual, expected):
    if len(actual) != 1 or len(expected) != 1:
        return False, f'missing/ambiguous declarations: ours {actual}, retail {expected}'
    return (True, '') if actual == expected else (False, f'ours {actual}, retail {expected}')


def unrecorded_compiler_thunk(name, actual, expected):
    """The body-SYM lane also explicitly has no retail records for these thunks.

    Do not call their declarations verified: require the compiler's void
    declaration, distinguish them in totals, and never excuse a known mismatch.
    """
    return (re.fullmatch(r'_GLOBAL__[ID]_\w+', canonical(name)) is not None
            and not expected and actual == {('FCN VOID', 0, '', '')})


def main():
    if len(sys.argv) < 2:
        raise SystemExit('usage: return_type_audit.py source [function,...]')
    source = Path(sys.argv[1]).resolve()
    source.relative_to(S.ROOT)
    names = sys.argv[2].split(',') if len(sys.argv) > 2 else status.seg_functions(source.stem)
    if not names:
        raise SystemExit('no oracle functions selected')
    expected = declarations(S.RETAIL.read_text(encoding='latin-1'))
    providers = status.segment_homes().get(source.stem, {})
    compiled, failures, unrecorded = {}, 0, 0
    for name in names:
        provider = providers.get(name, source).resolve()
        if provider not in compiled:
            output = S.link(S.compile_g(provider))
            compiled[provider] = declarations(output.read_text(encoding='utf-8', errors='replace'))
        key = canonical(name)
        actual, wanted = compiled[provider].get(key, set()), expected.get(key, set())
        if unrecorded_compiler_thunk(name, actual, wanted):
            unrecorded += 1
            print(f'{name}: RETURN TYPE n/a (compiler void thunk; no retail declaration)')
            continue
        ok, reason = compare(actual, wanted)
        failures += not ok
        print(f'{name}: RETURN TYPE ' + ('ok' if ok else 'FAIL ' + reason))
    count = len(names) - unrecorded
    print(f'RETURN TYPES: {count-failures}/{count} ok; {unrecorded} thunks without retail declarations')
    return int(bool(failures))


if __name__ == '__main__':
    sys.exit(main())
