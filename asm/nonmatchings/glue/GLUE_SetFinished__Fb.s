.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_SetFinished__Fb, 0xC

glabel GLUE_SetFinished__Fb
    /* 8BB10 8009BB10 301F84AF */  sw         $a0, %gp_rel(D_8011C6B0)($gp)
    /* 8BB14 8009BB14 0800E003 */  jr         $ra
    /* 8BB18 8009BB18 00000000 */   nop
endlabel GLUE_SetFinished__Fb
