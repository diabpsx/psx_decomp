.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_SetHomingScrollFlag__Fb, 0x10

glabel GLUE_SetHomingScrollFlag__Fb
    /* 8BBA0 8009BBA0 341F828F */  lw         $v0, %gp_rel(D_8011C6B4)($gp)
    /* 8BBA4 8009BBA4 341F84AF */  sw         $a0, %gp_rel(D_8011C6B4)($gp)
    /* 8BBA8 8009BBA8 0800E003 */  jr         $ra
    /* 8BBAC 8009BBAC 00000000 */   nop
endlabel GLUE_SetHomingScrollFlag__Fb
