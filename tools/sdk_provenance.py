#!/usr/bin/env python3
"""Find strict PsyQ archive-member candidates for the excluded library region.

This is provenance screening, NOT a link/seal receipt. Only known instruction
relocation fields are masked; their target expressions must still be verified
by the eventual real-library link. No code or object is rewritten.
"""
import argparse
import csv
import hashlib
import json
from pathlib import Path
import re
import struct

import psyq_extract as P
import build as B

MASKS = {0x4A: 0x03FFFFFF, 0x52: 0xFFFF, 0x54: 0xFFFF}
IMMEDIATE_OPS = {8, 9, 10, 11, 12, 13, 14, 32, 33, 34, 35, 36, 37, 38, 40, 41, 42, 43, 46}


def compare_words(source, retail, patches):
    if not source or len(source) != len(retail) or len(source) % 4:
        return False, "extent differs"
    masks = {}
    for offset, kind in patches:
        if kind not in MASKS:
            return False, f"unsupported patch type 0x{kind:02X}"
        if offset < 0 or offset % 4 or offset + 4 > len(source) or offset in masks:
            return False, "invalid/duplicate relocation offset"
        word = struct.unpack_from("<I", source, offset)[0]
        opcode = word >> 26
        if kind == 0x4A and opcode not in (2, 3):
            return False, "26-bit patch is not on a jump instruction"
        if kind == 0x54 and opcode != 15:
            return False, "high-half patch is not on LUI"
        if kind == 0x52 and opcode not in IMMEDIATE_OPS:
            return False, "low-half patch is not on an immediate instruction"
        masks[offset] = MASKS[kind]
    for offset in range(0, len(source), 4):
        a, b = struct.unpack_from("<I", source, offset)[0], struct.unpack_from("<I", retail, offset)[0]
        if (a ^ b) & (~masks.get(offset, 0) & 0xFFFFFFFF):
            return False, f"unmasked word differs at +0x{offset:X}"
    return True, "unrelocated bits match; relocation targets unverified"


def oracle(path):
    rows = [(int(va, 16), int.from_bytes(bytes.fromhex(word), "little")) for va, word in re.findall(
        r"/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s+([0-9A-Fa-f]{8})\s*\*/", path.read_text())]
    if not rows or any(va != rows[0][0] + i * 4 for i, (va, word) in enumerate(rows)):
        raise ValueError(f"missing/noncontiguous retail words: {path}")
    return rows[0][0], b"".join(struct.pack("<I", word) for va, word in rows)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sdk", type=Path, default=Path("C:/Temp/nfs3-clean/psyq400/extracted"))
    parser.add_argument("--archives", type=Path, default=Path("C:/Temp/nfs3-clean/psyq400/PSX/LIB"))
    parser.add_argument("--output", type=Path, default=B.BUILD / "sdk_provenance.json")
    args = parser.parse_args()
    with (args.sdk / "INDEX.tsv").open(encoding="utf-8", newline="") as handle:
        rows = list(csv.DictReader(handle, delimiter="\t"))
    by_name = {}
    for row in rows:
        if row["kind"] == "func":
            by_name.setdefault(row["name"], []).append(row)
    archives, objects, report = {}, {}, []
    for path in sorted((B.ROOT / "asm/nonmatchings/lib").glob("*.s")):
        name = path.stem
        va, retail = oracle(path)
        candidates, rejected = [], []
        for row in by_name.get(name, []):
            lib, obj = row["lib"], row["obj"]
            key = (lib, obj)
            try:
                if lib not in archives:
                    raw = (args.archives / (lib + ".LIB")).read_bytes()
                    members, end = P.lib_members(raw)
                    if end != len(raw):
                        raise ValueError("archive has unparsed bytes")
                    archives[lib] = (hashlib.sha256(raw).hexdigest(), members)
                if key not in objects:
                    raw = (args.sdk / lib / "obj" / obj).read_bytes()
                    if not any(m["name"] == row["member"] and m["data"] == raw
                               for m in archives[lib][1]):
                        raise ValueError("extracted object is not an exact original archive member")
                    parsed = P.parse_obj(raw)
                    if any(raw[parsed["consumed"]:]):
                        raise ValueError("object has unparsed nonzero bytes")
                    objects[key] = (parsed, hashlib.sha256(raw).hexdigest())
                parsed, digest = objects[key]
                offset = int(row["offset"])
                marks = parsed["xdefs"] + parsed["locals"]
                starts = [m for m in marks if m["name"] == name and m["off"] == offset
                          and parsed["sections"].get(m["sect"]) == row["section"]]
                if len(starts) != 1:
                    raise ValueError("index does not identify one real object symbol")
                section = starts[0]["sect"]
                if not P.is_code_section(parsed["sections"][section]):
                    raise ValueError("symbol is not in a code section")
                data = parsed["code"][section]
                stop = min([m["off"] for m in marks if m["sect"] == section and m["off"] > offset] or [len(data)])
                if stop - offset != int(row["size"]):
                    raise ValueError("stale index function boundary")
                patches = [(p["off"] - offset, p["type"]) for p in parsed["patches"]
                           if p["sect"] == section and offset <= p["off"] < stop]
                ok, reason = compare_words(data[offset:stop], retail, patches)
                item = {"library": lib, "member": row["member"], "object": obj,
                        "offset": offset, "size": stop - offset, "patches": len(patches),
                        "object_sha256": digest, "archive_sha256": archives[lib][0], "reason": reason}
                (candidates if ok else rejected).append(item)
            except (ValueError, KeyError, OSError, struct.error, P.Desync) as error:
                rejected.append({"library": lib, "object": obj, "reason": str(error)})
        report.append({"entry": name, "va": f"0x{va:08X}", "size": len(retail),
                       "candidates": candidates, "rejected": rejected})
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps({"verdict": "SCREENING ONLY; no library linkage sealed",
                                      "entries": report}, indent=2) + "\n")
    print(f"Library entries: {len(report)}; archive-backed candidates: "
          f"{sum(bool(r['candidates']) for r in report)}; "
          f"no candidate: {sum(not r['candidates'] for r in report)}")
    print(f"Screening report (NOT PASS): {args.output}")


if __name__ == "__main__":
    main()
