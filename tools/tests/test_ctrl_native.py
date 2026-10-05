"""CTRL complete inline tail, data tables, bytes, and retail SYM proof."""
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
class CtrlNativeTests(unittest.TestCase):
    def test_complete_object_and_inline_tail(self):
        source = B.ROOT / "recon/psxsrc/ctrl.cpp"
        self.assertNotIn("pack_lcomm", B.per_tu_flags(source))
        with tempfile.TemporaryDirectory(prefix="ctrl-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["ctrl"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("ctrl", 28))
        self.assertEqual(receipt["assembler_version"], "2.67")
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 2204)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 5992, ".data": 808, ".sdata": 111,
                          ".sbss": 16, ".bss": 16, ".ctors": 4, ".dtors": 4})


if __name__ == "__main__":
    unittest.main()
