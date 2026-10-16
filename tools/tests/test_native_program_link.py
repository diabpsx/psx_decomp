"""The whole-program PSYLINK link script: retail groups, section declarations and include order."""
import json
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import native_program_link as L
import link_symbols as LS


class NativeProgramLinkTests(unittest.TestCase):
    def test_retail_groups_follow_the_map_in_declaration_order(self):
        groups, values = L.retail_groups()
        names = [g for g, _, _ in groups]
        self.assertEqual(names, ['boot_text', 'text', 'startup_text', 'map_data', 'data', 'rdata', 'sdata', 'sbss', 'bss',
                                 'frontend_text', 'pregame_text', 'game_text', 'fmv_text'])
        main = [(lo, hi) for g, lo, hi in groups if g not in L.OVERLAY_GROUPS and g != 'map_data']
        self.assertEqual([lo for lo, _ in main][1:], [hi for _, hi in main][:-1])   # resident groups abut
        self.assertTrue(all(lo == 0x80139BF8 for g, lo, _ in groups if g in L.OVERLAY_GROUPS))
        self.assertEqual(values['LNK_StackSize'], LS.LINK_OPTIONS['LNK_StackSize'])

    def test_section_declarations_cover_the_map_table_and_the_empty_sections(self):
        declared = L.section_declarations()
        table = json.loads((L.B.ROOT / 'configs/sections.json').read_text())
        listed = {(row['group'], row['name']) for row in table if row['group'] != '(default)' and not row['name'].startswith('$')}
        self.assertTrue(listed <= set(declared), listed - set(declared))
        # an empty section is declared at its position, ahead of the non-empty section that starts there
        self.assertLess(declared.index(('text', '.OBJDAT_text')), declared.index(('text', '.OBJECTS_text')))
        self.assertIn(('map_data', '.MAP_data'), declared)
        self.assertIn(('game_text', '.MONSTDAT_text'), declared)
        self.assertIn(('pregame_text', '.PREITEM_text'), declared)
        self.assertEqual([s for g, s in declared if g == 'fmv_text'][:3], ['libpress.rdata', 'libpress.data', 'libpress.text'])
        self.assertEqual([s for g, s in declared if g == 'boot_text'], ['.boot_text'])
        self.assertEqual([s for g, s in declared if g == 'last'], ['.last'])
        # the text group keeps the MAP's declaration order
        text = [s for g, s in declared if g == 'text' and (g, s) in listed]
        self.assertEqual(text, [row['name'] for row in table if row['group'] == 'text'])

    def test_section_declarations_can_be_limited_to_the_sections_we_link(self):
        declared = L.section_declarations({'.text', '.OBJECTS_text', '.sdata'})
        self.assertEqual(set(declared), {('text', '.text'), ('text', '.OBJECTS_text'), ('sdata', '.sdata'),
                                         ('fmv_text', 'libpress.rdata'), ('fmv_text', 'libpress.data'), ('fmv_text', 'libpress.text')})

    def test_include_order_starts_with_boot_and_leaves_library_members_out(self):
        specs = L.owners()
        order = L.include_order(specs)
        self.assertEqual(order[0], 'hand_boot_text')
        self.assertFalse(set(order) & set(L.GLIB_MEMBERS))
        self.assertEqual(len(order), len(set(order)))
        self.assertEqual(set(order) | set(L.GLIB_MEMBERS), set(specs))
        self.assertTrue(all(member in specs for member in L.GLIB_MEMBERS))
        self.assertEqual(len(L.GLIB_MEMBERS), len(set(L.GLIB_MEMBERS)))

    def test_library_order_keeps_retail_pull_constraints(self):
        order = L.GLIB_MEMBERS
        for before, after in (('exit', 'vars'), ('systask', 'vars'), ('vars', 'inittmr'), ('loadcall', 'callback'),
                              ('callback', 'seekmsec'), ('gsysasm', 'hand_header_code')):
            self.assertLess(order.index(before), order.index(after), (before, after))

    def test_report_when_the_link_ran(self):
        report = L.OUT / 'report.json'
        if not report.is_file():
            self.skipTest('whole-program link output absent')
        data = json.loads(report.read_text())
        for name in ('frontend', 'pregame', 'game', 'fmv'):
            self.assertTrue(data['images'][name]['identical'], name)
        main = data['images']['diabpsx']
        self.assertEqual(main['size'], main['retail_size'])
        self.assertLessEqual(main['differing_bytes'], 160)   # PSYLINK's 1..3-byte section padding (stale buffer bytes) + checksum
        self.assertEqual(data['map']['group_rows_differ'], [])
        self.assertEqual(data['map']['symbols_extra'], [])


if __name__ == '__main__':
    unittest.main()
