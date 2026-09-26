.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AEB4, 0x24

glabel func_8013AEB4
    /* 12BC 8013AEB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12C0 8013AEB8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 12C4 8013AEBC 21288000 */  addu       $a1, $a0, $zero
    /* 12C8 8013AEC0 B748000C */  jal        DMACallback
    /* 12CC 8013AEC4 21200000 */   addu      $a0, $zero, $zero
    /* 12D0 8013AEC8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 12D4 8013AECC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12D8 8013AED0 0800E003 */  jr         $ra
    /* 12DC 8013AED4 00000000 */   nop
endlabel func_8013AEB4
