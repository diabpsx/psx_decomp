"""Post-ASPSX section splitting preserves native relocation operators."""
from pathlib import Path
import struct
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import psyq_extract as P
import psyq_rewrite as R


def counted(value):
    value = value.encode("ascii")
    return bytes([len(value)]) + value


def section(number, name):
    return b"\x10" + struct.pack("<HHB", number, 0, 4) + counted(name)


def xdef(symbol, section_number, offset, name):
    return (b"\x0c" + struct.pack("<HHI", symbol, section_number, offset)
            + counted(name))


class PsyqRewriteTests(unittest.TestCase):
    def object(self, section_name=".sdata"):
        expression = b"\x2c\x04" + struct.pack("<H", 2) + b"\x00" + struct.pack("<I", 4)
        debug_def = (b"\x40" + struct.pack("<HIHHI", 2, 0, 2, 4, 0)
                     + counted("first"))
        return (b"LNK\x02" + section(1, ".text") + section(2, section_name)
                + b"\x06\x02\x00\x02\x08\x00ABCDEFGH"
                + xdef(10, 2, 0, "first") + xdef(11, 2, 4, "second")
                + b"\x12" + struct.pack("<HI", 2, 4) + counted("local_second")
                + debug_def
                + b"\x06\x01\x00\x02\x04\x00\0\0\0\0"
                + b"\x0a\x1e\x00\x00" + expression + b"\x00")

    def test_split_preserves_text_and_retargets_section_expressions(self):
        pieces = [{"name": ".sdata.first", "offset": 0, "size": 4},
                  {"name": ".sdata.second", "offset": 4, "size": 4}]
        rewritten = R.split_section(self.object(), ".sdata", pieces)
        obj = P.parse_obj_complete(rewritten)
        section_ids = {name: number for number, name in obj["sections"].items()}
        self.assertEqual(obj["code"][section_ids[".sdata.first"]], b"ABCD")
        self.assertEqual(obj["code"][section_ids[".sdata.second"]], b"EFGH")
        self.assertEqual(obj["code"][section_ids[".text"]], b"\0\0\0\0")
        self.assertEqual([(row["sect"], row["off"]) for row in obj["xdefs"]],
                         [(section_ids[".sdata.first"], 0),
                          (section_ids[".sdata.second"], 0)])
        self.assertEqual((obj["locals"][0]["sect"], obj["locals"][0]["off"]),
                         (section_ids[".sdata.second"], 0))
        expected = (b"\x2c\x04" + struct.pack("<H", section_ids[".sdata.second"])
                    + b"\x00\0\0\0\0").hex()
        self.assertEqual(obj["patches"][0]["expr"], expected)

    def test_unambiguous_final_one_past_expression_is_preserved(self):
        old = b"\x2c\x04\x02\x00\x00\x04\x00\x00\x00"
        new = b"\x2c\x04\x02\x00\x00\x08\x00\x00\x00"
        raw = self.object().replace(old, new, 1)
        pieces = [{"name": ".sdata.first", "offset": 0, "size": 4},
                  {"name": ".sdata.second", "offset": 4, "size": 4}]
        obj = P.parse_obj_complete(R.split_section(raw, ".sdata", pieces))
        ids = {name: number for number, name in obj["sections"].items()}
        expected = (b"\x2c\x04" + struct.pack("<H", ids[".sdata.second"])
                    + b"\x00\x04\0\0\0").hex()
        self.assertEqual(obj["patches"][0]["expr"], expected)

    def test_split_requires_a_complete_cover(self):
        with self.assertRaisesRegex(ValueError, "suffix"):
            R.split_section(self.object(), ".sdata",
                            [{"name": ".sdata.first", "offset": 0, "size": 4}])

    def test_initialized_data_may_keep_its_base_section(self):
        pieces = [{"name": ".data", "offset": 0, "size": 4},
                  {"name": ".bss.tail", "offset": 4, "size": 4}]
        obj = P.parse_obj_complete(R.split_section(self.object(".data"), ".data", pieces))
        ids = {name: number for number, name in obj["sections"].items()}
        self.assertEqual(obj["code"][ids[".data"]], b"ABCD")
        self.assertEqual(obj["code"][ids[".bss.tail"]], b"EFGH")

    def test_initialized_data_may_split_into_named_banks(self):
        pieces = [{"name": ".data.second", "offset": 0, "size": 4},
                  {"name": ".data.first", "offset": 4, "size": 4}]
        obj = P.parse_obj_complete(R.split_section(self.object(".data"), ".data", pieces))
        ids = {name: number for number, name in obj["sections"].items()}
        self.assertEqual(obj["code"][ids[".data.first"]], b"EFGH")
        self.assertEqual(obj["code"][ids[".data.second"]], b"ABCD")

    def test_readonly_ranges_may_be_reordered_by_destination(self):
        pieces = [{"name": ".rdata.second", "offset": 0, "size": 4},
                  {"name": ".rdata.first", "offset": 4, "size": 4}]
        obj = P.parse_obj_complete(R.split_section(self.object(".rdata"), ".rdata", pieces))
        ids = {name: number for number, name in obj["sections"].items()}
        self.assertEqual(obj["code"][ids[".rdata.first"]], b"EFGH")
        self.assertEqual(obj["code"][ids[".rdata.second"]], b"ABCD")

    def test_split_may_drop_an_explicit_zero_gap(self):
        raw = self.object().replace(b"ABCDEFGH", b"ABC\0EFGH")
        pieces = [{"name": ".sdata.first", "offset": 0, "size": 3},
                  {"name": ".sdata.second", "offset": 4, "size": 4}]
        obj = P.parse_obj_complete(R.split_section(raw, ".sdata", pieces, True))
        ids = {name: number for number, name in obj["sections"].items()}
        self.assertEqual(obj["code"][ids[".sdata.first"]], b"ABC")
        self.assertEqual(obj["code"][ids[".sdata.second"]], b"EFGH")

    def test_patch_inside_source_section_follows_its_split_chunk(self):
        raw = self.object()
        marker = b"\x06\x02\x00\x02\x08\x00ABCDEFGH"
        expression = b"\x2c\x04\x02\x00\x00\x04\x00\x00\x00"
        raw = raw.replace(marker, marker + b"\x0a\x1e\x04\x00" + expression, 1)
        pieces = [{"name": ".sdata.first", "offset": 0, "size": 4},
                  {"name": ".sdata.second", "offset": 4, "size": 4}]
        obj = P.parse_obj_complete(R.split_section(raw, ".sdata", pieces))
        ids = {name: number for number, name in obj["sections"].items()}
        source_patch = next(row for row in obj["patches"]
                            if row["sect"] == ids[".sdata.second"])
        self.assertEqual(source_patch["off"], 0)
        expected = (b"\x2c\x04" + struct.pack("<H", ids[".sdata.second"])
                    + b"\x00\0\0\0\0").hex()
        self.assertEqual(source_patch["expr"], expected)


if __name__ == "__main__":
    unittest.main()
