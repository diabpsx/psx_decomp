.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgestreamcommanda, 0x130

glabel purgestreamcommanda
    /* 1D2AC 8002D2AC 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1D2B0 8002D2B0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1D2B4 8002D2B4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1D2B8 8002D2B8 4000B38F */  lw         $s3, 0x40($sp)
    /* 1D2BC 8002D2BC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D2C0 8002D2C0 21888000 */  addu       $s1, $a0, $zero
    /* 1D2C4 8002D2C4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1D2C8 8002D2C8 2190A000 */  addu       $s2, $a1, $zero
    /* 1D2CC 8002D2CC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1D2D0 8002D2D0 21A0C000 */  addu       $s4, $a2, $zero
    /* 1D2D4 8002D2D4 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1D2D8 8002D2D8 21A8E000 */  addu       $s5, $a3, $zero
    /* 1D2DC 8002D2DC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1D2E0 8002D2E0 17004014 */  bnez       $v0, .L8002D340
    /* 1D2E4 8002D2E4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1D2E8 8002D2E8 0C006012 */  beqz       $s3, .L8002D31C
    /* 1D2EC 8002D2EC 00000000 */   nop
    /* 1D2F0 8002D2F0 1180043C */  lui        $a0, %hi(D_8010FCA4)
    /* 1D2F4 8002D2F4 A4FC8424 */  addiu      $a0, $a0, %lo(D_8010FCA4)
    /* 1D2F8 8002D2F8 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1D2FC 8002D2FC F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1D300 8002D300 1280013C */  lui        $at, %hi(abortfile)
    /* 1D304 8002D304 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1D308 8002D308 48030224 */  addiu      $v0, $zero, 0x348
    /* 1D30C 8002D30C 1280013C */  lui        $at, %hi(abortline)
    /* 1D310 8002D310 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1D314 8002D314 0F95000C */  jal        abortmessage
    /* 1D318 8002D318 00000000 */   nop
  .L8002D31C:
    /* 1D31C 8002D31C EDB40008 */  j          .L8002D3B4
    /* 1D320 8002D320 21100000 */   addu      $v0, $zero, $zero
  .L8002D324:
    /* 1D324 8002D324 7800308E */  lw         $s0, 0x78($s1)
    /* 1D328 8002D328 00000000 */  nop
    /* 1D32C 8002D32C 9800028E */  lw         $v0, 0x98($s0)
    /* 1D330 8002D330 21200002 */  addu       $a0, $s0, $zero
    /* 1D334 8002D334 780022AE */  sw         $v0, 0x78($s1)
    /* 1D338 8002D338 F8BC000C */  jal        putstreamblock
    /* 1D33C 8002D33C 00000000 */   nop
  .L8002D340:
    /* 1D340 8002D340 7800228E */  lw         $v0, 0x78($s1)
    /* 1D344 8002D344 00000000 */  nop
    /* 1D348 8002D348 F6FF4014 */  bnez       $v0, .L8002D324
    /* 1D34C 8002D34C 00000000 */   nop
    /* 1D350 8002D350 22BD000C */  jal        getstreamblocka
    /* 1D354 8002D354 21206002 */   addu      $a0, $s3, $zero
    /* 1D358 8002D358 21804000 */  addu       $s0, $v0, $zero
    /* 1D35C 8002D35C 21200002 */  addu       $a0, $s0, $zero
    /* 1D360 8002D360 21284002 */  addu       $a1, $s2, $zero
    /* 1D364 8002D364 8367000C */  jal        strncpy
    /* 1D368 8002D368 8F000624 */   addiu     $a2, $zero, 0x8F
    /* 1D36C 8002D36C 8E0000A2 */  sb         $zero, 0x8E($s0)
    /* 1D370 8002D370 940014AE */  sw         $s4, 0x94($s0)
    /* 1D374 8002D374 900015AE */  sw         $s5, 0x90($s0)
    /* 1D378 8002D378 7C0030AE */  sw         $s0, 0x7C($s1)
    /* 1D37C 8002D37C 7C00228E */  lw         $v0, 0x7C($s1)
    /* 1D380 8002D380 00000000 */  nop
    /* 1D384 8002D384 780022AE */  sw         $v0, 0x78($s1)
    /* 1D388 8002D388 1C00228E */  lw         $v0, 0x1C($s1)
    /* 1D38C 8002D38C 00000000 */  nop
    /* 1D390 8002D390 08004010 */  beqz       $v0, .L8002D3B4
    /* 1D394 8002D394 01000224 */   addiu     $v0, $zero, 0x1
    /* 1D398 8002D398 2400228E */  lw         $v0, 0x24($s1)
    /* 1D39C 8002D39C 00000000 */  nop
    /* 1D3A0 8002D3A0 04004014 */  bnez       $v0, .L8002D3B4
    /* 1D3A4 8002D3A4 01000224 */   addiu     $v0, $zero, 0x1
    /* 1D3A8 8002D3A8 0F000224 */  addiu      $v0, $zero, 0xF
    /* 1D3AC 8002D3AC 240022AE */  sw         $v0, 0x24($s1)
    /* 1D3B0 8002D3B0 01000224 */  addiu      $v0, $zero, 0x1
  .L8002D3B4:
    /* 1D3B4 8002D3B4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1D3B8 8002D3B8 2400B58F */  lw         $s5, 0x24($sp)
    /* 1D3BC 8002D3BC 2000B48F */  lw         $s4, 0x20($sp)
    /* 1D3C0 8002D3C0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1D3C4 8002D3C4 1800B28F */  lw         $s2, 0x18($sp)
    /* 1D3C8 8002D3C8 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D3CC 8002D3CC 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D3D0 8002D3D0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1D3D4 8002D3D4 0800E003 */  jr         $ra
    /* 1D3D8 8002D3D8 00000000 */   nop
endlabel purgestreamcommanda
