.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PA_GetPauseOk__Fv, 0xC

glabel PA_GetPauseOk__Fv
    /* 78C04 80088C04 C41E828F */  lw         $v0, %gp_rel(D_8011C644)($gp)
    /* 78C08 80088C08 0800E003 */  jr         $ra
    /* 78C0C 80088C0C 00000000 */   nop
endlabel PA_GetPauseOk__Fv
