"""Exact source-twin linkage for stripped EACPSXZ library members."""
import json
from pathlib import Path
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


ASPSX234 = Path("C:/Temp/nfs2-clean/psyq350/PSYQ/ASPSX.EXE")


@unittest.skipUnless(all(path.is_file() for path in
                         (B.CPP, S.GLIB_CC1, S.DOSBOX, ASPSX234, S.PSYLINK,
                          B.ROOT / "rom/DIABPSX.BIN")),
                     "historical EAC toolchain/retail inputs unavailable")
class EacNativeTests(unittest.TestCase):
    def test_savegp_register_variables(self):
        spec = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())["savegp"]
        retail = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        with tempfile.TemporaryDirectory(prefix="eac-savegp-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                raw = S.compile_g(B.ROOT / spec["source"], assembler=ASPSX234,
                                  assembler_dos=True, assembler_flags=[]).read_bytes()
            obj = P.parse_obj_complete(raw)
            regions = {".text": (0x8002FFF4, 44), ".data": (0x800B7084, 4)}
            blocks, mapping = N.native_link("savegp", raw, regions,
                                            {"_gp": 0x8011A780}, output_dir=folder)
            for section, (address, size) in regions.items():
                self.assertEqual(blocks[section],
                                 retail[address - 0x80010000:address - 0x80010000 + size])
            paths = [B.ROOT / "asm/nonmatchings/lib" / (name + ".s")
                     for name in ("initgp", "savegp_ci", "restoregp")]
            self.assertEqual(R.verify_stripped_library_members(
                obj, spec, {".text.lib": regions[".text"], ".data": regions[".data"]},
                mapping, S.RETAIL.read_text(encoding="latin-1"), paths), 3)

    def test_eac_compiler_lane_and_divide_guard(self):
        # EA Canada EACLIB objects: PsyQ 3.6 DOS CC1PSX + ASPSX 2.56 keeping its default divide guard
        self.assertEqual(S.compiler_lane(B.ROOT / "recon/eaclib/timer.c"), (S.PSYQ36_CC1, True))
        self.assertEqual(S.compiler_lane(B.ROOT / "recon/eaclib/ddx.c"), (S.GLIB_CC1, False))
        version, path, dos, flags = R.source_assembler_options({"assembler": "2.56", "divide_guard": True})
        self.assertEqual((version, path, dos, flags), ("2.56", S.ASPSX, False, []))
        self.assertEqual(R.source_assembler_options({"assembler": "2.56"})[3], ["-0"])
        with self.assertRaises(ValueError):
            R.source_assembler_options({"assembler": "2.34", "divide_guard": False})

    @unittest.skipUnless(S.PSYQ36_CC1.is_file(), "PsyQ 3.6 DOS CC1PSX unavailable")
    def test_timer_object_shape(self):
        # one TIMER object: gettick .. timedwait; tickset/tickval are its gp-relative small data
        source = B.ROOT / "recon/eaclib/timer.c"
        with tempfile.TemporaryDirectory(prefix="eac-timer-", dir=B.BUILD) as directory:
            with patch.object(S, "OUT", Path(directory)):
                raw = S.compile_g(source, assembler=S.ASPSX, assembler_dos=False,
                                  assembler_flags=[]).read_bytes()
        obj = P.parse_obj_complete(raw)
        self.assertEqual({obj["sections"][section]: len(data)
                          for section, data in obj["code"].items()},
                         {".sdata": 8, ".text": 348})
        self.assertEqual({row["name"] for row in obj["xdefs"]},
                         {"gettick", "tickcount", "elapsedticks", "resettick", "setticks", "waitticks",
                          "testticks", "timedwait", "tickset", "tickval"})
        self.assertEqual(obj["xrefs"], ["ticks"])
        wanted = b"".join(N.scaffold_bytes(B.ROOT / "asm/nonmatchings/lib" / (name + ".s"))[1] for name in
                          ("gettick", "tickcount", "elapsedticks", "resettick", "setticks", "waitticks",
                           "testticks", "timedwait"))
        section = next(index for index, name in obj["sections"].items() if name == ".text")
        self.assertEqual(len(obj["code"][section]), len(wanted))

    def test_crc_assembly_and_table(self):
        spec = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())["crc"]
        retail = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        with tempfile.TemporaryDirectory(prefix="eac-crc-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                raw = R.compile_source(B.ROOT / spec["source"], ASPSX234, True, []).read_bytes()
            obj = P.parse_obj_complete(raw)
            regions = {".text": (0x800297B4, 200), ".data": (0x800B69C4, 512)}
            blocks, mapping = N.native_link("crc", raw, regions, {"_gp": 0x8011A780},
                                            output_dir=folder)
            for section, (address, size) in regions.items():
                self.assertEqual(blocks[section],
                                 retail[address - 0x80010000:address - 0x80010000 + size])
            self.assertEqual(R.verify_stripped_library_members(
                obj, spec, {".text.lib": regions[".text"], ".data": regions[".data"]},
                mapping, S.RETAIL.read_text(encoding="latin-1"),
                [B.ROOT / "asm/nonmatchings/lib/crc16.s"]), 1)

    def test_complete_stripped_library_objects(self):
        registry = json.loads((B.ROOT / "configs/native_recon_link.json").read_text())
        retail = (B.ROOT / "rom/DIABPSX.BIN").read_bytes()
        retail_sym = S.RETAIL.read_text(encoding="latin-1")
        cases = {"blkfill": (["blockclear", "blockfill"], {}),
                 "getm": (["getm", "geti"], {}),
                 "nasync_debug": (["dumpasync", "validateasyncblocks"], {}),
                 "textcrnt": (["putm", "puti"], {})}
        with tempfile.TemporaryDirectory(prefix="eac-native-", dir=B.BUILD) as directory:
            folder = Path(directory)
            with patch.object(S, "OUT", folder):
                for segment, (names, externals) in cases.items():
                    spec = registry[segment]
                    source = B.ROOT / spec["source"]
                    raw = R.compile_source(source, ASPSX234, True, []).read_bytes()
                    obj = P.parse_obj_complete(raw)
                    wanted = b"".join(N.scaffold_bytes(
                        B.ROOT / "asm/nonmatchings/lib" / (name + ".s"))[1] for name in names)
                    section = next(index for index, name in obj["sections"].items() if name == ".text")
                    if not externals:
                        self.assertEqual(obj["code"][section], wanted)
                    else:
                        self.assertEqual(len(obj["code"][section]), len(wanted))
                    logical = spec["sections"][".text.lib"]
                    region = (int(logical["va"], 0), logical["size"])
                    blocks, mapping = N.native_link(segment, raw, {".text": region},
                                                    {"_gp": 0x8011A780, **externals}, output_dir=folder)
                    self.assertEqual(blocks[".text"],
                                     retail[region[0] - 0x80010000:region[0] - 0x80010000 + region[1]])
                    paths = [B.ROOT / "asm/nonmatchings/lib" / (name + ".s") for name in names]
                    self.assertEqual(R.verify_stripped_library_members(
                        obj, spec, {".text.lib": region}, mapping, retail_sym, paths), len(names))


if __name__ == "__main__":
    unittest.main()
