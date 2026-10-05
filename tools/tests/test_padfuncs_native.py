"""PADFUNCS complete inline tail, owned data, bytes, and retail SYM proof."""
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
class PadfuncsNativeTests(unittest.TestCase):
    def test_complete_object_and_inline_tail(self):
        with tempfile.TemporaryDirectory(prefix="padfuncs-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["padfuncs"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("padfuncs", 49))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 2448)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 14760, ".sdata": 22, ".sbss": 12, ".bss": 16,
                          ".ctors": 4, ".dtors": 4})


if __name__ == "__main__":
    unittest.main()
