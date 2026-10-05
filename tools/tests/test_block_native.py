"""BLOCK retail-order text, split GP banks, zero-fill, data, and SYM proof."""
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
class BlockNativeTests(unittest.TestCase):
    def test_complete_object_and_split_storage(self):
        flags = B.per_tu_flags(B.ROOT / "recon/psxsrc/block.cpp")
        self.assertEqual(flags["pack_lcomm"]["symbols"],
                         [["dx", 0, 12], ["dy", 16, 12]])
        with tempfile.TemporaryDirectory(prefix="block-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["block"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("block", 68))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4)
        self.assertEqual(receipt["borrowed_section_prefixes"][".sdata.block_select"]["size"], 1)
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".data", ".sbss", ".bss", ".bss.block_xy")},
                         {".text": 19000, ".rdata": 76, ".data": 20,
                          ".sbss": 4, ".bss": 16, ".bss.block_xy": 28})


if __name__ == "__main__":
    unittest.main()
