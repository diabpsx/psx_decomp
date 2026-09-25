.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___7CScreen, 0x20

glabel ___7CScreen
    /* 94FE4 800A4FE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94FE8 800A4FE8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 94FEC 800A4FEC AA47020C */  jal        ___7TextDat
    /* 94FF0 800A4FF0 00000000 */   nop
    /* 94FF4 800A4FF4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 94FF8 800A4FF8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94FFC 800A4FFC 0800E003 */  jr         $ra
    /* 95000 800A5000 00000000 */   nop
endlabel ___7CScreen
