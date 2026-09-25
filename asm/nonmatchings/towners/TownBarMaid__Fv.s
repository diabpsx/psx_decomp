.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownBarMaid__Fv, 0x28

glabel TownBarMaid__Fv
    /* 2B4C8 8003B4C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B4CC 8003B4CC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B4D0 8003B4D0 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B4D4 8003B4D4 07000424 */   addiu     $a0, $zero, 0x7
    /* 2B4D8 8003B4D8 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B4DC 8003B4DC 21204000 */   addu      $a0, $v0, $zero
    /* 2B4E0 8003B4E0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B4E4 8003B4E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B4E8 8003B4E8 0800E003 */  jr         $ra
    /* 2B4EC 8003B4EC 00000000 */   nop
endlabel TownBarMaid__Fv
