.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostAddL1Objs__Fiiii, 0x108

glabel PostAddL1Objs__Fiiii
    /* 47520 80057520 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 47524 80057524 2400B5AF */  sw         $s5, 0x24($sp)
    /* 47528 80057528 21A88000 */  addu       $s5, $a0, $zero
    /* 4752C 8005752C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 47530 80057530 2190A000 */  addu       $s2, $a1, $zero
    /* 47534 80057534 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 47538 80057538 2198C000 */  addu       $s3, $a2, $zero
    /* 4753C 8005753C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 47540 80057540 21A0E000 */  addu       $s4, $a3, $zero
    /* 47544 80057544 2A105402 */  slt        $v0, $s2, $s4
    /* 47548 80057548 2800BFAF */  sw         $ra, 0x28($sp)
    /* 4754C 8005754C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 47550 80057550 2B004010 */  beqz       $v0, .L80057600
    /* 47554 80057554 1000B0AF */   sw        $s0, 0x10($sp)
    /* 47558 80057558 2188A002 */  addu       $s1, $s5, $zero
  .L8005755C:
    /* 4755C 8005755C 2A103302 */  slt        $v0, $s1, $s3
    /* 47560 80057560 23004010 */  beqz       $v0, .L800575F0
    /* 47564 80057564 21202002 */   addu      $a0, $s1, $zero
  .L80057568:
    /* 47568 80057568 80D4010C */  jal        FindBlock__Fii
    /* 4756C 8005756C 21284002 */   addu      $a1, $s2, $zero
    /* 47570 80057570 21804000 */  addu       $s0, $v0, $zero
    /* 47574 80057574 0E010224 */  addiu      $v0, $zero, 0x10E
    /* 47578 80057578 06000216 */  bne        $s0, $v0, .L80057594
    /* 4757C 8005757C 2C000224 */   addiu     $v0, $zero, 0x2C
    /* 47580 80057580 21200000 */  addu       $a0, $zero, $zero
    /* 47584 80057584 21282002 */  addu       $a1, $s1, $zero
    /* 47588 80057588 024F010C */  jal        PostAddObject__Fiii
    /* 4758C 8005758C 21304002 */   addu      $a2, $s2, $zero
    /* 47590 80057590 2C000224 */  addiu      $v0, $zero, 0x2C
  .L80057594:
    /* 47594 80057594 05000212 */  beq        $s0, $v0, .L800575AC
    /* 47598 80057598 33000224 */   addiu     $v0, $zero, 0x33
    /* 4759C 8005759C 03000212 */  beq        $s0, $v0, .L800575AC
    /* 475A0 800575A0 D6000224 */   addiu     $v0, $zero, 0xD6
    /* 475A4 800575A4 06000216 */  bne        $s0, $v0, .L800575C0
    /* 475A8 800575A8 2E000224 */   addiu     $v0, $zero, 0x2E
  .L800575AC:
    /* 475AC 800575AC 01000424 */  addiu      $a0, $zero, 0x1
    /* 475B0 800575B0 21282002 */  addu       $a1, $s1, $zero
    /* 475B4 800575B4 024F010C */  jal        PostAddObject__Fiii
    /* 475B8 800575B8 21304002 */   addu      $a2, $s2, $zero
    /* 475BC 800575BC 2E000224 */  addiu      $v0, $zero, 0x2E
  .L800575C0:
    /* 475C0 800575C0 03000212 */  beq        $s0, $v0, .L800575D0
    /* 475C4 800575C4 38000224 */   addiu     $v0, $zero, 0x38
    /* 475C8 800575C8 05000216 */  bne        $s0, $v0, .L800575E0
    /* 475CC 800575CC 00000000 */   nop
  .L800575D0:
    /* 475D0 800575D0 02000424 */  addiu      $a0, $zero, 0x2
    /* 475D4 800575D4 21282002 */  addu       $a1, $s1, $zero
    /* 475D8 800575D8 024F010C */  jal        PostAddObject__Fiii
    /* 475DC 800575DC 21304002 */   addu      $a2, $s2, $zero
  .L800575E0:
    /* 475E0 800575E0 01003126 */  addiu      $s1, $s1, 0x1
    /* 475E4 800575E4 2A103302 */  slt        $v0, $s1, $s3
    /* 475E8 800575E8 DFFF4014 */  bnez       $v0, .L80057568
    /* 475EC 800575EC 21202002 */   addu      $a0, $s1, $zero
  .L800575F0:
    /* 475F0 800575F0 01005226 */  addiu      $s2, $s2, 0x1
    /* 475F4 800575F4 2A105402 */  slt        $v0, $s2, $s4
    /* 475F8 800575F8 D8FF4014 */  bnez       $v0, .L8005755C
    /* 475FC 800575FC 2188A002 */   addu      $s1, $s5, $zero
  .L80057600:
    /* 47600 80057600 2800BF8F */  lw         $ra, 0x28($sp)
    /* 47604 80057604 2400B58F */  lw         $s5, 0x24($sp)
    /* 47608 80057608 2000B48F */  lw         $s4, 0x20($sp)
    /* 4760C 8005760C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 47610 80057610 1800B28F */  lw         $s2, 0x18($sp)
    /* 47614 80057614 1400B18F */  lw         $s1, 0x14($sp)
    /* 47618 80057618 1000B08F */  lw         $s0, 0x10($sp)
    /* 4761C 8005761C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 47620 80057620 0800E003 */  jr         $ra
    /* 47624 80057624 00000000 */   nop
endlabel PostAddL1Objs__Fiiii
