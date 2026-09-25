.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TICK_Update, 0x20

glabel TICK_Update
    /* 10C2C 80020C2C 1280023C */  lui        $v0, %hi(GazTick)
    /* 10C30 80020C30 60CA428C */  lw         $v0, %lo(GazTick)($v0)
    /* 10C34 80020C34 00000000 */  nop
    /* 10C38 80020C38 01004224 */  addiu      $v0, $v0, 0x1
    /* 10C3C 80020C3C 1280013C */  lui        $at, %hi(GazTick)
    /* 10C40 80020C40 60CA22AC */  sw         $v0, %lo(GazTick)($at)
    /* 10C44 80020C44 0800E003 */  jr         $ra
    /* 10C48 80020C48 00000000 */   nop
endlabel TICK_Update
