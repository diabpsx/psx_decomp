from pathlib import Path
from types import SimpleNamespace
import sys
import unittest
import contextlib
import io
import tempfile
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from recon_bss import placements, validate_object
from native_recon import check_bss_overlap
import gen_ld


class ReconBSSTests(unittest.TestCase):
    sources = {'pool': 'recon/psxsrc/pool.cpp', 'other': 'recon/source/other.cpp'}

    def test_linker_emits_original_source_section_and_exact_extent(self):
        yaml = (gen_ld.ROOT / 'configs/diabpsx.yaml').read_text()
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / 'configs').mkdir()
            (root / 'linkers').mkdir()
            (root / 'configs/diabpsx.yaml').write_text(yaml)
            sources = dict(gen_ld.RECON_MAP, primpool='recon/psxsrc/primpool.cpp')
            binding = {'diabpsx': {'primpool': {'.sbss': {'va': '0x8011C608', 'size': 32}}}}
            with patch.object(gen_ld, 'ROOT', root), patch.object(gen_ld, 'RECON_MAP', sources), \
                 patch.object(gen_ld, 'RECON_BSS', binding), contextlib.redirect_stdout(io.StringIO()):
                gen_ld.gen('diabpsx')
            script = (root / 'linkers/diabpsx.ld').read_text()
            self.assertIn('build/recon/psxsrc/primpool.cpp.o(.sbss);', script)
            self.assertIn('. = 0x10C608;', script)
            self.assertIn('ASSERT(. - __recon_primpool_sbss_start == 0x20,', script)

    def rows(self, rows):
        return placements(rows, self.sources, 0x8011C604, 0x80139BF4)

    def test_exact_packed_bss_placement(self):
        rows = self.rows({'pool': {'.sbss': {'va': '0x8011C608', 'size': 32}}})
        self.assertEqual(rows, [(0x8011C608, 32, 'pool', '.sbss')])
        check_bss_overlap(rows, [(0x8011C604, 4, 'main', '.sbss')])
        with self.assertRaises(ValueError):
            check_bss_overlap(rows, [(0x8011C624, 4, 'sdk', '.bss')])

    def test_bad_ownership_sections_addresses_and_sizes_fail(self):
        for registry in (
            {'unknown': {'.sbss': {'va': '0x8011C608', 'size': 32}}},
            {'pool': {}}, {'pool': {'.data': {'va': '0x8011C608', 'size': 32}}},
            *({'pool': {'.sbss': {'va': va, 'size': size}}} for va, size in
              [('0x8011C600', 4), ('0x80139BF0', 8), ('0x8011C609', 4),
               ('0x8011C608', True), ('0x8011C608', 0), (0x8011C608, 4)]),
        ):
            with self.subTest(registry=registry), self.assertRaises(ValueError):
                self.rows(registry)

    def test_conventional_owners_cannot_overlap(self):
        with self.assertRaises(ValueError):
            self.rows({'pool': {'.sbss': {'va': '0x8011C608', 'size': 32}},
                       'other': {'.bss': {'va': '0x8011C620', 'size': 8}}})

    def test_only_exact_nobits_object_section_is_accepted(self):
        binding = {'.sbss': {'va': '0x8011C608', 'size': 32}}
        for kind, flags, size, good in [(8, 3, 32, True), (1, 3, 32, False),
                                         (8, 0, 32, False), (8, 3, 44, False)]:
            elf = SimpleNamespace(names=['.sbss'], sections=[(0, kind, flags, 0, 0, size)])
            if good:
                validate_object(elf, binding)
            else:
                with self.assertRaises(ValueError):
                    validate_object(elf, binding)
        with self.assertRaises(ValueError):
            validate_object(SimpleNamespace(names=[], sections=[]), binding)

    def test_packed_symbol_offsets_are_checked(self):
        row = {'.sbss': {'size': 4, 'symbols': {'byte1': 1}}}
        elf = SimpleNamespace(names=['.sbss'], sections=[(0, 8, 3, 0, 0, 4)],
                              symbols={0: [('byte1', 1, 0, 0, 0, 0)]})
        validate_object(elf, row)
        elf.symbols[0][0] = ('byte1', 0, 0, 0, 0, 0)
        with self.assertRaises(ValueError):
            validate_object(elf, row)


if __name__ == '__main__':
    unittest.main()
