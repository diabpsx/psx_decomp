from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check_c_escapes import invalid_escapes


class EscapeTests(unittest.TestCase):
    def test_invalid_path_and_format_escapes(self):
        self.assertEqual(invalid_escapes('"Levels\\L1Data\\Banner.DUN"'),
                         [(1, '\\L'), (1, '\\B')])
        self.assertEqual(invalid_escapes('\n"\\%s;1"'), [(2, '\\%')])

    def test_valid_escaped_backslashes_are_consumed_in_pairs(self):
        self.assertEqual(invalid_escapes(r'"Levels\\L1Data\\Banner.DUN"'), [])
        self.assertEqual(invalid_escapes(r'"\\%s;1" "\n\t\123\x41"'), [])

    def test_comments_are_not_source_literals(self):
        self.assertEqual(invalid_escapes('// "\\Q"\n/* "\\L" */ "okay"'), [])

    def test_character_literals_and_continuations(self):
        self.assertEqual(invalid_escapes("'\\Q'"), [(1, '\\Q')])
        self.assertEqual(invalid_escapes('"a\\\nb"'), [])


if __name__ == '__main__':
    unittest.main()
