.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncBONESPIRIT__FP13MissileStructiii, 0x124

glabel FuncBONESPIRIT__FP13MissileStructiii
    /* 6CA94 8007CA94 A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 6CA98 8007CA98 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6CA9C 8007CA9C 21988000 */  addu       $s3, $a0, $zero
    /* 6CAA0 8007CAA0 5000B6AF */  sw         $s6, 0x50($sp)
    /* 6CAA4 8007CAA4 21B00000 */  addu       $s6, $zero, $zero
    /* 6CAA8 8007CAA8 5400B7AF */  sw         $s7, 0x54($sp)
    /* 6CAAC 8007CAAC 21B80000 */  addu       $s7, $zero, $zero
    /* 6CAB0 8007CAB0 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 6CAB4 8007CAB4 21A80000 */  addu       $s5, $zero, $zero
    /* 6CAB8 8007CAB8 4800B4AF */  sw         $s4, 0x48($sp)
    /* 6CABC 8007CABC 21A0E000 */  addu       $s4, $a3, $zero
    /* 6CAC0 8007CAC0 5800BFAF */  sw         $ra, 0x58($sp)
    /* 6CAC4 8007CAC4 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6CAC8 8007CAC8 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6CACC 8007CACC 3800B0AF */  sw         $s0, 0x38($sp)
    /* 6CAD0 8007CAD0 3F007082 */  lb         $s0, 0x3F($s3)
    /* 6CAD4 8007CAD4 28006286 */  lh         $v0, 0x28($s3)
    /* 6CAD8 8007CAD8 2A006386 */  lh         $v1, 0x2A($s3)
    /* 6CADC 8007CADC 2188A200 */  addu       $s1, $a1, $v0
    /* 6CAE0 8007CAE0 08000224 */  addiu      $v0, $zero, 0x8
    /* 6CAE4 8007CAE4 04000216 */  bne        $s0, $v0, .L8007CAF8
    /* 6CAE8 8007CAE8 2190C300 */   addu      $s2, $a2, $v1
    /* 6CAEC 8007CAEC 18006296 */  lhu        $v0, 0x18($s3)
    /* 6CAF0 8007CAF0 00000000 */  nop
    /* 6CAF4 8007CAF4 13005524 */  addiu      $s5, $v0, 0x13
  .L8007CAF8:
    /* 6CAF8 8007CAF8 0500022A */  slti       $v0, $s0, 0x5
    /* 6CAFC 8007CAFC 05004014 */  bnez       $v0, .L8007CB14
    /* 6CB00 8007CB00 0300022A */   slti      $v0, $s0, 0x3
    /* 6CB04 8007CB04 01001624 */  addiu      $s6, $zero, 0x1
    /* 6CB08 8007CB08 FFFF0226 */  addiu      $v0, $s0, -0x1
    /* 6CB0C 8007CB0C 07005038 */  xori       $s0, $v0, 0x7
    /* 6CB10 8007CB10 0300022A */  slti       $v0, $s0, 0x3
  .L8007CB14:
    /* 6CB14 8007CB14 03004014 */  bnez       $v0, .L8007CB24
    /* 6CB18 8007CB18 21206002 */   addu      $a0, $s3, $zero
    /* 6CB1C 8007CB1C 01001724 */  addiu      $s7, $zero, 0x1
    /* 6CB20 8007CB20 01001032 */  andi       $s0, $s0, 0x1
  .L8007CB24:
    /* 6CB24 8007CB24 21282002 */  addu       $a1, $s1, $zero
    /* 6CB28 8007CB28 F8FF4626 */  addiu      $a2, $s2, -0x8
    /* 6CB2C 8007CB2C 4000073C */  lui        $a3, (0x402020 >> 16)
    /* 6CB30 8007CB30 2020E734 */  ori        $a3, $a3, (0x402020 & 0xFFFF)
    /* 6CB34 8007CB34 FEFF8226 */  addiu      $v0, $s4, -0x2
    /* 6CB38 8007CB38 817E020C */  jal        ParticleMissile__FP13MissileStructiiii
    /* 6CB3C 8007CB3C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6CB40 8007CB40 21202002 */  addu       $a0, $s1, $zero
    /* 6CB44 8007CB44 21284002 */  addu       $a1, $s2, $zero
    /* 6CB48 8007CB48 21308002 */  addu       $a2, $s4, $zero
    /* 6CB4C 8007CB4C 10000724 */  addiu      $a3, $zero, 0x10
    /* 6CB50 8007CB50 47006382 */  lb         $v1, 0x47($s3)
    /* 6CB54 8007CB54 80000224 */  addiu      $v0, $zero, 0x80
    /* 6CB58 8007CB58 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6CB5C 8007CB5C 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6CB60 8007CB60 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6CB64 8007CB64 01000224 */  addiu      $v0, $zero, 0x1
    /* 6CB68 8007CB68 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6CB6C 8007CB6C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 6CB70 8007CB70 1C00B5AF */  sw         $s5, 0x1C($sp)
    /* 6CB74 8007CB74 2000B6AF */  sw         $s6, 0x20($sp)
    /* 6CB78 8007CB78 2400B7AF */  sw         $s7, 0x24($sp)
    /* 6CB7C 8007CB7C 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6CB80 8007CB80 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6CB84 8007CB84 1000A3AF */   sw        $v1, 0x10($sp)
    /* 6CB88 8007CB88 5800BF8F */  lw         $ra, 0x58($sp)
    /* 6CB8C 8007CB8C 5400B78F */  lw         $s7, 0x54($sp)
    /* 6CB90 8007CB90 5000B68F */  lw         $s6, 0x50($sp)
    /* 6CB94 8007CB94 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 6CB98 8007CB98 4800B48F */  lw         $s4, 0x48($sp)
    /* 6CB9C 8007CB9C 4400B38F */  lw         $s3, 0x44($sp)
    /* 6CBA0 8007CBA0 4000B28F */  lw         $s2, 0x40($sp)
    /* 6CBA4 8007CBA4 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6CBA8 8007CBA8 3800B08F */  lw         $s0, 0x38($sp)
    /* 6CBAC 8007CBAC 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 6CBB0 8007CBB0 0800E003 */  jr         $ra
    /* 6CBB4 8007CBB4 00000000 */   nop
endlabel FuncBONESPIRIT__FP13MissileStructiii
