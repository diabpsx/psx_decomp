from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from instr import real_rtl as R


SAMPLE = """preamble
;; Function A::tick
one
needle first
three
needle second
five
;; Function B::tick
other
;; Function unique
last
"""


class RealRtlTests(unittest.TestCase):
    def test_parse_dumps_deduplicates_in_order(self):
        self.assertEqual(R.parse_dumps("greg,sched2,greg,dbr"),
                         ["greg", "sched2", "dbr"])

    def test_parse_dumps_rejects_unknown_and_empty(self):
        with self.assertRaisesRegex(ValueError, "unknown dump"):
            R.parse_dumps("greg,nope")
        with self.assertRaisesRegex(ValueError, "empty dump"):
            R.parse_dumps("greg,")

    def test_extract_function_exact_and_unambiguous_bare(self):
        self.assertIn("needle first", R.extract_function(SAMPLE, "A::tick"))
        self.assertEqual(R.extract_function(SAMPLE, "unique"),
                         ";; Function unique\nlast")
        with self.assertRaisesRegex(ValueError, "found 2"):
            R.extract_function(SAMPLE, "tick")

    def test_focused_windows_merge_overlap(self):
        body = R.extract_function(SAMPLE, "A::tick")
        focused = R.focused_windows(body, "needle", 1)
        self.assertEqual(focused.count(";; focused lines"), 1)
        self.assertIn("needle first", focused)
        self.assertIn("needle second", focused)

    def test_focused_windows_report_missing_and_bad_regex(self):
        with self.assertRaisesRegex(ValueError, "did not match"):
            R.focused_windows("abc", "missing", 1)
        with self.assertRaisesRegex(ValueError, "invalid --around"):
            R.focused_windows("abc", "[", 1)


if __name__ == "__main__":
    unittest.main()
