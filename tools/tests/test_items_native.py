"""ITEMS retail-order text, complete data, split pools/BSS, and SYM proof."""
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
class ItemsNativeTests(unittest.TestCase):
    def test_complete_object_and_split_storage(self):
        with tempfile.TemporaryDirectory(prefix="items-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["items"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("items", 106))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4360)   # .sdata starts at 0x8011B888
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".data")},
                         {".text": 55836, ".data": 14708})
        self.assertEqual(receipt["sections"][".rdata"]["size"], 1448)   # one retail-order .rdata row
        # retail-order small data: one .sdata row 0x8011B888..0x8011B8DC (numitems .. uitemflag)
        self.assertEqual(receipt["sections"][".sdata"]["size"], 85)
        self.assertFalse(any(name.startswith(".sdata.items_") for name in receipt["sections"]))
        self.assertEqual(sum(row["size"] for name, row in receipt["sections"].items()
                             if name.startswith(".bss.items_")), 244)


if __name__ == "__main__":
    unittest.main()
