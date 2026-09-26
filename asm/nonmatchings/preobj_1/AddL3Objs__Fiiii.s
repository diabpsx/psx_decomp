.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddL3Objs__Fiiii, 0xE0

glabel AddL3Objs__Fiiii
    /* 1E9B0 801585A8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1E9B4 801585AC 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 1E9B8 801585B0 21B88000 */  addu       $s7, $a0, $zero
    /* 1E9BC 801585B4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1E9C0 801585B8 2190A000 */  addu       $s2, $a1, $zero
    /* 1E9C4 801585BC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1E9C8 801585C0 2198C000 */  addu       $s3, $a2, $zero
    /* 1E9CC 801585C4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1E9D0 801585C8 21A0E000 */  addu       $s4, $a3, $zero
    /* 1E9D4 801585CC 2A105402 */  slt        $v0, $s2, $s4
    /* 1E9D8 801585D0 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1E9DC 801585D4 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1E9E0 801585D8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1E9E4 801585DC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1E9E8 801585E0 1D004010 */  beqz       $v0, .L80158658
    /* 1E9EC 801585E4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1E9F0 801585E8 13021624 */  addiu      $s6, $zero, 0x213
    /* 1E9F4 801585EC 16021524 */  addiu      $s5, $zero, 0x216
    /* 1E9F8 801585F0 2180E002 */  addu       $s0, $s7, $zero
  .L801585F4:
    /* 1E9FC 801585F4 2A101302 */  slt        $v0, $s0, $s3
    /* 1EA00 801585F8 13004010 */  beqz       $v0, .L80158648
    /* 1EA04 801585FC 21200002 */   addu      $a0, $s0, $zero
  .L80158600:
    /* 1EA08 80158600 910A020C */  jal        GetDPiece__Fii
    /* 1EA0C 80158604 21284002 */   addu      $a1, $s2, $zero
    /* 1EA10 80158608 00140200 */  sll        $v0, $v0, 16
    /* 1EA14 8015860C 038C0200 */  sra        $s1, $v0, 16
    /* 1EA18 80158610 04003616 */  bne        $s1, $s6, .L80158624
    /* 1EA1C 80158614 4A000424 */   addiu     $a0, $zero, 0x4A
    /* 1EA20 80158618 21280002 */  addu       $a1, $s0, $zero
    /* 1EA24 8015861C BE4E010C */  jal        AddObject__Fiii
    /* 1EA28 80158620 21304002 */   addu      $a2, $s2, $zero
  .L80158624:
    /* 1EA2C 80158624 04003516 */  bne        $s1, $s5, .L80158638
    /* 1EA30 80158628 4B000424 */   addiu     $a0, $zero, 0x4B
    /* 1EA34 8015862C 21280002 */  addu       $a1, $s0, $zero
    /* 1EA38 80158630 BE4E010C */  jal        AddObject__Fiii
    /* 1EA3C 80158634 21304002 */   addu      $a2, $s2, $zero
  .L80158638:
    /* 1EA40 80158638 01001026 */  addiu      $s0, $s0, 0x1
    /* 1EA44 8015863C 2A101302 */  slt        $v0, $s0, $s3
    /* 1EA48 80158640 EFFF4014 */  bnez       $v0, .L80158600
    /* 1EA4C 80158644 21200002 */   addu      $a0, $s0, $zero
  .L80158648:
    /* 1EA50 80158648 01005226 */  addiu      $s2, $s2, 0x1
    /* 1EA54 8015864C 2A105402 */  slt        $v0, $s2, $s4
    /* 1EA58 80158650 E8FF4014 */  bnez       $v0, .L801585F4
    /* 1EA5C 80158654 2180E002 */   addu      $s0, $s7, $zero
  .L80158658:
    /* 1EA60 80158658 3000BF8F */  lw         $ra, 0x30($sp)
    /* 1EA64 8015865C 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 1EA68 80158660 2800B68F */  lw         $s6, 0x28($sp)
    /* 1EA6C 80158664 2400B58F */  lw         $s5, 0x24($sp)
    /* 1EA70 80158668 2000B48F */  lw         $s4, 0x20($sp)
    /* 1EA74 8015866C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1EA78 80158670 1800B28F */  lw         $s2, 0x18($sp)
    /* 1EA7C 80158674 1400B18F */  lw         $s1, 0x14($sp)
    /* 1EA80 80158678 1000B08F */  lw         $s0, 0x10($sp)
    /* 1EA84 8015867C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1EA88 80158680 0800E003 */  jr         $ra
    /* 1EA8C 80158684 00000000 */   nop
endlabel AddL3Objs__Fiiii
