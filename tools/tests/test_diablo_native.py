"""DIABLO complete pools, GP banks, tables, zero-fill, and SYM proof."""
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
class DiabloNativeTests(unittest.TestCase):
    def test_complete_object_and_split_storage(self):
        flags = B.per_tu_flags(B.ROOT / "recon/source/diablo.cpp")
        self.assertEqual(flags["pack_lcomm"]["size"], 308)
        self.assertEqual(flags["route_symbol_sections"]["D_8012EC28"],
                         ".bss.diablo_jmp")
        with tempfile.TemporaryDirectory(prefix="diablo-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["diablo"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("diablo", 33))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 4)
        self.assertEqual({name: receipt["sections"][name]["size"] for name in
                          (".text", ".rdata", ".data", ".bss.diablo_seeds",
                           ".bss.diablo_jmp")},
                         {".text": 8156, ".rdata": 116, ".data": 2912,
                          ".bss.diablo_seeds": 308, ".bss.diablo_jmp": 48})


if __name__ == "__main__":
    unittest.main()
