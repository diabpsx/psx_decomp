"""PsyQ 4.10 LIBPRESS archive members reproduce the complete FMV prefix."""
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_archive as N
import sdk_link as S
import symlane as SL


@unittest.skipUnless(all(path.is_file() for path in
                         (S.ARCHIVE_ROOTS["4.1"] / "LIBPRESS.LIB", SL.PSYLINK,
                          B.ROOT / "rom/DIABPSX.MAP", B.ROOT / "rom/FMV.BIN")),
                     "original PsyQ archive/toolchain/retail inputs unavailable")
class LibpressNativeTests(unittest.TestCase):
    def test_complete_archive_group(self):
        with tempfile.TemporaryDirectory(prefix="libpress-native-", dir=B.BUILD) as directory:
            receipts = N.build(["libpress"], Path(directory))
        self.assertEqual(len(receipts), 1)
        receipt = receipts[0]
        self.assertEqual(receipt["members"], ["LIBPRESS", "VLC_C", "BUILD"])
        self.assertEqual({name: row["size"] for name, row in receipt["sections"].items()},
                         {"libpress_rdata.rodata": 176, "libpress_data.data": 3984,
                          "libpress_rodata_8013ac3c.rodata": 2976})
        self.assertEqual(len(receipt["exports"]), 13)
        self.assertEqual(set(receipt["externals"]),
                         {"DMACallback", "ResetCallback", "printf"})


if __name__ == "__main__":
    unittest.main()
