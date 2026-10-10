"""Unmasked GAME source code/data/SYM/storage receipts; final image checked separately."""
from pathlib import Path
import sys
import tempfile
import subprocess
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import psyq_extract as P
import sdk_link as N
import symlane as S
import native_commons as C
import json


@unittest.skipUnless(all(p.is_file() for p in (B.CPP, B.CC1PL, S.ASPSX, S.PSYLINK, S.SYMMUNGE, S.DUMPSYM,
                         B.ROOT/'rom/DIABPSX.BIN', B.ROOT/'rom/GAME.BIN')),
                     'original compiler/linker and retail images unavailable')
class MissilesNativeProbeTests(unittest.TestCase):
    def test_full_relocated_text_pool_and_constant_small_data(self):
        self.check_source('missiles',0x80139C04,69488,0x80119DC0,1272,0x8011C258,45,115,
                          {'nummissiles':4,'MissilePreFlag':1,'ManashieldFlag':1,'ManashieldFlag2':1,
                           'fadetor':1,'fadetog':1,'fadetob':1},
                          data_section=(0x801029D8,10268))

    def test_monster_relocated_text_pool_statics_and_common_storage(self):
        self.check_source('monster',0x8014AB74,50944,0x8011A2B8,240,0x8011C2A0,43,105,
                          {'nummonsters':4,'nummtypes':4,'monstimgtot':4,'totalmonsters':1,'uniquetrans':4},
                          data_section=(0x801051F4,21384))

    def test_inv_relocated_text_initialized_globals_and_header_order(self):
        self.check_source('inv',0x80157274,44260,0x8011A3B8,896,0x8011C2F4,104,57,{},
                          data_section=(0x8010D008,1729))

    def test_automap_relocated_code_and_original_global_initializers(self):
        self.check_source('automap',0x80161F58,7880,0x8011A738,72,0x8011C368,60,19,{},
                          data_section=(0x8010D6CC,1248))

    def check_source(self,segment,text_va,text_size,pool_va,pool_size,small,small_size,count,expected_commons,data_section=None):
        source = B.ROOT/f'recon/source/{segment}.cpp'
        names = S.retail_section_names(source)   # retail's per-object section spelling on the object
        back = {v: k for k, v in names.items()}
        symbols = '\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
        main = (B.ROOT/'rom/DIABPSX.BIN').read_bytes()
        game = (B.ROOT/'rom/GAME.BIN').read_bytes()
        gp = 0x8011A780
        prefix = main[gp-0x80010000:small-0x80010000]
        B.BUILD.mkdir(exist_ok=True)
        with tempfile.TemporaryDirectory(prefix=segment+'-native-', dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, 'OUT', folder):
                path = S.compile_g(source)
                raw = path.read_bytes()
            obj = P.parse_obj_complete(raw)
            sizes = {obj['sections'][s]: len(data) for s,data in obj['code'].items()}
            expected_sizes={'.text': text_size, '.rdata': pool_size, '.sdata': small_size}
            if data_section:expected_sizes['.data']=data_section[1]
            self.assertEqual(sizes,{names.get(k, k): v for k, v in expected_sizes.items()})
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
            regions = {'.text': (text_va,text_size), '.rdata': (pool_va,pool_size),
                       '.sdata': (gp, len(prefix)+small_size)}
            if data_section:regions['.data']=data_section
            blocks, _ = N.native_link(segment+'_probe',raw,{names.get(k, k): v for k, v in regions.items()},bindings,
                                      prefix_objects=[prefix_obj],output_dir=folder,overlay_text=True,
                                      overlay_group='game_text')   # retail overlay id $d
            blocks = {back.get(k, k): v for k, v in blocks.items()}
            # Exact relocated bytes: no register/immediate/target normalization.
            self.assertEqual(blocks['.text'], game[text_va-0x80139BF8:text_va-0x80139BF8+text_size])
            self.assertEqual(blocks['.rdata'], main[pool_va-0x80010000:pool_va-0x80010000+pool_size])
            self.assertEqual(blocks['.sdata'][len(prefix):], main[small-0x80010000:small-0x80010000+small_size])
            if data_section:
                address,length=data_section
                self.assertEqual(blocks['.data'],main[address-0x80010000:address-0x80010000+length])
            self.assertEqual(path.read_bytes(), raw)
            dump = subprocess.run([S.DUMPSYM,folder/(segment+'_probe.sym')],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            spec = json.loads((B.ROOT/'configs/native_recon_link.json').read_text())[segment]
            self.assertEqual(R.verify_sym(dump.stdout,segment,spec['data_symbols'],
                             S.RETAIL.read_text(encoding='latin-1')),count)
            planned = C.placements(obj,spec.get('common_symbols',{}),symbols,
                                   {'diabpsx':R.image_layout('diabpsx')[0]},spec['data_symbols'])
            allocated,receipt = C.allocate('test_'+segment,planned,main,S.ASPSX,folder)
            self.assertEqual({n:len(data) for n,data in allocated.items()},expected_commons)
            self.assertTrue(all(not any(data) for data in allocated.values()))
            self.assertEqual(sum(r['size']-r['scaffold_bytes'] for r in receipt.get('banks',{}).values()),sum(expected_commons.values()))


if __name__ == '__main__':
    unittest.main()
