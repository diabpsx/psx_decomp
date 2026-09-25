.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SYSI_GetOverlayFs__Fv, 0xC

glabel SYSI_GetOverlayFs__Fv
    /* 74480 80084480 C01E828F */  lw         $v0, %gp_rel(D_8011C640)($gp)
    /* 74484 80084484 0800E003 */  jr         $ra
    /* 74488 80084488 00000000 */   nop
endlabel SYSI_GetOverlayFs__Fv
