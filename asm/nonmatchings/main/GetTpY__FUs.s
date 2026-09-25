.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTpY__FUs, 0x1C

glabel GetTpY__FUs
    /* 73100 80083100 FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 73104 80083104 00110400 */  sll        $v0, $a0, 4
    /* 73108 80083108 00014230 */  andi       $v0, $v0, 0x100
    /* 7310C 8008310C 82200400 */  srl        $a0, $a0, 2
    /* 73110 80083110 00028430 */  andi       $a0, $a0, 0x200
    /* 73114 80083114 0800E003 */  jr         $ra
    /* 73118 80083118 25104400 */   or        $v0, $v0, $a0
endlabel GetTpY__FUs
