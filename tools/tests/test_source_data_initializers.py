"""Do not silently turn padding or an inaccurate header into a table field."""
import sys
from pathlib import Path
import unittest
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import source_data_initializers as T


class SourceDataInitializerTests(unittest.TestCase):
    def test_padding_is_native_not_a_fake_field(self):
        self.assertEqual(T.aggregate_rows(b'\x01\0\0\0', 4,
                         [('unsigned char', 0, 1, False)]), ['    { 1 },'])
        with self.assertRaises(ValueError):
            T.aggregate_rows(b'\x01\0\x02\0', 4, [('unsigned char', 0, 1, False)])

    def test_field_ranges_cannot_overlap_or_overrun(self):
        for fields in [[('int', 1, 1, False)],
                       [('short', 0, 1, False), ('short', 1, 1, False)]]:
            with self.assertRaises(ValueError):
                T.aggregate_rows(bytes(4), 4, fields)

    def test_text_table_uses_all_retail_fields(self):
        _, fields = T.struct_layout('recon/source/gen/structs_minitext.h', 'TextDataStruct')
        self.assertEqual(fields, [('int', 0, 1, False), ('unsigned char', 4, 1, False),
                                 ('unsigned char', 5, 1, False), ('int', 8, 1, False)])


if __name__ == '__main__':
    unittest.main()
