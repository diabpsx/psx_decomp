"""CREDITS composed overlay group, initialized tables, and retail SYM proof."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import psyq_extract as P
import sdk_link as N
import symlane as S


@unittest.skipUnless(all(path.is_file() for path in
                         (B.CPP, B.CC1PL, S.ASPSX, S.PSYLINK, S.DUMPSYM,
                          B.ROOT / "rom/DIABPSX.BIN", B.ROOT / "rom/FRONTEND.BIN")),
                     "original toolchain/retail inputs unavailable")
class CreditsNativeTests(unittest.TestCase):
    def test_merged_stream_and_sym(self):
        spec = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())["credits"]
        source = B.ROOT / spec["source"]
        # retail assembled CREDITS' read-only and initialised data into its text stream (one section,
        # emission order: the gman.h/cplayer.h literals, CreditsText/CreditsTable, the primpool.h literal, code)
        self.assertEqual(B.per_tu_flags(source), {"merge_sections_into_text": [".rdata", ".data"]})
        self.assertEqual(spec["composed_group"]["sections"], [".text"])
        with tempfile.TemporaryDirectory(prefix="credits-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build(["credits"])
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual((receipt["segment"], receipt["functions"]), ("credits", 11))
        self.assertEqual(receipt["scaffold_gp_prefix"]["size"], 3120)   # .sdata starts at 0x8011B3B0 (its literal pool)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".rdata": 1636, ".text": 4004, ".sdata": 24})


if __name__ == "__main__":
    unittest.main()
