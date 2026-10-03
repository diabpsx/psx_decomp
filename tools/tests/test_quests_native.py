"""QUESTS whole-object bytes, symbols, inlines and data-wrapper proof."""
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


@unittest.skipUnless(all(p.is_file() for p in (B.CPP,B.CC1PL,B.AS,L.OBJCOPY,
                         S.ASPSX,S.PSYLINK,S.DUMPSYM,B.ROOT/'rom/DIABPSX.BIN')),
                     'original toolchain/retail inputs unavailable')
class QuestsNativeTests(unittest.TestCase):
    def test_complete_object_and_wrappers(self):
        spec=json.loads((B.ROOT/'configs/native_recon_link.json').read_text())['quests']
        source=B.ROOT/spec['source']
        self.assertEqual(B.per_tu_flags(source),{})
        self.assertEqual(R.source_assembler(spec),('2.56',S.ASPSX))
        image=(B.ROOT/'rom/DIABPSX.BIN').read_bytes()
        symbols='\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
        retail=S.RETAIL.read_text(encoding='latin-1')
        regions={'.text':(0x800674B4,7784),'.rdata':(0x801178E0,33),
                 '.data':(0x800DD908,632),'.sdata':(0x8011BA20,84),
                 '.sbss':(0x8011C87C,8),'.bss':(0x8012EDF8,80),
                 '.ctors':(0x800B0CC8,4),'.dtors':(0x800B0CF8,4)}
        with tempfile.TemporaryDirectory(prefix='quests-native-',dir=B.BUILD) as directory:
            folder=Path(directory)
            with patch.object(S,'OUT',folder):raw=S.compile_g(source).read_bytes()
            obj=P.parse_obj_complete(raw)
            self.assertEqual({obj['sections'][s]:len(data) for s,data in obj['code'].items()},
                             {section:size for section,(va,size) in regions.items()})
            self.assertFalse(any('bss' in row for row in obj['xdefs']))
            self.assertEqual(set(obj['xrefs']),set(spec['externals'])|{'_7CPlayer.PActiveArray'})
            prefix,combined,mode=R.gp_carrier_plan(regions,image,0x8011A780,0x8011C604)
            self.assertEqual((mode,len(prefix)),('prefix',4768))
            prefix_src=folder/'prefix.s';prefix_obj=folder/'prefix.obj'
            prefix_src.write_bytes(('.sdata\r\n'+''.join('.byte '+','.join(map(str,prefix[i:i+16]))+'\r\n'
                                   for i in range(0,len(prefix),16))).encode())
            run=B.run([S.ASPSX,'-q','-o',prefix_obj,prefix_src])
            self.assertEqual(run.returncode,0,run.stdout+run.stderr)
            bindings=R.resolve_bindings(spec['externals'],symbols);bindings['_gp']=0x8011A780
            blocks,map_text=N.native_link('quests',raw,combined,bindings,output_dir=folder,prefix_objects=[prefix_obj])
            for section,actual in blocks.items():
                va,size=combined[section]
                expected=bytes(size) if section in ('.bss','.sbss') else image[va-0x80010000:va-0x80010000+size]
                self.assertEqual(actual,expected,section)
            for section,kind,label,start,limit in (
                    ('.data','data','data_quests',0x800DD908,0x800DDB80),
                    ('.rdata','rodata','rodata_quests',0x801178E0,0x80117904),
                    ('.ctors','data','ctors',0x800B0C98,0x800B0CCC),
                    ('.dtors','data','dtors',0x800B0CD4,0x800B0CFC)):
                va,size=regions[section];payload=folder/(section[1:]+'.bin');payload.write_bytes(blocks[section])
                scaffold=(B.ROOT/f'asm/data/{label}.{kind}.s').read_text(encoding='utf-8')
                bridge=R.bounded_data_bridge(scaffold,[(va,size,payload.as_posix())],limit)
                self.assertGreaterEqual(bridge.count('.incbin'),1)
                if section in ('.ctors','.dtors'):
                    # Neighboring scaffold entries are unresolved function
                    # relocations until the final main-image link. The native
                    # block above proves this source entry; link.py proves the
                    # complete table rather than comparing an unlinked object.
                    continue
                bridge_src=folder/(section[1:]+'.s');bridge_src.write_text(bridge,encoding='utf-8')
                bridge_obj=folder/(section[1:]+'.o');bridge_bin=folder/(section[1:]+'.out.bin')
                L.assemble_raw(bridge_src,bridge_obj)
                run=B.run([L.OBJCOPY,'-O','binary','-j','.'+kind,bridge_obj,bridge_bin])
                self.assertEqual(run.returncode,0,run.stdout+run.stderr)
                self.assertEqual(bridge_bin.read_bytes(),image[start-0x80010000:limit-0x80010000])
            dump=subprocess.run([S.DUMPSYM,folder/'quests.sym'],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            self.assertEqual(len(spec['data_symbols']),27)
            self.assertEqual(R.verify_sym(dump.stdout,'quests',spec['data_symbols'],retail),26)
            for name in spec['data_symbols']:
                row=next(iter(R.data_records(dump.stdout,name)))
                if row[1]=='EXT':R.verify_data_map(map_text,symbols,retail,name)
            self.assertEqual(blocks['.sdata'][len(prefix):len(prefix)+9],b'.tp\0.dat\0')


if __name__=='__main__':unittest.main()
