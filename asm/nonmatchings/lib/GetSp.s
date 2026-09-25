.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSp, 0x8

glabel GetSp
    /* 112C4 800212C4 0800E003 */  jr         $ra
    /* 112C8 800212C8 2110A003 */   addu      $v0, $sp, $zero
endlabel GetSp
    /* 112CC 800212CC 00000000 */  nop
    /* 112D0 800212D0 00000000 */  nop
