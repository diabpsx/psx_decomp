#!/usr/bin/env python3
"""isoget.py — minimal ISO9660 reader for a MODE2/2352 CD image (Diablo Japan .bin).

    python tools/isoget.py IMAGE.bin list                 # root directory listing
    python tools/isoget.py IMAGE.bin get NAME OUT [...]   # extract root files (pairs)
"""
import struct, sys
from pathlib import Path

SECT = 2352
DATA_OFF = 24        # MODE2 form-1 user data (sync 12 + header 4 + subheader 8)

def sector(img, n):
    img.seek(n * SECT + DATA_OFF)
    return img.read(2048)

def read_extent(img, lba, size):
    out = bytearray()
    n = 0
    while len(out) < size:
        out += sector(img, lba + n); n += 1
    return bytes(out[:size])

def root_entries(img):
    pvd = sector(img, 16)
    assert pvd[1:6] == b"CD001", "no PVD"
    root = pvd[156:190]
    lba = struct.unpack_from("<I", root, 2)[0]
    size = struct.unpack_from("<I", root, 10)[0]
    data = read_extent(img, lba, size)
    i = 0
    while i < len(data):
        ln = data[i]
        if ln == 0:
            i = (i // 2048 + 1) * 2048   # next sector
            continue
        rec = data[i:i + ln]
        elba = struct.unpack_from("<I", rec, 2)[0]
        esize = struct.unpack_from("<I", rec, 10)[0]
        flags = rec[25]
        nl = rec[32]
        name = rec[33:33 + nl].decode("latin-1").split(";")[0]
        if name not in ("\x00", "\x01"):
            yield name, elba, esize, flags
        i += ln

def main():
    img = open(sys.argv[1], "rb")
    cmd = sys.argv[2]
    ents = {n: (l, s) for n, l, s, f in root_entries(img)}
    if cmd == "list":
        for n, (l, s) in ents.items(): print(f"{n:16s} lba {l:7d} size {s:10d}")
    elif cmd == "get":
        for name, out in zip(sys.argv[3::2], sys.argv[4::2]):
            l, s = ents[name]
            Path(out).write_bytes(read_extent(img, l, s)); print(f"{name} -> {out} ({s} B)")

if __name__ == "__main__":
    main()
