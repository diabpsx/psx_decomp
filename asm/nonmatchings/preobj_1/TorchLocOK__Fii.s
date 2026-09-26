.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TorchLocOK__Fii, 0x30

glabel TorchLocOK__Fii
    /* 1EAE8 801586E0 C0280500 */  sll        $a1, $a1, 3
    /* 1EAEC 801586E4 C0100400 */  sll        $v0, $a0, 3
    /* 1EAF0 801586E8 23104400 */  subu       $v0, $v0, $a0
    /* 1EAF4 801586EC C0110200 */  sll        $v0, $v0, 7
    /* 1EAF8 801586F0 2128A200 */  addu       $a1, $a1, $v0
    /* 1EAFC 801586F4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1EB00 801586F8 21082500 */  addu       $at, $at, $a1
    /* 1EB04 801586FC 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1EB08 80158700 00000000 */  nop
    /* 1EB0C 80158704 08004230 */  andi       $v0, $v0, 0x8
    /* 1EB10 80158708 0800E003 */  jr         $ra
    /* 1EB14 8015870C 0100422C */   sltiu     $v0, $v0, 0x1
endlabel TorchLocOK__Fii
