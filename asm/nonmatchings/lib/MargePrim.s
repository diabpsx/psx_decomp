.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MargePrim, 0x38

glabel MargePrim
    /* 3518 80013518 03008290 */  lbu        $v0, 0x3($a0)
    /* 351C 8001351C 0300A390 */  lbu        $v1, 0x3($a1)
    /* 3520 80013520 00000000 */  nop
    /* 3524 80013524 21104300 */  addu       $v0, $v0, $v1
    /* 3528 80013528 01004324 */  addiu      $v1, $v0, 0x1
    /* 352C 8001352C 11006228 */  slti       $v0, $v1, 0x11
    /* 3530 80013530 04004010 */  beqz       $v0, .L80013544
    /* 3534 80013534 21100000 */   addu      $v0, $zero, $zero
    /* 3538 80013538 030083A0 */  sb         $v1, 0x3($a0)
    /* 353C 8001353C 524D0008 */  j          .L80013548
    /* 3540 80013540 0000A0AC */   sw        $zero, 0x0($a1)
  .L80013544:
    /* 3544 80013544 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80013548:
    /* 3548 80013548 0800E003 */  jr         $ra
    /* 354C 8001354C 00000000 */   nop
endlabel MargePrim
