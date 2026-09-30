#!/usr/bin/env python3
"""Compile a TU and compare full ordered call/tail-call symbols with its oracle.

Usage: python tools/callaudit.py recon/source/items.cpp PrintItemPower__FcPC10ItemStruct
Only proven same-address aliases and TU-owned copies may differ in spelling.
C++ signatures are never discarded; unknown targets never act as wildcards.
"""
import argparse
import os
from pathlib import Path
import re
import sys

import build as B
import status as S


def spelling(name):
    return name.replace("_._", "___")


def copy_base(name):
    return re.sub(r"_[0-9a-fA-F]{8}$", "", spelling(name))


def addresses():
    result = {}
    for path in sorted((B.ROOT / "configs").glob("symbol_addrs*.txt")):
        for line in path.read_text().splitlines():
            match = re.match(r"(\S+)\s*=\s*0x([0-9a-fA-F]+)\s*;", line)
            if match:
                name, address = spelling(match[1]), int(match[2], 16)
                if name in result and result[name] != address:
                    result[name] = None  # ambiguous overlay/header copy
                else:
                    result[name] = address
    return result


def equivalent(actual, expected, defined, owned, addrs):
    actual, expected = spelling(actual), spelling(expected)
    if actual == expected:
        return True
    actual_va, expected_va = addrs.get(actual), addrs.get(expected)
    raw = re.fullmatch(r"func_([0-9a-fA-F]{8})", expected)
    if raw:
        expected_va = int(raw[1], 16)
    if actual_va is not None and expected_va is not None and actual_va == expected_va:
        return True
    # Header methods are defined with a plain name in each TU's object; retail
    # copies have address suffixes. Require a local definition AND an oracle in
    # this TU, and retain the entire mangled parameter/return spelling.
    return (actual in defined and expected in owned
            and copy_base(actual) == copy_base(expected))


def calls(obj, objdump):
    symbols = B.run([objdump, "-t", obj])
    disassembly = B.run([objdump, "-drz", "-j", ".text", obj])
    if symbols.returncode or disassembly.returncode:
        sys.exit("objdump failed:\n" + symbols.stderr + disassembly.stderr)
    functions = {}
    for line in symbols.stdout.splitlines():
        match = re.match(r"([0-9a-f]+) .* F \.text\s+([0-9a-f]+) (\S+)$", line)
        if match:
            functions[spelling(match[3])] = (int(match[1], 16), int(match[2], 16))
    by_start = {}
    for name, (start, size) in functions.items():
        by_start.setdefault(start, []).append(name)
    result = {name: [] for name in functions}
    instruction = None
    for line in disassembly.stdout.splitlines():
        match = re.match(r"\s*([0-9a-f]+):\s+([0-9a-f]{8})\s+(.*)", line)
        if match:
            instruction = (int(match[1], 16), int(match[2], 16))
            continue
        relocation = re.search(r"R_MIPS_26\s+(\S+)", line)
        if not relocation or instruction is None:
            continue
        pc, word = instruction
        owners = [name for name, (start, size) in functions.items()
                  if start <= pc < start + size]
        if not owners:
            continue
        target = relocation[1]
        if target == ".text":
            destination = (word & 0x3FFFFFF) << 2
            if word >> 26 == 2 and all(functions[name][0] <= destination
                                      < sum(functions[name]) for name in owners):
                continue  # ordinary local jump, covered by the byte gate
            names = by_start.get(destination, [])
            target = names[0] if len(names) == 1 else f".text+0x{destination:x}"
        for owner in owners:
            result[owner].append(spelling(target))
    return functions, result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("functions", nargs="?", help="comma-separated oracle function names")
    args = parser.parse_args()
    source = args.source.resolve()
    if not source.is_file():
        parser.error(f"source does not exist: {source}")
    source.relative_to(B.ROOT)
    obj = B.compile_any(source)
    objdump = os.environ.get("DIAB_OBJDUMP", str(B.MIPS / "mipsel-none-elf-objdump.exe"))
    defined, actual_calls = calls(obj, objdump)
    segment = source.stem.lower()
    owned = set(S.seg_functions(segment))
    wanted = args.functions.split(",") if args.functions else sorted(owned)
    if not wanted:
        sys.exit(f"no oracle functions for {segment}")
    addrs, failures = addresses(), 0
    for name in wanted:
        oracle = B.ROOT / "asm/nonmatchings" / segment / (name + ".s")
        key = spelling(name) if spelling(name) in defined else copy_base(name)
        if not oracle.is_file() or key not in defined:
            print(f"{name}: ERROR (missing oracle or object function)")
            failures += 1
            continue
        expected = [spelling(match[1]) for match in
                    re.finditer(r"\b(?:jal|j)\s+([A-Za-z_][\w.$]*)", oracle.read_text())
                    if not match[1].startswith(".L")]
        actual = actual_calls[key]
        differences = [(index, actual[index] if index < len(actual) else "<missing>",
                        expected[index] if index < len(expected) else "<missing>")
                       for index in range(max(len(actual), len(expected)))
                       if index >= len(actual) or index >= len(expected)
                       or not equivalent(actual[index], expected[index], defined, owned, addrs)]
        if differences:
            failures += 1
            print(f"{name}: FAIL ({len(actual)}/{len(expected)} calls)")
            for index, ours, retail in differences[:8]:
                print(f"  call {index}: {ours} != {retail}")
        else:
            print(f"{name}: CALLS ok ({len(actual)})")
    print(f"CALLS: {len(wanted) - failures}/{len(wanted)} ok")
    return bool(failures)


if __name__ == "__main__":
    sys.exit(main())
