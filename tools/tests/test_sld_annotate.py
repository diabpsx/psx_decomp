"""SLD annotator: record parsing, per-TU run selection across aliased overlay addresses, line marking."""
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import sld_annotate as S

SYM = """\
000010: $80010000 88 Set SLD to line 10 of file D:\\DIABPSX\\SOURCE\\ALPHA.CPP
000020: $80010004 80 Inc SLD linenum (to 11)
000030: $8001000c 82 Inc SLD linenum by byte 3 (to 14)
000040: $80010014 86 Set SLD linenum to 40
000050: $80010018 84 Inc SLD linenum by word 300 (to 340)
000060: $80010020 8a End SLD info
000070: $80010000 88 Set SLD to line 500 of file D:\\DIABPSX\\PSXSRC\\BETA.CPP
000080: $80010008 80 Inc SLD linenum (to 501)
000090: $80010030 8a End SLD info
0000a0: $80020000 94 Def class STAT type INT size 0 name unrelated
"""

ORACLE = """\
.set noat
nonmatching f, 0x20
glabel f
    /* 00000 80010000 00000000 */  addiu      $sp, $sp, -0x10
    /* 00004 80010004 00000000 */  sw         $ra, 0x8($sp)
    /* 00008 80010008 00000000 */  nop
.L8001000C:
    /* 0000C 8001000C 00000000 */  lw         $v0, 0x0($a0)
    /* 00010 80010010 00000000 */  addu       $v0, $v0, $a1
    /* 00014 80010014 00000000 */  sw         $v0, 0x0($a0)
    /* 00018 80010018 00000000 */  jr         $ra
    /* 0001C 8001001C 00000000 */   nop
endlabel f
"""


class SldAnnotateTests(unittest.TestCase):
    def setUp(self):
        self.recs = S.parse_sym(SYM.splitlines())
        self.ins, self.labels = S.parse_oracle(ORACLE)

    def test_parse_sym_keeps_every_line_bearing_kind_with_its_file(self):
        self.assertEqual(self.recs, [
            (0x80010000, 10, "ALPHA.CPP"), (0x80010004, 11, "ALPHA.CPP"), (0x8001000C, 14, "ALPHA.CPP"),
            (0x80010014, 40, "ALPHA.CPP"), (0x80010018, 340, "ALPHA.CPP"),
            (0x80010000, 500, "BETA.CPP"), (0x80010008, 501, "BETA.CPP")])

    def test_parse_oracle_reads_instructions_and_local_labels_only(self):
        self.assertEqual(len(self.ins), 8)
        self.assertEqual(self.ins[3], (0x8001000C, "lw         $v0, 0x0($a0)"))
        self.assertEqual(self.labels, [(3, ".L8001000C:")])

    def test_run_selection_separates_aliased_overlay_runs(self):
        alpha, f = S.select_run(self.recs, 0x80010000, 0x8001001C, "ALPHA.CPP")
        self.assertEqual(f, "ALPHA.CPP")
        self.assertEqual([l for _, l in alpha], [10, 11, 14, 40, 340])
        beta, f = S.select_run(self.recs, 0x80010000, 0x8001001C, "BETA")
        self.assertEqual((f, [l for _, l in beta]), ("BETA.CPP", [500, 501]))
        none, f = S.select_run(self.recs, 0x80010000, 0x8001001C, "GAMMA.CPP")
        self.assertEqual((none, f), ([], None))
        # unrestricted: the run with the most records inside the range wins
        best, f = S.select_run(self.recs, 0x80010000, 0x8001001C)
        self.assertEqual(f, "ALPHA.CPP")

    def test_annotate_holds_the_line_in_force_and_render_marks_statement_starts(self):
        run, _ = S.select_run(self.recs, 0x80010000, 0x8001001C, "ALPHA.CPP")
        rows = S.annotate(self.ins, run)
        self.assertEqual([l for _, l, _ in rows], [10, 11, 11, 14, 14, 40, 340, 340])
        text = S.render(rows, self.labels)
        lines = text.splitlines()
        self.assertTrue(lines[0].startswith("   0 80010000   *10  addiu"))
        self.assertTrue(lines[2].startswith("   2 80010008    11  nop"))
        self.assertEqual(lines[3], ".L8001000C:")
        self.assertTrue(lines[4].startswith("   3 8001000c   *14  lw"))
        counts, free = S.summary(rows)
        self.assertEqual(dict(counts), {10: 1, 11: 2, 14: 2, 40: 1, 340: 2})
        self.assertEqual(free[:3], [12, 13, 15])
        self.assertEqual(len(free), (340 - 10 + 1) - 5)

    def test_render_line_filter(self):
        run, _ = S.select_run(self.recs, 0x80010000, 0x8001001C, "ALPHA.CPP")
        rows = S.annotate(self.ins, run)
        text = S.render(rows, self.labels, (11, 14))
        self.assertEqual([l[:4].strip() for l in text.splitlines() if not l.startswith(".L")], ["1", "2", "3", "4"])


@unittest.skipUnless(S.DEFAULT_SYM.is_file() and (S.ROOT / "asm/nonmatchings/control/DrawSpellCel__FllUclUcc.s").is_file(),
                     "retail SYM and oracle not present")
class SldAnnotateRetailTests(unittest.TestCase):
    def test_drawspellcel_lines_match_the_hand_made_receipt(self):
        ins, labels = S.parse_oracle((S.ROOT / "asm/nonmatchings/control/DrawSpellCel__FllUclUcc.s").read_text(errors="replace"))
        recs = S.parse_sym(S.DEFAULT_SYM.read_text(errors="replace").splitlines())
        run, f = S.select_run(recs, ins[0][0], ins[-1][0], "CONTROL.CPP")
        self.assertEqual(f, "CONTROL.CPP")
        rows = S.annotate(ins, run)
        self.assertEqual(rows[0][:2], (0x800301B4, 551))      # prologue
        self.assertEqual(rows[82][1], 594)                     # if (!Trans) test
        self.assertEqual(rows[142][1], 614)                    # lw $a0, 0x8($s1): SW/SH word
        self.assertEqual(len(rows), 737)


if __name__ == "__main__":
    unittest.main()
