from pathlib import Path
import struct
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import psyq_extract as P


def string(value):
    return bytes([len(value)]) + value


def object_with(debug):
    # One complete section, real payload, then debug metadata and one export.
    return (b'LNK\x02\x10' + struct.pack('<HHB', 1, 0, 4) + string(b'.text')
            + b'\x06\x01\x00\x02\x08\x00' + bytes.fromhex('0800e00300000000')
            + debug + b'\x0c' + struct.pack('<HHI', 7, 1, 0) + string(b'probe') + b'\x00')


class PsyqSLDTests(unittest.TestCase):
    def test_patch_expression_and_xref_number_are_retained(self):
        raw = (b'LNK\x02\x10' + struct.pack('<HHB',1,0,4) + string(b'.text')
               + b'\x06\x01\x00\x02\x04\x00' + bytes.fromhex('0000000c')
               + b'\x0a\x4a\x00\x00\x02\x09\x00'
               + b'\x0e\x09\x00' + string(b'callee') + b'\x00')
        obj=P.parse_obj_complete(raw)
        self.assertEqual(obj['patches'],[{'sect':1,'off':0,'type':0x4a,'expr':'020900'}])
        self.assertEqual(obj['xrefs'],['callee'])
        self.assertEqual(obj['xref_symbols'],{9:'callee'})
        self.assertEqual(obj['symbol_names'],{9:'callee'})

    def test_line_records_are_numeric_not_strings(self):
        debug = (b'\x32' + struct.pack('<H', 0)
                 + b'\x34' + struct.pack('<HB', 0, 255)
                 + b'\x36' + struct.pack('<HH', 4, 0x5678)
                 + b'\x38' + struct.pack('<HI', 4, 900)
                 + b'\x3a' + struct.pack('<HIH', 4, 901, 2)
                 + b'\x3c' + struct.pack('<H', 8))
        raw = object_with(debug)
        obj = P.parse_obj_complete(raw)
        self.assertEqual(obj['parser_dialect'], 'sld')
        self.assertEqual(obj['consumed'], len(raw))
        self.assertEqual(obj['code'][1], bytes.fromhex('0800e00300000000'))
        self.assertEqual(obj['xdefs'][0]['name'], 'probe')

    def test_function_blocks_and_definitions_do_not_consume_code(self):
        debug = (b'\x4a' + struct.pack('<HIHIHIHIi', 1, 0, 2, 77, 29, 0, 31, 0, 0)
                 + string(b'probe'))
        debug += b'\x4e' + struct.pack('<HII', 1, 0, 78)
        debug += b'\x52' + struct.pack('<HIHHI', 1, 2, 4, 4, 0) + string(b'x')
        debug += (b'\x54' + struct.pack('<HIHHIH', 1, 0, 4, 4, 8, 1)
                  + struct.pack('<I', 2) + string(b'T') + string(b'array'))
        debug += b'\x50' + struct.pack('<HII', 1, 8, 79)
        debug += b'\x4c' + struct.pack('<HII', 1, 8, 80)
        raw = object_with(debug)
        obj = P.parse_obj(raw, sld_debug=True)
        self.assertEqual(obj['consumed'], len(raw))
        self.assertTrue(obj['terminated'])
        self.assertEqual(obj['xdefs'][0]['off'], 0)

    def test_unknown_record_and_truncated_debug_fail(self):
        with self.assertRaises(P.Desync):
            P.parse_obj(b'LNK\x02\x44\x00\x00\x00', sld_debug=True)
        with self.assertRaises(P.Desync):
            P.parse_obj(b'LNK\x02\x38\x00', sld_debug=True)

    def test_prefixed_overlay_group_is_not_a_common_symbol(self):
        raw = object_with(b'\x14' + struct.pack('<HB', 2, 0) + string(b'prcs01'))
        obj = P.parse_obj(raw, sld_debug=True)
        self.assertEqual(obj['groups'], {2: {'type': 0, 'name': 'prcs01'}})
        self.assertEqual([r['name'] for r in obj['xdefs']], ['probe'])
        self.assertTrue(P.is_code_section('prcs01.text'))
        self.assertTrue(P.is_code_section('.text'))
        self.assertFalse(P.is_code_section('prcs01.rdata'))
        self.assertFalse(P.is_code_section('.data'))

    def test_complete_reader_requires_an_actual_end_record(self):
        raw = object_with(b'')
        self.assertEqual(P.parse_obj_complete(raw)['parser_dialect'], 'historical')
        with self.assertRaises(P.Desync):
            P.parse_obj_complete(raw[:-1])
        # Payload ending in zero is not an END opcode.
        with self.assertRaises(P.Desync):
            P.parse_obj_complete(b'LNK\x02\x06\x01\x00\x02\x01\x00\x00')
        with self.assertRaises(P.Desync):
            P.parse_obj_complete(raw + b'\x99')
        self.assertEqual(P.parse_obj_complete(raw + b'\0\0')['consumed'], len(raw))

    @unittest.skipUnless(Path('C:/Temp/ps1-decomp-refs/BattleKonchuuden/FADE/FADE.obj').is_file(),
                         'original reference object unavailable')
    def test_original_debug_object(self):
        path = Path('C:/Temp/ps1-decomp-refs/BattleKonchuuden/FADE/FADE.obj')
        raw = path.read_bytes()
        obj = P.parse_obj_complete(raw)
        self.assertEqual(obj['parser_dialect'], 'sld')
        self.assertEqual(obj['consumed'], len(raw))
        self.assertEqual({obj['sections'][s]: len(b) for s, b in obj['code'].items()},
                         {'.text': 624, '.rdata': 44})
        self.assertEqual(len(obj['xdefs']), 3)


if __name__ == '__main__':
    unittest.main()
