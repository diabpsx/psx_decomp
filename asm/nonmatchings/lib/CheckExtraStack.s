.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckExtraStack, 0x3C

glabel CheckExtraStack
    /* 10BB0 80020BB0 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 10BB4 80020BB4 0900A010 */  beqz       $a1, .L80020BDC
    /* 10BB8 80020BB8 21180000 */   addu      $v1, $zero, $zero
  .L80020BBC:
    /* 10BBC 80020BBC 0000828C */  lw         $v0, 0x0($a0)
    /* 10BC0 80020BC0 00000000 */  nop
    /* 10BC4 80020BC4 06004314 */  bne        $v0, $v1, .L80020BE0
    /* 10BC8 80020BC8 21106000 */   addu      $v0, $v1, $zero
    /* 10BCC 80020BCC 01006324 */  addiu      $v1, $v1, 0x1
    /* 10BD0 80020BD0 2B106500 */  sltu       $v0, $v1, $a1
    /* 10BD4 80020BD4 F9FF4014 */  bnez       $v0, .L80020BBC
    /* 10BD8 80020BD8 04008424 */   addiu     $a0, $a0, 0x4
  .L80020BDC:
    /* 10BDC 80020BDC 21106000 */  addu       $v0, $v1, $zero
  .L80020BE0:
    /* 10BE0 80020BE0 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 10BE4 80020BE4 0800E003 */  jr         $ra
    /* 10BE8 80020BE8 00000000 */   nop
endlabel CheckExtraStack
