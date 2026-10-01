from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from sdk_layout import carrier_parts


class SDKLayoutTests(unittest.TestCase):
    def test_carriers_preserve_surroundings_not_member(self):
        retail = bytes(range(16))
        layout = {'.text': (0x80010000, 16), '.sbss': (0x80110000, 12)}
        owned = {'.text': (0x80010004, 8), '.sbss': (0x80110004, 4)}
        parts, expected = carrier_parts(layout, owned, retail)
        self.assertEqual(parts['.text'], (retail[:4], retail[12:]))
        self.assertEqual(parts['.sbss'], (bytes(4), bytes(4)))
        self.assertEqual(expected, {'.text': retail, '.sbss': bytes(12)})

    def test_unowned_section_remains_complete_scaffold(self):
        parts, expected = carrier_parts({'.ctors': (0x80010000, 8)}, {}, bytes(range(8)))
        self.assertEqual(parts['.ctors'], (bytes(range(8)), b''))

    def test_out_of_bounds_and_missing_section_fail(self):
        for owned in ({'.other': (0x80010000, 4)}, {'.text': (0x8000FFFF, 4)},
                      {'.text': (0x80010004, 16)}):
            with self.subTest(owned=owned), self.assertRaises(ValueError):
                carrier_parts({'.text': (0x80010000, 16)}, owned, bytes(16))
        with self.assertRaises(ValueError):
            carrier_parts({'.text': (0x80010000, 20)}, {}, bytes(16))


if __name__ == '__main__':
    unittest.main()
