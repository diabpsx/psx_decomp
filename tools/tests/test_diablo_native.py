"""DIABLO complete pools, GP banks, tables, zero-fill, and SYM proof."""
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import symlane as S


@unittest.skipUnless(all(path.is_file() for path in
                         (B.CPP, B.CC1PL, S.ASPSX, S.PSYLINK, S.DUMPSYM,
                          B.ROOT / "rom/DIABPSX.BIN")),
                     "original toolchain/retail inputs unavailable")
class DiabloNativeTests(unittest.TestCase):
    def test_complete_object_and_split_storage(self):
        flags = B.per_tu_flags(B.ROOT / "recon/source/diablo.cpp")
        self.assertNotIn("pack_lcomm", flags)
        self.assertNotIn("route_symbol_sections", flags)
        with tempfile.TemporaryDirectory(prefix="diablo-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["diablo"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("diablo", 33))
        self.assertEqual(receipt["assembler_version"], "2.67")
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4104)   # .sdata starts at 0x8011B788
        self.assertIsNone(receipt["post_assemble_section_split"])
        # retail-order small data: one .sdata row (0x8011B788..0x8011B804) and one .sbss row of statics
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".data", ".sdata", ".sbss", ".bss")},
                         {".text": 8156, ".rdata": 116, ".data": 2912, ".sdata": 125,
                          ".sbss": 16, ".bss": 368})


if __name__ == "__main__":
    unittest.main()
