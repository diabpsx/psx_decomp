.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching KANJI_strlen__FPc, 0x40

glabel KANJI_strlen__FPc
    /* 3E350 8004E350 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 3E354 8004E354 DC380108 */  j          .L8004E370
    /* 3E358 8004E358 21280000 */   addu      $a1, $zero, $zero
  .L8004E35C:
    /* 3E35C 8004E35C 02004010 */  beqz       $v0, .L8004E368
    /* 3E360 8004E360 00000000 */   nop
    /* 3E364 8004E364 01008424 */  addiu      $a0, $a0, 0x1
  .L8004E368:
    /* 3E368 8004E368 01008424 */  addiu      $a0, $a0, 0x1
    /* 3E36C 8004E36C 0100A524 */  addiu      $a1, $a1, 0x1
  .L8004E370:
    /* 3E370 8004E370 00008280 */  lb         $v0, 0x0($a0)
    /* 3E374 8004E374 00008390 */  lbu        $v1, 0x0($a0)
    /* 3E378 8004E378 F8FF4014 */  bnez       $v0, .L8004E35C
    /* 3E37C 8004E37C 80006230 */   andi      $v0, $v1, 0x80
    /* 3E380 8004E380 2110A000 */  addu       $v0, $a1, $zero
    /* 3E384 8004E384 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 3E388 8004E388 0800E003 */  jr         $ra
    /* 3E38C 8004E38C 00000000 */   nop
endlabel KANJI_strlen__FPc
