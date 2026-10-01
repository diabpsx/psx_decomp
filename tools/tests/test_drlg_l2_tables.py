import unittest
from gen_drlg_l2_tables import flatten, initializer, c_initializer


class L2TableTests(unittest.TestCase):
    def test_nested_zero_fill(self):
        self.assertEqual(flatten([[1], [2, 3]], [3, 3]), [1,0,0,2,3,0,0,0,0])

    def test_invalid_shape_and_noninteger(self):
        for value, shape in [([1,2], [1]), ([1.5], [1]), ([[1,2]], [1]), (1, [2])]:
            with self.assertRaises(ValueError):
                flatten(value, shape)

    def test_comments_and_numeric_roundtrip(self):
        value = initializer('{ { 1, /* omitted */ -1 }, // row\n {0x10, 2} }')
        self.assertEqual(value, [[1,-1],[16,2]])
        self.assertEqual(initializer(c_initializer(value)), value)

    def test_no_expression_execution(self):
        with self.assertRaises((ValueError, SyntaxError)):
            initializer('{ __import__("os") }')
