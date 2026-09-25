.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTRAP__Fii, 0x30

glabel GetTRAP__Fii
    /* 730D0 800830D0 C0280500 */  sll        $a1, $a1, 3
    /* 730D4 800830D4 C0100400 */  sll        $v0, $a0, 3
    /* 730D8 800830D8 23104400 */  subu       $v0, $v0, $a0
    /* 730DC 800830DC C0110200 */  sll        $v0, $v0, 7
    /* 730E0 800830E0 2128A200 */  addu       $a1, $a1, $v0
    /* 730E4 800830E4 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 730E8 800830E8 21082500 */  addu       $at, $at, $a1
    /* 730EC 800830EC 2A7A2290 */  lbu        $v0, %lo(dung_map + 0x2)($at)
    /* 730F0 800830F0 00000000 */  nop
    /* 730F4 800830F4 08004230 */  andi       $v0, $v0, 0x8
    /* 730F8 800830F8 0800E003 */  jr         $ra
    /* 730FC 800830FC 2B100200 */   sltu      $v0, $zero, $v0
endlabel GetTRAP__Fii
