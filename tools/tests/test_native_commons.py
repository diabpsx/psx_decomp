import copy
from pathlib import Path
import sys
import unittest

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import native_commons as C


class CommonPlacementTests(unittest.TestCase):
    def setUp(self):
        self.obj={'sections':{5:'.sbss'},'xdefs':[{'name':'a','bss':1,'sect':5}]}
        self.spec={'a':{'va':'0x80011001','size':1,'scaffold':'tiny.sdata'}}
        self.symbols='a = 0x80011001; // data\nb = 0x80011001; // data\n'
        self.layouts={'diabpsx':{('sdata','tiny'):(0x80011000,16)}}

    def plan(self,spec=None,obj=None,names=('a',)):
        return C.placements(self.obj if obj is None else obj,self.spec if spec is None else spec,
                            self.symbols,self.layouts,names)

    def test_byte_common_has_exact_size_address_and_fragment(self):
        row=self.plan()['a']
        self.assertEqual((row['va'],row['size'],row['limit']),(0x80011001,1,0x80011010))

    def test_missing_untyped_and_wrong_size_commons_fail(self):
        for spec,names in (({},('a',)),(self.spec,())):
            with self.assertRaises(ValueError):self.plan(spec,names=names)
        for size in (True,0,2):
            spec=copy.deepcopy(self.spec);spec['a']['size']=size
            with self.assertRaises(ValueError):self.plan(spec)

    def test_wrong_address_fragment_and_storage_fail(self):
        for key,value in (('va','0x80011002'),('scaffold','tiny.bss'),('scaffold','unknown.sdata')):
            spec=copy.deepcopy(self.spec);spec['a'][key]=value
            with self.assertRaises(ValueError):self.plan(spec)
        obj=copy.deepcopy(self.obj);obj['sections'][5]='.data'
        with self.assertRaises(ValueError):self.plan(obj=obj)

    def test_duplicate_or_overlapping_common_owners_fail(self):
        obj=copy.deepcopy(self.obj);obj['xdefs'].append(dict(obj['xdefs'][0]))
        with self.assertRaises(ValueError):self.plan(obj=obj)
        obj['xdefs'][-1]['name']='b'
        spec=copy.deepcopy(self.spec);spec['b']=dict(spec['a'])
        with self.assertRaises(ValueError):self.plan(spec,obj,('a','b'))


if __name__=='__main__':unittest.main()
