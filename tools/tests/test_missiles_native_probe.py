"""Unmasked MISSILES regression receipt, not a final-image integration claim.

Common globals are diagnostically bound to their retail addresses. Production
still needs actual storage integration and overlay-compacted exact SYM.
"""
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import psyq_extract as P
import sdk_link as N
import symlane as S


@unittest.skipUnless(all(p.is_file() for p in (B.CPP, B.CC1PL, S.ASPSX, S.PSYLINK,
                         B.ROOT/'rom/DIABPSX.BIN', B.ROOT/'rom/GAME.BIN')),
                     'original compiler/linker and retail images unavailable')
class MissilesNativeProbeTests(unittest.TestCase):
    def test_full_relocated_text_pool_and_constant_small_data(self):
        source = B.ROOT/'recon/source/missiles.cpp'
        symbols = '\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
        main = (B.ROOT/'rom/DIABPSX.BIN').read_bytes()
        game = (B.ROOT/'rom/GAME.BIN').read_bytes()
        gp, small = 0x8011A780, 0x8011C258
        prefix = main[gp-0x80010000:small-0x80010000]
        expected_commons = {'nummissiles': 4, 'MissilePreFlag': 1,
                            'ManashieldFlag': 1, 'ManashieldFlag2': 1,
                            'fadetor': 1, 'fadetog': 1, 'fadetob': 1}
        B.BUILD.mkdir(exist_ok=True)
        with tempfile.TemporaryDirectory(prefix='missile-native-', dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, 'OUT', folder), patch.dict(B.PER_TU_FLAGS,
                    {source.relative_to(B.ROOT).as_posix(): {'extra': ['-fconserve-space']}}):
                path = S.compile_g(source)
                raw = path.read_bytes()
            obj = P.parse_obj_complete(raw)
            sizes = {obj['sections'][s]: len(data) for s,data in obj['code'].items()}
            self.assertEqual(sizes, {'.text': 69488, '.rdata': 1272, '.sdata': 45})
            commons = {r['name']: r['bss'] for r in obj['xdefs'] if 'bss' in r}
            self.assertEqual(commons, expected_commons)
            bindings = R.resolve_bindings([n for n in obj['xrefs'] if n != '_7CPlayer.PActiveArray'], symbols)
            bindings.update(R.resolve_bindings(list(commons), symbols))
            bindings['_gp'] = gp
            prefix_source, prefix_obj = folder/'prefix.s', folder/'prefix.obj'
            prefix_source.write_bytes(('.sdata\r\n' + ''.join(
                '.byte '+','.join(str(v) for v in prefix[i:i+16])+'\r\n'
                for i in range(0,len(prefix),16))).encode())
            run = B.run([S.ASPSX,'-q','-o',prefix_obj,prefix_source])
            self.assertEqual(run.returncode, 0, run.stdout+run.stderr)
            regions = {'.text': (0x80139C04, 69488), '.rdata': (0x80119DC0, 1272),
                       '.sdata': (gp, len(prefix)+45)}
            blocks, _ = N.native_link('missiles_probe',raw,regions,bindings,
                                      prefix_objects=[prefix_obj],output_dir=folder)
            # Exact relocated bytes: no register/immediate/target normalization.
            self.assertEqual(blocks['.text'], game[12:12+69488])
            self.assertEqual(blocks['.rdata'], main[0x109DC0:0x109DC0+1272])
            self.assertEqual(blocks['.sdata'][len(prefix):], main[small-0x80010000:small-0x80010000+45])
            self.assertEqual(path.read_bytes(), raw)


if __name__ == '__main__':
    unittest.main()
