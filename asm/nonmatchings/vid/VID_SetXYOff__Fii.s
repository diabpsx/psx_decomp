.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_SetXYOff__Fii, 0x10

glabel VID_SetXYOff__Fii
    /* 7415C 8008415C B41E84AF */  sw         $a0, %gp_rel(D_8011C634)($gp)
    /* 74160 80084160 B81E85AF */  sw         $a1, %gp_rel(D_8011C638)($gp)
    /* 74164 80084164 0800E003 */  jr         $ra
    /* 74168 80084168 00000000 */   nop
endlabel VID_SetXYOff__Fii
