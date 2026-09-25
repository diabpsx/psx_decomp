.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DBG_PollHost, 0x8

glabel DBG_PollHost
    /* 10E5C 80020E5C 0800E003 */  jr         $ra
    /* 10E60 80020E60 00000000 */   nop
endlabel DBG_PollHost
