.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_GetMonsterList__Fv, 0xC

glabel GLUE_GetMonsterList__Fv
    /* 8BA18 8009BA18 3C1F828F */  lw         $v0, %gp_rel(D_8011C6BC)($gp)
    /* 8BA1C 8009BA1C 0800E003 */  jr         $ra
    /* 8BA20 8009BA20 00000000 */   nop
endlabel GLUE_GetMonsterList__Fv
