.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_InitL1Vals__Fv, 0x8

glabel DRLG_InitL1Vals__Fv
    /* 3364 8013CF5C 0800E003 */  jr         $ra
    /* 3368 8013CF60 00000000 */   nop
endlabel DRLG_InitL1Vals__Fv
