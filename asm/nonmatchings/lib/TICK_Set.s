.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TICK_Set, 0x10

glabel TICK_Set
    /* 10C0C 80020C0C 1280013C */  lui        $at, %hi(GazTick)
    /* 10C10 80020C10 60CA24AC */  sw         $a0, %lo(GazTick)($at)
    /* 10C14 80020C14 0800E003 */  jr         $ra
    /* 10C18 80020C18 00000000 */   nop
endlabel TICK_Set
