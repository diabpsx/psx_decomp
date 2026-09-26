.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_InitL2Vals__Fv, 0x8

glabel DRLG_InitL2Vals__Fv
    /* E53C 80148134 0800E003 */  jr         $ra
    /* E540 80148138 00000000 */   nop
endlabel DRLG_InitL2Vals__Fv
