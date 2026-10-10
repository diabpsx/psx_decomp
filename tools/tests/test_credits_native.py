"""CREDITS composed overlay group, initialized tables, and retail SYM proof."""
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
                          B.ROOT / "rom/DIABPSX.BIN", B.ROOT / "rom/FRONTEND.BIN")),
                     "original toolchain/retail inputs unavailable")
class CreditsNativeTests(unittest.TestCase):
    def test_composed_text_group_and_sym(self):
        spec = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())["credits"]
        source = B.ROOT / spec["source"]
        self.assertEqual(B.per_tu_flags(source)["split_section_after"]["as"],
                         ".rdata.credits_tail")
        main = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        frontend = (B.ROOT / "rom/FRONTEND.BIN").read_bytes()
        retail = S.RETAIL.read_text(encoding="latin-1")
        symbols = "\n".join(path.read_text() for path in
                            (B.ROOT / "configs").glob("symbol_addrs*.txt"))

        with tempfile.TemporaryDirectory(prefix="credits-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                raw = S.compile_g(source).read_bytes()
            obj = P.parse_obj_complete(raw)
            sizes = {obj["sections"][section]: len(data)
                     for section, data in obj["code"].items()}
            self.assertEqual(sizes, {".rdata": 33, ".data": 1580,
                                     ".rdata.credits_tail": 18, ".sdata": 12,
                                     ".text": 4004})
            self.assertEqual([obj["sections"][row["sect"]] for row in obj["chunks"][:5]],
                             [".rdata", ".rdata", ".data",
                              ".rdata.credits_tail", ".text"])

            owned = {".sdata": (0x8011B3BC, 12)}
            prefix, combined, mode = R.gp_carrier_plan(
                owned, main, 0x8011A780, 0x8011C604)
            self.assertEqual((mode, len(prefix)), ("prefix", 3132))
            prefix_source = folder / "prefix.s"
            prefix_object = folder / "prefix.obj"
            prefix_source.write_bytes((".sdata\r\n" + "".join(
                ".byte " + ",".join(map(str, prefix[offset:offset + 16])) + "\r\n"
                for offset in range(0, len(prefix), 16))).encode())
            run = B.run([S.ASPSX, "-q", "-o", prefix_object, prefix_source])
            self.assertEqual(run.returncode, 0, run.stdout + run.stderr)

            # the class static CPlayer::PActiveArray is `_7CPlayer.PActiveArray` to the SN tools; its
            # retail address is listed under the C-identifier spelling
            aliases = {"_7CPlayer.PActiveArray": "_7CPlayer_PActiveArray"}
            resolved = R.resolve_bindings(sorted({aliases.get(n, n) for n in obj["xrefs"]}), symbols)
            bindings = {n: resolved[aliases.get(n, n)] for n in obj["xrefs"]}
            bindings["_gp"] = 0x8011A780
            blocks, map_text = N.native_link(
                "credits", raw, combined, bindings, output_dir=folder,
                prefix_objects=[prefix_object], composed_groups={"credits_text": {
                    "sections": [".rdata", ".data", ".rdata.credits_tail", ".text"],
                    "va": 0x8013CB50, "size": 0x1608}})
            self.assertEqual(blocks["credits_text"], frontend[0x2F58:0x4560])
            self.assertEqual(blocks[".sdata"],
                             main[0x8011A780 - 0x80010000:0x8011B3C8 - 0x80010000])

            dump = subprocess.run([S.DUMPSYM, folder / "credits.sym"],
                                  capture_output=True, text=True)
            self.assertEqual(dump.returncode, 0, dump.stderr)
            self.assertEqual(R.verify_sym(dump.stdout, "credits",
                                          spec["data_symbols"], retail), 11)
            for name in spec["data_symbols"]:
                R.verify_data_map(map_text, symbols, retail, name)


if __name__ == "__main__":
    unittest.main()
