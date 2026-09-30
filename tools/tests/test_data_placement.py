"""Source data must occupy an explicitly declared whole retail fragment."""
from pathlib import Path
from types import SimpleNamespace
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import gen_ld
import link


class DataPlacementTests(unittest.TestCase):
    subs = [(0, "c", "owner"), (16, "rodata", "data"), (32, "data", "next")]

    def validate(self, binding):
        with patch.object(gen_ld, "RECON_MAP", {"owner": "recon/source/example.cpp"}):
            gen_ld.validate_data_bindings(self.subs, 48, {"data": binding})

    def test_whole_fragment(self):
        self.validate({"owner": "owner", "section": ".rodata", "size": 16})

    def test_partial_fragment(self):
        with self.assertRaisesRegex(ValueError, "whole retail fragment"):
            self.validate({"owner": "owner", "section": ".rodata", "size": 12})

    def test_wrong_section(self):
        with self.assertRaisesRegex(ValueError, "retail data kind"):
            self.validate({"owner": "owner", "section": ".data", "size": 16})

    def test_unselected_owner(self):
        with self.assertRaisesRegex(ValueError, "reconstructed text"):
            self.validate({"owner": "unselected", "section": ".rodata", "size": 16})

    def test_unknown_segment(self):
        with self.assertRaisesRegex(ValueError, "invalid source data segment"):
            gen_ld.validate_data_bindings(self.subs, 48, {"unknown": {}})

    def test_source_section_cannot_be_placed_twice(self):
        subs = [(0, "c", "owner"), (16, "rodata", "first"), (32, "rodata", "second")]
        binding = {"owner": "owner", "section": ".rodata", "size": 16}
        with patch.object(gen_ld, "RECON_MAP", {"owner": "recon/source/example.cpp"}):
            with self.assertRaisesRegex(ValueError, "cannot be placed twice"):
                gen_ld.validate_data_bindings(subs, 48, {"first": binding, "second": binding})

    def test_placed_sections_and_debug_metadata(self):
        elf = SimpleNamespace(names=[".text", ".rodata", ".MIPS.abiflags"],
            sections=[(0, 1, 2, 0, 0, 16)] * 3, symbols={})
        link.validate_runtime_sections(elf, {".text", ".rodata"})

    def test_orphan_runtime_data(self):
        elf = SimpleNamespace(names=[".rodata"],
            sections=[(0, 1, 2, 0, 0, 16)], symbols={})
        with self.assertRaisesRegex(ValueError, "no explicit placement"):
            link.validate_runtime_sections(elf, {".text"})

    def test_common_storage(self):
        elf = SimpleNamespace(names=[], sections=[],
            symbols={0: [("Common", 4, 4, 17, 0, 0xFFF2)]})
        with self.assertRaisesRegex(ValueError, "common symbols"):
            link.validate_runtime_sections(elf, {".text"})


if __name__ == "__main__":
    unittest.main()
