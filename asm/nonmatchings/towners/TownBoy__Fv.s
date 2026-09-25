.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownBoy__Fv, 0x28

glabel TownBoy__Fv
    /* 2B478 8003B478 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B47C 8003B47C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B480 8003B480 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B484 8003B484 08000424 */   addiu     $a0, $zero, 0x8
    /* 2B488 8003B488 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B48C 8003B48C 21204000 */   addu      $a0, $v0, $zero
    /* 2B490 8003B490 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B494 8003B494 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B498 8003B498 0800E003 */  jr         $ra
    /* 2B49C 8003B49C 00000000 */   nop
endlabel TownBoy__Fv
