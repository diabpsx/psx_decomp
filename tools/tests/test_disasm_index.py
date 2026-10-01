from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from disasm_index import symbol_coordinates, label_coordinates, resolve_label


class DisasmIndexTests(unittest.TestCase):
    table = ('00000000 g F .text.first 00000008 first\n'
             '00000000 g F .text.second 00000010 second\n'
             '00000000 g F .text.first 00000008 alias\n'
             '00000000 g *UND* 00000000 missing\n'
             '00000000 l *ABS* 00000000 file\n'
             '00000004 O *COM* 00000004 common\n')
    dump = ('Disassembly of section .text.first:\n00000000 <first>:\n'
            'Disassembly of section .text.second:\n00000000 <second>:\n')

    def test_equal_offsets_in_different_sections_remain_distinct(self):
        symbols, labels = symbol_coordinates(self.table), label_coordinates(self.dump)
        self.assertEqual(resolve_label('first', symbols, labels), ('first', '.text.first'))
        self.assertEqual(resolve_label('second', symbols, labels), ('second', '.text.second'))

    def test_same_section_alias_and_header_copy(self):
        symbols, labels = symbol_coordinates(self.table), label_coordinates(self.dump)
        self.assertEqual(resolve_label('alias', symbols, labels), ('first', '.text.first'))
        self.assertEqual(resolve_label('second_80012345', symbols, labels), ('second', '.text.second'))

    def test_nonsection_symbols_cannot_alias_code(self):
        symbols, labels = symbol_coordinates(self.table), label_coordinates(self.dump)
        for name in ('missing', 'file', 'common', 'unknown'):
            self.assertNotIn(name, symbols)
            self.assertEqual(resolve_label(name, symbols, labels), (name, None))

    def test_data_at_zero_cannot_alias_text_at_zero(self):
        symbols = symbol_coordinates(self.table + '00000000 g O .data 00000004 data_item\n')
        self.assertEqual(resolve_label('data_item', symbols, label_coordinates(self.dump)),
                         ('data_item', '.data'))


if __name__ == '__main__':
    unittest.main()
