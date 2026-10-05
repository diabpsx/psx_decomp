#!/usr/bin/env python3
"""Fail-closed producer-layout rewrites for assembled PsyQ LNK objects.

The compiler and ASPSX must see ordinary .sdata/.sbss so they retain the retail
GP-relative relocation operators.  This module may then split one assembled
section into independently placeable PSYLINK sections without changing code or
relocation kinds.
"""
import re
import struct

import psyq_extract as P


def _counted(value):
    raw = value.encode('ascii')
    if not raw or len(raw) > 255:
        raise ValueError('invalid PsyQ section name')
    return bytes([len(raw)]) + raw


def _piece_at(pieces, offset):
    matches = [row for row in pieces if row['offset'] <= offset < row['offset'] + row['size']]
    if not matches:
        # A compiler may materialize the legal one-past address of the final array.
        # Retarget it only when the boundary is unambiguous (no following chunk starts
        # there); ordinary shared boundaries continue to select the following chunk.
        ending = [row for row in pieces if row['offset'] + row['size'] == offset]
        starting = [row for row in pieces if row['offset'] == offset]
        if len(ending) == 1 and not starting:
            row = ending[0]
            return row, row['_destination_offset'] + row['size']
    if len(matches) != 1:
        raise ValueError(f'section offset 0x{offset:X} is outside the split plan')
    row = matches[0]
    return row, row['_destination_offset'] + offset - row['offset']


def _rewrite_expr(data, position, old_section, pieces, ids):
    start = position
    op = data[position]
    position += 1
    if op == 0x00:
        return data[start:position + 4], position + 4, None
    if op in (0x02, 0x04, 0x0C, 0x16, 0x36):
        value = struct.unpack_from('<H', data, position)[0]
        end = position + 2
        return data[start:end], end, ('section', value) if op == 0x04 else None
    if op not in (0x2C, 0x2E, 0x30, 0x32):
        raise ValueError(f'unsupported PsyQ expression opcode 0x{op:02X}')
    left, position, left_node = _rewrite_expr(data, position, old_section, pieces, ids)
    right, position, right_node = _rewrite_expr(data, position, old_section, pieces, ids)
    node = None
    if op == 0x2C and left_node == ('section', old_section) and right[0] == 0x00:
        offset = struct.unpack_from('<I', right, 1)[0]
        row, local = _piece_at(pieces, offset)
        left = b'\x04' + struct.pack('<H', ids[row['name']])
        right = b'\x00' + struct.pack('<I', local)
    return bytes([op]) + left + right, position, node


def split_section(raw, section, pieces, allow_zero_gaps=False):
    """Split one assembled section by byte ranges, preserving GP patch operators.

    `pieces` is an ordered source-range plan. By default it must cover the source
    section; `allow_zero_gaps` permits only verified zero, unreferenced gaps.
    Repeated names concatenate ranges into one destination, and the first range
    may provide a verified borrowed `prefix_hex`. No patch may originate inside
    the split section; initialized pointer tables need a future chunk-patch
    distributor rather than an unsafe partial rewrite.
    """
    obj = P.parse_obj_complete(raw)
    old_ids = [key for key, value in obj['sections'].items() if value == section]
    if len(old_ids) != 1:
        raise ValueError('split source section is absent or ambiguous')
    old = old_ids[0]
    total = len(obj['code'].get(old, b''))
    if (not isinstance(pieces, list) or not pieces
            or any(not isinstance(row, dict)
                   or set(row) - {'name', 'offset', 'size', 'alignment', 'prefix_hex'}
                   or not {'name', 'offset', 'size'} <= set(row)
                   or not isinstance(row['name'], str)
                   or not re.fullmatch(r'(?:\.(?:text|data)|\.(?:text|data|rdata|sdata|sbss|bss)\.[A-Za-z_][A-Za-z0-9_.]*)',
                                       row['name'])
                   or type(row['offset']) is not int or type(row['size']) is not int
                   or row['offset'] < 0 or row['size'] <= 0
                   or type(row.get('alignment', 1)) is not int
                   or row.get('alignment', 1) not in (0, 1, 2, 4, 8, 16)
                   or not isinstance(row.get('prefix_hex', ''), str)
                   or len(row.get('prefix_hex', '')) % 2
                   or not re.fullmatch(r'[0-9A-Fa-f]*', row.get('prefix_hex', ''))
                   for row in pieces)):
        raise ValueError('invalid section split plan')
    if type(allow_zero_gaps) is not bool:
        raise ValueError('invalid zero-gap split policy')
    pieces = sorted((dict(row) for row in pieces), key=lambda row: row['offset'])
    cursor = 0
    source = obj['code'].get(old, b'')
    for row in pieces:
        if row['offset'] < cursor:
            raise ValueError('section split plan must be nonoverlapping')
        if row['offset'] > cursor and (not allow_zero_gaps or any(source[cursor:row['offset']])):
            raise ValueError('section split plan has an unverified gap')
        cursor = row['offset'] + row['size']
    if cursor < total and (not allow_zero_gaps or any(source[cursor:])):
        raise ValueError('section split plan has an unverified suffix')
    if cursor > total:
        raise ValueError('section split plan differs from the assembled extent')
    patch_records = {}
    consumed_patches = set()
    last_source_code = None
    for record in obj['records']:
        if record['op'] == 0x02:
            last_source_code = record if record['section'] == old else None
        elif record['op'] in (0x06, 0x08):
            if record['section'] != old or record['op'] == 0x08:
                last_source_code = None
        elif record['op'] == 0x0A and record['section'] == old:
            if last_source_code is None:
                raise ValueError('source-section patch has no code chunk')
            patch_records.setdefault(last_source_code['start'], []).append(record)
            consumed_patches.add(record['start'])
    if sum(len(rows) for rows in patch_records.values()) != sum(
            patch['sect'] == old for patch in obj['patches']):
        raise ValueError('source-section patches were not completely assigned')

    # PsyQ section and symbol numbers share one object-wide namespace.
    names = list(dict.fromkeys(row['name'] for row in pieces))
    first_id = max(set(obj['sections']) | set(obj['symbol_names'])) + 1
    ids = {name: first_id + index for index, name in enumerate(names)}
    destination_sizes = {}
    first_rows = {}
    for row in pieces:
        if row['name'] not in first_rows:
            first_rows[row['name']] = row
            destination_sizes[row['name']] = len(bytes.fromhex(row.get('prefix_hex', '')))
        elif row.get('prefix_hex'):
            raise ValueError('only the first split-section piece may supply a prefix')
        row['_destination_offset'] = destination_sizes[row['name']]
        destination_sizes[row['name']] += row['size']
    old_def = obj['section_defs'][old]
    definitions = b''.join(
        b'\x10' + struct.pack('<HHB', ids[name], old_def['group'],
                              first_rows[name].get('alignment', old_def['alignment']))
        + _counted(name) for name in names)

    out = bytearray(raw[:4])
    offsets = {key: 0 for key in obj['sections']}
    inserted = False
    current = None
    prefixed = set()
    for record in obj['records']:
        op, start, end = record['op'], record['start'], record['end']
        if start in consumed_patches:
            continue
        block = bytearray(raw[start:end])
        if op == 0x10:
            sect = struct.unpack_from('<H', block, 1)[0]
            out.extend(block)
            if sect == old:
                out.extend(definitions)
                inserted = True
            continue
        if op == 0x06:
            current = struct.unpack_from('<H', block, 1)[0]
            out.extend(block)
            continue
        if op in (0x02, 0x08):
            size = struct.unpack_from('<H' if op == 0x02 else '<I', block, 1)[0]
            header = 3 if op == 0x02 else 5
            at = offsets[current]
            offsets[current] += size
            if current != old:
                out.extend(block)
                continue
            payload = bytes(block[header:])
            stop = at + size
            for row in pieces:
                left, right = max(at, row['offset']), min(stop, row['offset'] + row['size'])
                if left >= right:
                    continue
                amount = right - left
                out.extend(b'\x06' + struct.pack('<H', ids[row['name']]))
                if row['name'] not in prefixed and row.get('prefix_hex'):
                    prefix = bytes.fromhex(row['prefix_hex'])
                    out.extend(b'\x02' + struct.pack('<H', len(prefix)) + prefix)
                prefixed.add(row['name'])
                if op == 0x02:
                    rel = left - at
                    out.extend(b'\x02' + struct.pack('<H', amount) + payload[rel:rel + amount])
                    assigned = []
                    for patch_record in patch_records.get(start, []):
                        patch = bytearray(raw[patch_record['start']:patch_record['end']])
                        absolute = at + struct.unpack_from('<H', patch, 2)[0]
                        if left <= absolute < right:
                            struct.pack_into('<H', patch, 2, absolute - left)
                            expr, finish, _ = _rewrite_expr(bytes(patch), 4, old, pieces, ids)
                            if finish != len(patch):
                                raise ValueError('source patch rewrite did not consume its record')
                            patch[4:] = expr
                            out.extend(patch)
                            assigned.append(patch_record['start'])
                    if assigned:
                        patch_records[start] = [p for p in patch_records[start]
                                                if p['start'] not in assigned]
                else:
                    out.extend(b'\x08' + struct.pack('<I', amount))
            if patch_records.get(start):
                raise ValueError('source-section patch falls outside split pieces')
            out.extend(b'\x06' + struct.pack('<H', old))
            continue
        if op in (0x0C, 0x12):
            sect_at, value_at = (3, 5) if op == 0x0C else (1, 3)
            sect = struct.unpack_from('<H', block, sect_at)[0]
            if sect == old:
                value = struct.unpack_from('<I', block, value_at)[0]
                row, local = _piece_at(pieces, value)
                struct.pack_into('<H', block, sect_at, ids[row['name']])
                struct.pack_into('<I', block, value_at, local)
        elif op in (0x40, 0x42, 0x52, 0x54, 0x46):
            sect = struct.unpack_from('<H', block, 1)[0]
            if sect == old:
                value = struct.unpack_from('<I', block, 3)[0]
                row, local = _piece_at(pieces, value)
                struct.pack_into('<H', block, 1, ids[row['name']])
                struct.pack_into('<I', block, 3, local)
        elif op == 0x0A:
            expr, finish, _ = _rewrite_expr(bytes(block), 4, old, pieces, ids)
            if finish != len(block):
                raise ValueError('patch expression rewrite did not consume its record')
            block[4:] = expr
        out.extend(block)
    if not inserted:
        raise ValueError('split source section definition is absent')
    out.append(0)
    rewritten = bytes(out)
    checked = P.parse_obj_complete(rewritten)
    if checked['sections'].get(old) != section or len(checked['code'].get(old, b'')) != 0:
        raise ValueError('split source section retained payload bytes')
    for name in names:
        if len(checked['code'].get(ids[name], b'')) != destination_sizes[name]:
            raise ValueError('split destination extent differs')
    return rewritten
