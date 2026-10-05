"""GPANEL whole-object code order, initialized state, bytes, and SYM proof."""
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
class GPanelNativeTests(unittest.TestCase):
    def test_complete_object_and_initialized_state(self):
        source = (B.ROOT / "recon/psxsrc/gpanel.cpp").read_text()
        for declaration in ("D_8011AD94 = -64", "D_8011AD98 = -23",
                            "D_8011AD9C = 19", "D_8011ADA0 = 48",
                            "D_8011ADA4 = 4", "D_8011ADA8 = 4",
                            "D_8011ADAC = 4", "D_8011ADB0 = 4"):
            self.assertIn(declaration, source)
        with tempfile.TemporaryDirectory(prefix="gpanel-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["gpanel"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("gpanel", 13))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 1556)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 5052, ".rdata": 96,
                          ".data": 370, ".sdata": 32})
        self.assertNotIn("D_80110868", receipt["bindings"])


if __name__ == "__main__":
    unittest.main()
