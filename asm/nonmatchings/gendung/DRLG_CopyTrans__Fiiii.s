.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_CopyTrans__Fiiii, 0x48

glabel DRLG_CopyTrans__Fiiii
    /* 20560 8015A158 C0380700 */  sll        $a3, $a3, 3
    /* 20564 8015A15C C0180600 */  sll        $v1, $a2, 3
    /* 20568 8015A160 23186600 */  subu       $v1, $v1, $a2
    /* 2056C 8015A164 C0190300 */  sll        $v1, $v1, 7
    /* 20570 8015A168 C0280500 */  sll        $a1, $a1, 3
    /* 20574 8015A16C C0100400 */  sll        $v0, $a0, 3
    /* 20578 8015A170 23104400 */  subu       $v0, $v0, $a0
    /* 2057C 8015A174 C0110200 */  sll        $v0, $v0, 7
    /* 20580 8015A178 2128A200 */  addu       $a1, $a1, $v0
    /* 20584 8015A17C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 20588 8015A180 21082500 */  addu       $at, $at, $a1
    /* 2058C 8015A184 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 20590 8015A188 2138E300 */  addu       $a3, $a3, $v1
    /* 20594 8015A18C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 20598 8015A190 21082700 */  addu       $at, $at, $a3
    /* 2059C 8015A194 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 205A0 8015A198 0800E003 */  jr         $ra
    /* 205A4 8015A19C 00000000 */   nop
endlabel DRLG_CopyTrans__Fiiii
