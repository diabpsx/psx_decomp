from pathlib import Path
import sys
import unittest
import tempfile
import copy
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import native_recon as N


class NativeReconTests(unittest.TestCase):
    def test_assembler_selection_is_explicit_and_limited(self):
        self.assertEqual(N.source_assembler({}), ('2.56', N.S.ASPSX))
        version, path = N.source_assembler({'assembler': '2.67'})
        self.assertEqual(version, '2.67')
        self.assertEqual(path.name, 'ASPSX.EXE')
        for value in ('2.81', '../ASPSX.EXE', None, []):
            with self.subTest(value=value), self.assertRaises(ValueError):
                N.source_assembler({'assembler': value})
    def test_untyped_data_export_is_explicit_and_cannot_hide_types(self):
        name, alias = '_6SysObj.NewHnd', '_6SysObj_NewHnd'
        symbol = '000001: $8011ab3c 2 '+name+'\n'
        declaration = '000002: $8011ab3c 94 Def class EXT type LONG size 0 name '+name+'\n'
        mapping = ' 8011AB3C '+name+'\n'
        addresses = alias+' = 0x8011AB3C; //\n'
        receipt = N.verify_untyped_export(mapping, addresses, symbol, declaration+symbol, name, alias)
        self.assertFalse(receipt['retail_type_record'])
        receipt = N.verify_untyped_export(mapping, addresses, symbol, symbol, name, alias)
        self.assertIsNone(receipt['compiler_type'])
        for retail, compiled, native in [(symbol+declaration, declaration+symbol, mapping),
                                        ('', declaration+symbol, mapping), (symbol, '', mapping),
                                        (symbol, declaration+symbol, mapping.replace('AB3C','AB40')),
                                        (symbol, declaration.replace('LONG','FCN LONG')+symbol,mapping)]:
            with self.assertRaises(ValueError):
                N.verify_untyped_export(native, addresses, retail, compiled, name, alias)
    def test_static_member_alias_requires_all_addresses_to_agree(self):
        record = '000001: $80010000 96 Def2 class EXT type ARY CHAR size 50 dims 1 50 tag  name _6FileIO.FileToLoad\n'
        symbols = '_6FileIO_FileToLoad = 0x80010000; // size:0x32\n'
        mapping = ' 80010000 _6FileIO.FileToLoad\n'
        N.verify_data_map(mapping, symbols, record, '_6FileIO.FileToLoad', '_6FileIO_FileToLoad')
        for bad_map, bad_symbols, bad_record in ((mapping.replace('80010000','80010004'),symbols,record),
                (mapping,symbols.replace('80010000','80010004'),record), (mapping,symbols,'')):
            with self.assertRaises(ValueError):
                N.verify_data_map(bad_map,bad_symbols,bad_record,'_6FileIO.FileToLoad','_6FileIO_FileToLoad')

    def test_exact_backslash_literal_partial_bridge(self):
        source = ('dlabel path_separator\n /* 0 80110000 */ .asciz "' + '\\'*2 + '"\n.align 2\nenddlabel path_separator\n'
                  'dlabel next\n /* 4 80110004 00000000 */ .word 0\nenddlabel next\n')
        wrapper = N.bounded_data_bridge(source, [(0x80110000,2,'separator.bin')],0x80110008)
        self.assertIn('.incbin "separator.bin", 0, 2',wrapper)
        with self.assertRaises(ValueError):
            N.bounded_data_bridge(source, [(0x80110000,1,'separator.bin')],0x80110008)

    def test_backslash_format_literal_has_decoded_ascii_extent(self):
        source = ('dlabel format\n /* 0 80110000 */ .asciz "' + '\\'*2 + '%s;1"\n.align 2\nenddlabel format\n'
                  'dlabel next\n /* 8 80110008 00000000 */ .word 0\nenddlabel next\n')
        wrapper = N.bounded_data_bridge(source, [(0x80110000,6,'format.bin')],0x8011000C)
        self.assertIn('.incbin "format.bin", 0, 6',wrapper)
        with self.assertRaises(ValueError):
            N.bounded_data_bridge(source, [(0x80110000,5,'format.bin')],0x8011000C)
        for escaped in ('\\n', '\\x5c', '\\134'):
            with self.subTest(escaped=escaped), self.assertRaises(ValueError):
                N.bounded_data_bridge(source.replace('\\'*2,escaped), [(0x80110000,6,'format.bin')],0x8011000C)
    def test_gp_group_covers_contiguous_partitioned_small_data(self):
        rows = [(0, 'c', 'code'), (16, 'sdata', 'before'),
                (32, 'sdata', 'owned'), (40, 'sdata', 'after'), (64, 'bin', 'checksum')]
        self.assertEqual(N.small_data_group(rows, 68), (0x80010010, 0x80010040))
        self.assertEqual(N.small_data_group(rows[:-1], 64), (0x80010010, 0x80010040))
        with self.assertRaises(ValueError):
            N.small_data_group([(0, 'sdata', 'one'), (4, 'data', 'gap'), (8, 'sdata', 'two')], 12)
        with self.assertRaises(ValueError):
            N.small_data_group([(0, 'c', 'none')], 12)
    def test_thunk_alias_requires_placement_and_body_records(self):
        for kind in ('I', 'D'):
            name, retail_name = '_GLOBAL__' + kind + '_QBack', '_GLOBAL_.' + kind + '.QBack'
            actual = '000001: $80010000 94 Def class EXT type FCN VOID size 0 name ' + name + '\n'
            with tempfile.TemporaryDirectory() as temporary:
                root = Path(temporary)
                folder = root / 'asm/nonmatchings/sample'
                folder.mkdir(parents=True)
                (folder / (name + '.s')).write_text('')
                for va, same in ((0x80010000, True), (0x80010004, True), (0x80010000, False)):
                    with patch.object(N.B, 'ROOT', root), \
                         patch.object(N.S, 'functions', side_effect=[{name: {'start': va}}, {retail_name: [{'start': 0x80010000}]}]), \
                         patch.object(N.S, 'oracle_va', return_value=0x80010000), \
                         patch.object(N.S, 'compare', return_value=(same, 'body differs')):
                        if va == 0x80010000 and same:
                            self.assertEqual(N.verify_sym(actual, 'sample', [], ''), 1)
                        else:
                            with self.assertRaises(ValueError):
                                N.verify_sym(actual, 'sample', [], '')

    def test_constructor_sections_use_data_fragments_with_word_alignment(self):
        spec = {'image': 'diabpsx', 'sections': {
            '.text': {'va': '0x80010000', 'size': 8},
            '.ctors': {'va': '0x80011004', 'size': 4, 'scaffold': 'ctors.data'}}}
        layout = {'diabpsx': {('c', 'sample'): (0x80010000, 8), ('data', 'ctors'): (0x80011000, 12)}}
        N.validate_placements('sample', spec, layout)
        for field, value in (('size', 3), ('va', '0x80011005')):
            bad = copy.deepcopy(spec)
            bad['sections']['.ctors'][field] = value
            with self.assertRaises(ValueError):
                N.validate_placements('sample', bad, layout)

    def test_native_destructor_spelling_alias_keeps_placement_check(self):
        actual = '000001: $80010000 94 Def class EXT type FCN VOID size 0 name ___6Dialog\n'
        expected = actual.replace('___6Dialog', '_._6Dialog')
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            folder = root / 'asm/nonmatchings/sample'
            folder.mkdir(parents=True)
            (folder / '___6Dialog_80010000.s').write_text('')
            for va in (0x80010000, 0x80010004):
                with patch.object(N.B, 'ROOT', root), \
                     patch.object(N.S, 'functions', side_effect=[{'___6Dialog': {'start': va}},
                                                               {'_._6Dialog': [{'start': 0x80010000}]}]), \
                     patch.object(N.S, 'oracle_va', return_value=0x80010000), \
                     patch.object(N.S, 'compare', return_value=(True, '')):
                    if va == 0x80010000:
                        self.assertEqual(N.verify_sym(actual, 'sample', [], expected), 1)
                    else:
                        with self.assertRaises(ValueError):
                            N.verify_sym(actual, 'sample', [], expected)

    def test_partial_plain_string_requires_complete_literal(self):
        source = ('dlabel shared\n /* 0 80110000 */ .word 0x00000000\n'
                  ' /* 4 80110004 */ .asciz ".tp"\n'
                  ' /* 8 80110008 */ .word 0x00000000\nenddlabel shared\n')
        wrapper = N.bounded_data_bridge(source, [(0x80110004, 4, 'pool.bin')], 0x8011000C)
        self.assertIn('.incbin "pool.bin", 0, 4', wrapper)
        self.assertEqual(wrapper.count('.word'), 2)
        with self.assertRaises(ValueError):
            N.bounded_data_bridge(source, [(0x80110004, 3, 'pool.bin')], 0x8011000C)
        with self.assertRaises(ValueError):
            N.bounded_data_bridge(source.replace('".tp"', '"\\x2etp"'),
                                  [(0x80110004, 4, 'pool.bin')], 0x8011000C)
    def test_native_sym_rejects_wrong_or_missing_return_declaration(self):
        expected = '000001: $80010000 94 Def class EXT type FCN VOID size 0 name sample\n'
        function = {'start': 0x80010000}
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            folder = root / 'asm/nonmatchings/sample'
            folder.mkdir(parents=True)
            (folder / 'sample.s').write_text('')
            for actual in (expected.replace('VOID', 'INT'), ''):
                with self.subTest(actual=actual), patch.object(N.B, 'ROOT', root), \
                     patch.object(N.S, 'functions', side_effect=[{'sample': function}, {'sample': [function]}]), \
                     patch.object(N.S, 'oracle_va', return_value=0x80010000), \
                     self.assertRaisesRegex(ValueError, 'return declaration differs'):
                    N.verify_sym(actual, 'sample', [], expected)

    def test_bss_only_gp_anchor_does_not_become_source_payload(self):
        owned = {'.text': (0x80011000, 8), '.sbss': (0x80012000, 4)}
        prefix, combined, mode = N.gp_carrier_plan(owned, bytes(range(32)), 0x80010000, 0x80010020)
        self.assertEqual(prefix, bytes(range(4)))
        self.assertEqual(mode, 'anchor')
        self.assertNotIn('.sdata', owned)
        self.assertEqual(combined['.sdata'], (0x80010000, 4))
        self.assertEqual(set(combined) - set(owned), {'.sdata'})
        prefix, combined, mode = N.gp_carrier_plan({'.text': (0x80011000, 8)}, bytes(32), 0x80010000, 0x80010020)
        self.assertEqual((prefix, mode), (b'', 'none'))
        self.assertNotIn('.sdata', combined)
    def test_overlay_data_uses_its_own_image_bounds(self):
        layouts = {'pregame': {('c', 'sample'): (0x80140020, 16),
                               ('data', 'tables'): (0x80140000, 16),
                               ('rodata', 'pool'): (0x80140010, 16)},
                   'diabpsx': {}}
        spec = {'image': 'pregame', 'sections': {
            '.text': {'va': '0x80140020', 'size': 16},
            '.data': {'va': '0x80140000', 'size': 16, 'scaffold': 'tables.data'},
            '.rdata': {'va': '0x80140010', 'size': 15, 'scaffold': 'pool.rodata'}}}
        homes, _, _ = N.validate_placements('sample', spec, layouts)
        self.assertEqual(set(homes.values()), {'pregame'})
        spec['sections']['.data']['image'] = 'diabpsx'
        with self.assertRaises(ValueError):
            N.validate_placements('sample', spec, layouts)

    def test_native_bss_extent_and_sdk_overlap(self):
        first = {'image': 'diabpsx', 'sections': {
            '.sbss': {'va': '0x8011C604', 'size': 4}}}
        self.assertEqual(N.bss_placements({'main': first}, 0x8011C604, 0x80139BF4),
                         [(0x8011C604, 4, 'main', '.sbss')])
        spec = {'image': 'pregame', 'sections': {
            '.sbss': {'image': 'diabpsx', 'va': '0x8011C8E0', 'size': 8}}}
        rows = N.bss_placements({'sample': spec}, 0x8011C608, 0x80139BF4)
        self.assertEqual(rows, [(0x8011C8E0, 8, 'sample', '.sbss')])
        N.check_bss_overlap(rows, [(0x8011C8E8, 4, 'sdk', '.sbss')])
        with self.assertRaises(ValueError):
            N.check_bss_overlap(rows, [(0x8011C8E4, 4, 'sdk', '.sbss')])
        with self.assertRaises(ValueError):
            N.bss_placements({'sample': spec, 'other': spec}, 0x8011C608, 0x80139BF4)
        for key, value in [('size', 0), ('size', True), ('va', '0x8011C8E1'),
                           ('va', '0x8011C604'), ('va', '0x80139BF0'),
                           ('image', 'pregame')]:
            bad = copy.deepcopy(spec)
            bad['sections']['.sbss'][key] = value
            with self.subTest(key=key, value=value), self.assertRaises(ValueError):
                N.bss_placements({'sample': bad}, 0x8011C608, 0x80139BF4)

    def test_bridge_rejects_unclosed_or_mismatched_labels(self):
        for source in ('dlabel one\n /* 0 80110000 */ .byte 0\n',
                       'dlabel one\nenddlabel other\n',
                       'dlabel one\ndlabel two\nenddlabel two\n'):
            with self.subTest(source=source), self.assertRaises(ValueError):
                N.bounded_data_bridge(source, [(0x80110000, 1, 'data.bin')], 0x80110001)

    def test_labelled_padding_is_imported_only_once(self):
        source = ('dlabel values\n /* 0 80110000 */ .byte 1\nenddlabel values\n'
                  'dlabel padding\n /* 1 80110001 */ .byte 0\nenddlabel padding\n'
                  'dlabel next\n /* 2 80110002 */ .byte 2\nenddlabel next\n')
        wrapper = N.bounded_data_bridge(source, [(0x80110000, 3, 'data.bin')], 0x80110003)
        self.assertEqual(wrapper.count('.incbin'), 3)
        self.assertIn('.incbin "data.bin", 0, 1', wrapper)
        self.assertIn('.incbin "data.bin", 1, 1', wrapper)
        self.assertIn('.incbin "data.bin", 2, 1', wrapper)
        self.assertNotIn('.byte', wrapper)

    def test_cross_image_sections_have_explicit_bounded_ownership(self):
        layouts = {'pregame': {('c', 'sample'): (0x80140000, 16)},
                   'diabpsx': {('rodata', 'pool'): (0x80110000, 24)}}
        spec = {'image': 'pregame', 'sections': {
            '.text': {'va': '0x80140000', 'size': 16},
            '.rdata': {'image': 'diabpsx', 'va': '0x80110000', 'size': 24,
                       'scaffold': 'pool.rodata'}}}
        homes, regions, limits = N.validate_placements('sample', spec, layouts)
        self.assertEqual(homes, {'.text': 'pregame', '.rdata': 'diabpsx'})
        self.assertEqual(regions['.text'], (0x80140000, 16))
        self.assertEqual(limits['.rdata'], 0x80110018)
        for section, key, value in [('.text', 'size', 12), ('.text', 'size', 20),
                                    ('.text', 'image', 'diabpsx'),
                                    ('.rdata', 'size', 28), ('.rdata', 'size', 0),
                                    ('.rdata', 'image', 'pregame'),
                                    ('.rdata', 'image', 'unknown'),
                                    ('.rdata', 'va', '0x8010FFFC'),
                                    ('.rdata', 'scaffold', '../pool.rodata')]:
            bad = copy.deepcopy(spec)
            bad['sections'][section][key] = value
            with self.subTest(section=section, key=key, value=value), self.assertRaises(ValueError):
                N.validate_placements('sample', bad, layouts)

    def test_final_string_object_bridge_preserves_labels_and_bounds(self):
        source = ('dlabel pool\n /* 0 80110000 */ .asciz "abc"\n'
                  'enddlabel pool\n')
        wrapper = N.bounded_data_bridge(source, [(0x80110000, 4, 'pool.bin')], 0x80110004)
        self.assertIn('dlabel pool', wrapper)
        self.assertIn('.incbin "pool.bin", 0, 4', wrapper)
        self.assertIn('enddlabel pool', wrapper)
        self.assertNotIn('__native_source_end_boundary', wrapper)
        with self.assertRaises(ValueError):
            N.bounded_data_bridge(source, [(0x80110000, 8, 'pool.bin')], 0x80110004)
        with self.assertRaises(ValueError):
            N.bounded_data_bridge(source, [(0x80110001, 3, 'pool.bin')], 0x80110004)

    def test_pool_tail_preserves_nonzero_scaffold_padding(self):
        source = ('dlabel pool\n /* 0 80110000 */ .asciz "abc"\nenddlabel pool\n'
                  'dlabel tail\n /* 4 80110004 */ .short 0x0070\n'
                  ' /* 6 80110006 */ .short 0x0068\nenddlabel tail\n')
        wrapper = N.bounded_data_bridge(source, [(0x80110000, 6, 'pool.bin')], 0x80110008)
        self.assertIn('.incbin "pool.bin", 0, 4', wrapper)
        self.assertIn('.incbin "pool.bin", 4, 2', wrapper)
        self.assertNotIn('.short 0x0070', wrapper)
        self.assertIn('/* 6 80110006 */ .short 0x0068', wrapper)
        self.assertIn('dlabel tail', wrapper)

    def test_initialized_data_must_use_a_data_fragment(self):
        layouts = {'diabpsx': {('c', 'sample'): (0x80010000, 8),
                               ('data', 'table'): (0x80020000, 12)}}
        spec = {'image': 'diabpsx', 'sections': {
            '.text': {'va': '0x80010000', 'size': 8},
            '.data': {'va': '0x80020000', 'size': 12, 'scaffold': 'table.data'}}}
        homes, regions, limits = N.validate_placements('sample', spec, layouts)
        self.assertEqual(regions['.data'], (0x80020000, 12))
        spec['sections']['.data']['scaffold'] = 'table.rodata'
        with self.assertRaises(ValueError):
            N.validate_placements('sample', spec, layouts)

    def test_text_wrapper_requires_complete_contiguous_coverage(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            folder = root / 'asm/nonmatchings/sample'
            folder.mkdir(parents=True)
            first = 'glabel first\n /* 0 80010000 00000000 */ nop\nendlabel first\n'
            second = 'glabel second\n /* 4 80010004 00000000 */ nop\nendlabel second\n'
            (folder / 'first.s').write_text(first)
            (folder / 'second.s').write_text(second)
            with patch.object(N.B, 'ROOT', root):
                wrapper = N.text_bridge('sample', 0x80010000, 8)
                self.assertIn('glabel first', wrapper)
                self.assertIn('sample.text.bin", 4, 4', wrapper)
                with self.assertRaises(ValueError):
                    N.text_bridge('sample', 0x80010000, 12)
                (folder / 'second.s').write_text(second.replace('80010004', '80010008'))
                with self.assertRaises(ValueError):
                    N.text_bridge('sample', 0x80010000, 12)

    def test_binding_requires_unique_address_and_name(self):
        text = 'target = 0x80010000; // type:func\n'
        self.assertEqual(N.resolve_bindings(['target'], text + text), {'target': 0x80010000})
        for names, symbols in ((['missing'], text), (['target', 'target'], text),
                               (['bad name'], text),
                               (['target'], text + 'target = 0x80010004; //\n')):
            with self.subTest(names=names), self.assertRaises(ValueError):
                N.resolve_bindings(names, symbols)

    def test_gp_prefix_is_only_the_declared_data_range(self):
        data = bytes(range(32))
        self.assertEqual(N.prefix_bytes(data, 0x80010004, 0x80010010, 0x80010020), data[4:16])
        for gp, start, end in ((0x8000fffc, 0x80010010, 0x80010020),
                               (0x80010004, 0x80010002, 0x80010020),
                               (0x80010004, 0x80010011, 0x80010020),
                               (0x80010004, 0x80010020, 0x80010020),
                               (0x80010004, 0x80010010, 0x80010024)):
            with self.subTest(start=start), self.assertRaises(ValueError):
                N.prefix_bytes(data, gp, start, end)

    def test_global_record_retains_type_and_address(self):
        text = '000001: $8011b9cc 94 Def class EXT type LONG size 0 name numobjects\n'
        record = N.data_records(text, 'numobjects')
        self.assertEqual(len(record), 1)
        self.assertNotEqual(record, N.data_records(text.replace('LONG', 'INT'), 'numobjects'))
        self.assertNotEqual(record, N.data_records(text.replace('8011b9cc', '8011b9c0'), 'numobjects'))
        self.assertFalse(N.data_records(text.replace('EXT', 'REG'), 'numobjects'))


if __name__ == '__main__':
    unittest.main()
