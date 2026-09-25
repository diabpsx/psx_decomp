.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_DoQuake__Fii, 0x10

glabel GLUE_DoQuake__Fii
    /* 8BCA4 8009BCA4 401F84AF */  sw         $a0, %gp_rel(D_8011C6C0)($gp)
    /* 8BCA8 8009BCA8 441F85AF */  sw         $a1, %gp_rel(D_8011C6C4)($gp)
    /* 8BCAC 8009BCAC 0800E003 */  jr         $ra
    /* 8BCB0 8009BCB0 00000000 */   nop
endlabel GLUE_DoQuake__Fii
