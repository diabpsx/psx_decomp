from pathlib import Path
import ast
import re
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from disasm_constants import literal_dlabel_value


class DisasmConstantTests(unittest.TestCase):
    def test_instruction_normalizer_preserves_low_ram_immediates(self):
        # Load only the pure normalizer, without running the compiler-driving CLI.
        source = Path(__file__).resolve().parents[1] / 'verify_asm.py'
        tree = ast.parse(source.read_text())
        function = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == 'norm_ins')
        namespace = {'re': re, '_COP0': {}, 'literal_dlabel_value': literal_dlabel_value}
        exec(compile(ast.Module(body=[function], type_ignores=[]), str(source), 'exec'), namespace)
        norm = namespace['norm_ins']
        self.assertEqual(norm('lui $v1, %hi(D_8000001E)'), 'lui v1,32768')
        self.assertEqual(norm('lb $v0, %lo(D_8000001E)($s2)'), 'lb v0,30(s2)')
        self.assertEqual(norm('lbu $v0, %lo(D_80000034 + 0x1)($s2)'), 'lbu v0,53(s2)')
        self.assertEqual(norm('lw $v0, %lo(D_80110000 + 0x4)($s2)'), 'lw v0,0(s2)')
        self.assertNotEqual(norm('lb $v0, %lo(D_8000001E)($s2)'), norm('lb $v0,32($s2)'))

    def test_cached_pointer_field_offsets_remain_exact(self):
        self.assertEqual(literal_dlabel_value('8000001E'), 0x8000001E)
        self.assertEqual(literal_dlabel_value('80000034', 1), 0x80000035)
        self.assertNotEqual(literal_dlabel_value('8000001E'), literal_dlabel_value('80000020'))

    def test_loaded_image_addresses_keep_relocation_semantics(self):
        for address in ('80010000', '800D1D54', '80139BF8', '8015F6E8'):
            self.assertIsNone(literal_dlabel_value(address))
            self.assertIsNone(literal_dlabel_value(address, 4))

    def test_existing_fixed_literals_and_arithmetic(self):
        self.assertEqual(literal_dlabel_value('1F800000', 4), 0x1F800004)
        self.assertEqual(literal_dlabel_value('100FF'), 0x100FF)
        self.assertEqual(literal_dlabel_value('FF9D0001'), 0xFF9D0001)
        self.assertEqual(literal_dlabel_value('FFFFFFFF', 1), 0)


if __name__ == '__main__':
    unittest.main()
