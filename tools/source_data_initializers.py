#!/usr/bin/env python3
"""Read retail semantic table fields as typed C aggregate initializers.

Uses target-layout field offsets from the existing SYM-derived headers. Padding
must be zero and is not emitted as an invented field. Does not write source,
assemble bytes, create payload bridges or insert fixed program addresses.
"""
import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SIZES = {'char': 1, 'unsigned char': 1, 'signed char': 1,
         'short': 2, 'unsigned short': 2, 'int': 4, 'unsigned int': 4,
         'long': 4, 'unsigned long': 4, 'BOOL': 4}
SYM_TYPES = {'char': 'CHAR', 'signed char': 'CHAR', 'unsigned char': 'UCHAR',
             'short': 'SHORT', 'unsigned short': 'USHORT', 'int': 'INT',
             'unsigned int': 'UINT', 'long': 'LONG', 'unsigned long': 'ULONG',
             'BOOL': 'BOOL'}


def struct_layout(header, name):
    text = (ROOT / header).read_text(encoding='utf-8')
    match = re.search(r'^struct ' + re.escape(name) + r' \{.*?^\};', text, re.M | re.S)
    if not match:
        raise ValueError(f'{name}: no SYM-derived structure definition')
    retail = (ROOT / 'rom/DIABPSX-SYM.txt').read_text(encoding='latin-1')
    symbol = re.search(r'^[^\r\n]*Def class STRTAG type STRUCT size \d+ name '
                       + re.escape(name) + r'[^\S\r\n]*$.*?^[^\r\n]*class EOS[^\r\n]*?tag '
                       + re.escape(name) + r' name \.eos\s*$', retail, re.M | re.S)
    if not symbol:
        raise ValueError(f'{name}: retail field-layout records are missing')
    expected = {}
    for offset, kind, identifier in re.findall(
            r'^.*\$([0-9a-fA-F]+) 9[46] Def2? class MOS type ([A-Z ]+?) size \d+.*? name (\w+)\s*$',
            symbol[0], re.M):
        expected[identifier] = (int(offset, 16), kind)
    fields = []
    seen = set()
    for line in match[0].splitlines()[1:-1]:
        field = re.fullmatch(r'\s*(.+?)\s+(\w+)((?:\[\d+\])*)\s*;\s*/\* \+0x([0-9A-Fa-f]+) \*/', line)
        if not field:
            raise ValueError(f'{name}: field has no supported target-layout annotation: {line}')
        kind, identifier, dimensions, offset = field.groups()
        if kind not in SIZES:
            raise ValueError(f'{name}: unsupported field type {kind}')
        dims = [int(x) for x in re.findall(r'\[(\d+)\]', dimensions)]
        if len(dims) > 1:
            raise ValueError(f'{name}: nested array field requires explicit shape support')
        target_type = ('ARY ' if dims else '') + SYM_TYPES[kind]
        if expected.get(identifier) != (int(offset, 16), target_type):
            raise ValueError(f'{name}/{identifier}: header field differs from retail SYM')
        seen.add(identifier)
        fields.append((kind, int(offset, 16), dims[0] if dims else 1, bool(dims)))
    if seen != set(expected):
        raise ValueError(f'{name}: header omits retail fields')
    return match[0], fields


def values(kind, data):
    size = SIZES[kind]
    signed = not kind.startswith('unsigned') and kind != 'BOOL'
    return [int.from_bytes(data[i:i+size], 'little', signed=signed)
            for i in range(0, len(data), size)]


def aggregate_rows(raw, stride, fields):
    if len(raw) % stride:
        raise ValueError('table extent is not a whole number of records')
    rows = []
    for at in range(0, len(raw), stride):
        record = raw[at:at+stride]
        covered, members = set(), []
        for kind, offset, count, is_array in fields:
            length = SIZES[kind] * count
            if offset < 0 or offset+length > stride or covered & set(range(offset,offset+length)):
                raise ValueError('overlapping or out-of-range field layout')
            covered.update(range(offset, offset+length))
            decoded = values(kind, record[offset:offset+length])
            spelling = ', '.join(map(str, decoded))
            members.append('{ ' + spelling + ' }' if is_array else spelling)
        if any(value for offset, value in enumerate(record) if offset not in covered):
            raise ValueError(f'nonzero padding in record {at // stride}')
        rows.append('    { ' + ', '.join(members) + ' },')
    return rows


def table(header, tag, name, va, count, stride, const=False):
    declaration, fields = struct_layout(header, tag)
    rom = (ROOT / 'rom/DIABPSX.BIN').read_bytes()
    raw = rom[va-0x80010000:va-0x80010000+count*stride]
    if len(raw) != count * stride:
        raise ValueError('table is outside retail image')
    qualifier = 'extern const ' if const else ''
    source = (f'{qualifier}{tag} {name}[{count}] = {{ /* @0x{va:08X} */\n'
              + '\n'.join(aggregate_rows(raw, stride, fields)) + '\n};\n')
    return declaration, source
