from pathlib import Path
import hashlib
import json
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from instr import combine_uses as C


class CombineUsesTests(unittest.TestCase):
    def analyze(self, before, after):
        return C.analyze(';; Function target\n'+before, ';; Function target\n'+after, 'target')

    def test_deleted_set_has_its_original_source_and_uid(self):
        result = self.analyze('(note 1 0 2 "source/a.cpp" 17)\n'
                              '(insn 2 1 0 (set (reg:SI 144) (plus:SI (reg:SI 72) (reg:SI 73))) -1 (nil))',
                              '(note 2 0 3 "" NOTE_INSN_DELETED)\n'
                              '(insn 3 2 0 (use (reg:SI 144)) -1 (nil))')
        self.assertEqual(result['registers_with_lost_sets'], 1)
        row = result['registers'][0]
        self.assertEqual(row['flow_writes'][0]['uid'], 2)
        self.assertEqual(row['flow_writes'][0]['location'], {'file':'source/a.cpp', 'line':17})

    def test_surviving_partial_set_is_not_missing(self):
        before = '(insn 1 0 0 (set (reg/v:SI 144) (const_int 0)) -1 (nil))'
        after = '(insn 2 0 3 (set (subreg:QI (reg/v:SI 144) 0) (const_int 1)) -1 (nil))\n'
        after += '(insn 3 2 0 (use (reg:SI 144)) -1 (nil))'
        self.assertFalse(self.analyze(before, after)['registers'][0]['lost_all_sets'])

    def test_memory_address_is_not_a_register_write(self):
        before = '(insn 1 0 0 (set (mem:SI (reg:SI 144)) (reg:SI 72)) -1 (nil))'
        after = '(insn 2 0 0 (use (reg:SI 144)) -1 (nil))'
        row = self.analyze(before, after)['registers'][0]
        self.assertEqual(row['flow_writes'], [])
        self.assertFalse(row['lost_all_sets'])

    def test_call_argument_use_notes_are_excluded(self):
        body = '(call_insn 1 0 0 (call (mem:SI (symbol_ref:SI ("callee"))) (const_int 0)) -1 (nil) '
        body += '(expr_list (use (reg:SI 4 a0)) (nil)))'
        self.assertEqual(self.analyze(body, body)['standalone_uses'], 0)

    def test_parallel_sets_and_clobbers_stay_distinct(self):
        before = '(insn 1 0 0 (parallel[(set (reg:SI 144) (const_int 1)) (clobber (reg:SI 72))]) -1 (nil))'
        after = '(insn 2 0 3 (clobber (reg:SI 144)) -1 (nil))\n(insn 3 2 0 (use (reg:SI 144)) -1 (nil))'
        row = self.analyze(before, after)['registers'][0]
        self.assertTrue(row['lost_all_sets'])
        self.assertEqual(row['combine_writes'][0]['kind'], 'clobber')

    def test_multiple_uses_count_once_for_missing_set(self):
        before = '(insn 1 0 0 (set (reg:SI 144) (const_int 0)) -1 (nil))'
        after = '(insn 2 0 3 (use (reg:SI 144)) -1 (nil))\n(insn 3 2 0 (use (reg:SI 144)) -1 (nil))'
        result = self.analyze(before, after)
        self.assertEqual(result['standalone_uses'], 2)
        self.assertEqual(result['registers_with_lost_sets'], 1)

    def test_quoted_delimiters_and_escaped_quote(self):
        form = C.parse_form('(symbol_ref:SI ("[a](b)\\\"c"))')
        self.assertEqual(form[1][0], '"[a](b)\\\"c"')

    def test_incomplete_and_duplicate_records_fail(self):
        for text in ('(insn 1 0 0 (use (reg:SI 72))', '(insn 1 0 0 (nil)]',
                     '(insn 1 0 0 (nil))\n(insn 1 0 0 (nil))', 'nothing'):
            with self.assertRaises(ValueError):
                C.records(text)

    def test_wrong_function_fails_and_neighbor_is_not_included(self):
        text = ';; Function other\n(insn 1 0 0 (use (reg:SI 144)) -1 (nil))'
        with self.assertRaises(ValueError):
            C.analyze(text, text, 'target')
        text = ';; Function target\n(insn 1 0 0 (nil))\n'+text
        self.assertEqual(C.analyze(text, text, 'target')['standalone_uses'], 0)

    def test_wrapped_filename_note(self):
        before = '(note 1 0 2 ("source/b.cpp") 29)\n(insn 2 1 0 (set (reg:SI 144) (const_int 0)) -1 (nil))'
        row = self.analyze(before, '(insn 3 0 0 (use (reg:SI 144)) -1 (nil))')['registers'][0]
        self.assertEqual(row['flow_writes'][0]['location'], {'file':'source/b.cpp', 'line':29})

    def test_capture_receipt_rejects_mixed_or_modified_dumps(self):
        data = {'flow':b'before', 'combine':b'after'}
        receipt = {'dump_sha256':{name:hashlib.sha256(blob).hexdigest() for name,blob in data.items()}}
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)/'capture.json'
            path.write_text(json.dumps(receipt), encoding='utf-8')
            self.assertEqual(C.verify_capture(path, data), receipt)
            with self.assertRaisesRegex(ValueError, 'does not match combine'):
                C.verify_capture(path, {**data, 'combine':b'different capture'})

    def test_reload_uid_proves_stack_reference_not_slot_extent(self):
        flow=';; Function target\n(insn 1 0 0 (set (reg:SI 144) (const_int 0)) -1 (nil))'
        combine=';; Function target\n(insn 3 0 0 (use (reg:SI 144)) -1 (nil))'
        greg=';; Function target\nReloads for insn #123\n(insn 3 0 0 (use (mem/f:SI (plus:SI (reg:SI 29 sp) (const_int 120)))) -1 (nil))\nTrailing diagnostic prose'
        result=C.analyze(flow,combine,'target',greg)['registers'][0]['post_reload_uses'][0]
        self.assertEqual((result['state'],result['byte_offset'],result['mode']),('sp_relative',120,'SI'))
        self.assertNotIn('slot_size',result)

    def test_reload_accepts_commuted_and_zero_stack_addresses(self):
        for address,offset in [('(plus:SI (const_int -8) (reg:SI 29 sp))',-8),('(reg:SI 29 sp)',0)]:
            row=C.reload_use('(insn 3 0 0 (use (mem:QI '+address+')) -1 (nil))',3)
            self.assertEqual((row['state'],row['byte_offset']),('sp_relative',offset))

    def test_reload_does_not_guess_frame_pointer_or_other_memory(self):
        row=C.reload_use('(insn 3 0 0 (use (mem:SI (plus:SI (reg:SI 30 fp) (const_int 8)))) -1 (nil))',3)
        self.assertEqual(row['state'],'memory')
        self.assertNotIn('byte_offset',row)

    def test_reload_register_changed_kind_and_absent_uid(self):
        self.assertEqual(C.reload_use('',3),{'uid':3,'state':'not_present'})
        row=C.reload_use('(insn 3 0 0 (use (reg:SI 16 s0)) -1 (nil))',3)
        self.assertEqual((row['state'],row['register']),('register',16))
        row=C.reload_use('(insn 3 0 0 (set (reg:SI 16) (const_int 0)) -1 (nil))',3)
        self.assertEqual(row['state'],'not_use')

    def test_reload_duplicate_uid_is_an_error(self):
        with self.assertRaisesRegex(ValueError,'ambiguous'):
            C.reload_use('(insn 3 0 0 (use (reg:SI 16)))\n(insn 3 0 0 (use (reg:SI 17)))',3)

    def test_first_form_handles_quoted_delimiters_and_rejects_damage(self):
        text='(parallel[(use (symbol_ref:SI ("(quoted)")))])\nextra text'
        self.assertEqual(C.first_form(text),text.split('\n')[0])
        for bad in ('not an RTL form','(parallel[)','(use (reg:SI 72)'):
            with self.assertRaises(ValueError):C.first_form(bad)

    def test_capture_receipt_checks_optional_greg(self):
        data={'flow':b'before','combine':b'after','greg':b'allocated'}
        receipt={'dump_sha256':{name:hashlib.sha256(blob).hexdigest() for name,blob in data.items()}}
        with tempfile.TemporaryDirectory() as directory:
            path=Path(directory)/'capture.json';path.write_text(json.dumps(receipt),encoding='utf-8')
            self.assertEqual(C.verify_capture(path,data),receipt)
            with self.assertRaisesRegex(ValueError,'does not match greg'):
                C.verify_capture(path,{**data,'greg':b'unrelated'})


if __name__ == '__main__':
    unittest.main()
