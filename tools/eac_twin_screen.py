#!/usr/bin/env python3
"""Classify the unlinked library runs and screen an EA EACLIB twin tree.

The screen is evidence only: same-name relocation-masked bytes do not authorize
an archive import. It makes the remaining producer families and exact source
twins reproducible while native linkage remains the final seal.
"""
import json
import os
from pathlib import Path

import aspsx_gate as A
import build as B
import sdk_link as N


def words(path):
    result = []
    for line in path.read_text(errors="ignore").splitlines():
        match = A.ORA.search(line)
        if match:
            result.append((int.from_bytes(bytes.fromhex(match.group(2)), "little"),
                           match.group(3).strip()))
    return result


def main():
    paths = list((B.ROOT / "asm/nonmatchings/lib").glob("*.s"))
    rows = sorted((N.scaffold_bytes(path)[0], len(N.scaffold_bytes(path)[1]), path.stem)
                  for path in paths)
    receipt_path = B.BUILD / "sdk/native/receipts.json"
    if not receipt_path.is_file():
        raise ValueError("fresh SDK receipts required; run tools/sdk_link.py")
    sdk = {name for receipt in json.loads(receipt_path.read_text())
           for name in receipt["exports"]}
    registry = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())
    native_by_family = {"climax": set(), "eac": set()}
    for spec in registry.values():
        family = "eac" if spec["source"].startswith("recon/eaclib/") else "climax"
        for section, placement in spec["sections"].items():
            if section.startswith(".text.") and placement.get("segment") == "lib":
                native_by_family[family].update(placement.get("functions", []))
    native = set().union(*native_by_family.values())
    pending = {name for _, _, name in rows} - sdk - native
    clusters, current = [], []
    for row in rows:
        if row[2] in pending:
            current.append(row)
        elif current:
            clusters.append(current)
            current = []
    if current:
        clusters.append(current)
    if (len(rows) != 837 or len(sdk) != 349 or len(native_by_family["climax"]) != 146
            or len(pending) != 342 - len(native_by_family["eac"])):
        raise ValueError("library inventory changed; review classification thresholds")
    boot = {name for address, _, name in rows if name in pending and address < 0x8002326C}
    eac = pending - boot
    if len(boot) != 33 or len(eac) != 309 - len(native_by_family["eac"]):
        raise ValueError("library producer partition changed")

    twin_root = Path(os.environ.get(
        "DIAB_EAC_TWIN_ASM", "C:/Temp/nfs4-decomp/asm/nonmatchings/main"))
    twins = []
    for name in sorted(eac):
        candidate = twin_root / (name + ".s")
        retail = B.ROOT / "asm/nonmatchings/lib" / (name + ".s")
        if not candidate.is_file():
            continue
        ours, wanted = words(candidate), words(retail)
        differences = sum(1 for (word, _), (oracle, text) in zip(ours, wanted)
                          if (word ^ oracle) & A.mask_for(text, oracle))
        differences += abs(len(ours) - len(wanted))
        twins.append({"name": name, "candidate_words": len(ours),
                      "retail_words": len(wanted), "masked_differences": differences,
                      "exact": differences == 0})
    report = {
        "screening_only": True,
        "library_entries": len(rows),
        "sony_archive_linked": len(sdk),
        "climax_source_linked": len(native_by_family["climax"]),
        "eac_source_linked": len(native_by_family["eac"]),
        "pending": len(pending),
        "producer_partition": {"boot_gte_compression_abl": sorted(boot),
                               "eac_runtime": sorted(eac)},
        "clusters": [{"start": f"0x{cluster[0][0]:08X}",
                      "end": f"0x{cluster[-1][0] + cluster[-1][1]:08X}",
                      "count": len(cluster), "first": cluster[0][2], "last": cluster[-1][2]}
                     for cluster in clusters],
        "twin_root": str(twin_root),
        "same_name_twins": twins,
    }
    output = B.BUILD / "eac_twin_screen.json"
    output.write_text(json.dumps(report, indent=2) + "\n")
    exact = sum(row["exact"] for row in twins)
    print(f"837 = {len(sdk)} Sony + {len(native_by_family['climax'])} Climax + "
          f"{len(native_by_family['eac'])} EAC source + {len(pending)} pending")
    print(f"pending partition: {len(boot)} boot/GTE/compression/ABL + {len(eac)} EAC runtime")
    print(f"EAC twin screen: {len(twins)} same-name candidates, {exact} exact masked bodies")
    print(output)


if __name__ == "__main__":
    main()
