"""GMAN retail-order text, split literal pools, owned storage, and SYM proof."""
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
class GmanNativeTests(unittest.TestCase):
    def test_complete_object_and_retail_order_storage(self):
        with tempfile.TemporaryDirectory(prefix="gman-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["gman"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("gman", 76))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 1388)   # .sdata starts at 0x8011ACEC (its literal pool)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 13732, ".data": 3780, ".sbss": 8, ".bss": 40,   # .bss: the static MyFT4
                          ".ctors": 4, ".dtors": 4,
                          ".rdata": 50,    # "psxsrc/gman.h" (DumpDatFile, parsed at the include), "psxsrc/GMAN.CPP", "psxsrc/primpool.h" (parsed last)
                          ".sdata": 64})   # pool, "DECB", "GMAN", "Wanker!", wank, ".hdr", TpW .. TpYDest
        self.assertIsNone(receipt["post_assemble_section_split"])
        self.assertEqual(B.per_tu_flags(B.ROOT / "recon/psxsrc/gman.cpp"), {})

if __name__ == "__main__":
    unittest.main()
