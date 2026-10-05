"""OPTIONS retail-order text, split GP banks, data, and SYM proof."""
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
class OptionsNativeTests(unittest.TestCase):
    def test_complete_object_and_post_aspsx_gp_banks(self):
        flags = B.per_tu_flags(B.ROOT / "recon/psxsrc/options.cpp")
        self.assertEqual(flags["pack_lcomm"]["size"], 40)
        with tempfile.TemporaryDirectory(prefix="options-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["options"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("options", 38))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4)
        self.assertEqual(receipt["sections"][".text"]["size"], 19936)
        self.assertEqual(receipt["sections"][".rdata"]["size"], 208)
        self.assertEqual(receipt["sections"][".sbss"]["size"], 40)
        banks = [name for name in receipt["sections"] if name.startswith(".sdata.options_")]
        self.assertEqual(len(banks), 24)
        self.assertTrue(all(receipt["sections"][name]["size"] == 4 for name in banks))
        self.assertEqual(len(receipt["post_assemble_section_split"]["pieces"]), 24)


if __name__ == "__main__":
    unittest.main()
