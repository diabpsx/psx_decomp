.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsGameLoading__Fv, 0xC

glabel IsGameLoading__Fv
    /* 94648 800A4648 C809828F */  lw         $v0, %gp_rel(D_8011B148)($gp)
    /* 9464C 800A464C 0800E003 */  jr         $ra
    /* 94650 800A4650 00000000 */   nop
endlabel IsGameLoading__Fv
