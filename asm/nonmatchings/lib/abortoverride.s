.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching abortoverride, 0xC

glabel abortoverride
    /* 1552C 8002552C 341C84AF */  sw         $a0, %gp_rel(override)($gp)
    /* 15530 80025530 0800E003 */  jr         $ra
    /* 15534 80025534 00000000 */   nop
endlabel abortoverride
