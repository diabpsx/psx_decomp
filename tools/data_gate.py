#!/usr/bin/env python3
"""Verify source-emitted DLG data, including real ELF pointer relocations and symbol placement.

Uses configs/data_entries.json's retail section-fragment layout. Does not rewrite
objects, assembly, or linker inputs. The two synthetic function labels must have
no function records in either the source object or retail SYM inventory.
"""
import json
from pathlib import Path
import re
import struct
import sys
import build as B


class Elf:
    def __init__(self, path):
        self.raw = Path(path).read_bytes()
        header = struct.unpack_from("<16sHHIIIIIHHHHHH", self.raw)
        if header[0][:6] != b"\x7fELF\x01\x01" or header[2] != 8:
            raise ValueError("expected ELF32 little-endian MIPS")
        self.sections = [struct.unpack_from("<10I", self.raw, header[6] + i * header[11])
                         for i in range(header[12])]
        names = self.bytes(header[13])
        self.names = [self.string(names, section[0]) for section in self.sections]
        self.indices = {name: i for i, name in enumerate(self.names)}
        self.symbols = {}
        for i, section in enumerate(self.sections):
            if section[1] != 2:
                continue
            strings = self.bytes(section[6])
            self.symbols[i] = [(self.string(strings, value[0]), *value[1:]) for value in
                              struct.iter_unpack("<IIIBBH", self.bytes(i))]

    @staticmethod
    def string(data, start):
        return data[start:data.index(b"\0", start)].decode("ascii")

    def bytes(self, index):
        section = self.sections[index]
        return self.raw[section[4]:section[4] + section[5]]


def main():
    config = json.loads((B.ROOT / "configs/data_entries.json").read_text())
    pieces = config["pieces"]
    for piece in pieces:
        piece["va"] = int(piece["va"], 0)
        piece["image_base"] = int(piece["image_base"], 0)
    selected = sys.argv[1:]
    entries = [piece for piece in pieces if "segment" in piece]
    if selected and any(name not in {p["segment"] for p in entries} for name in selected):
        sys.exit("unknown data segment")
    obj = B.compile_any(B.ROOT / config["source"])
    elf = Elf(obj)
    retail_functions = {row["va"] for row in
                        json.loads((B.ROOT / "configs/sym_fns.json").read_text())}
    for piece in entries:
        if piece["va"] in retail_functions:
            sys.exit(f"{piece['entry']}: retail SYM identifies executable code")
        for symbols in elf.symbols.values():
            if any(name == piece["entry"] and info & 15 == 2
                   for name, value, size, info, other, index in symbols):
                sys.exit(f"{piece['entry']}: source invented a function body")

    def address(section, offset):
        matches = [p for p in pieces if p["section"] == section
                   and p["offset"] <= offset < p["offset"] + p["size"]]
        if len(matches) != 1:
            raise ValueError(f"unmapped/ambiguous relocation target {section}+0x{offset:x}")
        piece = matches[0]
        return piece["va"] + offset - piece["offset"]

    contents = {name: bytearray(elf.bytes(elf.indices[name]))
                for name in {p["section"] for p in pieces}}
    relocation_counts = {p["entry"]: 0 for p in pieces}
    for i, section in enumerate(elf.sections):
        if section[1] != 9 or elf.names[section[7]] not in contents:
            continue
        target = elf.names[section[7]]
        for offset, info in struct.iter_unpack("<II", elf.bytes(i)):
            if info & 255 != 2:
                raise ValueError(f"unsupported data relocation type {info & 255}")
            name, value, size, flags, other, index = elf.symbols[section[6]][info >> 8]
            if index == 0 or index >= len(elf.sections):
                raise ValueError(f"unresolved data symbol {name}")
            addend = struct.unpack_from("<I", contents[target], offset)[0]
            resolved = address(elf.names[index], value + addend)
            struct.pack_into("<I", contents[target], offset, resolved)
            owners = [p for p in pieces if p["section"] == target
                      and p["offset"] <= offset < p["offset"] + p["size"]]
            if len(owners) != 1:
                raise ValueError("unmapped relocation source")
            relocation_counts[owners[0]["entry"]] += 1

    known = {}
    for line in (B.ROOT / "configs/symbol_addrs.txt").read_text().splitlines():
        match = re.match(r"(\S+)\s*=\s*0x([0-9a-fA-F]+)\s*;", line)
        if match:
            known[match[1]] = int(match[2], 16)
    bindings = 0
    for symbols in elf.symbols.values():
        for name, value, size, info, other, index in symbols:
            if name in known and index < len(elf.names) and elf.names[index] == ".sdata":
                if address(".sdata", value) != known[name]:
                    raise ValueError(f"wrong retail placement for {name}")
                bindings += 1
    if bindings != 11:
        raise ValueError(f"expected 11 DLG data-symbol bindings, verified {bindings}")
    for piece in pieces:
        data = contents[piece["section"]][piece["offset"]:piece["offset"] + piece["size"]]
        image = (B.ROOT / "rom" / piece["image"]).read_bytes()
        start = piece["va"] - piece["image_base"]
        expected = image[start:start + piece["size"]]
        if len(data) != piece["size"] or len(expected) != piece["size"] or data != expected:
            raise ValueError(f"{piece['entry']}: source data differs from retail")
    for piece in entries:
        if not selected or piece["segment"] in selected:
            print(f"{piece['entry']}: DATA PASS ({piece['size']} bytes, "
                  f"{relocation_counts[piece['entry']]} relocations)")
    print(f"DLG_sdata: DATA PASS (96 bytes, 5 relocations, {bindings} symbol bindings)")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, KeyError, struct.error) as error:
        sys.exit(str(error))
