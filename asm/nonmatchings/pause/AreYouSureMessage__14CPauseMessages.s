.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AreYouSureMessage__14CPauseMessages, 0x120

glabel AreYouSureMessage__14CPauseMessages
    /* 78AD4 80088AD4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 78AD8 80088AD8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 78ADC 80088ADC 21908000 */  addu       $s2, $a0, $zero
    /* 78AE0 80088AE0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 78AE4 80088AE4 21A00000 */  addu       $s4, $zero, $zero
    /* 78AE8 80088AE8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 78AEC 80088AEC 21980000 */  addu       $s3, $zero, $zero
    /* 78AF0 80088AF0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 78AF4 80088AF4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 78AF8 80088AF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 78AFC 80088AFC 0400428E */  lw         $v0, 0x4($s2)
    /* 78B00 80088B00 01001124 */  addiu      $s1, $zero, 0x1
    /* 78B04 80088B04 28004484 */  lh         $a0, 0x28($v0)
    /* 78B08 80088B08 2C00428C */  lw         $v0, 0x2C($v0)
    /* 78B0C 80088B0C 00000000 */  nop
    /* 78B10 80088B10 09F84000 */  jalr       $v0
    /* 78B14 80088B14 21204402 */   addu      $a0, $s2, $a0
  .L80088B18:
    /* 78B18 80088B18 25006016 */  bnez       $s3, .L80088BB0
    /* 78B1C 80088B1C 21282002 */   addu      $a1, $s1, $zero
    /* 78B20 80088B20 0400428E */  lw         $v0, 0x4($s2)
    /* 78B24 80088B24 00000000 */  nop
    /* 78B28 80088B28 30004484 */  lh         $a0, 0x30($v0)
    /* 78B2C 80088B2C 3400428C */  lw         $v0, 0x34($v0)
    /* 78B30 80088B30 00000000 */  nop
    /* 78B34 80088B34 09F84000 */  jalr       $v0
    /* 78B38 80088B38 21204402 */   addu      $a0, $s2, $a0
    /* 78B3C 80088B3C EE80000C */  jal        TSK_Sleep
    /* 78B40 80088B40 01000424 */   addiu     $a0, $zero, 0x1
    /* 78B44 80088B44 0000448E */  lw         $a0, 0x0($s2)
    /* 78B48 80088B48 FD25020C */  jal        PAD_GetPad__FiUc
    /* 78B4C 80088B4C 01000524 */   addiu     $a1, $zero, 0x1
    /* 78B50 80088B50 2B25020C */  jal        GetDown__C4CPad_800894ac
    /* 78B54 80088B54 21204000 */   addu      $a0, $v0, $zero
    /* 78B58 80088B58 21804000 */  addu       $s0, $v0, $zero
    /* 78B5C 80088B5C 03000232 */  andi       $v0, $s0, 0x3
    /* 78B60 80088B60 05004010 */  beqz       $v0, .L80088B78
    /* 78B64 80088B64 40000232 */   andi      $v0, $s0, 0x40
    /* 78B68 80088B68 C6F5000C */  jal        PlaySFX__Fi
    /* 78B6C 80088B6C 32000424 */   addiu     $a0, $zero, 0x32
    /* 78B70 80088B70 0100312E */  sltiu      $s1, $s1, 0x1
    /* 78B74 80088B74 40000232 */  andi       $v0, $s0, 0x40
  .L80088B78:
    /* 78B78 80088B78 06004010 */  beqz       $v0, .L80088B94
    /* 78B7C 80088B7C 00010232 */   andi      $v0, $s0, 0x100
    /* 78B80 80088B80 C6F5000C */  jal        PlaySFX__Fi
    /* 78B84 80088B84 33000424 */   addiu     $a0, $zero, 0x33
    /* 78B88 80088B88 01001324 */  addiu      $s3, $zero, 0x1
    /* 78B8C 80088B8C 2BA01100 */  sltu       $s4, $zero, $s1
    /* 78B90 80088B90 00010232 */  andi       $v0, $s0, 0x100
  .L80088B94:
    /* 78B94 80088B94 E0FF4010 */  beqz       $v0, .L80088B18
    /* 78B98 80088B98 00000000 */   nop
    /* 78B9C 80088B9C C6F5000C */  jal        PlaySFX__Fi
    /* 78BA0 80088BA0 33000424 */   addiu     $a0, $zero, 0x33
    /* 78BA4 80088BA4 01001324 */  addiu      $s3, $zero, 0x1
    /* 78BA8 80088BA8 C6220208 */  j          .L80088B18
    /* 78BAC 80088BAC 01001424 */   addiu     $s4, $zero, 0x1
  .L80088BB0:
    /* 78BB0 80088BB0 0400428E */  lw         $v0, 0x4($s2)
    /* 78BB4 80088BB4 00000000 */  nop
    /* 78BB8 80088BB8 38004484 */  lh         $a0, 0x38($v0)
    /* 78BBC 80088BBC 3C00428C */  lw         $v0, 0x3C($v0)
    /* 78BC0 80088BC0 00000000 */  nop
    /* 78BC4 80088BC4 09F84000 */  jalr       $v0
    /* 78BC8 80088BC8 21204402 */   addu      $a0, $s2, $a0
    /* 78BCC 80088BCC 21108002 */  addu       $v0, $s4, $zero
    /* 78BD0 80088BD0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 78BD4 80088BD4 2000B48F */  lw         $s4, 0x20($sp)
    /* 78BD8 80088BD8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 78BDC 80088BDC 1800B28F */  lw         $s2, 0x18($sp)
    /* 78BE0 80088BE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 78BE4 80088BE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 78BE8 80088BE8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 78BEC 80088BEC 0800E003 */  jr         $ra
    /* 78BF0 80088BF0 00000000 */   nop
endlabel AreYouSureMessage__14CPauseMessages
