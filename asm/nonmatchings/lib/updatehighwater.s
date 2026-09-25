.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching updatehighwater, 0x4C

glabel updatehighwater
    /* 1B310 8002B310 3C1D828F */  lw         $v0, %gp_rel(highwateractive)($gp)
    /* 1B314 8002B314 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B318 8002B318 03004014 */  bnez       $v0, .L8002B328
    /* 1B31C 8002B31C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1B320 8002B320 D3AC0008 */  j          .L8002B34C
    /* 1B324 8002B324 21100000 */   addu      $v0, $zero, $zero
  .L8002B328:
    /* 1B328 8002B328 F1AC000C */  jal        largestunusedinclassi
    /* 1B32C 8002B32C 21200000 */   addu      $a0, $zero, $zero
    /* 1B330 8002B330 4423838F */  lw         $v1, %gp_rel(highwater)($gp)
    /* 1B334 8002B334 00000000 */  nop
    /* 1B338 8002B338 2A184300 */  slt        $v1, $v0, $v1
    /* 1B33C 8002B33C 02006010 */  beqz       $v1, .L8002B348
    /* 1B340 8002B340 00000000 */   nop
    /* 1B344 8002B344 442382AF */  sw         $v0, %gp_rel(highwater)($gp)
  .L8002B348:
    /* 1B348 8002B348 4423828F */  lw         $v0, %gp_rel(highwater)($gp)
  .L8002B34C:
    /* 1B34C 8002B34C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1B350 8002B350 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B354 8002B354 0800E003 */  jr         $ra
    /* 1B358 8002B358 00000000 */   nop
endlabel updatehighwater
