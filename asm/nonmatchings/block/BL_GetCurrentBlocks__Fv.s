.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_GetCurrentBlocks__Fv, 0xC

glabel BL_GetCurrentBlocks__Fv
    /* 819EC 800919EC 2805828F */  lw         $v0, %gp_rel(CurrentBlocks)($gp)
    /* 819F0 800919F0 0800E003 */  jr         $ra
    /* 819F4 800919F4 00000000 */   nop
endlabel BL_GetCurrentBlocks__Fv
