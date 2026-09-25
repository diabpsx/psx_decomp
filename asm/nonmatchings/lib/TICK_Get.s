.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TICK_Get, 0x10

glabel TICK_Get
    /* 10C1C 80020C1C 1280023C */  lui        $v0, %hi(GazTick)
    /* 10C20 80020C20 60CA428C */  lw         $v0, %lo(GazTick)($v0)
    /* 10C24 80020C24 0800E003 */  jr         $ra
    /* 10C28 80020C28 00000000 */   nop
endlabel TICK_Get
