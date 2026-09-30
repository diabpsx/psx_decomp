"""Cross-image bindings must identify unique retail function exports."""
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import gen_ld


class CrossImageSymbolTests(unittest.TestCase):
    def provisions(self, homes, symbols):
        def read(path, *args, **kwargs):
            if path.name == "cross_image_symbols.json":
                return json.dumps({"diabpsx": homes})
            return symbols
        with patch.object(Path, "exists", return_value=True), patch.object(Path, "read_text", read):
            return gen_ld.cross_image_provisions("diabpsx")

    def test_verified_export_is_provided_not_forced(self):
        result = self.provisions({"game": ["DrawInv__Fv"]},
            "DrawInv__Fv = 0x801590B4; // type:func size:0x48\n")
        self.assertEqual(result, ["PROVIDE(DrawInv__Fv = 0x801590B4); /* game retail export */"])

    def test_ambiguous_address_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "expected one"):
            self.provisions({"game": ["Fn"]},
                "Fn = 0x80140000; // type:func\nFn = 0x80150000; // type:func\n")

    def test_data_symbol_is_not_a_function(self):
        with self.assertRaisesRegex(ValueError, "expected one"):
            self.provisions({"game": ["Data"]}, "Data = 0x80140000; // size:0x4\n")

    def test_same_image_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "invalid cross-image home"):
            self.provisions({"diabpsx": ["Fn"]}, "")

    def test_unknown_image_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "invalid cross-image home"):
            self.provisions({"unknown": ["Fn"]}, "")

    def test_duplicate_binding_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "duplicate"):
            self.provisions({"game": ["Fn", "Fn"]}, "Fn = 0x80140000; // type:func\n")

    def test_invalid_symbol_syntax_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "invalid/duplicate"):
            self.provisions({"game": ["Fn); injected"]}, "")

    def test_symbol_list_is_required(self):
        with self.assertRaisesRegex(ValueError, "must be a list"):
            self.provisions({"game": "Fn"}, "Fn = 0x80140000; // type:func\n")


if __name__ == "__main__":
    unittest.main()
