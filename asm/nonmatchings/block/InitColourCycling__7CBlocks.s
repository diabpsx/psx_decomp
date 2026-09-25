.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitColourCycling__7CBlocks, 0x14C

glabel InitColourCycling__7CBlocks
    /* 7E29C 8008E29C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 7E2A0 8008E2A0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7E2A4 8008E2A4 21888000 */  addu       $s1, $a0, $zero
    /* 7E2A8 8008E2A8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7E2AC 8008E2AC FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 7E2B0 8008E2B0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7E2B4 8008E2B4 21980000 */  addu       $s3, $zero, $zero
    /* 7E2B8 8008E2B8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 7E2BC 8008E2BC FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 7E2C0 8008E2C0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 7E2C4 8008E2C4 0040143C */  lui        $s4, (0x40000000 >> 16)
    /* 7E2C8 8008E2C8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7E2CC 8008E2CC 21900000 */  addu       $s2, $zero, $zero
    /* 7E2D0 8008E2D0 2800BFAF */  sw         $ra, 0x28($sp)
  .L8008E2D4:
    /* 7E2D4 8008E2D4 8247020C */  jal        GetNumOfFrames__7TextDat_80091e08
    /* 7E2D8 8008E2D8 21202002 */   addu      $a0, $s1, $zero
    /* 7E2DC 8008E2DC 2A106202 */  slt        $v0, $s3, $v0
    /* 7E2E0 8008E2E0 12004010 */  beqz       $v0, .L8008E32C
    /* 7E2E4 8008E2E4 00000000 */   nop
    /* 7E2E8 8008E2E8 13001516 */  bne        $s0, $s5, .L8008E338
    /* 7E2EC 8008E2EC 00000000 */   nop
    /* 7E2F0 8008E2F0 2400228E */  lw         $v0, 0x24($s1)
    /* 7E2F4 8008E2F4 00000000 */  nop
    /* 7E2F8 8008E2F8 21184202 */  addu       $v1, $s2, $v0
    /* 7E2FC 8008E2FC 0400628C */  lw         $v0, 0x4($v1)
    /* 7E300 8008E300 00000000 */  nop
    /* 7E304 8008E304 24105400 */  and        $v0, $v0, $s4
    /* 7E308 8008E308 05004010 */  beqz       $v0, .L8008E320
    /* 7E30C 8008E30C 00000000 */   nop
    /* 7E310 8008E310 06006590 */  lbu        $a1, 0x6($v1)
    /* 7E314 8008E314 8747020C */  jal        GetPal__7TextDati_80091e1c
    /* 7E318 8008E318 21202002 */   addu      $a0, $s1, $zero
    /* 7E31C 8008E31C 02005094 */  lhu        $s0, 0x2($v0)
  .L8008E320:
    /* 7E320 8008E320 0C005226 */  addiu      $s2, $s2, 0xC
    /* 7E324 8008E324 B5380208 */  j          .L8008E2D4
    /* 7E328 8008E328 01007326 */   addiu     $s3, $s3, 0x1
  .L8008E32C:
    /* 7E32C 8008E32C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 7E330 8008E330 03000212 */  beq        $s0, $v0, .L8008E340
    /* 7E334 8008E334 00000000 */   nop
  .L8008E338:
    /* 7E338 8008E338 1280013C */  lui        $at, %hi(water_clut)
    /* 7E33C 8008E33C A4B030A4 */  sh         $s0, %lo(water_clut)($at)
  .L8008E340:
    /* 7E340 8008E340 FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 7E344 8008E344 21980000 */  addu       $s3, $zero, $zero
    /* 7E348 8008E348 FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 7E34C 8008E34C 0400143C */  lui        $s4, (0x40000 >> 16)
    /* 7E350 8008E350 21900000 */  addu       $s2, $zero, $zero
  .L8008E354:
    /* 7E354 8008E354 8247020C */  jal        GetNumOfFrames__7TextDat_80091e08
    /* 7E358 8008E358 21202002 */   addu      $a0, $s1, $zero
    /* 7E35C 8008E35C 2A106202 */  slt        $v0, $s3, $v0
    /* 7E360 8008E360 12004010 */  beqz       $v0, .L8008E3AC
    /* 7E364 8008E364 00000000 */   nop
    /* 7E368 8008E368 13001516 */  bne        $s0, $s5, .L8008E3B8
    /* 7E36C 8008E36C 00000000 */   nop
    /* 7E370 8008E370 2400228E */  lw         $v0, 0x24($s1)
    /* 7E374 8008E374 00000000 */  nop
    /* 7E378 8008E378 21184202 */  addu       $v1, $s2, $v0
    /* 7E37C 8008E37C 0800628C */  lw         $v0, 0x8($v1)
    /* 7E380 8008E380 00000000 */  nop
    /* 7E384 8008E384 24105400 */  and        $v0, $v0, $s4
    /* 7E388 8008E388 05004010 */  beqz       $v0, .L8008E3A0
    /* 7E38C 8008E38C 00000000 */   nop
    /* 7E390 8008E390 06006590 */  lbu        $a1, 0x6($v1)
    /* 7E394 8008E394 8747020C */  jal        GetPal__7TextDati_80091e1c
    /* 7E398 8008E398 21202002 */   addu      $a0, $s1, $zero
    /* 7E39C 8008E39C 02005094 */  lhu        $s0, 0x2($v0)
  .L8008E3A0:
    /* 7E3A0 8008E3A0 0C005226 */  addiu      $s2, $s2, 0xC
    /* 7E3A4 8008E3A4 D5380208 */  j          .L8008E354
    /* 7E3A8 8008E3A8 01007326 */   addiu     $s3, $s3, 0x1
  .L8008E3AC:
    /* 7E3AC 8008E3AC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 7E3B0 8008E3B0 03000212 */  beq        $s0, $v0, .L8008E3C0
    /* 7E3B4 8008E3B4 00000000 */   nop
  .L8008E3B8:
    /* 7E3B8 8008E3B8 1280013C */  lui        $at, %hi(penta_clut)
    /* 7E3BC 8008E3BC A6B030A4 */  sh         $s0, %lo(penta_clut)($at)
  .L8008E3C0:
    /* 7E3C0 8008E3C0 2800BF8F */  lw         $ra, 0x28($sp)
    /* 7E3C4 8008E3C4 2400B58F */  lw         $s5, 0x24($sp)
    /* 7E3C8 8008E3C8 2000B48F */  lw         $s4, 0x20($sp)
    /* 7E3CC 8008E3CC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7E3D0 8008E3D0 1800B28F */  lw         $s2, 0x18($sp)
    /* 7E3D4 8008E3D4 1400B18F */  lw         $s1, 0x14($sp)
    /* 7E3D8 8008E3D8 1000B08F */  lw         $s0, 0x10($sp)
    /* 7E3DC 8008E3DC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 7E3E0 8008E3E0 0800E003 */  jr         $ra
    /* 7E3E4 8008E3E4 00000000 */   nop
endlabel InitColourCycling__7CBlocks
