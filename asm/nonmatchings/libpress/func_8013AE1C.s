.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AE1C, 0x20

glabel func_8013AE1C
    /* 1224 8013AE1C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1228 8013AE20 1000BFAF */  sw         $ra, 0x10($sp)
    /* 122C 8013AE24 1FEC040C */  jal        func_8013B07C
    /* 1230 8013AE28 00000000 */   nop
    /* 1234 8013AE2C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1238 8013AE30 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 123C 8013AE34 0800E003 */  jr         $ra
    /* 1240 8013AE38 00000000 */   nop
endlabel func_8013AE1C
