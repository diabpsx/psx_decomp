.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_SetShowGameScreenFlag__Fb, 0x10

glabel GLUE_SetShowGameScreenFlag__Fb
    /* 8BB84 8009BB84 8408828F */  lw         $v0, %gp_rel(DoDrawBg)($gp)
    /* 8BB88 8009BB88 840884AF */  sw         $a0, %gp_rel(DoDrawBg)($gp)
    /* 8BB8C 8009BB8C 0800E003 */  jr         $ra
    /* 8BB90 8009BB90 00000000 */   nop
endlabel GLUE_SetShowGameScreenFlag__Fb
