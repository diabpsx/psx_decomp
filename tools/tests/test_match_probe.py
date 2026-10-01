import contextlib
import io
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from instr import match_probe as M
from instr import compare_tu as C


class MatchProbeTests(unittest.TestCase):
    def test_dump_selection_includes_late_jump_pass_and_rejects_typos(self):
        self.assertEqual(M.dump_selection('sched2,jump2,dbr'), ['sched2','jump2','dbr'])
        self.assertEqual(M.DUMPS['jump2'], ('-dJ','.jump2'))
        for value in ('', 'greg,greg', 'unknown'):
            with self.assertRaises(M.argparse.ArgumentTypeError):
                M.dump_selection(value)

    def test_target_extraction_preserves_real_operands(self):
        text = '.file "a"\n.ent f\nf:\n.frame $sp,24,$31\nli $2,7\n.end f\n.ent g\ng:\nnop\n.end g\n'
        target = M.assembly_function(text, 'f')
        self.assertIn('li $2,7', target)
        self.assertNotIn('.ent g', target)
        self.assertNotEqual(target, M.assembly_function(text.replace('li $2,7','li $2,8'), 'f'))

    def test_missing_duplicate_and_unterminated_targets_fail(self):
        for text in ('', '.ent f\n', '.ent f\n.end f\n.ent f\n.end f'):
            with self.assertRaises(ValueError):
                M.assembly_function(text, 'f')

    def test_trace_overloads_require_full_heading(self):
        trace = '===== FUNCTION int A::f(int) =====\none\n===== FUNCTION int A::f(char) =====\ntwo\n'
        with self.assertRaises(ValueError):
            M.trace_function(trace, 'f')
        self.assertIn('two', M.trace_function(trace, 'int A::f(char)'))
        self.assertNotIn('one', M.trace_function(trace, 'int A::f(char)'))

    def test_global_priorities_and_failed_then_successful_attempts(self):
        trace = ('[allocno_compare] order: 2/99:6/28/2/1=4285\n'
                 '[find_reg] allocno 2 pseudo 99 refs 6 live 28 calls 2 size 1 alt 0 ccl 0 retry 0 -> reg -1\n'
                 '[find_reg] allocno 2 pseudo 99 refs 6 live 28 calls 2 size 1 alt 1 ccl 0 retry 1 -> reg 18\n')
        row, = M.parse_allocations(trace)
        self.assertEqual((row['rank'],row['pseudo'],row['priority']), (1,99,4285))
        self.assertEqual([a['register'] for a in row['attempts']], [-1,18])

    def test_inconsistent_or_absent_trace_is_rejected(self):
        for text in ('', '[allocno_compare] order: 0/1:2/3/0/1=6666 1/1:2/3/0/1=6666',
                     '[allocno_compare] order: 0/1:2/3/0/1=6666\n[find_reg] allocno 9 pseudo 1 refs 2 live 3 calls 0 size 1 alt 0 ccl 0 retry 0 -> reg 2'):
            with self.assertRaises(ValueError):
                M.parse_allocations(text)

    def test_comparison_cli_exit_codes(self):
        for results, code in [([True],0),([False],1),([True,None],2)]:
            with patch.object(C,'one',side_effect=results), contextlib.redirect_stdout(io.StringIO()):
                self.assertEqual(C.main(['source.cpp']*len(results)), code)
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            C.main([])

    def test_local_quantity_ids_are_not_merged_across_blocks(self):
        events = M.local_events('[qty_order     ] (qty/reg1:refs/life/calls/sg/csg=pri): 0/99:2/4/0/0/0=5000\n'
                                '[find_free_reg] qty 0 -> reg 2\n'
                                '[qty_order     ] (qty/reg1:refs/life/calls/sg/csg=pri): 0/123:3/8/0/0/0=3750\n')
        self.assertEqual(events[0]['quantities'][0]['pseudo'],99)
        self.assertEqual(events[2]['quantities'][0]['pseudo'],123)
        self.assertEqual(events[1]['kind'],'find_free_reg')

    def test_report_does_not_label_trace_as_gate_success(self):
        text = M.report_text({'errors':[], 'stock_matches_real':True,
                              'instrumented_matches_stock':True,'trace_validated':True})
        self.assertIn('not a retail matching seal', text)

    def test_missing_compiler_is_recorded_as_failure(self):
        with tempfile.TemporaryDirectory() as directory, patch.object(M.subprocess,'run',side_effect=OSError('missing compiler')):
            result = M.run_saved(['missing.exe'],Path(directory))
            self.assertEqual(result['returncode'],2)
            self.assertIn('missing compiler',(Path(directory)/'stderr.txt').read_text())


if __name__ == '__main__':
    unittest.main()
