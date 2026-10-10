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
        moves = B.per_tu_flags(source)["move_symbols_before"]
        self.assertEqual(len(moves), 9)
        self.assertEqual(moves[0]["symbol"], "MemCardActive")
        self.assertEqual(moves[-1]["symbol"], "DoLoadedGame")
        with tempfile.TemporaryDirectory(prefix="cardcore-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["cardcore"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("cardcore", 27))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 2528)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 6348, ".rdata": 32,
                          ".data": 128, ".sdata": 184})
        self.assertEqual(receipt["bindings"]["CharDataStruct"], "0x801576F0")   # the character block, cleared whole


if __name__ == "__main__":
    unittest.main()
