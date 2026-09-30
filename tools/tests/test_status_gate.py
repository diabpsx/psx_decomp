"""Progress-parser tests: reported 'ours' counts must come from the source lane."""
from pathlib import Path
import subprocess
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import status


class StatusGateTests(unittest.TestCase):
    def test_failure_uses_ours_not_oracle_length(self):
        result = subprocess.CompletedProcess([], 1,
            "  Example: FAIL 11 diffs (ours 460 / oracle 459)\n", "")
        with patch.object(status.subprocess, "run", return_value=result):
            verdict = status.gate(status.ROOT / "recon/psxsrc/gpanel.cpp", ["Example"])
        self.assertEqual(verdict, {"Example": ("FAIL", 460, 11)})

    def test_pass_and_missing_function(self):
        result = subprocess.CompletedProcess([], 1,
            "  Matched: PASS (27 insns)\n  Missing: NOT IN OBJECT\n", "")
        with patch.object(status.subprocess, "run", return_value=result):
            verdict = status.gate(status.ROOT / "recon/psxsrc/gpanel.cpp", ["Matched", "Missing"])
        self.assertEqual(verdict, {"Matched": ("PASS", 27, 0),
                                   "Missing": ("NOT IN OBJECT", 0, 0)})


if __name__ == "__main__":
    unittest.main()
