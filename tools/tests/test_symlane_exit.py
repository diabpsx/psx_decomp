import contextlib
import io
from pathlib import Path
import sys
import unittest
import tempfile
from unittest.mock import MagicMock, patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import symlane as S


class SymlaneExitTests(unittest.TestCase):
    def test_default_header_copy_resolution_is_tu_specific_and_unambiguous(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            folder = root/'asm/nonmatchings/sample'
            folder.mkdir(parents=True)
            (folder/'Get__Fi_80010000.s').write_text('/* 0 80010000 00000000 */ nop\n')
            with patch.object(S, 'ROOT', root):
                self.assertEqual(S.oracle_va('sample', 'Get__Fi'), 0x80010000)
                self.assertEqual(S.oracle_va('sample', 'Get__Fi_80010000'), 0x80010000)
                self.assertIsNone(S.oracle_va('sample', 'Get__Fi_80030000'))
                (folder/'Get__Fi_80020000.s').write_text('/* 0 80020000 00000000 */ nop\n')
                self.assertIsNone(S.oracle_va('sample', 'Get__Fi'))
    def run_gate(self, ours, retail, same=True, wanted='sample'):
        text = MagicMock()
        text.read_text.return_value = ''
        argv = ['symlane.py', 'recon/sample.cpp'] + ([wanted] if wanted is not None else [])
        with patch.object(sys, 'argv', argv), patch.object(S, 'compile_g'), \
             patch.object(S, 'link', return_value=text), patch.object(S, 'RETAIL', text), \
             patch.object(S, 'functions', side_effect=[ours, retail]), \
             patch.object(S, 'compare', return_value=(same, 'record differs')) as compare, \
             contextlib.redirect_stdout(io.StringIO()):
            status = S.main()
            return status, compare.call_count

    def test_pass_requires_a_compared_record(self):
        self.assertEqual(self.run_gate({'sample': {}}, {'sample': [{}]}), (0, 1))

    def test_missing_mismatching_and_empty_results_fail(self):
        self.assertEqual(self.run_gate({}, {'sample': [{}]})[0], 1)
        self.assertEqual(self.run_gate({'sample': {}}, {})[0], 1)
        self.assertEqual(self.run_gate({'sample': {}}, {'sample': [{}]}, same=False), (1, 1))
        self.assertEqual(self.run_gate({}, {}, wanted=None)[0], 1)

    def test_missing_tu_copy_never_falls_back_to_first_retail_function(self):
        self.assertEqual(self.run_gate({'sample': {}}, {'sample': [
            {'start': 0x80010000}, {'start': 0x80020000}]}), (1, 0))

    def test_generated_thunks_are_compared_not_exempted(self):
        for kind in ('I', 'D'):
            name = '_GLOBAL__' + kind + '_QBack'
            retail_name = '_GLOBAL_.' + kind + '.QBack'
            for same in (True, False):
                self.assertEqual(self.run_gate({name: {}}, {retail_name: [{}]}, same=same, wanted=name),
                                 (0 if same else 1, 1))
            self.assertEqual(self.run_gate({name: {}}, {}, wanted=name)[0], 1)


if __name__ == '__main__':
    unittest.main()
