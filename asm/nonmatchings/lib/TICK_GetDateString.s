.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TICK_GetDateString, 0x10

glabel TICK_GetDateString
    /* 10C78 80020C78 1180023C */  lui        $v0, %hi(D_8010E758)
    /* 10C7C 80020C7C 58E74224 */  addiu      $v0, $v0, %lo(D_8010E758)
    /* 10C80 80020C80 0800E003 */  jr         $ra
    /* 10C84 80020C84 00000000 */   nop
endlabel TICK_GetDateString
