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
        source=B.ROOT/spec['source']
        self.assertEqual(B.per_tu_flags(source),{})
        main=(B.ROOT/'rom/DIABPSX.BIN').read_bytes()
        pregame=(B.ROOT/'rom/PREGAME.BIN').read_bytes()
        symbols='\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
        with tempfile.TemporaryDirectory(prefix='l4-native-',dir=B.BUILD) as directory:
            folder=Path(directory)
            with patch.object(S,'OUT',folder):
                raw=S.compile_g(source).read_bytes()
            obj=P.parse_obj_complete(raw)
            self.assertEqual({obj['sections'][s]:len(data) for s,data in obj['code'].items()},
                             {'.text':24112,'.rdata':123,'.data':7220,'.sdata':60,'.sbss':28})
            self.assertFalse(any('bss' in row for row in obj['xdefs']))
            regions={'.text':(0x8014F4A8,24112),'.rdata':(0x8014D7F8,123),'.data':(0x8014D874,7220),
                     '.sdata':(0x8011BF78,60),'.sbss':(0x8011C8E8,28)}
            prefix,combined,mode=R.gp_carrier_plan(regions,main,0x8011A780,0x8011C604)
            self.assertEqual((mode,len(prefix)),('prefix',6136))
            prefix_src=folder/'prefix.s';prefix_obj=folder/'prefix.obj'
            prefix_src.write_bytes(('.sdata\r\n'+''.join('.byte '+','.join(map(str,prefix[i:i+16]))+'\r\n'
                                                       for i in range(0,len(prefix),16))).encode())
            run=B.run([S.ASPSX,'-q','-o',prefix_obj,prefix_src])
            self.assertEqual(run.returncode,0,run.stdout+run.stderr)
            bindings=R.resolve_bindings(obj['xrefs'],symbols);bindings['_gp']=0x8011A780
            blocks,map_text=N.native_link('l4',raw,combined,bindings,output_dir=folder,prefix_objects=[prefix_obj])
            for section,(va,size) in combined.items():
                image,base=(main,0x80010000) if section in ('.sdata','.sbss') else (pregame,0x80139BF8)
                expected=bytes(size) if section=='.sbss' else image[va-base:va-base+size]
                self.assertEqual(blocks[section],expected,section)
            for section,kind,name,va,size,limit in (
                ('.data','data','tables',0x8014D874,7220,0x8014F4A8),
                ('.rdata','rodata','pool',0x8014D7F8,123,0x8014D874)):
                payload=folder/(name+'.bin');payload.write_bytes(blocks[section])
                scaffold=(B.ROOT/f'asm/data/drlg_l4_{name}.{kind}.s').read_text(encoding='utf-8')
                bridge=R.bounded_data_bridge(scaffold,[(va,size,payload.as_posix())],limit)
                bridge_src=folder/(name+'.s');bridge_src.write_text(bridge,encoding='utf-8')
                bridge_obj=folder/(name+'.o');bridge_bin=folder/(name+'.out.bin')
                L.assemble_raw(bridge_src,bridge_obj)
                run=B.run([L.OBJCOPY,'-O','binary','-j','.'+kind,bridge_obj,bridge_bin])
                self.assertEqual(run.returncode,0,run.stdout+run.stderr)
                self.assertEqual(bridge_bin.read_bytes(),pregame[va-0x80139BF8:limit-0x80139BF8])
            dump=subprocess.run([S.DUMPSYM,folder/'l4.sym'],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            retail=S.RETAIL.read_text(encoding='latin-1')
            self.assertEqual(len(spec['data_symbols']),32)
            self.assertEqual(R.verify_sym(dump.stdout,'drlg_l4',spec['data_symbols'],retail),36)
            for name in ('dung','hallok','L4dungeon'):
                R.verify_data_map(map_text,symbols,retail,name)
            for index,name in enumerate(('lpSetPiece1','lpSetPiece2','lpSetPiece3','lpSetPiece4',
                                         'lppSetPiece2','lppSetPiece3','lppSetPiece4')):
                rows=R.data_records(dump.stdout,name)
                self.assertEqual(len(rows),1)
                self.assertEqual(next(iter(rows))[0],0x8011C8E8+4*index)


if __name__=='__main__':unittest.main()
