"""MISPRINT complete inline tail, split pool, bytes, and retail SYM proof."""
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
class MisprintNativeTests(unittest.TestCase):
    def test_complete_object_and_split_pool(self):
        flags = B.per_tu_flags(B.ROOT / "recon/source/misprint.cpp")
        self.assertEqual(flags["section_occurrence_renames"][0]["as"],
                         ".rdata.misprint_prim")
        with tempfile.TemporaryDirectory(prefix="misprint-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["misprint"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("misprint", 37))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 5288)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 7476, ".rdata": 172,
                          ".rdata.misprint_prim": 20, ".data": 224, ".sdata": 4})


if __name__ == "__main__":
    unittest.main()
