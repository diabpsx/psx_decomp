"""Live data-gate integration tests; require the normal project compiler and ROMs."""
from pathlib import Path
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[2]
TOOL = ROOT / "tools/symbol_data_gate.py"
SOURCE = "recon/psxsrc/gpanel.cpp"


class SymbolDataGateTests(unittest.TestCase):
    def run_gate(self, symbol="DurColors", va="0x800B9BCC", size="18", source=SOURCE):
        return subprocess.run([sys.executable, str(TOOL), source, symbol, va, size],
                              cwd=ROOT, capture_output=True, text=True)

    def rejected(self, message, **kwargs):
        result = self.run_gate(**kwargs)
        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn(message, result.stderr)
        self.assertNotIn("DATA BYTES PASS", result.stdout)

    def test_retail_matrix(self):
        result = self.run_gate()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("DurColors: DATA BYTES PASS (18 bytes, .data", result.stdout)

    def test_wrong_va(self):
        self.rejected("source data differs", va="0x800B9BCD")

    def test_padding_is_not_array_extent(self):
        self.rejected("size/range differs", size="20")

    def test_missing_symbol(self):
        self.rejected("found 0", symbol="MissingData")

    def test_zero_size(self):
        self.rejected("size must be positive", size="0")

    def test_outside_image(self):
        self.rejected("range is outside the image", va="0x8000FFFF")

    def test_function_is_not_data(self):
        self.rejected("expected a defined ELF data-object symbol",
                      symbol="DrawDurThingy__6GPaneliiP10ItemStructi")

    def test_pointer_relocation_requires_layout(self):
        self.rejected("has a relocation", source="recon/psxsrc/dlg_2.cpp",
                      symbol="McState", va="0x8011B420", size="8")


if __name__ == "__main__":
    unittest.main()
