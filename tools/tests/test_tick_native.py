"""TICK GLIB source: -G0 identity, routed text, pool and common BSS proof."""
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
import native_text as T
import psyq_extract as P
import sdk_link as N
import symlane as S


NAMES=['TICK_InitModule','TICK_Set','TICK_Get','TICK_Update','TICK_GetAge',
       'TICK_GetDateString','TICK_GetTimeString']


@unittest.skipUnless(all(p.is_file() for p in (B.CPP,B.CC1,S.ASPSX,S.PSYLINK,
                         S.DUMPSYM,B.ROOT/'rom/DIABPSX.BIN')),
                     'original toolchain/retail inputs unavailable')
class TickNativeTests(unittest.TestCase):
    def test_complete_routed_object(self):
        spec=json.loads((B.ROOT/'configs/native_recon_link.json').read_text())['tick']
        source=B.ROOT/spec['source']
        self.assertEqual(B.per_tu_flags(source),{'g_value':'0'})
        layouts={name:R.image_layout(name)[0] for name in R.IMAGES}
        homes,regions,limits=R.validate_placements('tick',spec,layouts)
        self.assertEqual(regions,{'.text.lib':(0x80020BEC,172),'.rdata':(0x8010E758,21),'.bss':(0x8011CA60,4)})
        entries={p.stem:(N.scaffold_bytes(p)[0],len(N.scaffold_bytes(p)[1]))
                 for p in (B.ROOT/'asm/nonmatchings/lib').glob('*.s')}
        T.validate_members(0x80020BEC,172,NAMES,entries)
        with tempfile.TemporaryDirectory(prefix='tick-native-',dir=B.BUILD) as directory:
            folder=Path(directory)
            with patch.object(S,'OUT',folder):raw=S.compile_g(source).read_bytes()
            obj=P.parse_obj_complete(raw)
            self.assertEqual({obj['sections'][s]:len(data) for s,data in obj['code'].items() if data},
                             {'.text.lib':172,'.rdata':21})
            common=[r for r in obj['xdefs'] if 'bss' in r]
            self.assertEqual([(obj['sections'][r['sect']],r['name'],r['bss']) for r in common],
                             [('.bss','GazTick',4)])
            self.assertEqual(obj['xrefs'],[])
            blocks,map_text=N.native_link('tick',raw,regions,{'_gp':0x8011A780},output_dir=folder)
            retail=(B.ROOT/'rom/DIABPSX.BIN').read_bytes()
            self.assertEqual(blocks['.text.lib'],retail[0x10BEC:0x10C98])
            self.assertEqual(blocks['.rdata'],retail[0xFE758:0xFE76D])
            self.assertEqual(blocks['.bss'],bytes(4))
            dump=subprocess.run([S.DUMPSYM,folder/'tick.sym'],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            paths=[B.ROOT/'asm/nonmatchings/lib'/(name+'.s') for name in NAMES]
            retail_sym=S.RETAIL.read_text(encoding='latin-1')
            self.assertEqual(R.verify_sym(dump.stdout,'tick',['GazTick'],retail_sym,paths),7)
            symbols='\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
            R.verify_data_map(map_text,symbols,retail_sym,'GazTick')


if __name__=='__main__':unittest.main()
