.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_CutScr, 0x28

glabel _GLOBAL__D_CutScr
    /* 94EB4 800A4EB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94EB8 800A4EB8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 94EBC 800A4EBC 0D80043C */  lui        $a0, %hi(CutScr)
    /* 94EC0 800A4EC0 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 94EC4 800A4EC4 F993020C */  jal        ___7CScreen
    /* 94EC8 800A4EC8 02000524 */   addiu     $a1, $zero, 0x2
    /* 94ECC 800A4ECC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 94ED0 800A4ED0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94ED4 800A4ED4 0800E003 */  jr         $ra
    /* 94ED8 800A4ED8 00000000 */   nop
endlabel _GLOBAL__D_CutScr
