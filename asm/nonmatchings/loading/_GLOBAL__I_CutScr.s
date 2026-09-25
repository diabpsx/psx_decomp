.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_CutScr, 0x28

glabel _GLOBAL__I_CutScr
    /* 94EDC 800A4EDC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94EE0 800A4EE0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 94EE4 800A4EE4 0D80043C */  lui        $a0, %hi(CutScr)
    /* 94EE8 800A4EE8 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 94EEC 800A4EEC 1752020C */  jal        __7CScreen
    /* 94EF0 800A4EF0 00000000 */   nop
    /* 94EF4 800A4EF4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 94EF8 800A4EF8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94EFC 800A4EFC 0800E003 */  jr         $ra
    /* 94F00 800A4F00 00000000 */   nop
endlabel _GLOBAL__I_CutScr
