"""CONTROL complete text, initialized tables, retail-order small data, BSS, and SYM proof."""
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
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 3744)   # .sdata starts at 0x8011B620
        self.assertEqual(receipt["assembler_version"], "2.67")
        self.assertIsNone(receipt["post_assemble_section_split"])
        # retail-order storage: the literal pool + globals in one .sdata row, the statics in one
        # .sbss row (0x8011C764..0x8011C7AA) and one .bss row (0x8012E538..0x8012EAE7)
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".data", ".sdata", ".sbss", ".bss")},
                         {".text": 30136, ".rdata": 240, ".data": 2048,
                          ".sdata": 256, ".sbss": 71, ".bss": 1456})


if __name__ == "__main__":
    unittest.main()
