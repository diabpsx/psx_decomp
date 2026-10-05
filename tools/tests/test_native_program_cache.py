"""Raw native cache receipts must cover both build identity and artifacts."""
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import native_program as N


class NativeProgramCacheTests(unittest.TestCase):
    def test_receipt_rejects_changed_inputs_and_artifacts(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            obj, assembly, stamp = root / 'x.obj', root / 'x.s', root / 'x.json'
            obj.write_bytes(b'object')
            assembly.write_bytes(b'assembly')
            inputs = {'compiler_sha256': 'compiler', 'assembler_flags': ['-G8']}
            self.assertFalse(N.cache_matches(stamp, inputs, obj, assembly))
            stamp.write_text(json.dumps({'inputs': inputs,
                                        'object_sha256': N.digest(obj),
                                        'assembly_sha256': N.digest(assembly)}))
            self.assertTrue(N.cache_matches(stamp, inputs, obj, assembly))
            for changed in ({**inputs, 'compiler_sha256': 'different'},
                            {**inputs, 'assembler_flags': ['-G0']}):
                self.assertFalse(N.cache_matches(stamp, changed, obj, assembly))
            obj.write_bytes(b'tampered')
            self.assertFalse(N.cache_matches(stamp, inputs, obj, assembly))
            obj.write_bytes(b'object')
            assembly.write_bytes(b'tampered')
            self.assertFalse(N.cache_matches(stamp, inputs, obj, assembly))
            stamp.write_text('{invalid')
            self.assertFalse(N.cache_matches(stamp, inputs, obj, assembly))


if __name__ == '__main__':
    unittest.main()
