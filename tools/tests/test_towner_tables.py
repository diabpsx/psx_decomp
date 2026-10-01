import unittest
from gen_towner_tables import psx_values
from gen_drlg_l2_tables import flatten


class TownerTablesTests(unittest.TestCase):
    def test_cow_delta_requires_known_gold(self):
        self.assertEqual(psx_values('TownCowDir',[1,3,4]),[1,0,2])
        with self.assertRaises(ValueError):
            psx_values('TownCowDir',[1,0,2])

    def test_dialogue_projection_and_zero_row(self):
        gold = [[r*24+c for c in range(24)] for r in range(14)]
        result = flatten(psx_values('Qtalklist',gold),[11,16])
        self.assertEqual(result[:16],list(range(16)))
        self.assertEqual(result[144:160],gold[9][:16])
        self.assertEqual(result[160:],[0]*16)
        with self.assertRaises(ValueError):
            psx_values('Qtalklist',gold[:11])
