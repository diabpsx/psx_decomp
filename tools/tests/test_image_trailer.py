from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from image_trailer import decode, encode, map_extents, serialize_runtime, runtime_segments


class ImageTrailerTests(unittest.TestCase):
    def test_only_explicit_final_trailer_is_excluded(self):
        rows = [(0, 'c', 'main'), (8, 'bin', 'diabpsx_checksum')]
        self.assertEqual(runtime_segments(rows, 12), (rows[:1], 8))
        for bad, end in ((rows, 16), (rows[:1], 12), ([], 12),
                         ([(0, 'bin', 'other')] + rows[1:], 12),
                         ([(8, 'sdata', 'bad')] + rows[1:], 12)):
            with self.subTest(rows=bad), self.assertRaises(ValueError):
                runtime_segments(bad, end)

    def test_runtime_serialization_checks_complete_bss(self):
        payload = bytes(range(8))
        self.assertEqual(serialize_runtime(payload + bytes(12), 8, 12), encode(payload))
        for offset in range(12):
            bss = bytearray(12)
            bss[offset] = 1
            with self.subTest(offset=offset), self.assertRaises(ValueError):
                serialize_runtime(payload + bss, 8, 12)
        # The historical scaffold copied the file trailer over the first BSS word.
        with self.assertRaises(ValueError):
            serialize_runtime(encode(payload) + bytes(8), 8, 12)

    def test_runtime_extent_is_exact(self):
        for size in (0, -4, 3, True):
            with self.subTest(size=size), self.assertRaises(ValueError):
                serialize_runtime(bytes(20), 8, size)
            with self.subTest(payload=size), self.assertRaises(ValueError):
                serialize_runtime(bytes(20), size, 12)
        for size in (8, 16, 19, 21, 24):
            with self.subTest(length=size), self.assertRaises(ValueError):
                serialize_runtime(bytes(size), 8, 12)

    def test_map_regions_must_be_unique_consistent_and_contiguous(self):
        small = ' 8011C604 8011CADF 000004DC 00000000 sbss .sbss\n'
        large = ' 8011CAE0 80139BF3 0001D114 00000000 bss .bss\n'
        self.assertEqual(map_extents(small + large), (0x10C604, 0x1D5F0))
        for bad in (small, large, small + small + large,
                    small + large.replace('8011CAE0', '8011CAE4').replace('0001D114', '0001D110'),
                    small.replace('000004DC', '000004D8') + large):
            with self.subTest(text=bad), self.assertRaises(ValueError):
                map_extents(bad)

    def test_exact_additive_round_trip(self):
        payload = bytes(range(8))
        data = encode(payload)
        self.assertEqual(data[-4:], b'\x1c\x00\x00\x00')
        self.assertEqual(decode(data, 8), (payload, 28))

    def test_corruption_or_extra_data_is_rejected(self):
        data = encode(bytes(range(8)))
        for bad in (b'\xff' + data[1:], data[:-1], data + b'\x00', data[:-4] + bytes(4)):
            with self.subTest(data=bad), self.assertRaises(ValueError):
                decode(bad, 8)

    def test_invalid_payload_boundaries_are_rejected(self):
        for size in (0, -4, 3, True):
            with self.subTest(size=size), self.assertRaises(ValueError):
                decode(bytes(12), size)
        with self.assertRaises(ValueError):
            encode(bytes(3))
        with self.assertRaises(ValueError):
            encode(b'')


if __name__ == '__main__':
    unittest.main()
