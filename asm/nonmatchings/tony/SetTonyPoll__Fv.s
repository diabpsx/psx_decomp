.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTonyPoll__Fv, 0xC

glabel SetTonyPoll__Fv
    /* 8B858 8009B858 B40680AF */  sw         $zero, %gp_rel(tony_poll)($gp)
    /* 8B85C 8009B85C 0800E003 */  jr         $ra
    /* 8B860 8009B860 00000000 */   nop
endlabel SetTonyPoll__Fv
