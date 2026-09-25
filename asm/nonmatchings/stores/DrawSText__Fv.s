.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSText__Fv, 0x40

glabel DrawSText__Fv
    /* 5FD64 8006FD64 33138293 */  lbu        $v0, %gp_rel(InStoreFlag)($gp)
    /* 5FD68 8006FD68 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5FD6C 8006FD6C 09004014 */  bnez       $v0, .L8006FD94
    /* 5FD70 8006FD70 1000BFAF */   sw        $ra, 0x10($sp)
    /* 5FD74 8006FD74 01000224 */  addiu      $v0, $zero, 0x1
    /* 5FD78 8006FD78 331382A3 */  sb         $v0, %gp_rel(InStoreFlag)($gp)
    /* 5FD7C 8006FD7C 21200000 */  addu       $a0, $zero, $zero
    /* 5FD80 8006FD80 0780053C */  lui        $a1, %hi(DrawSTextTSK__FP4TASK)
    /* 5FD84 8006FD84 A4FDA524 */  addiu      $a1, $a1, %lo(DrawSTextTSK__FP4TASK)
    /* 5FD88 8006FD88 00100624 */  addiu      $a2, $zero, 0x1000
    /* 5FD8C 8006FD8C 0480000C */  jal        TSK_AddTask
    /* 5FD90 8006FD90 21380000 */   addu      $a3, $zero, $zero
  .L8006FD94:
    /* 5FD94 8006FD94 1000BF8F */  lw         $ra, 0x10($sp)
    /* 5FD98 8006FD98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5FD9C 8006FD9C 0800E003 */  jr         $ra
    /* 5FDA0 8006FDA0 00000000 */   nop
endlabel DrawSText__Fv
