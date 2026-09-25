.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRndSeed__Fl, 0x10

glabel SetRndSeed__Fl
    /* 2DACC 8003DACC 442084AF */  sw         $a0, %gp_rel(D_8011C7C4)($gp)
    /* 2DAD0 8003DAD0 DC1080AF */  sw         $zero, %gp_rel(SeedCount)($gp)
    /* 2DAD4 8003DAD4 0800E003 */  jr         $ra
    /* 2DAD8 8003DAD8 00000000 */   nop
endlabel SetRndSeed__Fl
