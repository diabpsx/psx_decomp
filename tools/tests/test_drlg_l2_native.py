"""DRLG_L2 composed overlay prefix, embedded switch table, bytes, and SYM proof."""
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
                          B.ROOT / "rom/DIABPSX.BIN", B.ROOT / "rom/PREGAME.BIN")),
                     "original toolchain/retail inputs unavailable")
class DrlgL2NativeTests(unittest.TestCase):
    def test_complete_composed_group(self):
        source = B.ROOT / "recon/source/drlg_l2.cpp"
        flags = B.per_tu_flags(source)
        self.assertIn("-fwritable-strings", flags["extra"])
        self.assertEqual(flags["pad_before_labels"], {"$L429": 4})
        with tempfile.TemporaryDirectory(prefix="drlg-l2-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["drlg_l2"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("drlg_l2", 36))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 5884)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 21148, ".sdata": 100})
        self.assertEqual(sum(row["size"] for row in receipt["raw_exports"]), 9492)


if __name__ == "__main__":
    unittest.main()
