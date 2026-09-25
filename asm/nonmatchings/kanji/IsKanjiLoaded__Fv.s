.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsKanjiLoaded__Fv, 0xC

glabel IsKanjiLoaded__Fv
    /* 9D718 800AD718 500B828F */  lw         $v0, %gp_rel(D_8011B2D0)($gp)
    /* 9D71C 800AD71C 0800E003 */  jr         $ra
    /* 9D720 800AD720 00000000 */   nop
endlabel IsKanjiLoaded__Fv
