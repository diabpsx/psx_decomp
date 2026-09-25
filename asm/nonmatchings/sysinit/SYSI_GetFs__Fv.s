.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SYSI_GetFs__Fv, 0xC

glabel SYSI_GetFs__Fv
    /* 74474 80084474 BC1E828F */  lw         $v0, %gp_rel(D_8011C63C)($gp)
    /* 74478 80084478 0800E003 */  jr         $ra
    /* 7447C 8008447C 00000000 */   nop
endlabel SYSI_GetFs__Fv
