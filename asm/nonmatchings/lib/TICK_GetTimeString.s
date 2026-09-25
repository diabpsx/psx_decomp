.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TICK_GetTimeString, 0x10

glabel TICK_GetTimeString
    /* 10C88 80020C88 1180023C */  lui        $v0, %hi(D_8010E764)
    /* 10C8C 80020C8C 64E74224 */  addiu      $v0, $v0, %lo(D_8010E764)
    /* 10C90 80020C90 0800E003 */  jr         $ra
    /* 10C94 80020C94 00000000 */   nop
endlabel TICK_GetTimeString
