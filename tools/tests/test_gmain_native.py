"""GMAIN extra-only GLIB source routing and exact native-link proof."""
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


@unittest.skipUnless(all(p.is_file() for p in (B.CPP,B.CC1,S.ASPSX,S.PSYLINK,
                         S.DUMPSYM,B.ROOT/'rom/DIABPSX.BIN')),
                     'original toolchain/retail inputs unavailable')
class GmainNativeTests(unittest.TestCase):
    def test_extra_only_complete_object(self):
        spec=json.loads((B.ROOT/'configs/native_recon_link.json').read_text())['gmain']
        source=B.ROOT/spec['source']
        self.assertEqual(B.per_tu_flags(source),{'g_value':'0'})
        layouts={name:R.image_layout(name)[0] for name in R.IMAGES}
        homes,regions,limits=R.validate_placements('gmain',spec,layouts)
        self.assertEqual(regions,{'.text.lib':(0x80020E04,80)})
        self.assertEqual(homes,{'.text.lib':'diabpsx'})
        entries={p.stem:(N.scaffold_bytes(p)[0],len(N.scaffold_bytes(p)[1]))
                 for p in (B.ROOT/'asm/nonmatchings/lib').glob('*.s')}
        T.validate_members(0x80020E04,80,['main'],entries)
        with tempfile.TemporaryDirectory(prefix='gmain-native-',dir=B.BUILD) as directory:
            folder=Path(directory)
            with patch.object(S,'OUT',folder):raw=S.compile_g(source).read_bytes()
            obj=P.parse_obj_complete(raw)
            self.assertEqual({obj['sections'][s]:len(data) for s,data in obj['code'].items() if data},
                             {'.text.lib':80})
            self.assertEqual(set(obj['xrefs']),set(spec['externals']))
            symbols='\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
            bindings=R.resolve_bindings(obj['xrefs'],symbols);bindings['_gp']=0x8011A780
            blocks,map_text=N.native_link('gmain',raw,regions,bindings,output_dir=folder)
            retail=(B.ROOT/'rom/DIABPSX.BIN').read_bytes()
            self.assertEqual(blocks['.text.lib'],retail[0x10E04:0x10E54])
            dump=subprocess.run([S.DUMPSYM,folder/'gmain.sym'],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            self.assertEqual(R.verify_sym(dump.stdout,'gmain',[],S.RETAIL.read_text(encoding='latin-1'),
                [B.ROOT/'asm/nonmatchings/lib/main.s']),1)


if __name__=='__main__':unittest.main()
