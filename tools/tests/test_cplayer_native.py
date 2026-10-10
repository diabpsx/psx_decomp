"""CPLAYER header-inline order, retail-order pool and literals, bytes, and SYM proof."""
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
class CPlayerNativeTests(unittest.TestCase):
    def test_complete_object_and_header_copies(self):
        source = B.ROOT / "recon/psxsrc/cplayer.cpp"
        self.assertEqual(B.per_tu_flags(source), {})   # PActiveArray initialised, PRIM_GetPrim body parsed before Print
        with tempfile.TemporaryDirectory(prefix="cplayer-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["cplayer"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("cplayer", 22))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 1476)   # .sdata starts at 0x8011AD44 (its literal pool)
        self.assertEqual(receipt["borrowed_section_prefixes"], {})
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 4068, ".rdata": 176,   # "psxsrc/cplayer.h" .. FindActionEnum's table
                          ".sdata": 27, ".sbss": 16})     # pool, PActiveArray, "PLRDAT"


if __name__ == "__main__":
    unittest.main()
