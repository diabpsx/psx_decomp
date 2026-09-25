.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcNumOfStrings__FPPc, 0xC

glabel CalcNumOfStrings__FPPc
    /* 6B758 8007B758 0000828C */  lw         $v0, 0x0($a0)
    /* 6B75C 8007B75C 0800E003 */  jr         $ra
    /* 6B760 8007B760 82100200 */   srl       $v0, $v0, 2
endlabel CalcNumOfStrings__FPPc
