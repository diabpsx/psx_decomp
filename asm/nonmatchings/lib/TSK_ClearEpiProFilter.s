.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_ClearEpiProFilter, 0x34

glabel TSK_ClearEpiProFilter
    /* 10B00 80020B00 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10B04 80020B04 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10B08 80020B08 01000434 */  ori        $a0, $zero, 0x1
    /* 10B0C 80020B0C BA82000C */  jal        TSK_SetEpiProFilter
    /* 10B10 80020B10 21280000 */   addu      $a1, $zero, $zero
    /* 10B14 80020B14 B482000C */  jal        TSK_SetTaskEpilogue
    /* 10B18 80020B18 21200000 */   addu      $a0, $zero, $zero
    /* 10B1C 80020B1C AE82000C */  jal        TSK_SetTaskPrologue
    /* 10B20 80020B20 21200000 */   addu      $a0, $zero, $zero
    /* 10B24 80020B24 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10B28 80020B28 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10B2C 80020B2C 0800E003 */  jr         $ra
    /* 10B30 80020B30 00000000 */   nop
endlabel TSK_ClearEpiProFilter
