.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncInitPlrPos__FP12PlayerStruct, 0xE8

glabel SyncInitPlrPos__FP12PlayerStruct
    /* 55AB4 80065AB4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 55AB8 80065AB8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 55ABC 80065ABC 21888000 */  addu       $s1, $a0, $zero
    /* 55AC0 80065AC0 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 55AC4 80065AC4 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 55AC8 80065AC8 01000224 */  addiu      $v0, $zero, 0x1
    /* 55ACC 80065ACC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 55AD0 80065AD0 2400B5AF */  sw         $s5, 0x24($sp)
    /* 55AD4 80065AD4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 55AD8 80065AD8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 55ADC 80065ADC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 55AE0 80065AE0 24006210 */  beq        $v1, $v0, .L80065B74
    /* 55AE4 80065AE4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 55AE8 80065AE8 21800000 */  addu       $s0, $zero, $zero
    /* 55AEC 80065AEC 0E80153C */  lui        $s5, %hi(plryoff2)
    /* 55AF0 80065AF0 B4A3B526 */  addiu      $s5, $s5, %lo(plryoff2)
    /* 55AF4 80065AF4 2198A002 */  addu       $s3, $s5, $zero
    /* 55AF8 80065AF8 0E80143C */  lui        $s4, %hi(plrxoff2)
    /* 55AFC 80065AFC 90A39426 */  addiu      $s4, $s4, %lo(plrxoff2)
    /* 55B00 80065B00 21908002 */  addu       $s2, $s4, $zero
  .L80065B04:
    /* 55B04 80065B04 21202002 */  addu       $a0, $s1, $zero
    /* 55B08 80065B08 30002386 */  lh         $v1, 0x30($s1)
    /* 55B0C 80065B0C 0000458E */  lw         $a1, 0x0($s2)
    /* 55B10 80065B10 32002286 */  lh         $v0, 0x32($s1)
    /* 55B14 80065B14 0000668E */  lw         $a2, 0x0($s3)
    /* 55B18 80065B18 21286500 */  addu       $a1, $v1, $a1
    /* 55B1C 80065B1C 1D95010C */  jal        PosOkPlayer__FP12PlayerStructii
    /* 55B20 80065B20 21304600 */   addu      $a2, $v0, $a2
    /* 55B24 80065B24 FF004230 */  andi       $v0, $v0, 0xFF
    /* 55B28 80065B28 07004014 */  bnez       $v0, .L80065B48
    /* 55B2C 80065B2C 80181000 */   sll       $v1, $s0, 2
    /* 55B30 80065B30 04007326 */  addiu      $s3, $s3, 0x4
    /* 55B34 80065B34 01001026 */  addiu      $s0, $s0, 0x1
    /* 55B38 80065B38 0800022A */  slti       $v0, $s0, 0x8
    /* 55B3C 80065B3C F1FF4014 */  bnez       $v0, .L80065B04
    /* 55B40 80065B40 04005226 */   addiu     $s2, $s2, 0x4
    /* 55B44 80065B44 80181000 */  sll        $v1, $s0, 2
  .L80065B48:
    /* 55B48 80065B48 21107400 */  addu       $v0, $v1, $s4
    /* 55B4C 80065B4C 0000448C */  lw         $a0, 0x0($v0)
    /* 55B50 80065B50 30002296 */  lhu        $v0, 0x30($s1)
    /* 55B54 80065B54 21187500 */  addu       $v1, $v1, $s5
    /* 55B58 80065B58 21104400 */  addu       $v0, $v0, $a0
    /* 55B5C 80065B5C 300022A6 */  sh         $v0, 0x30($s1)
    /* 55B60 80065B60 0000638C */  lw         $v1, 0x0($v1)
    /* 55B64 80065B64 32002296 */  lhu        $v0, 0x32($s1)
    /* 55B68 80065B68 00000000 */  nop
    /* 55B6C 80065B6C 21104300 */  addu       $v0, $v0, $v1
    /* 55B70 80065B70 320022A6 */  sh         $v0, 0x32($s1)
  .L80065B74:
    /* 55B74 80065B74 2800BF8F */  lw         $ra, 0x28($sp)
    /* 55B78 80065B78 2400B58F */  lw         $s5, 0x24($sp)
    /* 55B7C 80065B7C 2000B48F */  lw         $s4, 0x20($sp)
    /* 55B80 80065B80 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 55B84 80065B84 1800B28F */  lw         $s2, 0x18($sp)
    /* 55B88 80065B88 1400B18F */  lw         $s1, 0x14($sp)
    /* 55B8C 80065B8C 1000B08F */  lw         $s0, 0x10($sp)
    /* 55B90 80065B90 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 55B94 80065B94 0800E003 */  jr         $ra
    /* 55B98 80065B98 00000000 */   nop
endlabel SyncInitPlrPos__FP12PlayerStruct
