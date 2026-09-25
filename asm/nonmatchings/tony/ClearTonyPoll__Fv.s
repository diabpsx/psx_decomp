.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearTonyPoll__Fv, 0xC

glabel ClearTonyPoll__Fv
    /* 8B864 8009B864 B40680AF */  sw         $zero, %gp_rel(tony_poll)($gp)
    /* 8B868 8009B868 0800E003 */  jr         $ra
    /* 8B86C 8009B86C 00000000 */   nop
endlabel ClearTonyPoll__Fv
