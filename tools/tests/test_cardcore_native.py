"""CARDCORE complete event state, buffers, bytes, and retail SYM proof."""
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
class CardCoreNativeTests(unittest.TestCase):
    def test_complete_object_and_event_state_order(self):
        source = B.ROOT / "recon/psxsrc/cardcore.cpp"
        self.assertEqual(B.per_tu_flags(source), {})   # explicit initialisers give the retail .sdata order
        with tempfile.TemporaryDirectory(prefix="cardcore-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["cardcore"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("cardcore", 27))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 2516)   # .sdata starts at 0x8011B154 (its literal pool)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 6348, ".rdata": 48,   # "psxsrc/gman.h" + the jump table
                          ".data": 128, ".sdata": 196})
        self.assertEqual(receipt["bindings"]["CharDataStruct"], "0x801576F0")   # the character block, cleared whole


if __name__ == "__main__":
    unittest.main()
