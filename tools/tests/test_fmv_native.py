"""FMV composed overlay, resident stream/MDEC state, BSS, and SYM proof."""
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
                          B.ROOT / "rom/DIABPSX.BIN", B.ROOT / "rom/FMV.BIN")),
                     "original toolchain/retail inputs unavailable")
class FmvNativeTests(unittest.TestCase):
    def test_complete_composed_overlay_and_resident_storage(self):
        with tempfile.TemporaryDirectory(prefix="fmv-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["fmv"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("fmv", 44))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 3324)   # .sdata starts at 0x8011B47C (vlc_tab)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".text": 10828, ".rdata.fmv_all": 108096,
                          ".sdata": 420,    # one retail-order block, vlc_tab .. last_handler_event
                          ".sbss": 24,      # idx, i, sec, Passedfilename, Passedw, Passedh (<= 8 bytes each)
                          ".bss": 51360})   # subcode, voice_attr, FMVName, CreateEnv, TempStack: .lcomm rounded to 8 (ASPSX 2.67)
        self.assertIsNone(receipt["post_assemble_section_split"])


if __name__ == "__main__":
    unittest.main()
