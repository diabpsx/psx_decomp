"""Keep GAME's complete source-text ownership separate from scaffolded data."""
import json
from pathlib import Path
import sys
import unittest

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import native_recon as R
import status


class GameSourceCoverageTests(unittest.TestCase):
    def test_every_game_text_fragment_has_a_complete_source_owner(self):
        registry=json.loads((R.B.ROOT/'configs/native_recon_link.json').read_text())
        layout,base=R.image_layout('game')
        code={name:extent for (kind,name),extent in layout.items() if kind=='c'}
        owners={name:spec for name,spec in registry.items() if spec['image']=='game'}
        self.assertEqual(set(code),{'gameonly','missiles','monster','inv','automap'})
        self.assertEqual(set(owners),set(code))
        cursor=base+4  # The remaining four bytes are the overlay file ID, not code.
        for name,(start,size) in sorted(code.items(),key=lambda x:x[1][0]):
            row=owners[name]['sections']['.text']
            self.assertEqual((int(row['va'],0),row['size']),(start,size))
            self.assertEqual(start,cursor)
            self.assertTrue((R.B.ROOT/owners[name]['source']).is_file())
            cursor+=size
        self.assertEqual(cursor-base,172584)
        self.assertEqual(sum(len(status.seg_functions(name)) for name in code),297)


if __name__=='__main__':unittest.main()
