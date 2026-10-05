"""DIALOG whole-object storage packing, bytes, and retail SYM proof."""
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
class DialogNativeTests(unittest.TestCase):
    def test_complete_object_and_packed_storage(self):
        source = B.ROOT / "recon/psxsrc/dialog.cpp"
        packed = B.per_tu_flags(source)["pack_lcomm"]
        self.assertEqual(packed["symbols"],
                         [["DialogGBack", 0, 1], ["GShadeX", 1, 1],
                          ["GShadeY", 2, 1], ["RandBTab", 8, 8]])
        with tempfile.TemporaryDirectory(prefix="dialog-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["dialog"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("dialog", 11))
        self.assertEqual(receipt["scaffold_gp_prefix"]["mode"], "embedded_prefix")
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 1141)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 9444, ".rdata": 50, ".data": 176,
                          ".sdata": 131, ".sbss": 16})


if __name__ == "__main__":
    unittest.main()
