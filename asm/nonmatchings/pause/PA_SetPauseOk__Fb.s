.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PA_SetPauseOk__Fb, 0x10

glabel PA_SetPauseOk__Fb
    /* 78BF4 80088BF4 C41E828F */  lw         $v0, %gp_rel(D_8011C644)($gp)
    /* 78BF8 80088BF8 C41E84AF */  sw         $a0, %gp_rel(D_8011C644)($gp)
    /* 78BFC 80088BFC 0800E003 */  jr         $ra
    /* 78C00 80088C00 00000000 */   nop
endlabel PA_SetPauseOk__Fb
