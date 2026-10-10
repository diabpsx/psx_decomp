"""Historical Climax GLIB compiler lane and split zero-storage proofs."""
import json
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


ASPSX234 = Path("C:/Temp/nfs2-clean/psyq350/PSYQ/ASPSX.EXE")


@unittest.skipUnless(all(path.is_file() for path in (B.CPP, S.GLIB_CC1, S.DOSBOX, ASPSX234)),
                     "historical GLIB toolchain unavailable")
class GlibNativeTests(unittest.TestCase):
    def test_historical_assembler_selection(self):
        version, path, dos, flags = R.source_assembler_options({"assembler": "2.34"})
        self.assertEqual((version, path, dos, flags), ("2.34", ASPSX234, True, []))

    def test_historical_local_bss_banks(self):
        # the assembler's own small-data threshold (-G8) homes each `.lcomm` of 8 bytes or less in .sbss
        # and the large statics (SchEnv, MemHdrBlocks) in .bss; the code stays -G0
        expected = {
            "tasker": ({".text": 3312, ".rdata": 45, ".sbss": 64, ".bss": 48},
                       {".sbss": 64, ".bss": 48}),
            "gal": ({".data": 80, ".rdata": 470, ".text": 8088, ".sbss": 44, ".bss": 5600},
                    {".data": 28, ".sbss": 44, ".bss": 5600}),
        }
        with tempfile.TemporaryDirectory(prefix="glib-native-", dir=B.BUILD) as directory:
            with patch.object(S, "OUT", Path(directory)):
                for name, (code, bss) in expected.items():
                    obj = S.compile_g(B.ROOT / "recon/glibdev" / (name + ".c"),
                                      assembler=ASPSX234, assembler_dos=True,
                                      assembler_flags=[])
                    parsed = P.parse_obj_complete(obj.read_bytes())
                    self.assertEqual({parsed["sections"][section]: len(data)
                                      for section, data in parsed["code"].items()}, code)
                    self.assertEqual({parsed["sections"][section]: size
                                      for section, size in parsed["bss"].items()}, bss)

    def test_runtime_common_and_custom_bss_placements(self):
        registry = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())
        rows = R.bss_placements({name: registry[name] for name in
                                 ("tasker", "gal", "vrip", "gdebug", "gutils", "gsys")},
                                0x8011C604, 0x80139BF4)
        self.assertIn((0x801325A0, 48, "tasker", ".bss"), rows)
        self.assertIn((0x801325D0, 5600, "gal", ".bss"), rows)
        self.assertIn((0x8011CA88, 4, "gdebug.common_PollFunc", ".bss"), rows)
        self.assertIn((0x801351E8, 24, "gutils.common_RndTabs", ".bss"), rows)


if __name__ == "__main__":
    unittest.main()
