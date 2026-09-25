.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_GetTick__Fv, 0xC

glabel VID_GetTick__Fv
    /* 740F8 800840F8 B01E828F */  lw         $v0, %gp_rel(D_8011C630)($gp)
    /* 740FC 800840FC 0800E003 */  jr         $ra
    /* 74100 80084100 00000000 */   nop
endlabel VID_GetTick__Fv
