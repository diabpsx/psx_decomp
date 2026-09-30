"""Provenance masks must never accept unknown or opcode-changing patches."""
from pathlib import Path
import struct
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import sdk_provenance as S


def word(value):
    return struct.pack("<I", value)


class SdkProvenanceTests(unittest.TestCase):
    def test_exact_words(self):
        self.assertTrue(S.compare_words(word(0x3C0600FF), word(0x3C0600FF), [])[0])

    def test_jump_target_is_screened_not_sealed(self):
        ok, reason = S.compare_words(word(0x0C000000), word(0x0C012345), [(0, 0x4A)])
        self.assertTrue(ok)
        self.assertIn("targets unverified", reason)

    def test_jump_opcode_change(self):
        self.assertFalse(S.compare_words(word(0x0C000000), word(0x08012345), [(0, 0x4A)])[0])

    def test_lui_immediate(self):
        self.assertTrue(S.compare_words(word(0x3C060000), word(0x3C068011), [(0, 0x54)])[0])

    def test_register_change_is_not_masked(self):
        self.assertFalse(S.compare_words(word(0x24C60000), word(0x24E78000), [(0, 0x52)])[0])

    def test_unknown_and_full_word_patches(self):
        for kind in (0x99, 0x10):
            self.assertFalse(S.compare_words(word(0), word(0), [(0, kind)])[0])

    def test_wrong_instruction_for_patch(self):
        self.assertFalse(S.compare_words(word(0), word(0), [(0, 0x52)])[0])

    def test_duplicate_or_unaligned_patch(self):
        for patches in ([(0, 0x52), (0, 0x52)], [(1, 0x52)]):
            self.assertFalse(S.compare_words(word(0x24C60000), word(0x24C60000), patches)[0])

    def test_extent_including_zero_padding(self):
        self.assertFalse(S.compare_words(word(0) * 2, word(0), [])[0])

    def test_retail_hex_column_is_little_endian_bytes(self):
        with patch.object(Path, "read_text", return_value="/* 0 80010000 FF00063C */ lui $a2, 0xFF"):
            va, data = S.oracle(Path("unused"))
        self.assertEqual(va, 0x80010000)
        self.assertEqual(data, word(0x3C0600FF))


if __name__ == "__main__":
    unittest.main()
