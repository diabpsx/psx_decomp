.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetKanjiLoaded__Fb, 0x10

glabel SetKanjiLoaded__Fb
    /* 9D708 800AD708 500B828F */  lw         $v0, %gp_rel(D_8011B2D0)($gp)
    /* 9D70C 800AD70C 500B84AF */  sw         $a0, %gp_rel(D_8011B2D0)($gp)
    /* 9D710 800AD710 0800E003 */  jr         $ra
    /* 9D714 800AD714 00000000 */   nop
endlabel SetKanjiLoaded__Fb
