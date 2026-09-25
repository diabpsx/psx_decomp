.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching filename, 0x5C

glabel filename
    /* 1F518 8002F518 00008290 */  lbu        $v0, 0x0($a0)
    /* 1F51C 8002F51C 00000000 */  nop
    /* 1F520 8002F520 12004010 */  beqz       $v0, .L8002F56C
    /* 1F524 8002F524 21188000 */   addu      $v1, $a0, $zero
    /* 1F528 8002F528 5C000724 */  addiu      $a3, $zero, 0x5C
    /* 1F52C 8002F52C 3A000624 */  addiu      $a2, $zero, 0x3A
    /* 1F530 8002F530 2F000524 */  addiu      $a1, $zero, 0x2F
    /* 1F534 8002F534 00006290 */  lbu        $v0, 0x0($v1)
  .L8002F538:
    /* 1F538 8002F538 00000000 */  nop
    /* 1F53C 8002F53C 05004710 */  beq        $v0, $a3, .L8002F554
    /* 1F540 8002F540 00000000 */   nop
    /* 1F544 8002F544 03004610 */  beq        $v0, $a2, .L8002F554
    /* 1F548 8002F548 00000000 */   nop
    /* 1F54C 8002F54C 02004514 */  bne        $v0, $a1, .L8002F558
    /* 1F550 8002F550 00000000 */   nop
  .L8002F554:
    /* 1F554 8002F554 01006424 */  addiu      $a0, $v1, 0x1
  .L8002F558:
    /* 1F558 8002F558 01006324 */  addiu      $v1, $v1, 0x1
    /* 1F55C 8002F55C 00006290 */  lbu        $v0, 0x0($v1)
    /* 1F560 8002F560 00000000 */  nop
    /* 1F564 8002F564 F4FF4014 */  bnez       $v0, .L8002F538
    /* 1F568 8002F568 00000000 */   nop
  .L8002F56C:
    /* 1F56C 8002F56C 0800E003 */  jr         $ra
    /* 1F570 8002F570 21108000 */   addu      $v0, $a0, $zero
endlabel filename
