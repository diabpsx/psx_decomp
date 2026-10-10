"""DLG_2 separated raw pools, inline tail, bytes, and retail SYM proof."""
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
class Dlg2NativeTests(unittest.TestCase):
    def test_complete_object_and_raw_segments(self):
        # no section renames: DLG's .rdata is one compiled section spanning the overlay's fragments
        self.assertNotIn("section_occurrence_renames", B.per_tu_flags(B.ROOT / "recon/psxsrc/dlg_2.cpp"))
        with tempfile.TemporaryDirectory(prefix="dlg2-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["dlg_2"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("dlg_2", 35))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 3216)
        # one .rdata row (0x801435E8..0x801436EB): the gman.h literal, ClassStrTbl, the BISLPS file
        # names, the three McLoad*Menu tables and the sprintf formats
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 9160, ".rdata": 260, ".sdata": 96})


if __name__ == "__main__":
    unittest.main()
