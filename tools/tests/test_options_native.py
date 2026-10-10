"""OPTIONS natural small-data and packed statics, text, and SYM proof."""
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
    def test_complete_object_and_native_storage(self):
        flags = B.per_tu_flags(B.ROOT / "recon/psxsrc/options.cpp")
        self.assertEqual(flags, {})
        with tempfile.TemporaryDirectory(prefix="options-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["options"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("options", 38))
        self.assertIsNone(receipt["post_assemble_section_split"])
        self.assertEqual(receipt["assembler_version"], "2.67")
        self.assertEqual(receipt["sections"][".text"]["size"], 19936)
        self.assertEqual(receipt["sections"][".rdata"]["size"], 208)
        self.assertEqual(receipt["sections"][".sbss"]["size"], 40)
        self.assertEqual(receipt["sections"][".sdata"]["size"], 124)   # literal pool + goldcheat ahead of Qfromoptions


if __name__ == "__main__":
    unittest.main()
