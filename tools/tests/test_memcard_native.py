"""MEMCARD composed overlay storage, embedded table, bytes, and SYM proof."""
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
class MemcardNativeTests(unittest.TestCase):
    def test_complete_composed_object(self):
        source = (B.ROOT / "recon/psxsrc/memcard.cpp").read_text()
        self.assertIn("struct sjis sjis_table[37] =", source)
        self.assertIn("struct DIRENTRY card_dir[2][16];", source)
        self.assertIn("struct file_header card_header[2][16];", source)
        flags = B.per_tu_flags(B.ROOT / "recon/psxsrc/memcard.cpp")
        self.assertEqual(flags["route_symbol_sections"]["card_dir"],
                         ".data.memcard_zeros")
        with tempfile.TemporaryDirectory(prefix="memcard-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["memcard"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("memcard", 16))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 3144)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 3824, ".rdata": 17824, ".sdata": 60})   # .. last_card_status


if __name__ == "__main__":
    unittest.main()
