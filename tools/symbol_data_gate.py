#!/usr/bin/env python3
"""Compare a relocation-free source data symbol with its exact retail bytes.

Example: python tools/symbol_data_gate.py recon/psxsrc/gpanel.cpp DurColors 0x800B9BCC 18
This is a data-byte receipt only, not a function or final-link seal. Pointer
relocations require an appropriate layout/relocation gate such as data_gate.py.
"""
import argparse
from pathlib import Path
import re
import struct
import sys

import build as B
from data_gate import Elf
import symlane as SL


def number(value):
    return int(value, 0)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("symbol")
    parser.add_argument("va", type=number)
    parser.add_argument("size", type=number)
    parser.add_argument("--image", default="DIABPSX.BIN")
    parser.add_argument("--image-base", type=number, default=0x80010000)
    args = parser.parse_args()
    source = args.source.resolve()
    source.relative_to(B.ROOT)
    if not source.is_file():
        raise ValueError(f"source does not exist: {source}")
    if args.size <= 0:
        raise ValueError("data size must be positive")
    if Path(args.image).name != args.image:
        raise ValueError("image must be a filename under rom/")
    retail = (B.ROOT / "rom" / args.image).read_bytes()
    start = args.va - args.image_base
    if start < 0 or start + args.size > len(retail):
        raise ValueError("retail data range is outside the image")
    elf = Elf(B.compile_any(source))
    matches = [symbol for symbols in elf.symbols.values() for symbol in symbols
               if symbol[0] == args.symbol]
    if len(matches) != 1:
        raise ValueError(f"expected one {args.symbol} symbol, found {len(matches)}")
    name, offset, size, info, other, index = matches[0]
    kind = info & 15
    if kind not in (0, 1) or index <= 0 or index >= len(elf.sections):
        raise ValueError("expected a defined ELF data-object symbol")
    section = elf.sections[index]
    if section[1] != 1 or elf.names[index] not in (".data", ".rodata", ".rdata", ".sdata"):
        raise ValueError("expected initialized data in a supported PROGBITS section")
    if kind == 0 and size == 0:
        # Era GCC/ASPSX input often omits ELF .type/.size. Do not guess an
        # object's extent from a caller's requested range or section padding:
        # recover the array extent from the same source's real SDB receipt.
        receipt = SL.link(SL.compile_g(source), source=source).read_text(errors="replace")
        sizes = re.findall(r"^\w+:\s+\$\w+\s+\d+ Def2 class (?:STAT|EXT) "
                           r"type ARY.*? size (\d+).*? name " + re.escape(name) + r"\s*$",
                           receipt, re.M)
        if len(sizes) != 1:
            raise ValueError("ELF extent absent; expected one source SDB array-size record")
        size = int(sizes[0])
    if size != args.size or offset + size > section[5]:
        raise ValueError(f"source symbol size/range differs: {size} versus {args.size}")
    for i, relocation_section in enumerate(elf.sections):
        if relocation_section[1] not in (4, 9) or relocation_section[7] != index:
            continue
        stride = 12 if relocation_section[1] == 4 else 8
        entries = elf.bytes(i)
        if len(entries) % stride:
            raise ValueError("malformed data relocation section")
        for entry in range(0, len(entries), stride):
            where, relocation = struct.unpack_from("<II", entries, entry)
            width = 8 if relocation & 255 == 18 else 4  # R_MIPS_64 versus ELF32 word patches
            if where < offset + size and where + width > offset:
                raise ValueError("data symbol has a relocation; use a relocation-aware gate")
    actual = elf.bytes(index)[offset:offset + size]
    if actual != retail[start:start + size]:
        raise ValueError(f"{name}: source data differs from retail")
    print(f"{name}: DATA BYTES PASS ({size} bytes, {elf.names[index]}, "
          f"retail 0x{args.va:08X}, no overlapping relocations)")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, KeyError, OSError, struct.error) as error:
        sys.exit(str(error))
