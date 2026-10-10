"""PREAUTO cross-image code/data/BSS and retail SYM proof."""
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
                          B.ROOT / "rom/DIABPSX.BIN", B.ROOT / "rom/PREGAME.BIN")),
                     "original toolchain/retail inputs unavailable")
class PreAutoNativeTests(unittest.TestCase):
    def test_complete_cross_image_object_and_sym(self):
        spec = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())["preauto"]
        main = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        overlay = (B.ROOT / "rom/PREGAME.BIN").read_bytes()
        symbols = "\n".join(path.read_text() for path in
                            (B.ROOT / "configs").glob("symbol_addrs*.txt"))
        regions = {".text": (0x8015F4C4, 548),
                   ".rdata": (0x80119BEC, 19),
                   ".sdata": (0x8011C1E0, 36),
                   ".bss": (0x8012FD80, 512)}

        with tempfile.TemporaryDirectory(prefix="preauto-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                raw = S.compile_g(B.ROOT / spec["source"]).read_bytes()
            obj = P.parse_obj_complete(raw)
            self.assertEqual({obj["sections"][section]: len(data)
                              for section, data in obj["code"].items()},
                             {section: size for section, (_, size) in regions.items()})
            self.assertEqual(set(obj["xrefs"]), set(spec["externals"]))

            prefix, combined, mode = R.gp_carrier_plan(
                regions, main, 0x8011A780, 0x8011C604)
            self.assertEqual((mode, len(prefix)), ("prefix", 6752))
            prefix_source = folder / "prefix.s"
            prefix_object = folder / "prefix.obj"
            prefix_source.write_bytes((".sdata\r\n" + "".join(
                ".byte " + ",".join(map(str, prefix[offset:offset + 16])) + "\r\n"
                for offset in range(0, len(prefix), 16))).encode())
            run = B.run([S.ASPSX, "-q", "-o", prefix_object, prefix_source])
            self.assertEqual(run.returncode, 0, run.stdout + run.stderr)

            bindings = R.resolve_bindings(obj["xrefs"], symbols)
            bindings["_gp"] = 0x8011A780
            blocks, map_text = N.native_link(
                "preauto", raw, combined, bindings, output_dir=folder,
                prefix_objects=[prefix_object], overlay_text=True, overlay_group="pregame_text")
            for section in (".rdata", ".sdata"):
                va, size = combined[section]
                self.assertEqual(blocks[section],
                                 main[va - 0x80010000:va - 0x80010000 + size], section)
            self.assertEqual(blocks[".bss"], bytes(512))
            text_offset = 4 + regions[".text"][0] - 0x80139BFC
            self.assertEqual(blocks[".text"], overlay[text_offset:text_offset + 548])

            dump = subprocess.run([S.DUMPSYM, folder / "preauto.sym"],
                                  capture_output=True, text=True)
            self.assertEqual(dump.returncode, 0, dump.stderr)
            retail = S.RETAIL.read_text(encoding="latin-1")
            self.assertEqual(R.verify_sym(dump.stdout, "preauto",
                                          spec["data_symbols"], retail), 2)
            R.verify_data_map(map_text, symbols, retail, "AutoMapTData")


if __name__ == "__main__":
    unittest.main()
