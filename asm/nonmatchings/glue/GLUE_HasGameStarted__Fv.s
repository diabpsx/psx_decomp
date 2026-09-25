.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_HasGameStarted__Fv, 0xC

glabel GLUE_HasGameStarted__Fv
    /* 8BBC0 8009BBC0 7408828F */  lw         $v0, %gp_rel(D_8011AFF4)($gp)
    /* 8BBC4 8009BBC4 0800E003 */  jr         $ra
    /* 8BBC8 8009BBC8 00000000 */   nop
endlabel GLUE_HasGameStarted__Fv
