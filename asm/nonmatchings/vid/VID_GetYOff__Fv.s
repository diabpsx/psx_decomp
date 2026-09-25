.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_GetYOff__Fv, 0xC

glabel VID_GetYOff__Fv
    /* 74178 80084178 B81E828F */  lw         $v0, %gp_rel(D_8011C638)($gp)
    /* 7417C 8008417C 0800E003 */  jr         $ra
    /* 74180 80084180 00000000 */   nop
endlabel VID_GetYOff__Fv
