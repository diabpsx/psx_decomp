"""BIGLUMP complete code, persistent state, bytes, and retail SYM proof."""
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
class BigLumpNativeTests(unittest.TestCase):
    def test_complete_object_and_small_data_order(self):
        source = B.ROOT / "recon/psxsrc/biglump.cpp"
        self.assertEqual(B.per_tu_flags(source), {})   # explicit initialisers give the retail order
        with tempfile.TemporaryDirectory(prefix="biglump-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["biglump"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("biglump", 17))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 980)   # .sdata starts at 0x8011AB54 (its literal pool)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 3960, ".rdata": 280,
                          ".data": 432, ".sdata": 53})


if __name__ == "__main__":
    unittest.main()
