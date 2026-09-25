.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_GetXOff__Fv, 0xC

glabel VID_GetXOff__Fv
    /* 7416C 8008416C B41E828F */  lw         $v0, %gp_rel(D_8011C634)($gp)
    /* 74170 80084170 0800E003 */  jr         $ra
    /* 74174 80084174 00000000 */   nop
endlabel VID_GetXOff__Fv
