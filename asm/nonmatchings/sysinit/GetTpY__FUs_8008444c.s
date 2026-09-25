.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTpY__FUs_8008444c, 0x1C

glabel GetTpY__FUs_8008444c
    /* 7444C 8008444C FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 74450 80084450 00110400 */  sll        $v0, $a0, 4
    /* 74454 80084454 00014230 */  andi       $v0, $v0, 0x100
    /* 74458 80084458 82200400 */  srl        $a0, $a0, 2
    /* 7445C 8008445C 00028430 */  andi       $a0, $a0, 0x200
    /* 74460 80084460 0800E003 */  jr         $ra
    /* 74464 80084464 25104400 */   or        $v0, $v0, $a0
endlabel GetTpY__FUs_8008444c
