.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ImportData__13CompLevelMapsP14CompressedLevs, 0xAC

glabel ImportData__13CompLevelMapsP14CompressedLevs
    /* 718A4 800818A4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 718A8 800818A8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 718AC 800818AC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 718B0 800818B0 2198A000 */  addu       $s3, $a1, $zero
    /* 718B4 800818B4 2400BFAF */  sw         $ra, 0x24($sp)
    /* 718B8 800818B8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 718BC 800818BC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 718C0 800818C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 718C4 800818C4 0000638E */  lw         $v1, 0x0($s3)
    /* 718C8 800818C8 00010224 */  addiu      $v0, $zero, 0x100
    /* 718CC 800818CC 06006210 */  beq        $v1, $v0, .L800818E8
    /* 718D0 800818D0 21A08000 */   addu      $s4, $a0, $zero
    /* 718D4 800818D4 21200000 */  addu       $a0, $zero, $zero
    /* 718D8 800818D8 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 718DC 800818DC 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 718E0 800818E0 A583000C */  jal        DBG_Error
    /* 718E4 800818E4 9B000624 */   addiu     $a2, $zero, 0x9B
  .L800818E8:
    /* 718E8 800818E8 C105020C */  jal        Init__13CompLevelMaps
    /* 718EC 800818EC 21208002 */   addu      $a0, $s4, $zero
    /* 718F0 800818F0 21900000 */  addu       $s2, $zero, $zero
    /* 718F4 800818F4 04001124 */  addiu      $s1, $zero, 0x4
    /* 718F8 800818F8 21806002 */  addu       $s0, $s3, $zero
    /* 718FC 800818FC 1600422A */  slti       $v0, $s2, 0x16
  .L80081900:
    /* 71900 80081900 0A004010 */  beqz       $v0, .L8008192C
    /* 71904 80081904 21209102 */   addu      $a0, $s4, $s1
    /* 71908 80081908 10003126 */  addiu      $s1, $s1, 0x10
    /* 7190C 8008190C 5C00068E */  lw         $a2, 0x5C($s0)
    /* 71910 80081910 0400058E */  lw         $a1, 0x4($s0)
    /* 71914 80081914 04001026 */  addiu      $s0, $s0, 0x4
    /* 71918 80081918 01005226 */  addiu      $s2, $s2, 0x1
    /* 7191C 8008191C E206020C */  jal        SetCompData__4AMapPCUci
    /* 71920 80081920 21286502 */   addu      $a1, $s3, $a1
    /* 71924 80081924 40060208 */  j          .L80081900
    /* 71928 80081928 1600422A */   slti      $v0, $s2, 0x16
  .L8008192C:
    /* 7192C 8008192C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 71930 80081930 2000B48F */  lw         $s4, 0x20($sp)
    /* 71934 80081934 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 71938 80081938 1800B28F */  lw         $s2, 0x18($sp)
    /* 7193C 8008193C 1400B18F */  lw         $s1, 0x14($sp)
    /* 71940 80081940 1000B08F */  lw         $s0, 0x10($sp)
    /* 71944 80081944 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 71948 80081948 0800E003 */  jr         $ra
    /* 7194C 8008194C 00000000 */   nop
endlabel ImportData__13CompLevelMapsP14CompressedLevs
