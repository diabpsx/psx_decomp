"""Ownership rules added 2026-10-06: wider overlay context, link-computed symbols, link-order bounds."""
from pathlib import Path
import sys
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import map_source_owners as M
import link_symbols as LS


class OverlayContextRuleTests(unittest.TestCase):
    def test_dlg_data_pool_names_resolve_to_dlg_with_the_typed_object(self):
        frontend = (M.ROOT / 'configs/frontend.yaml').read_text()
        rows = [(0x80139C04, 0x8014AB74, 'MISSILES', 'text'), (0x8013B7DC, 0x80158868, 'FMV', 'text'),
                (0x801435E8, 0x8015B958, 'DLG', 'text'), (0x80157274, 0x80161F58, 'INV', 'text')]
        for name, va in [('save_buffer', 0x801436EC), ('CharDataStruct', 0x801576F0),
                         ('CharBlockBuf', 0x801576F0), ('D_80157B68', 0x80157B68),
                         ('TempStr', 0x801594D0), ('AlertStr', 0x80159510)]:
            selected, confirmed = M.contextual_candidates(name, va, rows, {'typed record'}, frontend)
            self.assertTrue(confirmed, name)
            self.assertEqual(selected, [rows[2]], name)
        # aliases name the typed object they belong to
        self.assertEqual(M.OVERLAY_CONTEXT['CharBlockBuf'][5], 'CharDataStruct')
        self.assertEqual(M.OVERLAY_CONTEXT['D_80157B68'][5], 'CharDataStruct')

    def test_game_overlay_function_address_uses_its_own_layout(self):
        layouts = M.overlay_layouts()
        rows = [(0x8015F6E8, 0x80161FDC, 'PREMON', 'text'), (0x80161F58, 0x80163E20, 'AUTOMAP', 'text')]
        selected, confirmed = M.contextual_candidates('func_80161F58', 0x80161F58, rows, {'FCN'}, '', layouts)
        self.assertTrue(confirmed)
        self.assertEqual(selected, [rows[1]])
        with self.assertRaises(ValueError):   # outside the AUTOMAP fragment
            M.contextual_candidates('func_80161F58', 0x80161F00, rows, {'FCN'}, '', layouts)
        with self.assertRaises(ValueError):   # no typed record for StartAutomap
            M.contextual_candidates('func_80161F58', 0x80161F58, rows, set(), '', layouts)


class LinkOrderBoundTests(unittest.TestCase):
    symbols = {'svgamode': {0x8011B7E0}, 'MouseX': {0x8011B7E4}, 'gbProcessPlayers': {0x8011B800},
               'tickval': {0x8011C600}, 'shared': {0x8011B7F0}}
    owners = {'svgamode': ['diablo'], 'gbProcessPlayers': ['diablo'], 'tickval': ['timer'],
              'shared': ['a', 'b']}

    def test_neighbours_with_one_known_owner_bound_the_name(self):
        below, above = M.link_order_bounds(0x8011B7E4, self.symbols, self.owners)
        self.assertEqual(below, (0x8011B7E0, 'svgamode', 'diablo'))
        self.assertEqual(above, (0x8011B800, 'gbProcessPlayers', 'diablo'))

    def test_ambiguous_exports_and_unknown_names_are_not_neighbours(self):
        below, above = M.link_order_bounds(0x8011B7F4, self.symbols, self.owners)
        self.assertEqual(below[1], 'svgamode')      # `shared` (two owners) and MouseX (unknown) skipped
        self.assertEqual(above[1], 'gbProcessPlayers')
        self.assertEqual(M.link_order_bounds(0x8011C700, self.symbols, self.owners)[1], None)


class LinkComputedRuleTests(unittest.TestCase):
    def test_overinfo_and_lnkopt_words_are_link_symbols(self):
        computed = LS.compute()
        for name in ('FirstFreeByte', '_frontend_text_org', '_game_text_size', 'LNK_StackSize',
                     '__lnk_free_mem_size'):
            self.assertIn(name, computed)


if __name__ == '__main__':
    unittest.main()
