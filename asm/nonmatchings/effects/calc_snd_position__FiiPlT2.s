.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching calc_snd_position__FiiPlT2, 0x1E8

glabel calc_snd_position__FiiPlT2
    /* 2D1DC 8003D1DC 1280033C */  lui        $v1, %hi(sglSoundVolume)
    /* 2D1E0 8003D1E0 A4BB638C */  lw         $v1, %lo(sglSoundVolume)($v1)
    /* 2D1E4 8003D1E4 1280023C */  lui        $v0, %hi(sglMasterVolume)
    /* 2D1E8 8003D1E8 9CBB428C */  lw         $v0, %lo(sglMasterVolume)($v0)
    /* 2D1EC 8003D1EC 00000000 */  nop
    /* 2D1F0 8003D1F0 18006200 */  mult       $v1, $v0
    /* 2D1F4 8003D1F4 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 2D1F8 8003D1F8 6000B0AF */  sw         $s0, 0x60($sp)
    /* 2D1FC 8003D1FC 21808000 */  addu       $s0, $a0, $zero
    /* 2D200 8003D200 6400B1AF */  sw         $s1, 0x64($sp)
    /* 2D204 8003D204 2188A000 */  addu       $s1, $a1, $zero
    /* 2D208 8003D208 6800B2AF */  sw         $s2, 0x68($sp)
    /* 2D20C 8003D20C 2190C000 */  addu       $s2, $a2, $zero
    /* 2D210 8003D210 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 2D214 8003D214 2198E000 */  addu       $s3, $a3, $zero
    /* 2D218 8003D218 7000BFAF */  sw         $ra, 0x70($sp)
    /* 2D21C 8003D21C C0181100 */  sll        $v1, $s1, 3
    /* 2D220 8003D220 12400000 */  mflo       $t0
    /* 2D224 8003D224 03120800 */  sra        $v0, $t0, 8
    /* 2D228 8003D228 000042AE */  sw         $v0, 0x0($s2)
    /* 2D22C 8003D22C 00800234 */  ori        $v0, $zero, 0x8000
    /* 2D230 8003D230 000062AE */  sw         $v0, 0x0($s3)
    /* 2D234 8003D234 C0101000 */  sll        $v0, $s0, 3
    /* 2D238 8003D238 23105000 */  subu       $v0, $v0, $s0
    /* 2D23C 8003D23C C0110200 */  sll        $v0, $v0, 7
    /* 2D240 8003D240 21186200 */  addu       $v1, $v1, $v0
    /* 2D244 8003D244 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 2D248 8003D248 21082300 */  addu       $at, $at, $v1
    /* 2D24C 8003D24C 2E7A2280 */  lb         $v0, %lo(dung_map + 0x6)($at)
    /* 2D250 8003D250 00000000 */  nop
    /* 2D254 8003D254 28004010 */  beqz       $v0, .L8003D2F8
    /* 2D258 8003D258 21101102 */   addu      $v0, $s0, $s1
    /* 2D25C 8003D25C 51004010 */  beqz       $v0, .L8003D3A4
    /* 2D260 8003D260 01000224 */   addiu     $v0, $zero, 0x1
    /* 2D264 8003D264 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 2D268 8003D268 00000000 */   nop
    /* 2D26C 8003D26C 22004010 */  beqz       $v0, .L8003D2F8
    /* 2D270 8003D270 80301000 */   sll       $a2, $s0, 2
    /* 2D274 8003D274 2130D000 */  addu       $a2, $a2, $s0
    /* 2D278 8003D278 80381100 */  sll        $a3, $s1, 2
    /* 2D27C 8003D27C 2138F100 */  addu       $a3, $a3, $s1
    /* 2D280 8003D280 21204000 */  addu       $a0, $v0, $zero
    /* 2D284 8003D284 5800A527 */  addiu      $a1, $sp, 0x58
    /* 2D288 8003D288 80300600 */  sll        $a2, $a2, 2
    /* 2D28C 8003D28C 80380700 */  sll        $a3, $a3, 2
    /* 2D290 8003D290 1000A0AF */  sw         $zero, 0x10($sp)
    /* 2D294 8003D294 1746020C */  jal        GetScrXY__7CBlocksR4RECTiiii
    /* 2D298 8003D298 1400A0AF */   sw        $zero, 0x14($sp)
    /* 2D29C 8003D29C 5800A587 */  lh         $a1, 0x58($sp)
    /* 2D2A0 8003D2A0 BC10838F */  lw         $v1, %gp_rel(D_8011B83C)($gp)
    /* 2D2A4 8003D2A4 5A00A487 */  lh         $a0, 0x5A($sp)
    /* 2D2A8 8003D2A8 2A10A300 */  slt        $v0, $a1, $v1
    /* 2D2AC 8003D2AC 3D004014 */  bnez       $v0, .L8003D3A4
    /* 2D2B0 8003D2B0 21100000 */   addu      $v0, $zero, $zero
    /* 2D2B4 8003D2B4 C410878F */  lw         $a3, %gp_rel(D_8011B844)($gp)
    /* 2D2B8 8003D2B8 00000000 */  nop
    /* 2D2BC 8003D2BC 21106700 */  addu       $v0, $v1, $a3
    /* 2D2C0 8003D2C0 2A104500 */  slt        $v0, $v0, $a1
    /* 2D2C4 8003D2C4 37004014 */  bnez       $v0, .L8003D3A4
    /* 2D2C8 8003D2C8 21100000 */   addu      $v0, $zero, $zero
    /* 2D2CC 8003D2CC C010838F */  lw         $v1, %gp_rel(D_8011B840)($gp)
    /* 2D2D0 8003D2D0 00000000 */  nop
    /* 2D2D4 8003D2D4 2A108300 */  slt        $v0, $a0, $v1
    /* 2D2D8 8003D2D8 32004014 */  bnez       $v0, .L8003D3A4
    /* 2D2DC 8003D2DC 21100000 */   addu      $v0, $zero, $zero
    /* 2D2E0 8003D2E0 C810828F */  lw         $v0, %gp_rel(D_8011B848)($gp)
    /* 2D2E4 8003D2E4 00000000 */  nop
    /* 2D2E8 8003D2E8 21106200 */  addu       $v0, $v1, $v0
    /* 2D2EC 8003D2EC 2A104400 */  slt        $v0, $v0, $a0
    /* 2D2F0 8003D2F0 03004010 */  beqz       $v0, .L8003D300
    /* 2D2F4 8003D2F4 00000000 */   nop
  .L8003D2F8:
    /* 2D2F8 8003D2F8 E9F40008 */  j          .L8003D3A4
    /* 2D2FC 8003D2FC 21100000 */   addu      $v0, $zero, $zero
  .L8003D300:
    /* 2D300 8003D300 1280023C */  lui        $v0, %hi(MONO)
    /* 2D304 8003D304 B0BB428C */  lw         $v0, %lo(MONO)($v0)
    /* 2D308 8003D308 00000000 */  nop
    /* 2D30C 8003D30C 25004014 */  bnez       $v0, .L8003D3A4
    /* 2D310 8003D310 01000224 */   addiu     $v0, $zero, 0x1
    /* 2D314 8003D314 40100500 */  sll        $v0, $a1, 1
    /* 2D318 8003D318 21104500 */  addu       $v0, $v0, $a1
    /* 2D31C 8003D31C 00190200 */  sll        $v1, $v0, 4
    /* 2D320 8003D320 21104300 */  addu       $v0, $v0, $v1
    /* 2D324 8003D324 80300200 */  sll        $a2, $v0, 2
    /* 2D328 8003D328 0200C104 */  bgez       $a2, .L8003D334
    /* 2D32C 8003D32C 0100023C */   lui       $v0, (0x10000 >> 16)
    /* 2D330 8003D330 21300000 */  addu       $a2, $zero, $zero
  .L8003D334:
    /* 2D334 8003D334 2A104600 */  slt        $v0, $v0, $a2
    /* 2D338 8003D338 02004010 */  beqz       $v0, .L8003D344
    /* 2D33C 8003D33C 00000000 */   nop
    /* 2D340 8003D340 0100063C */  lui        $a2, (0x10000 >> 16)
  .L8003D344:
    /* 2D344 8003D344 1280033C */  lui        $v1, %hi(sglSoundVolume)
    /* 2D348 8003D348 A4BB638C */  lw         $v1, %lo(sglSoundVolume)($v1)
    /* 2D34C 8003D34C 1280023C */  lui        $v0, %hi(sglMasterVolume)
    /* 2D350 8003D350 9CBB428C */  lw         $v0, %lo(sglMasterVolume)($v0)
    /* 2D354 8003D354 00000000 */  nop
    /* 2D358 8003D358 18006200 */  mult       $v1, $v0
    /* 2D35C 8003D35C C2170700 */  srl        $v0, $a3, 31
    /* 2D360 8003D360 2110E200 */  addu       $v0, $a3, $v0
    /* 2D364 8003D364 43200200 */  sra        $a0, $v0, 1
    /* 2D368 8003D368 2A108500 */  slt        $v0, $a0, $a1
    /* 2D36C 8003D36C 12400000 */  mflo       $t0
    /* 2D370 8003D370 02004010 */  beqz       $v0, .L8003D37C
    /* 2D374 8003D374 001A0800 */   sll       $v1, $t0, 8
    /* 2D378 8003D378 2328E500 */  subu       $a1, $a3, $a1
  .L8003D37C:
    /* 2D37C 8003D37C 1A006400 */  div        $zero, $v1, $a0
    /* 2D380 8003D380 12100000 */  mflo       $v0
    /* 2D384 8003D384 40280500 */  sll        $a1, $a1, 1
    /* 2D388 8003D388 00000000 */  nop
    /* 2D38C 8003D38C 1800A200 */  mult       $a1, $v0
    /* 2D390 8003D390 01000224 */  addiu      $v0, $zero, 0x1
    /* 2D394 8003D394 12400000 */  mflo       $t0
    /* 2D398 8003D398 031C0800 */  sra        $v1, $t0, 16
    /* 2D39C 8003D39C 000043AE */  sw         $v1, 0x0($s2)
    /* 2D3A0 8003D3A0 000066AE */  sw         $a2, 0x0($s3)
  .L8003D3A4:
    /* 2D3A4 8003D3A4 7000BF8F */  lw         $ra, 0x70($sp)
    /* 2D3A8 8003D3A8 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 2D3AC 8003D3AC 6800B28F */  lw         $s2, 0x68($sp)
    /* 2D3B0 8003D3B0 6400B18F */  lw         $s1, 0x64($sp)
    /* 2D3B4 8003D3B4 6000B08F */  lw         $s0, 0x60($sp)
    /* 2D3B8 8003D3B8 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 2D3BC 8003D3BC 0800E003 */  jr         $ra
    /* 2D3C0 8003D3C0 00000000 */   nop
endlabel calc_snd_position__FiiPlT2
