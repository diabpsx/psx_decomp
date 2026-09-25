.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetCurrentPortal__Fi, 0xC

glabel SetCurrentPortal__Fi
    /* 713E4 800813E4 502184AF */  sw         $a0, %gp_rel(D_8011C8D0)($gp)
    /* 713E8 800813E8 0800E003 */  jr         $ra
    /* 713EC 800813EC 00000000 */   nop
endlabel SetCurrentPortal__Fi
