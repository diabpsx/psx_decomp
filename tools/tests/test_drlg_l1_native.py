"""Unmasked full-TU and packed-BSS regression for original-address DRLG_L1."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import psyq_extract as P
import sdk_link as N
import symlane as S
import link as L

AS267=Path('C:/Temp/PSYQ/psyq-410/PSSN/ASPSX.EXE')


@unittest.skipUnless(all(p.is_file() for p in (B.CPP,B.CC1PL,B.AS,L.OBJCOPY,AS267,S.PSYLINK,S.DUMPSYM,
                         B.ROOT/'rom/DIABPSX.BIN',B.ROOT/'rom/PREGAME.BIN')),
                     'original toolchain/retail inputs unavailable')
class DrlgL1NativeTests(unittest.TestCase):
    def test_all_code_data_globals_and_six_packed_flags(self):
        spec=json.loads((B.ROOT/'configs/native_recon_link.json').read_text())['drlg_l1']
        self.assertEqual(R.source_assembler(spec),('2.67',AS267))
        source=B.ROOT/spec['source']
        main=(B.ROOT/'rom/DIABPSX.BIN').read_bytes()
        pregame=(B.ROOT/'rom/PREGAME.BIN').read_bytes()
        symbols='\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
        with tempfile.TemporaryDirectory(prefix='l1-native-',dir=B.BUILD) as directory:
            folder=Path(directory)
            with patch.object(S,'OUT',folder):
                raw=S.compile_g(source,assembler=AS267).read_bytes()
            obj=P.parse_obj_complete(raw)
            self.assertEqual({obj['sections'][s]:len(data) for s,data in obj['code'].items()},
                             {'.text':21060,'.rdata':52,'.data':8280,'.sbss':6})
            self.assertFalse(any('bss' in row for row in obj['xdefs']))
            regions={'.text':(0x8013BCB0,21060),'.rdata':(0x80139C24,52),
                     '.data':(0x80139C58,8280),'.sbss':(0x8011C8D8,6)}
            prefix,combined,mode=R.gp_carrier_plan(regions,main,0x8011A780,0x8011C604)
            self.assertEqual(mode,'anchor')
            self.assertEqual(len(prefix),4)
            prefix_src=folder/'anchor.s';prefix_obj=folder/'anchor.obj'
            prefix_src.write_bytes(('.sdata\r\n.byte '+','.join(map(str,prefix))+'\r\n').encode())
            run=B.run([AS267,'-q','-o',prefix_obj,prefix_src])
            self.assertEqual(run.returncode,0,run.stdout+run.stderr)
            bindings=R.resolve_bindings(obj['xrefs'],symbols);bindings['_gp']=0x8011A780
            blocks,map_text=N.native_link('l1',raw,combined,bindings,output_dir=folder,prefix_objects=[prefix_obj])
            for section,(va,size) in regions.items():
                expected=bytes(size) if section=='.sbss' else pregame[va-0x80139BF8:va-0x80139BF8+size]
                self.assertEqual(blocks[section],expected,section)
            self.assertEqual(blocks['.sdata'],prefix)
            # Verify the format bridge too: inter-label alignment bytes must
            # not survive outside an incbin that already contains those bytes.
            payload=folder/'tables.bin';payload.write_bytes(blocks['.data'])
            scaffold=(B.ROOT/'asm/data/drlg_l1_tables.data.s').read_text(encoding='utf-8')
            bridge=R.bounded_data_bridge(scaffold,[(0x80139C58,8280,payload.as_posix())],0x8013BCB0)
            bridge_source=folder/'bridge.s';bridge_source.write_text(bridge,encoding='utf-8')
            bridge_object=folder/'bridge.o';bridge_bin=folder/'bridge.bin'
            L.assemble_raw(bridge_source,bridge_object)
            run=B.run([L.OBJCOPY,'-O','binary','-j','.data',bridge_object,bridge_bin])
            self.assertEqual(run.returncode,0,run.stdout+run.stderr)
            self.assertEqual(bridge_bin.read_bytes(),blocks['.data'])
            dump=subprocess.run([S.DUMPSYM,folder/'l1.sym'],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            retail=S.RETAIL.read_text(encoding='latin-1')
            self.assertEqual(len(spec['data_symbols']),17)
            self.assertEqual(R.verify_sym(dump.stdout,'drlg_l1',spec['data_symbols'],retail),40)
            for name in ('themeLoc','L5ConvTbl','L5dungeon'):
                R.verify_data_map(map_text,symbols,retail,name)
            for index,name in enumerate(('HR1','HR2','HR3','VR1','VR2','VR3')):
                rows=R.data_records(dump.stdout,name)
                self.assertEqual(len(rows),1)
                self.assertEqual(next(iter(rows))[0],0x8011C8D8+index)


if __name__=='__main__':unittest.main()
