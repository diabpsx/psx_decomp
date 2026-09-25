.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetBLOCK__Fii, 0x30

glabel GetBLOCK__Fii
    /* 72F88 80082F88 C0280500 */  sll        $a1, $a1, 3
    /* 72F8C 80082F8C C0100400 */  sll        $v0, $a0, 3
    /* 72F90 80082F90 23104400 */  subu       $v0, $v0, $a0
    /* 72F94 80082F94 C0110200 */  sll        $v0, $v0, 7
    /* 72F98 80082F98 2128A200 */  addu       $a1, $a1, $v0
    /* 72F9C 80082F9C 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72FA0 80082FA0 21082500 */  addu       $at, $at, $a1
    /* 72FA4 80082FA4 2A7A2290 */  lbu        $v0, %lo(dung_map + 0x2)($at)
    /* 72FA8 80082FA8 00000000 */  nop
    /* 72FAC 80082FAC 04004230 */  andi       $v0, $v0, 0x4
    /* 72FB0 80082FB0 0800E003 */  jr         $ra
    /* 72FB4 80082FB4 2B100200 */   sltu      $v0, $zero, $v0
endlabel GetBLOCK__Fii
