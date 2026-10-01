from pathlib import Path
from types import SimpleNamespace
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import callaudit as C


class CallAuditSectionTests(unittest.TestCase):
    def test_cross_section_tail_call_at_same_offset_is_not_local_jump(self):
        symbols = ('00000000 g F .text 00000008 first\n'
                   '00000000 g F .text.startup 00000008 second\n')
        disasm = ('Disassembly of section .text:\n'
                  '   0: 08000000 j 0\n'
                  '      0: R_MIPS_26 .text.startup\n'
                  'Disassembly of section .text.startup:\n'
                  '   0: 0c000000 jal 0\n'
                  '      0: R_MIPS_26 external__Fi\n')
        outputs = [SimpleNamespace(returncode=0, stdout=x, stderr='') for x in (symbols, disasm)]
        with patch.object(C.B, 'run', side_effect=outputs):
            defined, calls = C.calls(Path('sample.o'), 'objdump')
        self.assertEqual(set(defined), {'first', 'second'})
        self.assertEqual(calls, {'first': ['second'], 'second': ['external__Fi']})

    def test_within_function_jump_remains_excluded(self):
        symbols = '00000000 g F .text.startup 00000008 function\n'
        disasm = 'Disassembly of section .text.startup:\n 0: 08000001 j 4\n 0: R_MIPS_26 .text.startup\n'
        outputs = [SimpleNamespace(returncode=0, stdout=x, stderr='') for x in (symbols, disasm)]
        with patch.object(C.B, 'run', side_effect=outputs):
            _, calls = C.calls(Path('sample.o'), 'objdump')
        self.assertEqual(calls, {'function': []})


if __name__ == '__main__':
    unittest.main()
