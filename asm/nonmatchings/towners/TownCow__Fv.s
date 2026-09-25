.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownCow__Fv, 0x28

glabel TownCow__Fv
    /* 2B4F0 8003B4F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B4F4 8003B4F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B4F8 8003B4F8 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B4FC 8003B4FC 09000424 */   addiu     $a0, $zero, 0x9
    /* 2B500 8003B500 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B504 8003B504 21204000 */   addu      $a0, $v0, $zero
    /* 2B508 8003B508 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B50C 8003B50C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B510 8003B510 0800E003 */  jr         $ra
    /* 2B514 8003B514 00000000 */   nop
endlabel TownCow__Fv
