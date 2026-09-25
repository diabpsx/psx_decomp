.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTpY__FUs_8008584c, 0x1C

glabel GetTpY__FUs_8008584c
    /* 7584C 8008584C FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 75850 80085850 00110400 */  sll        $v0, $a0, 4
    /* 75854 80085854 00014230 */  andi       $v0, $v0, 0x100
    /* 75858 80085858 82200400 */  srl        $a0, $a0, 2
    /* 7585C 8008585C 00028430 */  andi       $a0, $a0, 0x200
    /* 75860 80085860 0800E003 */  jr         $ra
    /* 75864 80085864 25104400 */   or        $v0, $v0, $a0
endlabel GetTpY__FUs_8008584c
