"""TITLESCR whole-object bytes, initialized storage, and retail SYM proof."""
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
class TitleScreenNativeTests(unittest.TestCase):
    def test_complete_object_and_sym(self):
        spec = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())["titlescr"]
        source = B.ROOT / spec["source"]
        image = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        symbols = "\n".join(path.read_text() for path in
                            (B.ROOT / "configs").glob("symbol_addrs*.txt"))
        regions = {".text": (0x8009E1F0, 516),
                   ".data": (0x800CC68C, 48),
                   ".sdata": (0x8011B0C0, 12)}

        with tempfile.TemporaryDirectory(prefix="titlescr-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                raw = S.compile_g(source).read_bytes()
            obj = P.parse_obj_complete(raw)
            names = S.retail_section_names(source)   # retail's per-object section spelling on the object
            back = {v: k for k, v in names.items()}
            self.assertEqual({obj["sections"][section]: len(data)
                              for section, data in obj["code"].items()},
                             {names.get(section, section): size for section, (_, size) in regions.items()})
            self.assertEqual(set(obj["xrefs"]), set(spec["externals"]))

            prefix, combined, mode = R.gp_carrier_plan(
                regions, image, 0x8011A780, 0x8011C604)
            self.assertEqual((mode, len(prefix)), ("prefix", 2368))
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
                "titlescr", raw, {names.get(k, k): v for k, v in combined.items()}, bindings, output_dir=folder,
                prefix_objects=[prefix_object])
            blocks = {back.get(k, k): v for k, v in blocks.items()}
            for section, actual in blocks.items():
                va, size = combined[section]
                self.assertEqual(actual, image[va - 0x80010000:va - 0x80010000 + size],
                                 section)

            dump = subprocess.run([S.DUMPSYM, folder / "titlescr.sym"],
                                  capture_output=True, text=True)
            self.assertEqual(dump.returncode, 0, dump.stderr)
            retail = S.RETAIL.read_text(encoding="latin-1")
            self.assertEqual(R.verify_sym(dump.stdout, "titlescr",
                                          spec["data_symbols"], retail), 2)
            for name in spec["data_symbols"]:
                row = next(iter(R.data_records(dump.stdout, name)))
                if row[1] == "EXT":
                    R.verify_data_map(map_text, symbols, retail, name)


if __name__ == "__main__":
    unittest.main()
