.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_WaitForAsyncFinish__Fv, 0x44

glabel BL_WaitForAsyncFinish__Fv
    /* 77E28 80087E28 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 77E2C 80087E2C 1000BFAF */  sw         $ra, 0x10($sp)
  .L80087E30:
    /* 77E30 80087E30 871F020C */  jal        BL_AsyncLoadDone__Fv
    /* 77E34 80087E34 00000000 */   nop
    /* 77E38 80087E38 01004238 */  xori       $v0, $v0, 0x1
    /* 77E3C 80087E3C 05004010 */  beqz       $v0, .L80087E54
    /* 77E40 80087E40 00000000 */   nop
    /* 77E44 80087E44 EE80000C */  jal        TSK_Sleep
    /* 77E48 80087E48 01000424 */   addiu     $a0, $zero, 0x1
    /* 77E4C 80087E4C 8C1F0208 */  j          .L80087E30
    /* 77E50 80087E50 00000000 */   nop
  .L80087E54:
    /* 77E54 80087E54 53BE000C */  jal        systemtask
    /* 77E58 80087E58 21200000 */   addu      $a0, $zero, $zero
    /* 77E5C 80087E5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 77E60 80087E60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 77E64 80087E64 0800E003 */  jr         $ra
    /* 77E68 80087E68 00000000 */   nop
endlabel BL_WaitForAsyncFinish__Fv
