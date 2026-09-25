.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DBG_SetPollRoutine, 0x10

glabel DBG_SetPollRoutine
    /* 10EE0 80020EE0 1280013C */  lui        $at, %hi(PollFunc)
    /* 10EE4 80020EE4 88CA24AC */  sw         $a0, %lo(PollFunc)($at)
    /* 10EE8 80020EE8 0800E003 */  jr         $ra
    /* 10EEC 80020EEC 00000000 */   nop
endlabel DBG_SetPollRoutine
