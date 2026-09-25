.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init_GamePad__Fv, 0x30

glabel Init_GamePad__Fv
    /* 6AE50 8007AE50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6AE54 8007AE54 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6AE58 8007AE58 42000424 */  addiu      $a0, $zero, 0x42
    /* 6AE5C 8007AE5C 0880053C */  lui        $a1, %hi(GamePadTask__FP4TASK)
    /* 6AE60 8007AE60 34ACA524 */  addiu      $a1, $a1, %lo(GamePadTask__FP4TASK)
    /* 6AE64 8007AE64 00100624 */  addiu      $a2, $zero, 0x1000
    /* 6AE68 8007AE68 0480000C */  jal        TSK_AddTask
    /* 6AE6C 8007AE6C 21380000 */   addu      $a3, $zero, $zero
    /* 6AE70 8007AE70 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6AE74 8007AE74 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6AE78 8007AE78 0800E003 */  jr         $ra
    /* 6AE7C 8007AE7C 00000000 */   nop
endlabel Init_GamePad__Fv
