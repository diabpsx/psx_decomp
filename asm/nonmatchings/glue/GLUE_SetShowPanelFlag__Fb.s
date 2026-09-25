.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_SetShowPanelFlag__Fb, 0x10

glabel GLUE_SetShowPanelFlag__Fb
    /* 8BBB0 8009BBB0 8008828F */  lw         $v0, %gp_rel(DoShowPanel)($gp)
    /* 8BBB4 8009BBB4 800884AF */  sw         $a0, %gp_rel(DoShowPanel)($gp)
    /* 8BBB8 8009BBB8 0800E003 */  jr         $ra
    /* 8BBBC 8009BBBC 00000000 */   nop
endlabel GLUE_SetShowPanelFlag__Fb
