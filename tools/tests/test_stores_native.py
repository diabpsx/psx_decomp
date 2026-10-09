"""STORES retail-order text, owned tables, split data/GP/BSS, and SYM proof."""
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
class StoresNativeTests(unittest.TestCase):
    def test_complete_object_and_split_storage(self):
        with tempfile.TemporaryDirectory(prefix="stores-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["stores"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("stores", 103))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4888)   # .sdata starts at 0x8011BA98
        self.assertEqual(receipt["assembler_version"], "2.67")   # 2.56 pads 8-byte .lcomm statics to 8
        self.assertIsNone(receipt["post_assemble_section_split"])
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".bss", ".ctors", ".dtors")},
                         {".text": 44756, ".rdata": 728, ".bss": 3360,
                          ".ctors": 4, ".dtors": 4})
        self.assertEqual(receipt["sections"][".data"]["size"], 20212)
        self.assertFalse(any(name.startswith('.data.stores_')
                             for name in receipt['sections']))
        # retail-order small data: one .sdata row 0x8011BA98..0x8011BAEF and one .sbss row of statics
        self.assertEqual((receipt["sections"][".sdata"]["size"], receipt["sections"][".sbss"]["size"]), (88, 68))
        self.assertFalse(any(name.startswith((".sdata.stores_", ".sbss.stores_")) for name in receipt["sections"]))


if __name__ == "__main__":
    unittest.main()
