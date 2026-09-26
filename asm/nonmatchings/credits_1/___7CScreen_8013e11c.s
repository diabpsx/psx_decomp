.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___7CScreen_8013e11c, 0x20

glabel ___7CScreen_8013e11c
    /* 4524 8013E11C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4528 8013E120 1000BFAF */  sw         $ra, 0x10($sp)
    /* 452C 8013E124 AA47020C */  jal        ___7TextDat
    /* 4530 8013E128 00000000 */   nop
    /* 4534 8013E12C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4538 8013E130 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 453C 8013E134 0800E003 */  jr         $ra
    /* 4540 8013E138 00000000 */   nop
endlabel ___7CScreen_8013e11c
