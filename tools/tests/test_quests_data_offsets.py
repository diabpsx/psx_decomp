"""Raw linked data operands hidden by relocation-normalized function gates.

This is deliberately not a whole-QUESTS seal: the current TU's function order
and questlog placement still differ. Locate each compiler function by its own
symbol offset, then compare the thirteen specific retail load/store words.
"""
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import build as B
import symlane as S
import psyq_extract as P
import native_recon as R
import sdk_link as N


@unittest.skipUnless(all(p.is_file() for p in (B.CPP,B.CC1PL,S.ASPSX,S.PSYLINK,
                         B.ROOT/'rom/DIABPSX.BIN')), 'original toolchain/retail unavailable')
class QuestsDataOffsetsTests(unittest.TestCase):
    def test_quest_and_dialogue_field_addresses(self):
        image=(B.ROOT/'rom/DIABPSX.BIN').read_bytes()
        symbols='\n'.join(p.read_text() for p in (B.ROOT/'configs').glob('symbol_addrs*.txt'))
        with tempfile.TemporaryDirectory(prefix='quests-operands-',dir=B.BUILD) as directory:
            folder=Path(directory)
            with patch.object(S,'OUT',folder):
                raw=S.compile_g(B.ROOT/'recon/source/quests.cpp').read_bytes()
            obj=P.parse_obj_complete(raw)
            sizes={obj['sections'][s]:len(data) for s,data in obj['code'].items()}
            self.assertEqual(sizes['.data'],632)
            # These two owned arrays already have their retail offsets in the
            # current data section; other global records are not sealed here.
            for name,offset in (('questlist',0),('quests',312)):
                rows=[r for r in obj['xdefs'] if r['name']==name]
                self.assertEqual(len(rows),1)
                self.assertEqual((obj['sections'][rows[0]['sect']],rows[0]['off']),('.data',offset))
            bases={'.text':0x800674B4,'.rdata':0x801178E0,'.data':0x800DD908,'.sdata':0x8011BA20,
                   '.sbss':0x8011C87C,'.bss':0x8012EDF8,'.ctors':0x800B0CC8,'.dtors':0x800B0CF8}
            regions={name:(bases[name],size) for name,size in sizes.items() if size}
            prefix,combined,mode=R.gp_carrier_plan(regions,image,0x8011A780,0x8011C604)
            src=folder/'prefix.s'; po=folder/'prefix.obj'
            src.write_bytes(('.sdata\r\n'+''.join('.byte '+','.join(map(str,prefix[i:i+16]))+'\r\n'
                            for i in range(0,len(prefix),16))).encode())
            run=B.run([S.ASPSX,'-q','-o',po,src])
            self.assertEqual(run.returncode,0,run.stdout+run.stderr)
            bindings=R.resolve_bindings([n for n in obj['xrefs'] if n!='_7CPlayer.PActiveArray'],symbols)
            bindings['_gp']=0x8011A780
            blocks,_=N.native_link('quests_operands',raw,combined,bindings,output_dir=folder,prefix_objects=[po])
            functions={r['name']:r['off'] for r in obj['xdefs']+obj['locals']
                       if obj['sections'].get(r['sect'])=='.text'}
            targets={
                'SetReturnLvlPos__Fv':(0x800681CC,[0x80068270,0x80068280,0x8006828C]),
                'ResyncQuests__Fv':(0x80068330,[0x800685BC,0x800685D0,0x80068600,0x80068618,
                                               0x80068634,0x80068658,0x80068660,0x80068690,0x800686B4]),
                'DrawQuestLog__Fv':(0x80068A70,[0x80068C14]),
            }
            for name,(retail_start,addresses) in targets.items():
                for va in addresses:
                    with self.subTest(function=name,address=hex(va)):
                        offset=functions[name]+va-retail_start
                        expected=image[va-0x80010000:va-0x80010000+4]
                        self.assertEqual(blocks['.text'][offset:offset+4],expected)


if __name__=='__main__':unittest.main()
