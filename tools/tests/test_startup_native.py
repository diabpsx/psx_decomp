"""Native once-only code stays with its authentic module's static storage."""
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import symlane as S

@unittest.skipUnless(all(p.is_file() for p in (B.CPP, B.CC1PL, S.ASPSX,
    S.PSYLINK, S.DUMPSYM, B.ROOT / "rom/DIABPSX.BIN")), "toolchain unavailable")
class StartupNativeTests(unittest.TestCase):
    def test_mem_statics_and_once_only_functions_share_one_object(self):
        with tempfile.TemporaryDirectory(dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                rows = R.build(["mem", "startup"])
        records = {row["segment"]: row for row in rows}
        self.assertEqual(records["startup"]["functions"], 2)
        self.assertEqual(records["mem"]["functions"], 4)
        self.assertEqual(records["mem"]["sections"][".data"]["size"], 80)
        self.assertEqual(records["mem"]["sections"][".text.startup_mem"]["size"], 204)
        self.assertNotIn("PsxMem", records["startup"]["bindings"])
        self.assertNotIn("PsxFastMem", records["startup"]["bindings"])
