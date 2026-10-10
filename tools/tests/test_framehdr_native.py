"""FRAMEHDR: an empty retail TU (GMAN.H include only) owns its literal and pool; PSXMSG owns its pool;
TONY patches its DEMOPAD0.DAT literal in place through a local pointer."""
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
class FrameHdrNativeTests(unittest.TestCase):
    def gate(self, segment):
        with tempfile.TemporaryDirectory(prefix=f"{segment}-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                receipts = R.build([segment])
        self.assertEqual(len(receipts), 1)
        return receipts[0]

    def test_empty_framehdr_owns_its_gman_literal_and_pool(self):
        source = (B.ROOT / "recon/psxsrc/framehdr.cpp").read_text()
        self.assertEqual([line for line in source.splitlines() if line.startswith("#include")],
                         ['#include "psxsrc/gman.h"'])
        receipt = self.gate("framehdr")
        self.assertEqual(receipt["functions"], 0)
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {".rdata": 14, ".sdata": 9})   # "psxsrc/gman.h" at 0x801106D4, the pool at 0x8011AD64

    def test_psxmsg_pool_and_tony_literal_patch(self):
        self.assertIn('char *Name = "DEMOPAD0.DAT";', (B.ROOT / "recon/psxsrc/tony.cpp").read_text())
        self.assertNotIn("D_80110B24", (B.ROOT / "recon/psxsrc/tony.cpp").read_text())
        receipt = self.gate("psxmsg")
        self.assertEqual(receipt["sections"][".sdata"]["size"], 16)   # pool at 0x8011AD70, then the resident word
        receipt = self.gate("tony")
        self.assertEqual(receipt["sections"][".rdata"]["size"], 109)


if __name__ == "__main__":
    unittest.main()
