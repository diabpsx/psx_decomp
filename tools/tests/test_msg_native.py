"""MSG retail-order text, compression metadata, split GP/BSS, and SYM proof."""
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
class MsgNativeTests(unittest.TestCase):
    def test_complete_object_and_split_storage(self):
        with tempfile.TemporaryDirectory(prefix="msg-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["msg"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("msg", 111))
        self.assertEqual(receipt["assembler_version"], "2.67")
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4)
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".data", ".bss", ".ctors", ".dtors")},
                         {".text": 16648, ".rdata": 552, ".data": 4768, ".bss": 32,
                          ".ctors": 4, ".dtors": 4})
        self.assertEqual(sum(row["size"] for name, row in receipt["sections"].items()
                             if name.startswith(".sdata.msg_")), 14)
        self.assertEqual(receipt["sections"][".sbss"]["size"], 10)
        self.assertEqual(len(receipt["post_assemble_section_split"]), 1)
        self.assertEqual(receipt["post_assemble_section_split"][0]["section"], ".sdata")


if __name__ == "__main__":
    unittest.main()
