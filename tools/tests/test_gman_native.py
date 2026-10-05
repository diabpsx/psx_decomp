"""GMAN retail-order text, split literal pools, owned storage, and SYM proof."""
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
class GmanNativeTests(unittest.TestCase):
    def test_complete_object_and_split_storage(self):
        with tempfile.TemporaryDirectory(prefix="gman-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["gman"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("gman", 76))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4)
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".data", ".sbss", ".ctors", ".dtors")},
                         {".text": 13732, ".data": 3780, ".sbss": 8,
                          ".ctors": 4, ".dtors": 4})
        self.assertEqual(sum(row["size"] for name, row in receipt["sections"].items()
                             if name.startswith(".rdata.gman_")), 50)
        self.assertEqual(sum(row["size"] for name, row in receipt["sections"].items()
                             if name.startswith(".sdata.gman_")), 60)


if __name__ == "__main__":
    unittest.main()
