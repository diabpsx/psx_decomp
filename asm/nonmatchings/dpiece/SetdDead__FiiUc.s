.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetdDead__FiiUc, 0x40

glabel SetdDead__FiiUc
    /* 72B60 80082B60 C0280500 */  sll        $a1, $a1, 3
    /* 72B64 80082B64 C0100400 */  sll        $v0, $a0, 3
    /* 72B68 80082B68 23104400 */  subu       $v0, $v0, $a0
    /* 72B6C 80082B6C C0110200 */  sll        $v0, $v0, 7
    /* 72B70 80082B70 2128A200 */  addu       $a1, $a1, $v0
    /* 72B74 80082B74 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72B78 80082B78 21082500 */  addu       $at, $at, $a1
    /* 72B7C 80082B7C 2A7A2290 */  lbu        $v0, %lo(dung_map + 0x2)($at)
    /* 72B80 80082B80 00310600 */  sll        $a2, $a2, 4
    /* 72B84 80082B84 0F004230 */  andi       $v0, $v0, 0xF
    /* 72B88 80082B88 25104600 */  or         $v0, $v0, $a2
    /* 72B8C 80082B8C 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72B90 80082B90 21082500 */  addu       $at, $at, $a1
    /* 72B94 80082B94 2A7A22A0 */  sb         $v0, %lo(dung_map + 0x2)($at)
    /* 72B98 80082B98 0800E003 */  jr         $ra
    /* 72B9C 80082B9C 00000000 */   nop
endlabel SetdDead__FiiUc
