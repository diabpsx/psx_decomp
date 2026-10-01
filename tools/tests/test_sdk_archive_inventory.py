from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import sdk_archive_inventory as I


class ArchiveInventoryTests(unittest.TestCase):
    def object(self, code):
        return {'consumed': 4, 'sections': {1: '.text'}, 'code': {1: code},
                'xdefs': [{'name': 'sample', 'sect': 1, 'off': 0}],
                'locals': [], 'patches': []}

    def test_screen_is_exact_before_native_link(self):
        for code, same in ((bytes(4), True), (bytes(8), False), (b'\x01\x00\x00\x00', False)):
            with patch.object(I.P, 'parse_obj', return_value=self.object(code)), \
                 patch.object(I, 'oracle', return_value=(0x80010000, bytes(4))):
                self.assertEqual(I.screen_member(b'LNK\x02', ['sample'])[0]['candidate'], same)

    def test_unparsed_object_cannot_be_a_candidate(self):
        with patch.object(I.P, 'parse_obj', return_value=self.object(bytes(4))), self.assertRaises(ValueError):
            I.screen_member(b'LNK\x02\xFF', ['sample'])

    def test_missing_export_cannot_be_a_candidate(self):
        with patch.object(I.P, 'parse_obj', return_value=self.object(bytes(4))), self.assertRaises(ValueError):
            I.screen_member(b'LNK\x02', ['other'])


if __name__ == '__main__':
    unittest.main()
