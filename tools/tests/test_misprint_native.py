"""MISPRINT complete inline tail, retail-order literal pool, bytes, and retail SYM proof."""
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
    def test_complete_object_and_retail_literal_order(self):
        self.assertEqual(B.per_tu_flags(B.ROOT / "recon/source/misprint.cpp"), {})   # PRIM_GetPrim body parsed after FuncFLASH
        with tempfile.TemporaryDirectory(prefix="misprint-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["misprint"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("misprint", 37))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 5276)   # .sdata starts at 0x8011BC1C (its literal pool)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 7476, ".rdata": 206,   # gman.h, cplayer.h, .., xoffset, primpool.h in one section
                          ".data": 224, ".sdata": 16})


if __name__ == "__main__":
    unittest.main()
