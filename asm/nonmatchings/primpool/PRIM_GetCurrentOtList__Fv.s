.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetCurrentOtList__Fv, 0xC

glabel PRIM_GetCurrentOtList__Fv
    /* 73D8C 80083D8C 3403828F */  lw         $v0, %gp_rel(ThisOt)($gp)
    /* 73D90 80083D90 0800E003 */  jr         $ra
    /* 73D94 80083D94 00000000 */   nop
endlabel PRIM_GetCurrentOtList__Fv
