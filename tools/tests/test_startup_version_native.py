"""VERSION.CPP startup suffix, original timestamp, bytes, and SYM proof."""
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
class StartupVersionNativeTests(unittest.TestCase):
    def test_original_build_timestamp_and_complete_object(self):
        spec = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())["startup_1"]
        source = B.ROOT / spec["source"]
        self.assertEqual(B.per_tu_flags(source)["cpp_extra"],
                         ['-D__DATE__="May 29 1998"', '-D__TIME__="14:30:45"'])
        image = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        symbols = "\n".join(path.read_text() for path in
                            (B.ROOT / "configs").glob("symbol_addrs*.txt"))
        regions = {".text": (0x800B0A18, 640),
                   ".rdata": (0x80119464, 43),
                   ".sdata": (0x8011BE14, 8)}

        with tempfile.TemporaryDirectory(prefix="startup-version-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                raw = S.compile_g(source).read_bytes()
            obj = P.parse_obj_complete(raw)
            self.assertEqual({obj["sections"][section]: len(data)
                              for section, data in obj["code"].items()},
                             {section: size for section, (_, size) in regions.items()})
            rdata = next(data for number, data in obj["code"].items()
                         if obj["sections"][number] == ".rdata")
            self.assertEqual(rdata, b"May 29 1998\x0014:30:45\x00\x00\x00\x00source/VERSION.cpp\x00")
            self.assertEqual(set(obj["xrefs"]), set(spec["externals"]))

            prefix, combined, mode = R.gp_carrier_plan(
                regions, image, 0x8011A780, 0x8011C604)
            self.assertEqual((mode, len(prefix)), ("prefix", 5780))
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
                "startup_1", raw, combined, bindings, output_dir=folder,
                prefix_objects=[prefix_object])
            for section, actual in blocks.items():
                va, size = combined[section]
                self.assertEqual(actual, image[va - 0x80010000:va - 0x80010000 + size],
                                 section)

            dump = subprocess.run([S.DUMPSYM, folder / "startup_1.sym"],
                                  capture_output=True, text=True)
            self.assertEqual(dump.returncode, 0, dump.stderr)
            retail = S.RETAIL.read_text(encoding="latin-1")
            self.assertEqual(R.verify_sym(dump.stdout, "startup_1",
                                          spec["data_symbols"], retail), 2)
            for name in spec["data_symbols"]:
                R.verify_data_map(map_text, symbols, retail, name)


if __name__ == "__main__":
    unittest.main()
