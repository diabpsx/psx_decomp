"""Complete native linkage for the one-function frontend/pregame probe TUs."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build as B
import native_recon as R
import psyq_extract as P
import sdk_link as N
import symlane as S


@unittest.skipUnless(all(path.is_file() for path in
                         (B.CPP, B.CC1PL, S.ASPSX, S.PSYLINK, S.DUMPSYM,
                          B.ROOT / "rom/DIABPSX.BIN", B.ROOT / "rom/FRONTEND.BIN",
                          B.ROOT / "rom/PREGAME.BIN")),
                     "original toolchain/retail inputs unavailable")
class OverlayProbeNativeTests(unittest.TestCase):
    def test_complete_cross_image_members(self):
        registry = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())
        symbols = "\n".join(path.read_text() for path in (B.ROOT / "configs").glob("symbol_addrs*.txt"))
        main = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        cases = {"pregame": ("PREGAME.BIN", 0x8011101C, "pregame_text"),
                 "presonly": ("FRONTEND.BIN", 0x80110FA8, "frontend_text")}
        with tempfile.TemporaryDirectory(prefix="overlay-probe-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                for segment, (image, pool, group) in cases.items():
                    spec = registry[segment]
                    source = B.ROOT / spec["source"]
                    raw = S.compile_g(source).read_bytes()
                    obj = P.parse_obj_complete(raw)
                    self.assertEqual({obj["sections"][section]: len(data)
                                      for section, data in obj["code"].items()},
                                     {".rdata": 23, ".text": 40})
                    regions = {".text": (0x80139BFC, 40), ".rdata": (pool, 23)}
                    bindings = R.resolve_bindings(spec["externals"], symbols)
                    bindings["_gp"] = 0x8011A780
                    blocks, _ = N.native_link(segment, raw, regions, bindings, output_dir=folder,
                                              overlay_text=True, overlay_group=group)   # retail overlay ids $c / $b
                    overlay = (B.ROOT / "rom" / image).read_bytes()
                    self.assertEqual(blocks[".text"], overlay[4:44])
                    self.assertEqual(blocks[".rdata"], main[pool - 0x80010000:pool - 0x80010000 + 23])
                    dump = subprocess.run([S.DUMPSYM, folder / (segment + ".sym")],
                                          capture_output=True, text=True)
                    self.assertEqual(dump.returncode, 0, dump.stderr)
                    self.assertEqual(R.verify_sym(dump.stdout, segment, [],
                                                  S.RETAIL.read_text(encoding="latin-1")), 1)


if __name__ == "__main__":
    unittest.main()
