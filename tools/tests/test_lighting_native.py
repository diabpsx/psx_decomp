"""LIGHTING whole-object bytes, typed storage and final data-wrapper proof."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import link as L
import native_recon as R
import psyq_extract as P
import sdk_link as N
import symlane as S


@unittest.skipUnless(all(p.is_file() for p in (B.CPP, B.CC1PL, B.AS, L.OBJCOPY,
                         S.ASPSX, S.PSYLINK, S.DUMPSYM, B.ROOT/'rom/DIABPSX.BIN')),
                     'original toolchain/retail inputs unavailable')
class LightingNativeTests(unittest.TestCase):
    def test_complete_object_and_wrappers(self):
        spec = json.loads((B.ROOT/'configs/native_recon_link.json').read_text())['lighting']
        source = B.ROOT/spec['source']
        self.assertEqual(B.per_tu_flags(source), {})
        self.assertEqual(R.source_assembler(spec), ('2.56', S.ASPSX))
        image = (B.ROOT/'rom/DIABPSX.BIN').read_bytes()
        symbols = '\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
        retail = S.RETAIL.read_text(encoding='latin-1')
        regions = {'.text':(0x8004BC68,7412), '.rdata':(0x801166E8,14),
                   '.data':(0x800D5554,4668), '.sdata':(0x8011B8F4,52),
                   '.sbss':(0x8011C7DC,44), '.bss':(0x8012ED58,128)}
        with tempfile.TemporaryDirectory(prefix='lighting-native-',dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S,'OUT',folder):
                raw = S.compile_g(source).read_bytes()
            obj = P.parse_obj_complete(raw)
            names = S.retail_section_names(source)   # retail's per-object section spelling on the object
            back = {v: k for k, v in names.items()}
            self.assertEqual({obj['sections'][s]:len(data) for s,data in obj['code'].items()},
                             {names.get(section, section):size for section,(va,size) in regions.items()})
            self.assertFalse(any('bss' in row for row in obj['xdefs']))
            self.assertEqual(set(obj['xrefs']),set(spec['externals']))
            prefix,combined,mode = R.gp_carrier_plan(regions,image,0x8011A780,0x8011C604)
            self.assertEqual((mode,len(prefix)),('prefix',4468))
            prefix_src=folder/'prefix.s'; prefix_obj=folder/'prefix.obj'
            prefix_src.write_bytes(('.sdata\r\n'+''.join('.byte '+','.join(map(str,prefix[i:i+16]))+'\r\n'
                                  for i in range(0,len(prefix),16))).encode())
            run = B.run([S.ASPSX,'-q','-o',prefix_obj,prefix_src])
            self.assertEqual(run.returncode,0,run.stdout+run.stderr)
            bindings = R.resolve_bindings(obj['xrefs'],symbols); bindings['_gp']=0x8011A780
            blocks,map_text = N.native_link('lighting',raw,{names.get(k, k): v for k, v in combined.items()},bindings,
                                            output_dir=folder,prefix_objects=[prefix_obj])
            blocks = {back.get(k, k): v for k, v in blocks.items()}
            for section,actual in blocks.items():
                va,size = combined[section]
                expected = bytes(size) if section in ('.bss','.sbss') else image[va-0x80010000:va-0x80010000+size]
                self.assertEqual(actual,expected,section)
            for section,kind,label,limit in (('.data','data','data_lighting',0x800D6790),
                                              ('.rdata','rodata','rodata_lighting',0x801166F8)):
                va,size = regions[section]
                payload=folder/(kind+'.bin'); payload.write_bytes(blocks[section])
                scaffold=(B.ROOT/f'asm/data/{label}.{kind}.s').read_text(encoding='utf-8')
                bridge=R.bounded_data_bridge(scaffold,[(va,size,payload.as_posix())],limit)
                bridge_src=folder/(kind+'.s'); bridge_src.write_text(bridge,encoding='utf-8')
                bridge_obj=folder/(kind+'.o'); bridge_bin=folder/(kind+'.out.bin')
                L.assemble_raw(bridge_src,bridge_obj)
                run=B.run([L.OBJCOPY,'-O','binary','-j','.'+kind,bridge_obj,bridge_bin])
                self.assertEqual(run.returncode,0,run.stdout+run.stderr)
                self.assertEqual(bridge_bin.read_bytes(),image[va-0x80010000:limit-0x80010000])
            dump=subprocess.run([S.DUMPSYM,folder/'lighting.sym'],capture_output=True,text=True)
            self.assertEqual(dump.returncode,0,dump.stderr)
            self.assertEqual(len(spec['data_symbols']),31)
            self.assertEqual(R.verify_sym(dump.stdout,'lighting',spec['data_symbols'],retail),28)
            for name in spec['data_symbols']:
                row=next(iter(R.data_records(dump.stdout,name)))
                if row[1]=='EXT':
                    R.verify_data_map(map_text,symbols,retail,name)
            self.assertEqual(next(iter(R.data_records(dump.stdout,'mult_tab')))[3:5],(128,'128'))


if __name__=='__main__': unittest.main()
