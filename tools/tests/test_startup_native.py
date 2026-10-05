"""Remaining STARTUP_text module blocks, small data, bytes, and SYM proof."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import psyq_extract as P
import sdk_link as N
import symlane as S


@unittest.skipUnless(all(path.is_file() for path in
                         (B.CPP, B.CC1PL, S.ASPSX, S.PSYLINK, S.DUMPSYM,
                          B.ROOT / "rom/DIABPSX.BIN")),
                     "original toolchain/retail inputs unavailable")
class StartupNativeTests(unittest.TestCase):
    def test_routed_module_blocks_and_sym(self):
        spec = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())["startup"]
        image = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        retail = S.RETAIL.read_text(encoding="latin-1")
        symbols = "\n".join(path.read_text() for path in
                            (B.ROOT / "configs").glob("symbol_addrs*.txt"))
        regions = {".text.startup_mem": (0x800B04D0, 204),
                   ".text.startup_pads": (0x800B071C, 68),
                   ".text.startup_gman": (0x800B0760, 36),
                   ".sdata": (0x8011AAD8, 4)}

        with tempfile.TemporaryDirectory(prefix="startup-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                raw = S.compile_g(B.ROOT / spec["source"]).read_bytes()
            obj = P.parse_obj_complete(raw)
            self.assertEqual({obj["sections"][section]: len(data)
                              for section, data in obj["code"].items()},
                             {section: size for section, (_, size) in regions.items()})
            self.assertEqual(set(obj["xrefs"]), set(spec["externals"]) |
                             set(spec["retail_data_bindings"]))

            prefix, combined, mode = R.gp_carrier_plan(
                regions, image, 0x8011A780, 0x8011C604)
            self.assertEqual((mode, len(prefix)), ("prefix", 856))
            prefix_source = folder / "prefix.s"
            prefix_object = folder / "prefix.obj"
            prefix_source.write_bytes((".sdata\r\n" + "".join(
                ".byte " + ",".join(map(str, prefix[offset:offset + 16])) + "\r\n"
                for offset in range(0, len(prefix), 16))).encode())
            run = B.run([S.ASPSX, "-q", "-o", prefix_object, prefix_source])
            self.assertEqual(run.returncode, 0, run.stdout + run.stderr)

            bindings = R.resolve_bindings(spec["externals"], symbols)
            bindings.update(R.resolve_retail_data_bindings(
                spec["retail_data_bindings"], retail))
            bindings["_gp"] = 0x8011A780
            blocks, map_text = N.native_link(
                "startup", raw, combined, bindings, output_dir=folder,
                prefix_objects=[prefix_object])
            for section, actual in blocks.items():
                va, size = combined[section]
                self.assertEqual(actual, image[va - 0x80010000:va - 0x80010000 + size],
                                 section)

            dump = subprocess.run([S.DUMPSYM, folder / "startup.sym"],
                                  capture_output=True, text=True)
            self.assertEqual(dump.returncode, 0, dump.stderr)
            names = ("MEM_SetupMem__Fv", "SetupWorkRam__Fv",
                     "PAD_Open__Fv", "GM_Open__Fv")
            paths = [B.ROOT / "asm/nonmatchings/startup" / (name + ".s")
                     for name in names]
            self.assertEqual(R.verify_sym(dump.stdout, "startup", ["Gaz"], retail,
                                          paths, routed_only=True), 4)
            R.verify_data_map(map_text, symbols, retail, "Gaz")


if __name__ == "__main__":
    unittest.main()
