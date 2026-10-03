from pathlib import Path
import struct
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import sdk_archive_inventory as I


class ArchiveInventoryTests(unittest.TestCase):
    def object(self, code):
        return (b'LNK\x02\x10' + struct.pack('<HHB', 1, 0, 4) + b'\x05.text'
                + b'\x06\x01\x00\x02' + struct.pack('<H', len(code)) + code
                + b'\x0c' + struct.pack('<HHI', 7, 1, 0) + b'\x06sample\x00')

    def test_screen_is_exact_before_native_link(self):
        for code, same in ((bytes(4), True), (bytes(8), False), (b'\x01\x00\x00\x00', False)):
            with patch.object(I, 'oracle', return_value=(0x80010000, bytes(4))):
                self.assertEqual(I.screen_member(self.object(code), ['sample'])[0]['candidate'], same)

    def test_unparsed_object_cannot_be_a_candidate(self):
        with self.assertRaises(I.P.Desync):
            I.screen_member(self.object(bytes(4)) + b'\xff', ['sample'])

    def test_missing_export_cannot_be_a_candidate(self):
        with self.assertRaises(ValueError):
            I.screen_member(self.object(bytes(4)), ['other'])


if __name__ == '__main__':
    unittest.main()
