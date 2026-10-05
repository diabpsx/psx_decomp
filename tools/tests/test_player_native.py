"""PLAYER retail-order text, complete player tables/state, and SYM proof."""
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
class PlayerNativeTests(unittest.TestCase):
    def test_complete_object_and_native_storage(self):
        with tempfile.TemporaryDirectory(prefix="player-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["player"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("player", 136))
        self.assertIsNone(receipt["post_assemble_section_split"])
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".data")},
                         {".text": 30628, ".rdata": 404, ".data": 13760})
        self.assertEqual(receipt["sections"][".sdata"]["size"], 6)


if __name__ == "__main__":
    unittest.main()
