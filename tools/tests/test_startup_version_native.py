"""The complete VERSION owner generates both tables and all five functions."""
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import psyq_extract as P
import symlane as S

@unittest.skipUnless(all(p.is_file() for p in (B.CPP, B.CC1PL, S.ASPSX,
    S.PSYLINK, S.DUMPSYM, B.ROOT / "rom/DIABPSX.BIN")), "toolchain unavailable")
class StartupVersionNativeTests(unittest.TestCase):
    def test_complete_version_owner(self):
        with tempfile.TemporaryDirectory(dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(R, "OUT", folder), patch.object(S, "OUT", folder):
                rows = R.build(["version"])
                names = set(P.parse_obj_complete((folder / "version.obj").read_bytes())["sections"].values())
        # the object carries retail's section names: its MAP sections and the shared once-only section
        self.assertLessEqual({".VERSION_text", ".VERSION_rdata", ".VERSION_data", ".STARTUP_text"}, names)
        self.assertEqual(rows[0]["functions"], 5)
        self.assertEqual(rows[0]["sections"][".rdata"]["size"], 1536)
        # StrDate (12), StrTime (9, padded), Words (472), MonDays (96): one .STARTUP_text section with the code
        self.assertEqual(rows[0]["sections"][".rdata.version_startup"]["size"], 592)
        self.assertEqual(rows[0]["sections"][".text.version_startup"]["size"], 640)
        self.assertNotIn("Words", rows[0]["bindings"])
        self.assertNotIn("MonDays", rows[0]["bindings"])
        self.assertNotIn("StrDate", rows[0]["bindings"])
        self.assertNotIn("StrTime", rows[0]["bindings"])
