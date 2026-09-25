.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DBG_SetMessageHandler, 0x10

glabel DBG_SetMessageHandler
    /* 10E84 80020E84 1280013C */  lui        $at, %hi(MsgFunc)
    /* 10E88 80020E88 6CCA24AC */  sw         $a0, %lo(MsgFunc)($at)
    /* 10E8C 80020E8C 0800E003 */  jr         $ra
    /* 10E90 80020E90 00000000 */   nop
endlabel DBG_SetMessageHandler
