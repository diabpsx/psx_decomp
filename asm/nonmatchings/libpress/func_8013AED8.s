.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AED8, 0x24

glabel func_8013AED8
    /* 12E0 8013AED8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12E4 8013AEDC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 12E8 8013AEE0 21288000 */  addu       $a1, $a0, $zero
    /* 12EC 8013AEE4 B748000C */  jal        DMACallback
    /* 12F0 8013AEE8 01000424 */   addiu     $a0, $zero, 0x1
    /* 12F4 8013AEEC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 12F8 8013AEF0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12FC 8013AEF4 0800E003 */  jr         $ra
    /* 1300 8013AEF8 00000000 */   nop
endlabel func_8013AED8
