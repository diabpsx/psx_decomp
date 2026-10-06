"""Overlay addresses alone must not override proved DLG data ownership."""
from pathlib import Path
import sys
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import map_source_owners as M


class OwnershipContextTests(unittest.TestCase):
    def test_dlg_frontend_disambiguates_overlapping_objects(self):
        frontend = (M.ROOT / 'configs/frontend.yaml').read_text()
        rows = [(0x80139C04, 0x8014AB74, 'MISSILES', 'text'),
                (0x801435E8, 0x8015B958, 'DLG', 'text')]
        for name, va in [('ClassStrTbl', 0x801435F8), ('McLoadGameMenu', 0x8014364C),
                         ('McLoadCard1Menu', 0x80143668), ('McLoadCard2Menu', 0x80143684)]:
            selected, confirmed = M.contextual_candidates(name, va, rows, {'typed record'}, frontend)
            self.assertTrue(confirmed)
            self.assertEqual(selected, [rows[1]])

    def test_context_must_be_supported_by_fragment_and_sym(self):
        frontend = (M.ROOT / 'configs/frontend.yaml').read_text()
        rows = [(0x801435E8, 0x8015B958, 'DLG', 'text')]
        for va, records in [(0x801436EC, {'typed record'}), (0x8014364C, set())]:
            with self.assertRaises(ValueError):
                M.contextual_candidates('McLoadGameMenu', va, rows, records, frontend)

    def test_unproved_symbols_stay_candidates(self):
        rows = [(0x1000, 0x2000, 'A', 'text'), (0x1000, 0x2000, 'B', 'text')]
        self.assertEqual(M.contextual_candidates('Unknown', 0x1000, rows, set(), ''),
                         (rows, False))


if __name__ == '__main__':
    unittest.main()
