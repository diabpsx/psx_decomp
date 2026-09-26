.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_mdec_buffer, 0x1C

glabel init_mdec_buffer
    /* 1CDD8 801569D0 540E84AF */  sw         $a0, %gp_rel(mdc_bufstart)($gp)
    /* 1CDDC 801569D4 500E84AF */  sw         $a0, %gp_rel(mdc_buftop)($gp)
    /* 1CDE0 801569D8 5C0E85AF */  sw         $a1, %gp_rel(mdc_buftotal)($gp)
    /* 1CDE4 801569DC 580E85AF */  sw         $a1, %gp_rel(mdc_bufleft)($gp)
    /* 1CDE8 801569E0 480D80AF */  sw         $zero, %gp_rel(num_mdcs)($gp)
    /* 1CDEC 801569E4 0800E003 */  jr         $ra
    /* 1CDF0 801569E8 00000000 */   nop
endlabel init_mdec_buffer
