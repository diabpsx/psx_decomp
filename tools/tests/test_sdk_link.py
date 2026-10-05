"""Reject incomplete or ambiguous native SDK payloads before scaffold import."""
import copy
import collections
import json
from pathlib import Path
import struct
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import sdk_link as S


class NativeSdkTests(unittest.TestCase):
    def test_retail_archive_roots_are_canonical(self):
        self.assertEqual(S.DEFAULT_SDK, "4.0")
        self.assertEqual(S.ARCHIVES, Path("C:/Temp/PSYQ/psyq-400/PSX/LIB"))
        self.assertEqual(S.SDK410, Path("C:/Temp/PSYQ/psyq-410/PSX/LIB"))
        registry = json.loads((Path(__file__).resolve().parents[2]
                               / "configs/sdk_link.json").read_text())
        self.assertEqual(len(registry), 140)
        self.assertEqual(collections.Counter(
            spec.get("sdk", S.DEFAULT_SDK) for spec in registry.values()),
            {"4.0": 66, "4.1": 74})

    def test_overlay_layout_rejects_unsupported_and_overlapping_regions(self):
        for regions in ({'.rdata': (0x1000,4)},
                        {'.text': (0x1000,4),'.sbss': (0x2000,4)},
                        {'.text': (0x1000,4),'.rdata': (0xffc,4)},
                        {'.text': (0x1000,4),'.data': (0x1000,4)}):
            with self.subTest(regions=regions), self.assertRaises(ValueError):
                S.native_link('sample',b'unused',regions,{},overlay_text=True)
        with self.assertRaises(ValueError):
            S.native_link('sample',b'unused',{'.text':(0x1000,4)},{},overlay_text='yes')

    def test_compiler_named_section_is_safe_linker_input(self):
        with tempfile.TemporaryDirectory() as temporary:
            folder = Path(temporary)
            (folder/'sample.cpe').write_bytes(b'CPE\x01' + self.chunk(0x80010000, b'abcd') + b'\x00')
            (folder/'sample.map').write_text('map')
            with patch.object(S.subprocess, 'run', return_value=SimpleNamespace(returncode=0, stdout='0 error(s)', stderr='')):
                blocks, _ = S.native_link('sample', b'original object',
                    {'.text.vid_startup': (0x80010000, 4)}, {}, output_dir=folder)
            self.assertEqual(blocks, {'.text.vid_startup': b'abcd'})
            self.assertIn('section .text.vid_startup,sdk_0', (folder/'sample.lnk').read_text())
            for name in ('.text\ninclude bad.obj', '../text', '.text,other', 'text'):
                with self.subTest(name=name), self.assertRaisesRegex(ValueError, 'section name'):
                    S.native_link('sample', b'original object', {name: (0x80010000, 4)}, {}, output_dir=folder)

    def test_prefix_output_collision_rejected_before_overwrite(self):
        with tempfile.TemporaryDirectory() as temporary:
            folder = Path(temporary)
            prefix = folder / 'sample.obj'
            prefix.write_bytes(b'prefix object')
            with self.assertRaisesRegex(ValueError, 'cannot alias'):
                S.native_link('sample', b'compiled object', {}, {},
                              prefix_objects=[prefix], output_dir=folder)
            self.assertEqual(prefix.read_bytes(), b'prefix object')

    def chunk(self, address, payload):
        return b'\x01' + struct.pack('<II', address, len(payload)) + payload

    def test_cpe_exact_coverage(self):
        data = b'CPE\x01' + self.chunk(0x1000, b'ab') + self.chunk(0x1002, b'cd') + b'\x00'
        self.assertEqual(S.cpe_bytes(data, 0x1000, 4), b'abcd')

    def test_cpe_disjoint_sections_exact_coverage(self):
        data = b'CPE\x01' + self.chunk(0x2000, b'DATA') + self.chunk(0x1000, b'CODE') + b'\x00'
        self.assertEqual(S.cpe_regions(data, {'.text': (0x1000, 4), '.rdata': (0x2000, 4)}),
                         {'.text': b'CODE', '.rdata': b'DATA'})

    def test_cpe_rejects_unplaced_and_uncovered_sections(self):
        data = b'CPE\x01' + self.chunk(0x1000, b'CODE') + self.chunk(0x2000, b'DATA') + b'\x00'
        for regions in ({'.text': (0x1000, 4)},
                        {'.text': (0x1000, 4), '.rdata': (0x2000, 8)},
                        {'.text': (0x1000, 4), '.overlap': (0x1002, 4)}):
            with self.subTest(regions=regions), self.assertRaises(ValueError):
                S.cpe_regions(data, regions)

    def test_cpe_rejects_truncated_chunk_header(self):
        with self.assertRaises(ValueError):
            S.cpe_bytes(b'CPE\x01\x01\x00', 0x1000, 4)

    def test_cpe_rejects_overlap_gap_and_outside(self):
        for address in (0x1001, 0x1003, 0x0fff):
            data = b'CPE\x01' + self.chunk(0x1000, b'ab') + self.chunk(address, b'cd') + b'\x00'
            with self.subTest(address=address), self.assertRaises(ValueError):
                S.cpe_bytes(data, 0x1000, 4)

    def test_cpe_rejects_missing_end_trailing_data_and_unknown_tag(self):
        data = b'CPE\x01' + self.chunk(0x1000, b'abcd')
        for suffix in (b'', b'\x00x', b'\xff\x00'):
            with self.subTest(suffix=suffix), self.assertRaises(ValueError):
                S.cpe_bytes(data + suffix, 0x1000, 4)

    def test_cpe_rejects_truncated_metadata(self):
        with self.assertRaises(ValueError):
            S.cpe_bytes(b'CPE\x01\x03\x00', 0x1000, 4)

    def test_member_requires_self_contained_single_export(self):
        obj = {'sections': {1: '.text'}, 'xrefs': [], 'bss': {},
               'code': {1: b'1234'},
               'xdefs': [{'name': 'entry', 'sect': 1, 'off': 0}]}
        self.assertEqual(S.member_text(obj, 'entry'), b'1234')
        invalid = [
            {'xrefs': ['external']}, {'bss': {2: 4}},
            {'code': {1: b'1234', 2: b'data'}},
            {'xdefs': [{'name': 'entry', 'sect': 1, 'off': 4}]},
            {'code': {1: b'123'}}, {'code': {1: b''}},
            {'sections': {1: '.text', 2: '.text'}},
        ]
        for mutation in invalid:
            candidate = copy.deepcopy(obj)
            candidate.update(mutation)
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                S.member_text(candidate, 'entry')

    def test_member_external_bindings_are_exact(self):
        obj = {'sections': {1: '.text'}, 'xrefs': ['callee'], 'bss': {},
               'code': {1: b'1234'},
               'xdefs': [{'name': 'entry', 'sect': 1, 'off': 0}]}
        self.assertEqual(S.member_text(obj, 'entry', ['callee']), b'1234')
        for declared in ([], ['other'], ['callee', 'extra'], ['callee', 'callee']):
            with self.subTest(declared=declared), self.assertRaises(ValueError):
                S.member_text(obj, 'entry', declared)

    def test_multi_entry_member_requires_complete_aligned_exports(self):
        obj = {'sections': {1: '.text'}, 'xrefs': [], 'bss': {},
               'code': {1: b'12345678'},
               'xdefs': [{'name': 'second', 'sect': 1, 'off': 4},
                         {'name': 'first', 'sect': 1, 'off': 0}]}
        names = ['first', 'second']
        self.assertEqual(S.member_text(obj, 'first', exports=names), b'12345678')
        for declared in (None, ['first'], ['first', 'second', 'third'],
                         ['first', 'second', 'second']):
            with self.subTest(declared=declared), self.assertRaises(ValueError):
                S.member_text(obj, 'first', exports=declared)
        for offset in (-4, 0, 2, 8):
            candidate = copy.deepcopy(obj)
            candidate['xdefs'][0]['off'] = offset
            with self.subTest(offset=offset), self.assertRaises(ValueError):
                S.member_text(candidate, 'first', exports=names)
        with self.assertRaises(ValueError):
            S.member_text(obj, 'second', exports=names)
        candidate = copy.deepcopy(obj)
        candidate['xdefs'][0]['sect'] = 2
        with self.assertRaises(ValueError):
            S.member_text(candidate, 'first', exports=names)

    def test_function_address_requires_unique_function_binding(self):
        symbols = 'callee = 0x80010000; // type:func\n'
        self.assertEqual(S.function_address(symbols, 'callee'), 0x80010000)
        for text, name in (
            (symbols, 'missing'), (symbols, 'callee\nevil'),
            (symbols.replace('type:func', 'type:data'), 'callee'),
            (symbols + 'callee = 0x80010004; // type:func\n', 'callee'),
        ):
            with self.subTest(text=text, name=name), self.assertRaises(ValueError):
                S.function_address(text, name)

    def test_prefix_member_requires_explicit_opt_in(self):
        obj = {'sections': {1: '.text'}, 'xrefs': [], 'bss': {},
               'code': {1: b'HEADcode'},
               'xdefs': [{'name': 'entry', 'sect': 1, 'off': 4}]}
        with self.assertRaises(ValueError):
            S.member_text(obj, 'entry')
        self.assertEqual(S.member_text(obj, 'entry', allow_prefix=True), b'HEADcode')

    def test_initialized_sections_require_exact_placement(self):
        obj = {'sections': {1: '.text', 2: '.rdata'}, 'xrefs': [], 'bss': {},
               'code': {1: b'CODE', 2: b'DATA'},
               'xdefs': [{'name': 'entry', 'sect': 1, 'off': 0}]}
        self.assertEqual(S.member_text(obj, 'entry', data_sections={'.rdata': 4}), b'CODE')
        for placement in ({}, {'.data': 4}, {'.rdata': 8}, {'.rdata': 4, '.data': 4}):
            with self.subTest(placement=placement), self.assertRaises(ValueError):
                S.member_text(obj, 'entry', data_sections=placement)

    def test_data_binding_rejects_functions_missing_and_ambiguous_names(self):
        self.assertEqual(S.data_address('pointer = 0x1000; //\n', 'pointer'), 0x1000)
        for symbols in ('pointer = 0x1000; // type:func\n', '',
                        'pointer = 0x1000; //\npointer = 0x1004; //\n'):
            with self.assertRaises(ValueError):
                S.data_address(symbols, 'pointer')

    def test_data_bridge_preserves_labels_and_requires_exact_boundaries(self):
        source = ('dlabel first\n /* 0 00001000 */ .word 1\nenddlabel first\n'
                  'dlabel second\n /* 4 00001004 */ .word 2\nenddlabel second\n'
                  'dlabel after\n /* 8 00001008 */ .word 3\nenddlabel after\n')
        result = S.data_bridge(source, [(0x1000, 8, 'member.bin')])
        self.assertIn('dlabel first\n    .incbin "member.bin", 0, 4\nenddlabel first', result)
        self.assertIn('dlabel second\n    .incbin "member.bin", 4, 4\nenddlabel second', result)
        self.assertIn('/* 8 00001008 */ .word 3', result)
        for regions in ([(0x1001, 7, 'member.bin')], [(0x1000, 7, 'member.bin')],
                        [(0x1000, 8, 'member.bin'), (0x1004, 4, 'other.bin')]):
            with self.subTest(regions=regions), self.assertRaises(ValueError):
                S.data_bridge(source, regions)

    def test_data_bridge_partial_label_requires_explicit_contiguous_words(self):
        source = ('dlabel table\n'
                  ' /* 0 00001000 01000000 */ .word 1\n'
                  ' /* 4 00001004 02000000 */ .word 2\n'
                  ' /* 8 00001008 03000000 */ .word 3\n'
                  ' /* C 0000100C 04000000 */ .word 4\n'
                  'enddlabel table\n')
        result = S.data_bridge(source, [(0x1004, 8, 'member.bin')])
        self.assertIn('dlabel table', result)
        self.assertIn('enddlabel table', result)
        self.assertIn('.word 1', result)
        self.assertIn('.word 4', result)
        self.assertIn('.incbin "member.bin", 0, 4', result)
        self.assertIn('.incbin "member.bin", 4, 4', result)
        for invalid in (source.replace('00001008', '0000100C'),
                        source.replace('.word 3', '.word 3, 4'),
                        source.replace('03000000', '')):
            with self.assertRaises(ValueError):
                S.data_bridge(invalid, [(0x1004, 8, 'member.bin')])
        with self.assertRaises(ValueError):
            S.data_bridge(source, [(0x1004, 8, 'a.bin'), (0x1008, 4, 'b.bin')])

    def test_data_bridge_preserves_unowned_literal_tail_bytes(self):
        source = ('dlabel table\n /* 0 00001000 02000304 */ .word 0x04030002\nenddlabel table\n')
        result = S.data_bridge(source,[(0x1000,1,'array.bin')])
        self.assertIn('.incbin "array.bin", 0, 1\n    .byte 0x00,0x03,0x04',result)
        for bad in (source.replace('0x04030002','address_symbol'),
                    source.replace('0x04030002','0x00000002')):
            with self.assertRaises(ValueError):
                S.data_bridge(bad,[(0x1000,1,'array.bin')])

    def test_prefix_owner_must_be_present_unique_and_contiguous(self):
        previous = {'entry': 'first', 'va': 0x1000, 'size': 4,
                    'exports': [{'name': 'first', 'off': 0}]}
        following = {'entry': 'second', 'va': 0x1004, 'size': 8,
                     'exports': [{'name': 'second', 'off': 4}],
                     'prefix_owner': 'first', 'linked': b'HEADcode'}
        self.assertEqual(S.prefix_tails([previous, following]), {'first': following})
        for mutation in ({'prefix_owner': None}, {'prefix_owner': 'missing'}, {'va': 0x1008}):
            invalid = dict(following, **mutation)
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                S.prefix_tails([previous, invalid])
        with self.assertRaises(ValueError):
            S.prefix_tails([previous, following, dict(following, entry='third')])
        with self.assertRaises(ValueError):
            S.prefix_tails([dict(previous, prefix_owner='second'), following])

    def test_prefix_bytes_must_match_old_scaffold_tail(self):
        exports = [{'name': 'first', 'off': 0}]
        tail = {'va': 0x1004, 'exports': [{'off': 4}], 'linked': b'HEADcode'}
        with patch.object(S, 'scaffold_bytes', return_value=(0x1000, b'bodyHEAD')):
            S.validate_scaffold_extents(exports, 0x1000, 4, {'first': tail})
        for data in (b'bodyFAIL', b'bodyHEADmore'):
            with patch.object(S, 'scaffold_bytes', return_value=(0x1000, data)):
                with self.assertRaises(ValueError):
                    S.validate_scaffold_extents(exports, 0x1000, 4, {'first': tail})

    def test_scaffold_extent_preserves_surrounding_data(self):
        exports = [{'name': 'first', 'off': 0}, {'name': 'second', 'off': 4}]
        with patch.object(S, 'scaffold_bytes', side_effect=[(0x1000, b'abcd'), (0x1004, b'efgh')]):
            S.validate_scaffold_extents(exports, 0x1000, 8)
        for second in ((0x1004, b'efghTAIL'), (0x1008, b'efgh')):
            with patch.object(S, 'scaffold_bytes', side_effect=[(0x1000, b'abcd'), second]):
                with self.assertRaises(ValueError):
                    S.validate_scaffold_extents(exports, 0x1000, 8)

    def test_local_label_aliases_preserve_only_verified_offsets(self):
        self.assertEqual(S.local_label_aliases('  .L80001004:\n', 'entry', 0x80001000, 8),
                         '.set .L80001004, entry + 4\n')
        for source in ('.L80000FFC:\n', '.L8000100C:\n', '.L80001002:\n'):
            with self.subTest(source=source), self.assertRaises(ValueError):
                S.local_label_aliases(source, 'entry', 0x80001000, 8)

    def test_owned_prefix_labels_preserve_global_data_and_jump_names(self):
        source = ' alabel D_80001010\n jlabel .L80001014\n .L80001018:\n'
        self.assertEqual(S.local_label_aliases(source, 'entry', 0x80001000, 32),
                         '.global D_80001010\n.set D_80001010, entry + 16\n'
                         '.global .L80001014\n.set .L80001014, entry + 20\n'
                         '.set .L80001018, entry + 24\n')
        with self.assertRaises(ValueError):
            S.local_label_aliases(source, 'entry', 0x80001000, 8)


class BssTests(unittest.TestCase):
    def test_single_byte_source_payload_preserves_neighbor_padding(self):
        source = ('dlabel flag\n /* 0 00001000 */ .byte 0\n'
                  ' /* 1 00001001 */ .byte 0\n /* 2 00001002 */ .byte 0\n'
                  ' /* 3 00001003 */ .byte 0\nenddlabel flag\n')
        result = S.data_bridge(source, [(0x1000, 1, 'flag.bin')])
        self.assertIn('.incbin "flag.bin", 0, 1', result)
        self.assertIn('/* 1 00001001 */ .byte 0', result)
        self.assertEqual(result.count('.byte 0'), 3)
        with self.assertRaises(ValueError):
            S.data_bridge(source.replace('00001000', '00001001'), [(0x1000, 1, 'flag.bin')])

    def test_internal_prefix_owner_still_requires_final_extent_validation(self):
        exports = [{'name': 'public', 'off': 0}]
        with patch.object(S, 'scaffold_bytes', return_value=(0x1004, b'bodyTAIL')):
            with self.assertRaises(ValueError):
                S.partition_entries(exports, ['func_00001004'], 0x1000, 8)
            entries = S.partition_entries(exports, ['func_00001004'], 0x1000, 8,
                                           {'func_00001004'})
        with patch.object(S, 'scaffold_bytes', side_effect=[(0x1000, b'head'), (0x1004, b'bodyTAIL')]):
            with self.assertRaises(ValueError):
                S.validate_scaffold_extents(entries, 0x1000, 8)

    def test_data_bridge_combines_partial_words_and_whole_halfword_objects(self):
        source = ('dlabel header\n /* 0 00001000 01000000 */ .word 1\n'
                  ' /* 4 00001004 02000000 */ .word 2\nenddlabel header\n'
                  'dlabel shorts\n /* 8 00001008 */ .short 3, 4\nenddlabel shorts\n'
                  'dlabel after\n /* C 0000100C 05000000 */ .word 5\nenddlabel after\n')
        result = S.data_bridge(source, [(0x1004, 8, 'member.bin')])
        self.assertIn('.word 1', result)
        self.assertIn('.word 5', result)
        self.assertIn('.incbin "member.bin", 0, 4', result)
        self.assertIn('dlabel shorts\n    .incbin "member.bin", 4, 4\nenddlabel shorts', result)
        with self.assertRaises(ValueError):
            S.data_bridge(source, [(0x1004, 6, 'member.bin')])

    def test_data_bridge_rejects_nonpositive_regions(self):
        for size in (0, -4):
            with self.assertRaises(ValueError):
                S.data_bridge('', [(0x1000, size, 'member.bin')])

    def test_initialized_exports_require_declaration_and_section_bounds(self):
        obj = {'sections': {1: '.text', 2: '.data'}, 'xrefs': [], 'bss': {},
               'code': {1: b'CODE', 2: b'DATA'},
               'xdefs': [{'name': 'entry', 'sect': 1, 'off': 0},
                         {'name': 'variable', 'sect': 2, 'off': 0}]}
        self.assertEqual(S.member_text(obj, 'entry', data_sections={'.data': 4},
                                       data_exports=['variable']), b'CODE')
        for names in ([], ['other'], ['variable', 'variable']):
            with self.subTest(names=names), self.assertRaises(ValueError):
                S.member_text(obj, 'entry', data_sections={'.data': 4}, data_exports=names)
        obj['xdefs'][1]['off'] = 4
        with self.assertRaises(ValueError):
            S.member_text(obj, 'entry', data_sections={'.data': 4}, data_exports=['variable'])

    def test_internal_entries_require_exact_scaffold_addresses_and_bounds(self):
        exports = [{'name': 'public', 'off': 0}]
        with patch.object(S, 'scaffold_bytes', return_value=(0x1004, b'CODE')):
            entries = S.partition_entries(exports, ['func_00001004'], 0x1000, 8)
            self.assertEqual(entries[1], {'name': 'func_00001004', 'off': 4, 'internal': True})
            for names, size in ((['wrong_name'], 8), (['func_00001008'], 8),
                                (['func_00001004'], 4), (['func_00001004', 'func_00001004'], 8)):
                with self.subTest(names=names, size=size), self.assertRaises(ValueError):
                    S.partition_entries(exports, names, 0x1000, size)
        with patch.object(S, 'scaffold_bytes', return_value=(0x1000, b'CODE')):
            with self.assertRaises(ValueError):
                S.partition_entries(exports, ['func_00001000'], 0x1000, 8)

    def test_fixed_common_keeps_original_size_separate_from_private_bss(self):
        obj = {'sections': {1: '.text', 2: '.bss'}, 'xrefs': [], 'bss': {2: 16},
               'code': {1: b'CODE', 2: bytes(16)},
               'xdefs': [{'name': 'entry', 'sect': 1, 'off': 0},
                         {'name': 'common', 'sect': 2, 'off': 0, 'bss': 4}]}
        self.assertEqual(S.member_text(obj, 'entry', bss_sections={'.bss': 16},
                                       fixed_commons={'common': 4}), b'CODE')
        with self.assertRaises(ValueError):
            S.member_text(obj, 'entry', bss_sections={'.bss': 16}, fixed_commons={'common': 8})
        with self.assertRaises(ValueError):
            S.member_text(obj, 'entry', bss_sections={'.bss': 16}, bss_exports=['common'],
                          fixed_commons={'common': 4})

    def test_fixed_common_participates_in_placement_overlap_checks(self):
        registry = {'entry': {'bss_sections': {'.bss': {'va': '0x1000', 'size': 16}},
                              'common_symbols': {'common': {'va': '0x1010', 'size': 4}}}}
        self.assertEqual(S.bss_placements(registry, 0x1000, 0x1020),
                         [(0x1000, 16, 'entry', '.bss'), (0x1010, 4, 'entry_common', '.bss')])
        registry['entry']['common_symbols']['common']['va'] = '0x100c'
        with self.assertRaises(ValueError):
            S.bss_placements(registry, 0x1000, 0x1020)

    def test_regions_require_bounds_alignment_and_no_overlap(self):
        registry = {'first': {'bss_sections': {'.bss': {'va': '0x1000', 'size': 16}}}}
        self.assertEqual(S.bss_placements(registry, 0x1000, 0x1020), [(0x1000, 16, 'first', '.bss')])
        for region in ({'va': '0xffc', 'size': 4}, {'va': '0x1001', 'size': 4},
                       {'va': '0x1010', 'size': 20}, {'va': '0x1000', 'size': 0},
                       {'va': '0x1000', 'size': True}):
            with self.subTest(region=region), self.assertRaises(ValueError):
                S.bss_placements({'first': {'bss_sections': {'.bss': region}}}, 0x1000, 0x1020)
        registry['second'] = {'bss_sections': {'.sbss': {'va': '0x100c', 'size': 4}}}
        with self.assertRaises(ValueError):
            S.bss_placements(registry, 0x1000, 0x1020)

    def test_common_exports_need_complete_declarations(self):
        obj = {'sections': {1: '.text', 2: '.bss'}, 'xrefs': [], 'bss': {2: 16},
               'code': {1: b'CODE', 2: bytes(16)},
               'xdefs': [{'name': 'entry', 'sect': 1, 'off': 0}]}
        self.assertEqual(S.member_text(obj, 'entry', bss_sections={'.bss': 16}), b'CODE')
        with self.assertRaises(ValueError):
            S.member_text(obj, 'entry')
        obj['xdefs'].append({'name': 'common', 'sect': 2, 'off': 0, 'bss': 4})
        self.assertEqual(S.member_text(obj, 'entry', bss_sections={'.bss': 20}, bss_exports=['common']), b'CODE')
        with self.assertRaises(ValueError):
            S.member_text(obj, 'entry', bss_sections={'.bss': 16}, bss_exports=['common'])
        with self.assertRaises(ValueError):
            S.member_text(obj, 'entry', bss_sections={'.bss': 20})


if __name__ == '__main__':
    unittest.main()
