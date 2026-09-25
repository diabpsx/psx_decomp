.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownDrunk__Fv, 0x28

glabel TownDrunk__Fv
    /* 2B450 8003B450 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B454 8003B454 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B458 8003B458 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B45C 8003B45C 05000424 */   addiu     $a0, $zero, 0x5
    /* 2B460 8003B460 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B464 8003B464 21204000 */   addu      $a0, $v0, $zero
    /* 2B468 8003B468 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B46C 8003B46C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B470 8003B470 0800E003 */  jr         $ra
    /* 2B474 8003B474 00000000 */   nop
endlabel TownDrunk__Fv
