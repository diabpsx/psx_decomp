"""STREAM complete audio buffers, persistent state, bytes, and SYM proof."""
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
class StreamNativeTests(unittest.TestCase):
    def test_complete_object_and_state_order(self):
        source = B.ROOT / "recon/psxsrc/stream.cpp"
        self.assertEqual(B.per_tu_flags(source), {})   # Time/CDWAIT follow STR_SoundCommand in the source
        with tempfile.TemporaryDirectory(prefix="stream-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["stream"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("stream", 21))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 1588)   # .sdata starts at 0x8011ADB4 (its literal pool)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 6160, ".rdata": 216, ".data": 74188,
                          ".sdata": 60, ".sbss": 4})


if __name__ == "__main__":
    unittest.main()
