.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_SetMonsterList__Fi, 0xC

glabel GLUE_SetMonsterList__Fi
    /* 8BA0C 8009BA0C 3C1F84AF */  sw         $a0, %gp_rel(D_8011C6BC)($gp)
    /* 8BA10 8009BA10 0800E003 */  jr         $ra
    /* 8BA14 8009BA14 00000000 */   nop
endlabel GLUE_SetMonsterList__Fi
