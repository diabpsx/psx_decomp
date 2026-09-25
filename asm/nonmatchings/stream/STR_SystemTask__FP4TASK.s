.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_SystemTask__FP4TASK, 0x30

glabel STR_SystemTask__FP4TASK
    /* 88B0C 80098B0C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 88B10 80098B10 1000BFAF */  sw         $ra, 0x10($sp)
  .L80098B14:
    /* 88B14 80098B14 53BE000C */  jal        systemtask
    /* 88B18 80098B18 21200000 */   addu      $a0, $zero, $zero
    /* 88B1C 80098B1C EE80000C */  jal        TSK_Sleep
    /* 88B20 80098B20 01000424 */   addiu     $a0, $zero, 0x1
    /* 88B24 80098B24 C5620208 */  j          .L80098B14
    /* 88B28 80098B28 00000000 */   nop
    /* 88B2C 80098B2C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 88B30 80098B30 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 88B34 80098B34 0800E003 */  jr         $ra
    /* 88B38 80098B38 00000000 */   nop
endlabel STR_SystemTask__FP4TASK
