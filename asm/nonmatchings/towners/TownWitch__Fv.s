.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownWitch__Fv, 0x28

glabel TownWitch__Fv
    /* 2B4A0 8003B4A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B4A4 8003B4A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B4A8 8003B4A8 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B4AC 8003B4AC 06000424 */   addiu     $a0, $zero, 0x6
    /* 2B4B0 8003B4B0 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B4B4 8003B4B4 21204000 */   addu      $a0, $v0, $zero
    /* 2B4B8 8003B4B8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B4BC 8003B4BC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B4C0 8003B4C0 0800E003 */  jr         $ra
    /* 2B4C4 8003B4C4 00000000 */   nop
endlabel TownWitch__Fv
