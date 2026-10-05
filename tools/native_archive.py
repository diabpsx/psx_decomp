#!/usr/bin/env python3
"""Native-link complete original archive-member groups at their retail layout.

Selected members remain byte-for-byte unchanged. PSYLINK resolves their real
relocations and emits complete section groups, replacing handwritten oracles.
"""
import hashlib
import json
from pathlib import Path
import re

import build as B
import psyq_extract as P
import sdk_link as S

REGISTRY = B.ROOT / "configs/native_archive_link.json"
OUT = B.BUILD / "native_archive"
IMAGES = {
    "diabpsx": (0x80010000, "DIABPSX.BIN"),
    "frontend": (0x80139BF8, "FRONTEND.BIN"),
    "pregame": (0x80139BF8, "PREGAME.BIN"),
    "game": (0x80139BF8, "GAME.BIN"),
    "fmv": (0x80139BF8, "FMV.BIN"),
}


def _binding(symbols, name):
    try:
        return S.function_address(symbols, name)
    except ValueError:
        return S.data_address(symbols, name)


def _map_address(text, name):
    rows = {int(value, 16) for value in re.findall(
        r"^\s*([0-9A-Fa-f]{8})\s+" + re.escape(name) + r"\s*$", text, re.M)}
    if len(rows) != 1:
        raise ValueError(f"{name}: expected one authoritative MAP address")
    return rows.pop()


def verified_headers(spec):
    result = {}
    include = S.ARCHIVE_ROOTS[spec['sdk']].parent / 'INCLUDE'
    for name, expected in spec.get('headers', {}).items():
        if Path(name).name != name:
            raise ValueError('invalid SDK header filename')
        digest = hashlib.sha256((include / name).read_bytes()).hexdigest()
        if digest != expected:
            raise ValueError(f'{name}: original SDK header hash differs')
        result[name] = digest
    return result


def build(only=None, output_dir=None):
    registry = json.loads(REGISTRY.read_text())
    selected = set(registry) if only is None else set(only)
    if selected - set(registry):
        raise ValueError("unknown native archive group")
    out = OUT if output_dir is None else Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)
    symbols = (B.ROOT / "configs/symbol_addrs.txt").read_text()
    retail_map = (B.ROOT / "rom/DIABPSX.MAP").read_text(encoding="latin-1")
    receipts = []
    for entry, spec in registry.items():
        if entry not in selected:
            continue
        if (not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", entry)
                or spec.get("image") not in IMAGES
                or spec.get("sdk") not in S.ARCHIVE_ROOTS
                or Path(spec.get("library", "")).name != spec.get("library")
                or not isinstance(spec.get("members"), list) or not spec["members"]
                or len(spec["members"]) != len(set(spec["members"]))
                or not isinstance(spec.get("sections"), dict) or not spec["sections"]):
            raise ValueError(f"{entry}: invalid native archive declaration")
        archive_path = S.ARCHIVE_ROOTS[spec["sdk"]] / spec["library"]
        archive = archive_path.read_bytes()
        digest = hashlib.sha256(archive).hexdigest()
        if digest != spec.get("archive_sha256"):
            raise ValueError(f"{entry}: original archive hash differs")
        headers = verified_headers(spec)
        members, consumed = P.lib_members(archive)
        by_name = {member["name"]: member for member in members}
        if consumed != len(archive) or any(name not in by_name for name in spec["members"]):
            raise ValueError(f"{entry}: archive member set is incomplete")
        chosen = [by_name[name] for name in spec["members"]]
        objects = [P.parse_obj_complete(member["data"]) for member in chosen]
        definitions = {row["name"] for obj in objects for row in obj["xdefs"]}
        references = {name for obj in objects for name in obj["xrefs"]}
        externals = set(spec.get("externals", []))
        if references - definitions != externals:
            raise ValueError(f"{entry}: external binding set differs")
        section_rows = list(spec["sections"].items())
        source_sections = [row["source_section"] for _, row in section_rows]
        if (len(source_sections) != len(set(source_sections))
                or any(set(row) != {"source_section", "output_section", "va", "size"}
                       or not re.fullmatch(r"\.[A-Za-z_][A-Za-z0-9_.]*", row["source_section"])
                       or not re.fullmatch(r"\.[A-Za-z_][A-Za-z0-9_.]*", row["output_section"])
                       or type(row["size"]) is not int or row["size"] <= 0
                       for _, row in section_rows)):
            raise ValueError(f"{entry}: invalid section group")
        starts = [int(row["va"], 0) for _, row in section_rows]
        if any(a + row["size"] != b for a, (_, row), b in zip(starts, section_rows, starts[1:])):
            raise ValueError(f"{entry}: archive sections are not contiguous")
        size = sum(row["size"] for _, row in section_rows)
        for member in chosen[:-1]:
            (out / f"{entry}_{member['name']}.obj").write_bytes(member["data"])
        prefixes = [out / f"{entry}_{member['name']}.obj" for member in chosen[:-1]]
        bindings = {name: _binding(symbols, name) for name in externals}
        blocks, native_map = S.native_link(
            entry, chosen[-1]["data"], {}, bindings, prefix_objects=prefixes,
            output_dir=out, composed_groups={entry: {
                "sections": source_sections, "va": starts[0], "size": size}})
        payload = blocks[entry]
        base, image_name = IMAGES[spec["image"]]
        retail = (B.ROOT / "rom" / image_name).read_bytes()
        expected = retail[starts[0] - base:starts[0] - base + size]
        if payload != expected:
            raise ValueError(f"{entry}: native archive payload differs from retail")
        for name in definitions:
            if _map_address(native_map, name) != _map_address(retail_map, name):
                raise ValueError(f"{entry}: native archive export address differs")
        cursor = 0
        receipt_sections = {}
        for scaffold, row in section_rows:
            part = payload[cursor:cursor + row["size"]]
            cursor += row["size"]
            binary = out / f"{scaffold}.bin"
            binary.write_bytes(part)
            (out / f"{scaffold}.s").write_text(
                f'.section {row["output_section"]}\n'
                f'.incbin "build/native_archive/{scaffold}.bin"\n')
            receipt_sections[scaffold] = {
                "source_section": row["source_section"],
                "output_section": row["output_section"],
                "va": f"0x{int(row['va'], 0):08X}",
                "size": row["size"],
                "sha256": hashlib.sha256(part).hexdigest(),
            }
        receipt = {
            "entry": entry,
            "sdk": spec["sdk"],
            "library": spec["library"],
            "members": spec["members"],
            "archive_sha256": digest,
            "headers": headers,
            "sections": receipt_sections,
            "exports": {name: f"0x{_map_address(native_map, name):08X}"
                        for name in sorted(definitions)},
            "externals": {name: f"0x{address:08X}" for name, address in sorted(bindings.items())},
        }
        receipts.append(receipt)
        print(f"{entry}: {len(chosen)} original archive members native-link to {size} exact retail bytes")
    if only is None:
        (out / "receipts.json").write_text(json.dumps(receipts, indent=2) + "\n")
    return receipts


if __name__ == "__main__":
    build()
