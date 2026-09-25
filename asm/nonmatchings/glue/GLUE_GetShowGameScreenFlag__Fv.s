.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_GetShowGameScreenFlag__Fv, 0xC

glabel GLUE_GetShowGameScreenFlag__Fv
    /* 8BB94 8009BB94 8408828F */  lw         $v0, %gp_rel(DoDrawBg)($gp)
    /* 8BB98 8009BB98 0800E003 */  jr         $ra
    /* 8BB9C 8009BB9C 00000000 */   nop
endlabel GLUE_GetShowGameScreenFlag__Fv
