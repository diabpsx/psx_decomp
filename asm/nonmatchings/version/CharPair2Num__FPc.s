.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CharPair2Num__FPc, 0x28

glabel CharPair2Num__FPc
    /* 726F4 800826F4 00008380 */  lb         $v1, 0x0($a0)
    /* 726F8 800826F8 00000000 */  nop
    /* 726FC 800826FC D0FF6324 */  addiu      $v1, $v1, -0x30
    /* 72700 80082700 80100300 */  sll        $v0, $v1, 2
    /* 72704 80082704 21104300 */  addu       $v0, $v0, $v1
    /* 72708 80082708 40100200 */  sll        $v0, $v0, 1
    /* 7270C 8008270C 01008380 */  lb         $v1, 0x1($a0)
    /* 72710 80082710 D0FF4224 */  addiu      $v0, $v0, -0x30
    /* 72714 80082714 0800E003 */  jr         $ra
    /* 72718 80082718 21104300 */   addu      $v0, $v0, $v1
endlabel CharPair2Num__FPc
