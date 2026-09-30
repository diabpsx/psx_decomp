#!/usr/bin/env python3
"""Link complete single-entry SDK members with original PSYLINK at retail VAs.

The GNU scaffold consumes the verified CPE payload through an incbin format
bridge. This lane currently accepts self-contained, text-only archive members;
it neither reconstructs SDK functions nor modifies their instructions.
"""
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess

import build as B
import psyq_extract as P
import symlane as SL

ARCHIVES = Path("C:/Temp/nfs3-clean/psyq400/PSX/LIB")
OUT = B.BUILD / "sdk/native"


def cpe_bytes(data, va, size):
    if data[:4] != b"CPE\x01":
        raise ValueError("invalid CPE magic")
    result, seen = bytearray(size), set()
    cursor, ended = 4, False
    while cursor < len(data):
        tag = data[cursor]
        cursor += 1
        if tag == 0:
            ended = True
            break
        if tag == 1:
            address, length = struct.unpack_from("<II", data, cursor)
            cursor += 8
            if cursor + length > len(data) or address < va or address + length > va + size:
                raise ValueError("CPE chunk is truncated or outside the declared SDK member")
            for i, value in enumerate(data[cursor:cursor + length], address - va):
                if i in seen:
                    raise ValueError("overlapping CPE chunks")
                seen.add(i)
                result[i] = value
            cursor += length
        elif tag in (2, 3, 8):
            cursor += {2: 4, 3: 6, 8: 1}[tag]
            if cursor > len(data):
                raise ValueError("truncated CPE metadata")
        else:
            raise ValueError(f"unsupported CPE tag {tag}")
    if not ended or any(data[cursor:]) or len(seen) != size:
        raise ValueError("CPE is unterminated, has trailing data, or leaves uncovered bytes")
    return bytes(result)


def member_text(obj, entry):
    sections = [index for index, name in obj["sections"].items() if name == ".text"]
    if len(sections) != 1:
        raise ValueError("expected one SDK text section")
    section = sections[0]
    if obj["xrefs"] or any(size for size in obj["bss"].values()):
        raise ValueError("SDK member needs external/data placement support")
    if any(data for index, data in obj["code"].items() if index != section):
        raise ValueError("SDK member has additional initialized data")
    exports = obj["xdefs"]
    if len(exports) != 1 or (exports[0]["name"], exports[0]["sect"], exports[0]["off"]) != (entry, section, 0):
        raise ValueError("SDK member must export only the selected entry at text offset zero")
    payload = obj["code"].get(section, b"")
    if not payload or len(payload) % 4:
        raise ValueError("SDK text is empty or not word aligned")
    return payload


def build():
    registry = json.loads((B.ROOT / "configs/sdk_link.json").read_text())
    symbols = (B.ROOT / "configs/symbol_addrs.txt").read_text()
    retail = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
    OUT.mkdir(parents=True, exist_ok=True)
    receipts = []
    for entry, spec in registry.items():
        if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", entry):
            raise ValueError("invalid SDK entry name")
        library, member = spec["library"], spec["member"]
        if Path(library).name != library:
            raise ValueError("SDK archive must be a filename")
        archive = (ARCHIVES / library).read_bytes()
        members, consumed = P.lib_members(archive)
        matches = [m for m in members if m["name"] == member]
        if consumed != len(archive) or len(matches) != 1:
            raise ValueError("archive member is missing, ambiguous, or archive parse is incomplete")
        raw = matches[0]["data"]
        obj = P.parse_obj(raw)
        if any(raw[obj["consumed"]:]):
            raise ValueError("SDK object has unparsed bytes")
        payload = member_text(obj, entry)
        addresses = {int(v, 16) for v in re.findall(
            r"^" + re.escape(entry) + r"\s*=\s*0x([0-9A-Fa-f]+);\s*//\s*type:func\b", symbols, re.M)}
        if len(addresses) != 1:
            raise ValueError("SDK entry needs one authoritative retail address")
        va = addresses.pop()
        (OUT / f"{entry}.obj").write_bytes(raw)  # exact original archive member
        commands = [f"sdk_text group org(${va:08X})", "\tsection .text,sdk_text", f"\tinclude {entry}.obj"]
        (OUT / f"{entry}.lnk").write_bytes(("\r\n".join(commands) + "\r\n").encode("ascii"))
        run = subprocess.run([str(SL.PSYLINK), "/c", "/m",
                              f"@{entry}.lnk,{entry}.cpe,{entry}.sym,{entry}.map"],
                             cwd=OUT, env=SL.ENV, capture_output=True, text=True)
        if run.returncode or "0 error(s)" not in run.stdout:
            raise ValueError("native SDK link failed: " + run.stdout + run.stderr)
        linked = cpe_bytes((OUT / f"{entry}.cpe").read_bytes(), va, len(payload))
        start = va - 0x80010000
        if start < 0 or start + len(linked) > len(retail) or linked != retail[start:start + len(linked)]:
            raise ValueError(f"{entry}: native SDK link differs from retail")
        map_text = (OUT / f"{entry}.map").read_text()
        mapped = {int(v, 16) for v in re.findall(r"^\s*([0-9A-Fa-f]{8})\s+" + re.escape(entry) + r"\s*$", map_text, re.M)}
        if mapped != {va}:
            raise ValueError("native SDK export address differs")
        (OUT / f"{entry}.bin").write_bytes(linked)
        (OUT / f"{entry}.s").write_text(f'glabel {entry}\n.incbin "build/sdk/native/{entry}.bin"\nendlabel {entry}\n')
        receipts.append({"entry": entry, "library": library, "member": member,
                         "va": f"0x{va:08X}", "size": len(linked),
                         "archive_sha256": hashlib.sha256(archive).hexdigest(),
                         "object_sha256": hashlib.sha256(raw).hexdigest(),
                         "linked_sha256": hashlib.sha256(linked).hexdigest()})
        print(f"{entry}: native SDK link matches retail ({len(linked)} bytes)")
    (OUT / "receipts.json").write_text(json.dumps(receipts, indent=2) + "\n")
    return set(registry)


if __name__ == "__main__":
    build()
