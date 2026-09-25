.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFadeState__Fv, 0xC

glabel GetFadeState__Fv
    /* 6EEAC 8007EEAC EC14828F */  lw         $v0, %gp_rel(D_8011BC6C)($gp)
    /* 6EEB0 8007EEB0 0800E003 */  jr         $ra
    /* 6EEB4 8007EEB4 00000000 */   nop
endlabel GetFadeState__Fv
