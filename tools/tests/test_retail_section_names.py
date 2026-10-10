"""Compiled objects carry retail's per-object section names; library and hand-assembled objects stay plain."""
from pathlib import Path
import sys
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import sdk_link as N
import symlane as S
import psyq_extract as P


class RetailSectionNameTests(unittest.TestCase):
    def test_resident_module_three_names(self):
        self.assertEqual(S.retail_section_names(B.ROOT / "recon/source/version.cpp"),
                         {".text": ".VERSION_text", ".rdata": ".VERSION_rdata", ".data": ".VERSION_data"})

    def test_merged_overlay_module_one_stream(self):
        self.assertEqual(S.retail_section_names(B.ROOT / "recon/psxsrc/credits.cpp", merged=True),
                         {".text": ".CREDITS_text", ".rdata": ".CREDITS_text", ".data": ".CREDITS_text"})
        self.assertEqual(S.retail_object_name(B.ROOT / "recon/psxsrc/dlg_2.cpp"), "DLG")   # one retail object, two TUs here

    def test_library_and_assembly_objects_keep_plain_names(self):
        self.assertEqual(S.retail_section_names(B.ROOT / "recon/eaclib/timer.c"), {})
        self.assertEqual(S.retail_section_names(B.ROOT / "recon/psxsrc/crunch.s"), {})

    def test_object_kind_and_code_section(self):
        for name, kind in ((".text", "text"), (".VERSION_text", "text"), (".DRLG_L1_rdata", "rdata"),
                           (".STARTUP_text", "text"), (".text.lib", "text"), (".rdata.version_startup", "rdata"),
                           (".sdata", "sdata"), (".ctors", None), ("code", None)):
            self.assertEqual(N.object_kind(name), kind, name)
        self.assertTrue(P.is_code_section(".VERSION_text") and P.is_code_section(".STARTUP_text"))
        self.assertFalse(P.is_code_section(".VERSION_rdata"))


if __name__ == "__main__":
    unittest.main()
