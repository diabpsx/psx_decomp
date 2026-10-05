"""CONTROL complete text, initialized tables, split GP banks, BSS, and SYM proof."""
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
class ControlNativeTests(unittest.TestCase):
    def test_complete_object_and_split_storage(self):
        with tempfile.TemporaryDirectory(prefix="control-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["control"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("control", 51))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4)
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".data", ".bss.control_panel",
                           ".bss.control_back", ".bss.control_talk")},
                         {".text": 30136, ".rdata": 240, ".data": 2048,
                          ".bss.control_panel": 1360, ".bss.control_back": 16,
                          ".bss.control_talk": 80})


if __name__ == "__main__":
    unittest.main()
