.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTpY__FUs_800ad1f0, 0x1C

glabel GetTpY__FUs_800ad1f0
    /* 9D1F0 800AD1F0 FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 9D1F4 800AD1F4 00110400 */  sll        $v0, $a0, 4
    /* 9D1F8 800AD1F8 00014230 */  andi       $v0, $v0, 0x100
    /* 9D1FC 800AD1FC 82200400 */  srl        $a0, $a0, 2
    /* 9D200 800AD200 00028430 */  andi       $a0, $a0, 0x200
    /* 9D204 800AD204 0800E003 */  jr         $ra
    /* 9D208 800AD208 25104400 */   or        $v0, $v0, $a0
endlabel GetTpY__FUs_800ad1f0
