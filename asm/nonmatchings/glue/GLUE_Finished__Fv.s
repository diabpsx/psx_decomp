.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_Finished__Fv, 0xC

glabel GLUE_Finished__Fv
    /* 8BB04 8009BB04 301F828F */  lw         $v0, %gp_rel(D_8011C6B0)($gp)
    /* 8BB08 8009BB08 0800E003 */  jr         $ra
    /* 8BB0C 8009BB0C 00000000 */   nop
endlabel GLUE_Finished__Fv
