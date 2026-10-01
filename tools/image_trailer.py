#!/usr/bin/env python3
"""Audit DIABPSX.BIN's additive file trailer against the MAP payload boundary.

The trailer is file metadata, not the initial value of GameTaskPtr in .sbss.
This module does not modify the ROM, linked image, or assembly scaffold.
"""
from pathlib import Path
import re
import struct
import argparse

ROOT = Path(__file__).resolve().parent.parent
BASE = 0x80010000


def runtime_segments(rows, file_end):
    """Exclude the explicitly declared main-file trailer from loadable sections."""
    if not rows or rows[-1][1:] != ('bin', 'diabpsx_checksum'):
        raise ValueError('main image must declare its checksum trailer')
    payload_end = rows[-1][0]
    if file_end != payload_end + 4 or payload_end % 4:
        raise ValueError('main checksum trailer must be exactly four bytes')
    if any(kind == 'bin' or off >= payload_end for off, kind, label in rows[:-1]):
        raise ValueError('invalid runtime section before checksum trailer')
    return rows[:-1], payload_end


def encode(payload):
    if not payload or len(payload) % 4:
        raise ValueError('payload must be nonempty and word aligned')
    return payload + struct.pack('<I', sum(payload) & 0xFFFFFFFF)


def decode(data, payload_size):
    if type(payload_size) is not int or payload_size <= 0 or payload_size % 4:
        raise ValueError('invalid payload extent')
    if len(data) != payload_size + 4:
        raise ValueError('file must contain exactly one four-byte trailer')
    payload = data[:payload_size]
    checksum = struct.unpack_from('<I', data, payload_size)[0]
    if checksum != sum(payload) & 0xFFFFFFFF:
        raise ValueError('additive file checksum differs')
    return payload, checksum


def serialize_runtime(runtime, payload_size, bss_size):
    """Serialize an exact linked runtime image, never copying BSS into the file.

    Reject the old scaffold layout: a checksum in the first BSS word is not
    acceptable even when every subsequent byte is zero. No runtime bytes are
    repaired here; the linker must emit the correct image before serialization.
    """
    if type(payload_size) is not int or payload_size <= 0 or payload_size % 4:
        raise ValueError('invalid payload extent')
    if type(bss_size) is not int or bss_size <= 0 or bss_size % 4:
        raise ValueError('invalid BSS extent')
    if len(runtime) != payload_size + bss_size:
        raise ValueError('runtime must cover exactly the payload and complete BSS')
    if any(runtime[payload_size:]):
        raise ValueError('runtime BSS must be entirely zero, including its first word')
    return encode(runtime[:payload_size])


def map_extents(text):
    """Read the contiguous small/large BSS regions from the retail linker MAP."""
    rows = {}
    for kind in ('sbss', 'bss'):
        matches = re.findall(
            r'^\s*([0-9A-F]{8})\s+([0-9A-F]{8})\s+([0-9A-F]{8})\s+[0-9A-F]{8}\s+'
            + kind + r'\s+\.' + kind + r'\s*$', text, re.M)
        if len(matches) != 1:
            raise ValueError('expected one MAP ' + kind + ' boundary')
        start, end, size = (int(x, 16) for x in matches[0])
        if size <= 0 or end + 1 != start + size:
            raise ValueError('inconsistent MAP ' + kind + ' extent')
        rows[kind] = (start, end + 1)
    start, middle = rows['sbss']
    if rows['bss'][0] != middle or start <= BASE:
        raise ValueError('MAP BSS regions are not contiguous after the payload')
    return start - BASE, rows['bss'][1] - start


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--runtime', type=Path, help='validate a linked runtime image without modifying it')
    args = parser.parse_args()
    text = (ROOT / 'rom/DIABPSX.MAP').read_text(encoding='latin-1')
    payload_size, bss_size = map_extents(text)
    retail = (ROOT / 'rom/DIABPSX.BIN').read_bytes()
    payload, checksum = decode(retail, payload_size)
    print(f'DIABPSX: {len(payload)} payload bytes + 4-byte additive trailer 0x{checksum:08X}')
    print(f'MAP .sbss begins at 0x{BASE + payload_size:08X}; {bss_size} runtime BSS bytes')
    if args.runtime:
        serialized = serialize_runtime(args.runtime.read_bytes(), payload_size, bss_size)
        if serialized != retail:
            raise ValueError('serialized runtime differs from the complete retail file')
        print('Runtime BSS and serialized retail file both verified')


if __name__ == '__main__':
    main()
