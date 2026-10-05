"""FE overlay text, resident menu/data banks, split GP state, and SYM proof."""
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
                          B.ROOT / "rom/DIABPSX.BIN", B.ROOT / "rom/FRONTEND.BIN")),
                     "original toolchain/retail inputs unavailable")
class FeNativeTests(unittest.TestCase):
    def test_complete_overlay_and_resident_storage(self):
        with tempfile.TemporaryDirectory(prefix="fe-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["fe"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("fe", 45))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4)
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".data", ".sbss")},
                         {".text": 12076, ".rdata": 92, ".data": 3214, ".sbss": 4})
        self.assertEqual(sum(row["size"] for name, row in receipt["sections"].items()
                             if name.startswith(".sdata.fe_")), 135)


if __name__ == "__main__":
    unittest.main()
