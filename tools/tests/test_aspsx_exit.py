import contextlib
import io
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import MagicMock, patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import aspsx_gate as A


class ASPSXExitTests(unittest.TestCase):
    def run_gate(self, oracle, functions, data=bytes(4), wanted='sample'):
        text = MagicMock()
        text.name = 'sample.sym.txt'
        text.read_text.return_value = ''
        argv = ['aspsx_gate.py', 'sample.cpp'] + ([wanted] if wanted is not None else [])
        with tempfile.TemporaryDirectory() as directory, patch.object(A, 'ROOT', Path(directory)), \
             patch.object(sys, 'argv', argv), patch.object(A.SL, 'compile_g'), \
             patch.object(A.SL, 'link', return_value=text), patch.object(A, 'read_cpe'), \
             patch.object(A.SL, 'functions', return_value=functions), \
             patch.object(A, 'oracle', return_value=oracle), patch.object(A, 'fetch', return_value=data), \
             contextlib.redirect_stdout(io.StringIO()):
            return A.main()

    def test_only_a_complete_match_succeeds(self):
        function = {'sample': {'start': 0x80010000, 'end': 4}}
        self.assertEqual(self.run_gate([(0, 'nop')], function), 0)
        self.assertEqual(self.run_gate([(1, 'sll zero,zero,0')], function), 1)

    def test_missing_and_empty_results_fail(self):
        function = {'sample': {'start': 0x80010000, 'end': 4}}
        for oracle in (None, []):
            self.assertEqual(self.run_gate(oracle, function), 1)
        self.assertEqual(self.run_gate([(0, 'nop')], {}), 1)
        self.assertEqual(self.run_gate([(0, 'nop')], function, data=None), 1)
        self.assertEqual(self.run_gate(None, {}, wanted=None), 1)


if __name__ == '__main__':
    unittest.main()
