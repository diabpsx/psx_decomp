.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetdDead__Fii, 0x28

glabel GetdDead__Fii
    /* 72BA0 80082BA0 C0280500 */  sll        $a1, $a1, 3
    /* 72BA4 80082BA4 C0100400 */  sll        $v0, $a0, 3
    /* 72BA8 80082BA8 23104400 */  subu       $v0, $v0, $a0
    /* 72BAC 80082BAC C0110200 */  sll        $v0, $v0, 7
    /* 72BB0 80082BB0 2128A200 */  addu       $a1, $a1, $v0
    /* 72BB4 80082BB4 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72BB8 80082BB8 21082500 */  addu       $at, $at, $a1
    /* 72BBC 80082BBC 2A7A2290 */  lbu        $v0, %lo(dung_map + 0x2)($at)
    /* 72BC0 80082BC0 0800E003 */  jr         $ra
    /* 72BC4 80082BC4 02110200 */   srl       $v0, $v0, 4
endlabel GetdDead__Fii
