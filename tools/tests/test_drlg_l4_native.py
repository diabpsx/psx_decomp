"""Whole DRLG_L4 code, data, global SYM and final-format-wrapper regression."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import build as B
import link as L
import native_recon as R
import psyq_extract as P
import sdk_link as N
import symlane as S


@unittest.skipUnless(all(p.is_file() for p in (B.CPP,B.CC1PL,B.AS,L.OBJCOPY,S.ASPSX,S.PSYLINK,S.DUMPSYM,
                         B.ROOT/'rom/DIABPSX.BIN',B.ROOT/'rom/PREGAME.BIN')),
                     'original toolchain/retail inputs unavailable')
class DrlgL4NativeTests(unittest.TestCase):
    def test_full_sections_named_caches_and_both_data_wrappers(self):
        spec=json.loads((B.ROOT/'configs/native_recon_link.json').read_text())['drlg_l4']
        self.assertEqual(R.source_assembler(spec),('2.56',S.ASPSX))
        self.assertEqual(B.per_tu_flags(B.ROOT/spec['source']),{})
        self.assertEqual(spec['composed_group']['sections'],['.rdata','.data','.text'])
        pregame=(B.ROOT/'rom/PREGAME.BIN').read_bytes()
        with tempfile.TemporaryDirectory(prefix='l4-native-',dir=B.BUILD) as directory:
            folder=Path(directory)
            with patch.object(R,'OUT',folder),patch.object(S,'OUT',folder):
                receipt=R.build(['drlg_l4'])[0]
            self.assertEqual((receipt['segment'],receipt['functions']),('drlg_l4',36))
            self.assertEqual({name:row['size'] for name,row in receipt['sections'].items()},
                             {'.text':24112,'.rdata':123,'.data':7220,'.sdata':60,'.sbss':28})
            self.assertEqual(receipt['scaffold_gp_prefix']['size'],6136)
            for section,kind,name,va,size,limit in (
                ('.data','data','tables',0x8014D874,7220,0x8014F4A8),
                ('.rdata','rodata','pool',0x8014D7F8,123,0x8014D874)):
                payload=folder/f'drlg_l4{section}.bin'
                scaffold=(B.ROOT/f'asm/data/drlg_l4_{name}.{kind}.s').read_text(encoding='utf-8')
                bridge=R.bounded_data_bridge(scaffold,[(va,size,payload.as_posix())],limit)
                bridge_src=folder/(name+'.s');bridge_src.write_text(bridge,encoding='utf-8')
                bridge_obj=folder/(name+'.o');bridge_bin=folder/(name+'.out.bin')
                L.assemble_raw(bridge_src,bridge_obj)
                run=B.run([L.OBJCOPY,'-O','binary','-j','.'+kind,bridge_obj,bridge_bin])
                self.assertEqual(run.returncode,0,run.stdout+run.stderr)
                self.assertEqual(bridge_bin.read_bytes(),pregame[va-0x80139BF8:limit-0x80139BF8])
            dump=subprocess.run([S.DUMPSYM,folder/'drlg_l4.sym'],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            self.assertEqual(len(spec['data_symbols']),32)
            for index,name in enumerate(('lpSetPiece1','lpSetPiece2','lpSetPiece3','lpSetPiece4',
                                         'lppSetPiece2','lppSetPiece3','lppSetPiece4')):
                rows=R.data_records(dump.stdout,name)
                self.assertEqual(len(rows),1)
                self.assertEqual(next(iter(rows))[0],0x8011C8E8+4*index)


if __name__=='__main__':unittest.main()
