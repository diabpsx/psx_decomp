"""Exact ownership of extra source text sections inside mixed retail segments."""
import re


def validate_members(start, size, names, entries):
    if not isinstance(names, list) or not names or any(not isinstance(n, str) for n in names) or len(set(names)) != len(names):
        raise ValueError('extra text requires unique explicit functions')
    if any(not isinstance(n, str) or not re.fullmatch(r'\w+', n) or n not in entries for n in names):
        raise ValueError('extra text names a missing or invalid function')
    cursor = start
    for name in sorted(names, key=lambda n: entries[n][0]):
        address, length = entries[name]
        if address != cursor or length <= 0 or address + length > start + size:
            raise ValueError('extra text must cover complete contiguous functions')
        cursor += length
    if cursor != start + size:
        raise ValueError('extra text has an uncovered suffix')


def render_mixed(parts, owned, start, size):
    """Parts: (VA, bytes, label, original assembly, relative path, oracle name)."""
    output = ['.include "macro.inc"\n.section .text\n']
    cursor, used = start, set()
    from sdk_link import local_label_aliases
    for address, data, label, source, path, name in sorted(parts):
        if address != cursor or address + len(data) > start + size:
            raise ValueError('mixed text scaffold must cover its whole segment')
        if name in owned:
            base, length, filename = owned[name]
            if not base <= address < address + len(data) <= base + length:
                raise ValueError('mixed text function exceeds its source section')
            output.append(f'glabel {label}\n.incbin "{filename}", {address-base}, {len(data)}\nendlabel {label}\n')
            output.append(local_label_aliases(source, label, address, len(data)))
            used.add(name)
        else:
            output.append(f'.include "{path}"\n')
        cursor += len(data)
    if cursor != start + size or used != set(owned):
        raise ValueError('mixed text has missing bytes or unused source functions')
    return ''.join(output)
