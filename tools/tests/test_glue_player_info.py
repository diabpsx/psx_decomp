from pathlib import Path
import struct
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from gen_glue_player_info import decode


class PlayerInfoTests(unittest.TestCase):
    def fixture(self):
        image = bytearray(0x10AFF0)
        for i in range(81):
            struct.pack_into('<I4H', image, 0xBBF98 + 12*i,
                             0x8011AEAC + 4*i, i, i+81, i+162, 0)
            image[0x10AEAC+4*i:0x10AEAC+4*i+4] = b'WHA\0'
        return image

    def test_decodes_all_typed_fields(self):
        rows = decode(self.fixture())
        self.assertEqual(len(rows), 81)
        self.assertEqual(rows[-1], ('WHA', 80, 161, 242))

    def test_rejects_pointer_and_padding_changes(self):
        for offset in (0xBBF98, 0xBBF98+10):
            image = self.fixture()
            image[offset] ^= 1
            with self.assertRaises(ValueError):
                decode(image)

    def test_rejects_malformed_identifier(self):
        for offset in (0x10AEAC, 0x10AEAC+3):
            image = self.fixture()
            image[offset] = 1
            with self.assertRaises(ValueError):
                decode(image)


if __name__ == '__main__':
    unittest.main()
