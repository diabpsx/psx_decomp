from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from native_text import validate_members, render_mixed
import native_recon as N


class NativeTextTests(unittest.TestCase):
    entries = {'first': (0x1000, 4), 'second': (0x1004, 4), 'last': (0x1008, 4)}

    def test_untouched_section_can_span_ordered_diagnostic_fragments(self):
        layouts = {'diabpsx': {('rodata', 'a'): (0x1000, 4),
                               ('rodata', 'b'): (0x1004, 8)}}
        row = {'scaffold': ['a.rodata', 'b.rodata']}
        self.assertEqual(N.scaffold_parts(row, 'diabpsx', 'rodata', layouts),
                         [('a.rodata', (0x1000, 4)), ('b.rodata', (0x1004, 8))])
        for names in (['b.rodata', 'a.rodata'], ['a.rodata', 'a.rodata'], [{}]):
            with self.assertRaises(ValueError):
                N.scaffold_parts({'scaffold': names}, 'diabpsx', 'rodata', layouts)

    def test_bridge_offset_does_not_split_the_source_object(self):
        source = 'dlabel x\n /* 0 00001000 00000000 */ .word 0\nenddlabel x\n'
        result = N.bounded_data_bridge(source, [(0x1000, 4, 'whole-section.bin', 28)], 0x1004)
        self.assertIn('.incbin "whole-section.bin", 28, 4', result)
        with self.assertRaises(ValueError):
            N.bounded_data_bridge(source, [(0x1000, 4, 'whole-section.bin', -1)], 0x1004)

    def test_only_whole_contiguous_explicit_functions(self):
        validate_members(0x1000, 8, ['second', 'first'], self.entries)
        for size, names in [(8, []), (8, ['first', 'first']), (8, ['first']),
                            (4, ['first', 'second']), (8, ['first', 'last']),
                            (8, ['unknown']), (8, ['../first']), (8, [{}])]:
            with self.subTest(size=size, names=names), self.assertRaises(ValueError):
                validate_members(0x1000, size, names, self.entries)

    def parts(self):
        return [(address, bytes(size), name, f'glabel {name}\nendlabel {name}\n',
                 'asm/nonmatchings/startup/'+name+'.s', name) for name,(address,size) in self.entries.items()]

    def test_mixed_bridge_keeps_unselected_scaffold(self):
        owned = {name: (0x1000, 8, 'build/source.bin') for name in ('first', 'second')}
        text = render_mixed(self.parts(), owned, 0x1000, 12)
        self.assertIn('.incbin "build/source.bin", 0, 4', text)
        self.assertIn('.incbin "build/source.bin", 4, 4', text)
        self.assertIn('.include "asm/nonmatchings/startup/last.s"', text)
        self.assertNotIn('.include "asm/nonmatchings/startup/first.s"', text)

    def test_mixed_bridge_rejects_missing_or_partial_ownership(self):
        for parts, owned, size in [(self.parts()[:-1], {}, 12),
                                   (self.parts(), {'missing': (0x1000, 4, 'data')}, 12),
                                   (self.parts(), {'first': (0x1000, 3, 'data')}, 12)]:
            with self.assertRaises(ValueError):
                render_mixed(parts, owned, 0x1000, size)

    def test_two_source_owners_share_a_segment_without_overwriting_scaffold(self):
        text = render_mixed(self.parts(), {'first': (0x1000, 4, 'build/one.bin'),
                                          'last': (0x1008, 4, 'build/two.bin')}, 0x1000, 12)
        self.assertIn('.incbin "build/one.bin", 0, 4', text)
        self.assertIn('.incbin "build/two.bin", 0, 4', text)
        self.assertIn('.include "asm/nonmatchings/startup/second.s"', text)

    def test_original_archive_wrapper_replaces_the_oracle(self):
        text = render_mixed(self.parts(), {
            'first': (0x1000, 4, None, 'build/sdk/native/first.s')}, 0x1000, 12)
        self.assertIn('.include "build/sdk/native/first.s"', text)
        self.assertNotIn('asm/nonmatchings/startup/first.s', text)
        with self.assertRaises(ValueError):
            render_mixed(self.parts(), {
                'first': (0x1000, 4, None, '../unverified.s')}, 0x1000, 12)

    def test_native_large_bss_is_bounded_and_counted(self):
        spec = {'image': 'diabpsx', 'sections': {'.bss': {'va': '0x8011CAE0', 'size': 224}}}
        rows = N.bss_placements({'vid': spec}, 0x8011C604, 0x80139BF4)
        self.assertEqual(rows, [(0x8011CAE0, 224, 'vid', '.bss')])
        with self.assertRaises(ValueError):
            N.check_bss_overlap(rows, [(0x8011CBB0, 32, 'sdk', '.bss')])


if __name__ == '__main__':
    unittest.main()
