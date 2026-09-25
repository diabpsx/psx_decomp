.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_DrawLevelUpFlag, 0x28

glabel _GLOBAL__D_DrawLevelUpFlag
    /* 27550 80037550 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27554 80037554 1000BFAF */  sw         $ra, 0x10($sp)
    /* 27558 80037558 1380043C */  lui        $a0, %hi(D_8012EA88)
    /* 2755C 8003755C 88EA8424 */  addiu      $a0, $a0, %lo(D_8012EA88)
    /* 27560 80037560 91DD000C */  jal        ___6Dialog
    /* 27564 80037564 02000524 */   addiu     $a1, $zero, 0x2
    /* 27568 80037568 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2756C 8003756C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 27570 80037570 0800E003 */  jr         $ra
    /* 27574 80037574 00000000 */   nop
endlabel _GLOBAL__D_DrawLevelUpFlag
