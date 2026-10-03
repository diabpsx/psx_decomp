import copy
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import symlane as S
import aspsx_gate as A


class OverlayOwnershipTests(unittest.TestCase):
    def test_map_drives_overlay_routing_including_diagnostic_copies(self):
        self.assertEqual(S.overlay_group(Path('recon/source/monster.cpp')), 'game_text')
        self.assertEqual(S.overlay_group(Path('build/probe/fmv.cpp')), 'fmv_text')
        self.assertEqual(S.overlay_group(Path('recon/source/premon.cpp')), 'pregame_text')
        self.assertIsNone(S.overlay_group(Path('recon/source/control.cpp')))
        self.assertIsNone(S.overlay_group(Path('recon/psxsrc/corefmv.cpp')))
        self.assertIsNone(S.overlay_group(None))

    def test_overlay_pools_keep_their_verified_storage_home(self):
        self.assertEqual(S.overlay_sections(Path('drlg_l3.cpp'), 'pregame_text'), {'.text', '.rdata', '.data'})
        self.assertEqual(S.overlay_sections(Path('missiles.cpp'), 'game_text'), {'.text'})
        self.assertEqual(S.overlay_sections(Path('monster.cpp'), 'game_text'), {'.text'})
        self.assertEqual(S.overlay_sections(Path('fmv.cpp'), 'fmv_text'), {'.text', '.rdata', '.data'})


@unittest.skipUnless(all(p.is_file() for p in (S.B.CPP, S.B.CC1PL, S.ASPSX, S.PSYLINK, S.DUMPSYM, S.SYMMUNGE)),
                     'original PsyQ and SYMMUNGE tools unavailable')
class OverlayProducerTests(unittest.TestCase):
    def test_real_overlay_munge_moves_static_suffix_and_keeps_exact_comparison(self):
        build = S.ROOT / 'build'
        build.mkdir(exist_ok=True)
        with tempfile.TemporaryDirectory(prefix='symov-', dir=build) as directory:
            folder = Path(directory)
            source = folder / 'fmv.cpp'
            source.write_text('extern void consume(int *, int);\n'
                              'int scopeprobe(int a) {\n'
                              ' int before = a * 3;\n'
                              ' static int counter = 0;\n'
                              ' int after = a + 2;\n'
                              ' consume(&counter, before);\n'
                              ' return before + after;\n}\n')
            with patch.object(S, 'OUT', folder):
                obj = S.compile_g(source)
                original_obj = obj.read_bytes()
                receipt = S.link(obj, source=source)
                final = S.functions(receipt.read_text())
                raw_text = (folder / 'fmv_g.raw.sym.txt').read_text()
                raw = S.functions(raw_text)
                self.assertIn(' overlay length ', raw_text)
                self.assertIn(' set overlay', raw_text)
                name = 'scopeprobe__Fi'
                self.assertEqual(set(final), set(raw))
                self.assertEqual(original_obj, obj.read_bytes())
                records = raw[name]['recs']
                split = next(i for i, record in enumerate(records) if record[0] == 'STAT')
                params = [r for r in records[:split] if r[0] in ('ARG', 'REGPARM')]
                locals_ = records[len(params):split]
                suffix = records[split:]
                self.assertEqual([r[5] for r in locals_], ['before'])
                self.assertEqual([r[5] for r in suffix], ['counter', 'after'])
                expected = copy.deepcopy(raw[name])
                expected['recs'] = params + suffix + locals_
                start, end = [x for x in raw[name]['seq'] if x[0] == 'B']
                expected['seq'] = [('R', r[5]) for r in params + suffix] + [start] + [('R', r[5]) for r in locals_] + [end]
                self.assertEqual(S.compare(final[name], expected), (True, 'SYM ok'))
                self.assertFalse(S.compare(raw[name], expected)[0])
                # A genuine wrong local register must still fail after compaction.
                wrong = copy.deepcopy(expected)
                record = list(wrong['recs'][-1])
                record[-1] = '$99'
                wrong['recs'][-1] = tuple(record)
                self.assertFalse(S.compare(final[name], wrong)[0])
                memory = A.read_cpe(folder / 'fmv_g.cpe')
                self.assertIsNotNone(A.fetch(memory, final[name]['start'], final[name]['end']))

    def test_unverified_compactor_fails_closed(self):
        with tempfile.TemporaryDirectory() as directory:
            fake = Path(directory) / 'symmunge.exe'
            fake.write_bytes(b'not the verified vendor tool')
            with patch.object(S, 'SYMMUNGE', fake):
                with self.assertRaisesRegex(SystemExit, 'verified original SYMMUNGE'):
                    S.link(Path('unused.obj'), source=Path('fmv.cpp'))


if __name__ == '__main__':
    unittest.main()
