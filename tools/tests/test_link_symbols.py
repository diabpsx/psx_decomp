from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import link_symbols as LS
import native_recon as N


class LinkSymbolTests(unittest.TestCase):
    def test_layout_derived_symbols_agree_with_the_retail_map(self):
        values = LS.compute()
        retail = LS.check()
        # every genuine PSYLINK record the MAP carries for these names is reproduced from the layouts
        self.assertEqual({name: values[name] for name in retail}, retail)
        self.assertIn('_frontend_text_org', retail)
        self.assertIn('FirstFreeByte', retail)
        self.assertIn('LNK_StackSize', retail)
        # the overlays share one buffer after the main image's bss; .last follows the largest overlay
        self.assertEqual(values['_game_text_org'], values['_bss_objend'])
        self.assertEqual(values['FirstFreeByte'], max(values[f'_{n}_text_orgend'] for n in LS.OVERLAYS))
        self.assertEqual(values['__lnk_free_mem_size'],
                         0x80000000 + values['__lnk_ram_size'] - values['LNK_StackSize'] - values['FirstFreeByte'])

    def test_overlay_ids_follow_the_group_order_and_the_retail_sym(self):
        values = LS.compute()
        # PSYLINK numbers groups in declaration order; the retail SYM carries the six overlay records
        self.assertEqual([values[f'_{g}_id'] for g in LS.OVERLAY_GROUPS], [4, 5, 0xB, 0xC, 0xD, 0xE])
        self.assertEqual(LS.retail_overlay_ids(), {g: values[f'_{g}_id'] for g in LS.OVERLAY_GROUPS})
        # startup_text and map_data share one org; map_data holds only its id word and MAP's empty .data
        self.assertEqual(values['_map_data_org'], values['_startup_text_org'])
        self.assertEqual((values['_map_data_size'], values['__MAP_data_size']), (4, 0))
        self.assertEqual(values['__MAP_data_org'], values['_map_data_orgend'])
        self.assertEqual(values['_startup_text_size'], 0x9E4)
        retail = LS.check()
        for name in ('_startup_text_org', '_startup_text_objend', '_map_data_size', '__MAP_data_obj', '__MAP_data_size'):
            self.assertEqual(retail[name], values[name])
        with self.assertRaises(ValueError):
            LS.check(sym_text='000008: $800b031c overlay length $00000004 id $7\n')

    def test_id_words_are_emitted_by_the_link_not_by_scaffold_data(self):
        self.assertIn('_map_data_id = 5;', '\n'.join(LS.id_lines()))
        main = LS.subsegment_lines('diabpsx', 'startup_text_hdr')
        self.assertIn('LONG(_map_data_id);', main[2])
        self.assertTrue(any(line.startswith(f'build/{LS.MAP_MEMBER}.o(.data);') for line in main))
        self.assertEqual(LS.subsegment_lines('frontend', 'frontend_hdr')[0].split('   ')[0], 'LONG(_frontend_text_id);')
        self.assertEqual(LS.subsegment_lines('frontend', 'fe'), [])
        self.assertEqual(LS.after_subsegment_lines('diabpsx', 'dtors'), ['_startup_text_orgend = .;'])
        self.assertFalse(list((LS.ROOT / 'asm/data').glob('*_hdr.data.s')))
        self.assertEqual((LS.ROOT / LS.MAP_MEMBER).read_text().strip().splitlines()[-1].strip(), '.data')

    def test_check_reports_a_disagreeing_map_record(self):
        with self.assertRaises(ValueError):
            LS.check(' 80139BFC  _frontend_text_org\n')
        with self.assertRaises(ValueError):
            LS.check(' 80139BF8  _frontend_text_org\n 80139BFC  _frontend_text_org\n')

    def test_ld_lines_compute_inside_the_script_and_assert_retail(self):
        lines = LS.ld_lines('.diabpsx')
        text = '\n'.join(lines)
        self.assertIn('_bss_objend = ALIGN(ADDR(.diabpsx) + SIZEOF(.diabpsx), 8);', text)
        self.assertIn('FirstFreeByte = __last_org;', text)
        self.assertIn('__lnk_free_mem_size = 0x80200000 - LNK_StackSize - FirstFreeByte;', text)
        self.assertNotIn('ASSERT', text)   # inside SECTIONS ld rejects `ASSERT(...);`
        asserts = '\n'.join(LS.ld_asserts())
        for name, value in LS.check().items():
            self.assertIn(f'ASSERT({name} == 0x{value:X},', asserts)


class LinkedObjectCarveTests(unittest.TestCase):
    registry = {
        'overinfo': {'source': 'recon/psxsrc/overinfo.s', 'image': 'diabpsx',
                     'sections': {'.rdata': {'va': '0x8010DBAC', 'size': 44, 'link_object': True}}},
        'lnkopt': {'source': 'recon/psxsrc/lnkopt.s', 'image': 'diabpsx',
                   'sections': {'.rdata': {'va': '0x8010DBD8', 'size': 32, 'link_object': True}}},
    }
    rows = [(0xFD6CC, 'data', 'data_automap'), (0xFDBAC, 'rodata', 'rodata'), (0xFFF90, 'rodata', 'rodata_main')]

    def test_linked_objects_lead_their_fragment_and_keep_the_remainder(self):
        carved = N.carve_linked_objects(self.rows, 0x100000, 0x80010000, 'diabpsx', self.registry)
        self.assertEqual(carved, [(0xFD6CC, 'data', 'data_automap'), (0xFDBAC, 'rodata', 'overinfo'),
                                  (0xFDBD8, 'rodata', 'lnkopt'), (0xFDBF8, 'rodata', 'rodata'),
                                  (0xFFF90, 'rodata', 'rodata_main')])
        # another image's layout is untouched
        self.assertEqual(N.carve_linked_objects(self.rows, 0x100000, 0x80139BF8, 'game', self.registry), self.rows)

    def test_linked_object_must_lead_a_fragment_of_its_kind(self):
        inside = {'x': {'source': 'recon/x.s', 'image': 'diabpsx',
                        'sections': {'.rdata': {'va': '0x8010DBB0', 'size': 4, 'link_object': True}}}}
        with self.assertRaises(ValueError):
            N.carve_linked_objects(self.rows, 0x100000, 0x80010000, 'diabpsx', inside)
        wrong_kind = {'x': {'source': 'recon/x.s', 'image': 'diabpsx',
                            'sections': {'.data': {'va': '0x8010DBAC', 'size': 4, 'link_object': True}}}}
        with self.assertRaises(ValueError):
            N.carve_linked_objects(self.rows, 0x100000, 0x80010000, 'diabpsx', wrong_kind)
        too_long = {'x': {'source': 'recon/x.s', 'image': 'diabpsx',
                          'sections': {'.rdata': {'va': '0x8010DBAC', 'size': 0x3000, 'link_object': True}}}}
        with self.assertRaises(ValueError):
            N.carve_linked_objects(self.rows, 0x100000, 0x80010000, 'diabpsx', too_long)

    def test_linked_rows_are_hand_authored_without_scaffold(self):
        with self.assertRaises(ValueError):
            N.linked_object_rows({'x': {'source': 'recon/x.c', 'image': 'diabpsx',
                                        'sections': {'.rdata': {'va': '0x8010DBAC', 'size': 4, 'link_object': True}}}})
        with self.assertRaises(ValueError):
            N.linked_object_rows({'x': {'source': 'recon/x.s', 'image': 'diabpsx',
                                        'sections': {'.rdata': {'va': '0x8010DBAC', 'size': 4, 'link_object': True,
                                                                'scaffold': 'rodata.rodata'}}}})
        with self.assertRaises(ValueError):
            N.linked_object_rows({'x': {'source': 'recon/x.s', 'image': 'diabpsx',
                                        'sections': {'.text': {'va': '0x8010DBAC', 'size': 4, 'link_object': True}}}})

    def test_scaffold_source_drops_the_labels_a_linked_object_owns(self):
        source = ('.include "macro.inc"\n\n.section .rodata, "a"\n\nnonmatching OVR_LoadAddress\n\ndlabel OVR_LoadAddress\n'
                  '    /* FDBAC 8010DBAC F89B1380 */ .word D_80139BF8\nenddlabel OVR_LoadAddress\n\n'
                  'nonmatching OPT_NoQuests\n\ndlabel OPT_NoQuests\n    /* FDBF4 8010DBF4 00000000 */ .word 0x00000000\n'
                  'enddlabel OPT_NoQuests\n\nnonmatching D_8010DBF8\n\ndlabel D_8010DBF8\n'
                  '    /* FDBF8 8010DBF8 00010202 */ .word 0x02020100\nenddlabel D_8010DBF8\n')
        trimmed = N.trim_linked_objects(source, 'diabpsx', self.registry)
        self.assertNotIn('OVR_LoadAddress', trimmed)
        self.assertNotIn('OPT_NoQuests', trimmed)
        self.assertIn('dlabel D_8010DBF8\n    /* FDBF8 8010DBF8 00010202 */ .word 0x02020100\nenddlabel D_8010DBF8\n', trimmed)
        self.assertTrue(trimmed.startswith('.include "macro.inc"\n\n.section .rodata, "a"\n\n'))
        self.assertEqual(N.trim_linked_objects(source, 'game', self.registry), source)

    def test_carved_scaffold_aligns_labels_by_retail_address(self):
        source = ('nonmatching OVR_LoadAddress\n\ndlabel OVR_LoadAddress\n'
                  '    /* FDBAC 8010DBAC F89B1380 */ .word D_80139BF8\nenddlabel OVR_LoadAddress\n\n'
                  '.align 3\nnonmatching jtbl_8010EB74\n\ndlabel jtbl_8010EB74\n'
                  '    /* FEB74 8010EB74 00000000 */ .word 0\nenddlabel jtbl_8010EB74\n\n'
                  '.align 3\nnonmatching D_8010EB78\n\ndlabel D_8010EB78\n'
                  '    /* FEB78 8010EB78 00000000 */ .word 0\nenddlabel D_8010EB78\n')
        trimmed = N.trim_linked_objects(source, 'diabpsx', self.registry)
        self.assertIn('.align 2\nnonmatching jtbl_8010EB74\n', trimmed)   # 8010EB74 is only 4-aligned
        self.assertIn('.align 3\nnonmatching D_8010EB78\n', trimmed)      # 8010EB78 keeps its 8-alignment
        untouched = source.split('\n\n', 2)[2]
        self.assertEqual(N.trim_linked_objects(untouched, 'diabpsx', self.registry), untouched)

    def test_placement_requires_the_whole_carved_fragment(self):
        spec = {'source': 'recon/psxsrc/overinfo.s', 'image': 'diabpsx', 'stripped_library_sym': True,
                'data_only': True, 'sections': {'.rdata': {'va': '0x8010DBAC', 'size': 44, 'link_object': True}}}
        layouts = {'diabpsx': {('rodata', 'overinfo'): (0x8010DBAC, 44)}}
        homes, regions, limits = N.validate_placements('overinfo', spec, layouts)
        self.assertEqual(regions['.rdata'], (0x8010DBAC, 44))
        with self.assertRaises(ValueError):
            N.validate_placements('overinfo', spec, {'diabpsx': {('rodata', 'overinfo'): (0x8010DBAC, 48)}})


class MixedScaffoldSpanTests(unittest.TestCase):
    layouts = {'frontend': {('rodata', 'dlg_rodata_801435e8'): (0x801435E8, 0x1C), ('c', 'dlg'): (0x80143604, 0x48),
                            ('rodata', 'dlg_rodata_8014364c'): (0x8014364C, 0x54), ('c', 'dlg_1'): (0x801436A0, 0x4C),
                            ('rodata', 'dlg_rodata_801436ec'): (0x801436EC, 0x15EA4)}}

    def test_rodata_row_may_span_code_labelled_fragments_it_covers(self):
        row = {'va': '0x801435E8', 'size': 0x104,
               'scaffold': ['dlg_rodata_801435e8.rodata', 'dlg.c', 'dlg_rodata_8014364c.rodata', 'dlg_1.c']}
        parts = N.scaffold_parts(row, 'frontend', 'rodata', self.layouts)
        self.assertEqual([name for name, _ in parts], row['scaffold'])
        spec = {'source': 'recon/psxsrc/dlg_2.cpp', 'image': 'frontend',
                'sections': {'.text': {'va': '0x80159590', 'size': 9160}, '.rdata': row}}
        layouts = {'frontend': {**self.layouts['frontend'], ('c', 'dlg_2'): (0x80159590, 9160)}}
        homes, regions, limits = N.validate_placements('dlg_2', spec, layouts)
        self.assertEqual(regions['.rdata'], (0x801435E8, 0x104))
        short = dict(spec, sections={**spec['sections'], '.rdata': dict(row, size=0x100)})
        with self.assertRaises(ValueError):   # dlg_1.c would not be covered completely
            N.validate_placements('dlg_2', short, layouts)

    def test_data_row_may_use_a_rodata_labelled_fragment_but_not_text(self):
        parts = N.scaffold_parts({'scaffold': ['dlg_rodata_801436ec.rodata']}, 'frontend', 'data', self.layouts)
        self.assertEqual(parts[0][1], (0x801436EC, 0x15EA4))
        with self.assertRaises(ValueError):
            N.scaffold_parts({'scaffold': ['dlg_rodata_801436ec.rodata']}, 'frontend', 'sdata', self.layouts)
        with self.assertRaises(ValueError):
            N.scaffold_parts({'scaffold': ['dlg.text']}, 'frontend', 'rodata', self.layouts)


if __name__ == '__main__':
    unittest.main()
