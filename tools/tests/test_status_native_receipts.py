"""The status board accepts only fresh complete-object native byte/SYM receipts."""
from pathlib import Path
import hashlib
import json
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import status as S


class StatusNativeReceiptTests(unittest.TestCase):
    def test_source_hash_controls_receipt_freshness(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "recon/sample.cpp"
            source.parent.mkdir(parents=True)
            source.write_bytes(b"source")
            receipts = root / "build/native_source/receipts.json"
            receipts.parent.mkdir(parents=True)
            row = {"segment": "sample", "source": "recon/sample.cpp", "functions": 3,
                   "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest()}
            receipts.write_text(json.dumps([row]))
            with patch.object(S, "ROOT", root):
                self.assertEqual(S.native_sym_receipts(), {("sample", source.resolve()): 3})
                source.write_bytes(b"changed")
                self.assertEqual(S.native_sym_receipts(), {})


if __name__ == "__main__":
    unittest.main()
