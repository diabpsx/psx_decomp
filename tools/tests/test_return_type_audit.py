from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from return_type_audit import canonical, compare, declarations, unrecorded_compiler_thunk


class ReturnTypeTests(unittest.TestCase):
    def test_only_unrecorded_compiler_void_thunks_are_separate(self):
        void = {('FCN VOID', 0, '', '')}
        integer = {('FCN INT', 0, '', '')}
        self.assertTrue(unrecorded_compiler_thunk('_GLOBAL__I_object', void, set()))
        self.assertFalse(unrecorded_compiler_thunk('ordinary_function', void, set()))
        self.assertFalse(unrecorded_compiler_thunk('_GLOBAL__I_object', integer, set()))
        self.assertFalse(unrecorded_compiler_thunk('_GLOBAL__I_object', set(), set()))
        self.assertFalse(unrecorded_compiler_thunk('_GLOBAL__I_object', void, integer))
    def test_void_and_int_are_not_interchangeable(self):
        text = '000001: $80157000 94 Def class EXT type FCN VOID size 0 name sample\n'
        expected = declarations(text)['sample']
        self.assertTrue(compare(expected, expected)[0])
        self.assertFalse(compare(declarations(text.replace('VOID', 'INT'))['sample'], expected)[0])
        self.assertFalse(compare(set(), expected)[0])

    def test_pointer_variables_are_not_function_declarations(self):
        text = '000001: $80157000 94 Def class EXT type PTR FCN VOID size 0 name callback\n'
        self.assertEqual(declarations(text), {})

    def test_ambiguous_copies_fail_closed(self):
        a = ('FCN INT', 0, '', '')
        b = ('FCN LONG', 0, '', '')
        self.assertFalse(compare({a}, {a, b})[0])
        self.assertEqual(canonical('GetDown__C4CPad_800ab554'), 'GetDown__C4CPad')
        self.assertEqual(canonical('_._6Dialog'), '___6Dialog')


if __name__ == '__main__':
    unittest.main()
