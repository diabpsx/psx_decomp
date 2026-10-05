"""CPLAYER header-inline order, borrowed pool prefix, bytes, and SYM proof."""
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
        flags = B.per_tu_flags(source)
        self.assertEqual(flags["move_symbol_before"]["symbol"],
                         "_7CPlayer.PActiveArray")
        with tempfile.TemporaryDirectory(prefix="cplayer-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["cplayer"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("cplayer", 22))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 1488)
        self.assertEqual(receipt["borrowed_section_prefixes"][".rdata"]["size"], 4)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 4068, ".rdata": 156,
                          ".sdata": 15, ".sbss": 16})


if __name__ == "__main__":
    unittest.main()
