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
        self.assertEqual(spec['composed_group']['sections'],['.rdata','.data','.text'])   # literals, tables, code in the pregame stream
        with tempfile.TemporaryDirectory(prefix='l1-native-',dir=B.BUILD) as directory:
            folder=Path(directory)
            with patch.object(R,'OUT',folder),patch.object(S,'OUT',folder):
                receipt=R.build(['drlg_l1'])[0]
            self.assertEqual((receipt['segment'],receipt['functions']),('drlg_l1',40))
            self.assertEqual({name:row['size'] for name,row in receipt['sections'].items()},
                             {'.text':21060,'.rdata':52,'.data':8280,'.sbss':6})
            self.assertEqual(len(spec['data_symbols']),17)
            # Verify the format bridge too: inter-label alignment bytes must
            # not survive outside an incbin that already contains those bytes.
            payload=folder/'drlg_l1.data.bin'
            scaffold=(B.ROOT/'asm/data/drlg_l1_tables.data.s').read_text(encoding='utf-8')
            bridge=R.bounded_data_bridge(scaffold,[(0x80139C58,8280,payload.as_posix())],0x8013BCB0)
            bridge_source=folder/'bridge.s';bridge_source.write_text(bridge,encoding='utf-8')
            bridge_object=folder/'bridge.o';bridge_bin=folder/'bridge.bin'
            L.assemble_raw(bridge_source,bridge_object)
            run=B.run([L.OBJCOPY,'-O','binary','-j','.data',bridge_object,bridge_bin])
            self.assertEqual(run.returncode,0,run.stdout+run.stderr)
            self.assertEqual(bridge_bin.read_bytes(),payload.read_bytes())
            dump=subprocess.run([S.DUMPSYM,folder/'drlg_l1.sym'],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            self.assertIn(' set overlay', dump.stdout)   # the pregame overlay switch (retail id $c)
            for index,name in enumerate(('HR1','HR2','HR3','VR1','VR2','VR3')):
                rows=R.data_records(dump.stdout,name)
                self.assertEqual(len(rows),1)
                self.assertEqual(next(iter(rows))[0],0x8011C8D8+index)


if __name__=='__main__':unittest.main()
