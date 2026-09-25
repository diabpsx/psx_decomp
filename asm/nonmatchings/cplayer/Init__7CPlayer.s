.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init__7CPlayer, 0x8

glabel Init__7CPlayer
    /* 864CC 800964CC 0800E003 */  jr         $ra
    /* 864D0 800964D0 00000000 */   nop
endlabel Init__7CPlayer
