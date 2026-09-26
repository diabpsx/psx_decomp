.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VerifyGoldSeeds__FP12PlayerStruct, 0xD8

glabel VerifyGoldSeeds__FP12PlayerStruct
    /* 212E8 8015AEE0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 212EC 8015AEE4 2400B1AF */  sw         $s1, 0x24($sp)
    /* 212F0 8015AEE8 21888000 */  addu       $s1, $a0, $zero
    /* 212F4 8015AEEC 3000BFAF */  sw         $ra, 0x30($sp)
    /* 212F8 8015AEF0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 212FC 8015AEF4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 21300 8015AEF8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 21304 8015AEFC 8415238E */  lw         $v1, 0x1584($s1)
    /* 21308 8015AF00 00000000 */  nop
    /* 2130C 8015AF04 24006018 */  blez       $v1, .L8015AF98
    /* 21310 8015AF08 21900000 */   addu      $s2, $zero, $zero
    /* 21314 8015AF0C 21982002 */  addu       $s3, $s1, $zero
  .L8015AF10:
    /* 21318 8015AF10 D2046286 */  lh         $v0, 0x4D2($s3)
    /* 2131C 8015AF14 00000000 */  nop
    /* 21320 8015AF18 1A004014 */  bnez       $v0, .L8015AF84
    /* 21324 8015AF1C 00000000 */   nop
    /* 21328 8015AF20 18006018 */  blez       $v1, .L8015AF84
    /* 2132C 8015AF24 21280000 */   addu      $a1, $zero, $zero
    /* 21330 8015AF28 21806002 */  addu       $s0, $s3, $zero
    /* 21334 8015AF2C 21202002 */  addu       $a0, $s1, $zero
  .L8015AF30:
    /* 21338 8015AF30 0F004512 */  beq        $s2, $a1, .L8015AF70
    /* 2133C 8015AF34 00000000 */   nop
    /* 21340 8015AF38 D2048284 */  lh         $v0, 0x4D2($a0)
    /* 21344 8015AF3C 00000000 */  nop
    /* 21348 8015AF40 0B004014 */  bnez       $v0, .L8015AF70
    /* 2134C 8015AF44 00000000 */   nop
    /* 21350 8015AF48 B404038E */  lw         $v1, 0x4B4($s0)
    /* 21354 8015AF4C B404828C */  lw         $v0, 0x4B4($a0)
    /* 21358 8015AF50 00000000 */  nop
    /* 2135C 8015AF54 06006214 */  bne        $v1, $v0, .L8015AF70
    /* 21360 8015AF58 00000000 */   nop
    /* 21364 8015AF5C B7F6000C */  jal        GetRndSeed__Fv
    /* 21368 8015AF60 00000000 */   nop
    /* 2136C 8015AF64 B40402AE */  sw         $v0, 0x4B4($s0)
    /* 21370 8015AF68 94FF2426 */  addiu      $a0, $s1, -0x6C
    /* 21374 8015AF6C FFFF0524 */  addiu      $a1, $zero, -0x1
  .L8015AF70:
    /* 21378 8015AF70 8415228E */  lw         $v0, 0x1584($s1)
    /* 2137C 8015AF74 0100A524 */  addiu      $a1, $a1, 0x1
    /* 21380 8015AF78 2A10A200 */  slt        $v0, $a1, $v0
    /* 21384 8015AF7C ECFF4014 */  bnez       $v0, .L8015AF30
    /* 21388 8015AF80 6C008424 */   addiu     $a0, $a0, 0x6C
  .L8015AF84:
    /* 2138C 8015AF84 8415238E */  lw         $v1, 0x1584($s1)
    /* 21390 8015AF88 01005226 */  addiu      $s2, $s2, 0x1
    /* 21394 8015AF8C 2A104302 */  slt        $v0, $s2, $v1
    /* 21398 8015AF90 DFFF4014 */  bnez       $v0, .L8015AF10
    /* 2139C 8015AF94 6C007326 */   addiu     $s3, $s3, 0x6C
  .L8015AF98:
    /* 213A0 8015AF98 3000BF8F */  lw         $ra, 0x30($sp)
    /* 213A4 8015AF9C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 213A8 8015AFA0 2800B28F */  lw         $s2, 0x28($sp)
    /* 213AC 8015AFA4 2400B18F */  lw         $s1, 0x24($sp)
    /* 213B0 8015AFA8 2000B08F */  lw         $s0, 0x20($sp)
    /* 213B4 8015AFAC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 213B8 8015AFB0 0800E003 */  jr         $ra
    /* 213BC 8015AFB4 00000000 */   nop
endlabel VerifyGoldSeeds__FP12PlayerStruct
