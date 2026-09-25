.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StCdInterrupt, 0x91C

glabel StCdInterrupt
    /* DFEC 8001DFEC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* DFF0 8001DFF0 1380023C */  lui        $v0, %hi(StFinalSector)
    /* DFF4 8001DFF4 2872428C */  lw         $v0, %lo(StFinalSector)($v0)
    /* DFF8 8001DFF8 01000424 */  addiu      $a0, $zero, 0x1
    /* DFFC 8001DFFC 3E024410 */  beq        $v0, $a0, .L8001E8F8
    /* E000 8001E000 3800BFAF */   sw        $ra, 0x38($sp)
    /* E004 8001E004 1380023C */  lui        $v0, %hi(StRgb24)
    /* E008 8001E008 D451428C */  lw         $v0, %lo(StRgb24)($v0)
    /* E00C 8001E00C 00000000 */  nop
    /* E010 8001E010 17004010 */  beqz       $v0, .L8001E070
    /* E014 8001E014 00000000 */   nop
    /* E018 8001E018 0B80023C */  lui        $v0, %hi(D_800B62DC)
    /* E01C 8001E01C DC62428C */  lw         $v0, %lo(D_800B62DC)($v0)
    /* E020 8001E020 00000000 */  nop
    /* E024 8001E024 0000428C */  lw         $v0, 0x0($v0)
    /* E028 8001E028 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* E02C 8001E02C 24104300 */  and        $v0, $v0, $v1
    /* E030 8001E030 0F004010 */  beqz       $v0, .L8001E070
    /* E034 8001E034 00000000 */   nop
    /* E038 8001E038 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E03C 8001E03C C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E040 8001E040 1380013C */  lui        $at, %hi(StCdIntrFlag)
    /* E044 8001E044 07004010 */  beqz       $v0, .L8001E064
    /* E048 8001E048 E45124AC */   sw        $a0, %lo(StCdIntrFlag)($at)
    /* E04C 8001E04C 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E050 8001E050 B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E054 8001E054 00000000 */  nop
    /* E058 8001E058 01004224 */  addiu      $v0, $v0, 0x1
    /* E05C 8001E05C 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E060 8001E060 B08322AC */  sw         $v0, %lo(StEmu_Idx)($at)
  .L8001E064:
    /* E064 8001E064 0B80013C */  lui        $at, %hi(debug_cause)
    /* E068 8001E068 3E7A0008 */  j          .L8001E8F8
    /* E06C 8001E06C 046324AC */   sw        $a0, %lo(debug_cause)($at)
  .L8001E070:
    /* E070 8001E070 846B000C */  jal        CdReady
    /* E074 8001E074 3000A527 */   addiu     $a1, $sp, 0x30
    /* E078 8001E078 05000324 */  addiu      $v1, $zero, 0x5
    /* E07C 8001E07C 1E024310 */  beq        $v0, $v1, .L8001E8F8
    /* E080 8001E080 00000000 */   nop
    /* E084 8001E084 3000A293 */  lbu        $v0, 0x30($sp)
    /* E088 8001E088 3100A393 */  lbu        $v1, 0x31($sp)
    /* E08C 8001E08C 2200A2A7 */  sh         $v0, 0x22($sp)
    /* E090 8001E090 2400A3A7 */  sh         $v1, 0x24($sp)
    /* E094 8001E094 2200A297 */  lhu        $v0, 0x22($sp)
    /* E098 8001E098 00000000 */  nop
    /* E09C 8001E09C 04004230 */  andi       $v0, $v0, 0x4
    /* E0A0 8001E0A0 04004010 */  beqz       $v0, .L8001E0B4
    /* E0A4 8001E0A4 03000224 */   addiu     $v0, $zero, 0x3
    /* E0A8 8001E0A8 0B80013C */  lui        $at, %hi(debug_cause)
    /* E0AC 8001E0AC 3E7A0008 */  j          .L8001E8F8
    /* E0B0 8001E0B0 046322AC */   sw        $v0, %lo(debug_cause)($at)
  .L8001E0B4:
    /* E0B4 8001E0B4 1480023C */  lui        $v0, %hi(StRingIdx1)
    /* E0B8 8001E0B8 B89B428C */  lw         $v0, %lo(StRingIdx1)($v0)
    /* E0BC 8001E0BC 1480033C */  lui        $v1, %hi(StRingAddr)
    /* E0C0 8001E0C0 D89B638C */  lw         $v1, %lo(StRingAddr)($v1)
    /* E0C4 8001E0C4 40110200 */  sll        $v0, $v0, 5
    /* E0C8 8001E0C8 21186200 */  addu       $v1, $v1, $v0
    /* E0CC 8001E0CC 1380013C */  lui        $at, %hi(D_80132580)
    /* E0D0 8001E0D0 802523AC */  sw         $v1, %lo(D_80132580)($at)
    /* E0D4 8001E0D4 00006294 */  lhu        $v0, 0x0($v1)
    /* E0D8 8001E0D8 00000000 */  nop
    /* E0DC 8001E0DC 10004010 */  beqz       $v0, .L8001E120
    /* E0E0 8001E0E0 00000000 */   nop
    /* E0E4 8001E0E4 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E0E8 8001E0E8 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E0EC 8001E0EC 00000000 */  nop
    /* E0F0 8001E0F0 08004010 */  beqz       $v0, .L8001E114
    /* E0F4 8001E0F4 04000224 */   addiu     $v0, $zero, 0x4
    /* E0F8 8001E0F8 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E0FC 8001E0FC B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E100 8001E100 00000000 */  nop
    /* E104 8001E104 01004224 */  addiu      $v0, $v0, 0x1
    /* E108 8001E108 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E10C 8001E10C B08322AC */  sw         $v0, %lo(StEmu_Idx)($at)
    /* E110 8001E110 04000224 */  addiu      $v0, $zero, 0x4
  .L8001E114:
    /* E114 8001E114 0B80013C */  lui        $at, %hi(debug_cause)
    /* E118 8001E118 3E7A0008 */  j          .L8001E8F8
    /* E11C 8001E11C 046322AC */   sw        $v0, %lo(debug_cause)($at)
  .L8001E120:
    /* E120 8001E120 0B80023C */  lui        $v0, %hi(D_800B62BC)
    /* E124 8001E124 BC62428C */  lw         $v0, %lo(D_800B62BC)($v0)
    /* E128 8001E128 00000000 */  nop
    /* E12C 8001E12C 000040A0 */  sb         $zero, 0x0($v0)
    /* E130 8001E130 0B80023C */  lui        $v0, %hi(D_800B62C8)
    /* E134 8001E134 C862428C */  lw         $v0, %lo(D_800B62C8)($v0)
    /* E138 8001E138 00000000 */  nop
    /* E13C 8001E13C 000040A0 */  sb         $zero, 0x0($v0)
    /* E140 8001E140 0B80023C */  lui        $v0, %hi(D_800B62BC)
    /* E144 8001E144 BC62428C */  lw         $v0, %lo(D_800B62BC)($v0)
    /* E148 8001E148 0200043C */  lui        $a0, (0x20943 >> 16)
    /* E14C 8001E14C 000040A0 */  sb         $zero, 0x0($v0)
    /* E150 8001E150 0B80033C */  lui        $v1, %hi(D_800B62C8)
    /* E154 8001E154 C862638C */  lw         $v1, %lo(D_800B62C8)($v1)
    /* E158 8001E158 80000224 */  addiu      $v0, $zero, 0x80
    /* E15C 8001E15C 000062A0 */  sb         $v0, 0x0($v1)
    /* E160 8001E160 0B80023C */  lui        $v0, %hi(D_800B62CC)
    /* E164 8001E164 CC62428C */  lw         $v0, %lo(D_800B62CC)($v0)
    /* E168 8001E168 43098434 */  ori        $a0, $a0, (0x20943 & 0xFFFF)
    /* E16C 8001E16C 000044AC */  sw         $a0, 0x0($v0)
    /* E170 8001E170 0B80033C */  lui        $v1, %hi(D_800B62D0)
    /* E174 8001E174 D062638C */  lw         $v1, %lo(D_800B62D0)($v1)
    /* E178 8001E178 23130224 */  addiu      $v0, $zero, 0x1323
    /* E17C 8001E17C 000062AC */  sw         $v0, 0x0($v1)
    /* E180 8001E180 1380023C */  lui        $v0, %hi(StMode)
    /* E184 8001E184 D851428C */  lw         $v0, %lo(StMode)($v0)
    /* E188 8001E188 00000000 */  nop
    /* E18C 8001E18C 14004014 */  bnez       $v0, .L8001E1E0
    /* E190 8001E190 21200000 */   addu      $a0, $zero, $zero
    /* E194 8001E194 2800A527 */  addiu      $a1, $sp, 0x28
  .L8001E198:
    /* E198 8001E198 0B80023C */  lui        $v0, %hi(D_800B62C4)
    /* E19C 8001E19C C462428C */  lw         $v0, %lo(D_800B62C4)($v0)
    /* E1A0 8001E1A0 2118A400 */  addu       $v1, $a1, $a0
    /* E1A4 8001E1A4 00004290 */  lbu        $v0, 0x0($v0)
    /* E1A8 8001E1A8 01008424 */  addiu      $a0, $a0, 0x1
    /* E1AC 8001E1AC 000062A0 */  sb         $v0, 0x0($v1)
    /* E1B0 8001E1B0 0400822C */  sltiu      $v0, $a0, 0x4
    /* E1B4 8001E1B4 F8FF4014 */  bnez       $v0, .L8001E198
    /* E1B8 8001E1B8 00000000 */   nop
    /* E1BC 8001E1BC 21200000 */  addu       $a0, $zero, $zero
    /* E1C0 8001E1C0 0B80033C */  lui        $v1, %hi(D_800B62C4)
    /* E1C4 8001E1C4 C462638C */  lw         $v1, %lo(D_800B62C4)($v1)
    /* E1C8 8001E1C8 00000000 */  nop
  .L8001E1CC:
    /* E1CC 8001E1CC 00006290 */  lbu        $v0, 0x0($v1)
    /* E1D0 8001E1D0 01008424 */  addiu      $a0, $a0, 0x1
    /* E1D4 8001E1D4 0800822C */  sltiu      $v0, $a0, 0x8
    /* E1D8 8001E1D8 FCFF4014 */  bnez       $v0, .L8001E1CC
    /* E1DC 8001E1DC 00000000 */   nop
  .L8001E1E0:
    /* E1E0 8001E1E0 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E1E4 8001E1E4 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E1E8 8001E1E8 00000000 */  nop
    /* E1EC 8001E1EC 0C004010 */  beqz       $v0, .L8001E220
    /* E1F0 8001E1F0 0011083C */   lui       $t0, (0x11000000 >> 16)
    /* E1F4 8001E1F4 08000624 */  addiu      $a2, $zero, 0x8
    /* E1F8 8001E1F8 21380000 */  addu       $a3, $zero, $zero
    /* E1FC 8001E1FC 1480053C */  lui        $a1, %hi(StEmu_Idx)
    /* E200 8001E200 B083A58C */  lw         $a1, %lo(StEmu_Idx)($a1)
    /* E204 8001E204 1380043C */  lui        $a0, %hi(D_80132580)
    /* E208 8001E208 8025848C */  lw         $a0, %lo(D_80132580)($a0)
    /* E20C 8001E20C C02A0500 */  sll        $a1, $a1, 11
    /* E210 8001E210 427A000C */  jal        func_8001E908
    /* E214 8001E214 21284500 */   addu      $a1, $v0, $a1
    /* E218 8001E218 91780008 */  j          .L8001E244
    /* E21C 8001E21C 00000000 */   nop
  .L8001E220:
    /* E220 8001E220 03000424 */  addiu      $a0, $zero, 0x3
    /* E224 8001E224 21300000 */  addu       $a2, $zero, $zero
    /* E228 8001E228 1380053C */  lui        $a1, %hi(D_80132580)
    /* E22C 8001E22C 8025A58C */  lw         $a1, %lo(D_80132580)($a1)
    /* E230 8001E230 08000724 */  addiu      $a3, $zero, 0x8
    /* E234 8001E234 1000A8AF */  sw         $t0, 0x10($sp)
    /* E238 8001E238 1400A0AF */  sw         $zero, 0x14($sp)
    /* E23C 8001E23C 4D7A000C */  jal        func_8001E934
    /* E240 8001E240 1800A0AF */   sw        $zero, 0x18($sp)
  .L8001E244:
    /* E244 8001E244 0B80043C */  lui        $a0, %hi(D_800B62EC)
    /* E248 8001E248 EC62848C */  lw         $a0, %lo(D_800B62EC)($a0)
    /* E24C 8001E24C 00000000 */  nop
    /* E250 8001E250 0000828C */  lw         $v0, 0x0($a0)
    /* E254 8001E254 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* E258 8001E258 24104300 */  and        $v0, $v0, $v1
    /* E25C 8001E25C 07004010 */  beqz       $v0, .L8001E27C
    /* E260 8001E260 21188000 */   addu      $v1, $a0, $zero
    /* E264 8001E264 0001043C */  lui        $a0, (0x1000000 >> 16)
  .L8001E268:
    /* E268 8001E268 0000628C */  lw         $v0, 0x0($v1)
    /* E26C 8001E26C 00000000 */  nop
    /* E270 8001E270 24104400 */  and        $v0, $v0, $a0
    /* E274 8001E274 FCFF4014 */  bnez       $v0, .L8001E268
    /* E278 8001E278 00000000 */   nop
  .L8001E27C:
    /* E27C 8001E27C 0200043C */  lui        $a0, (0x20843 >> 16)
    /* E280 8001E280 43088434 */  ori        $a0, $a0, (0x20843 & 0xFFFF)
    /* E284 8001E284 1380023C */  lui        $v0, %hi(D_80132580)
    /* E288 8001E288 8025428C */  lw         $v0, %lo(D_80132580)($v0)
    /* E28C 8001E28C 0B80033C */  lui        $v1, %hi(D_800B62CC)
    /* E290 8001E290 CC62638C */  lw         $v1, %lo(D_800B62CC)($v1)
    /* E294 8001E294 2B00A58B */  lwl        $a1, 0x2B($sp)
    /* E298 8001E298 2800A59B */  lwr        $a1, 0x28($sp)
    /* E29C 8001E29C 00000000 */  nop
    /* E2A0 8001E2A0 1F0045A8 */  swl        $a1, 0x1F($v0)
    /* E2A4 8001E2A4 1C0045B8 */  swr        $a1, 0x1C($v0)
    /* E2A8 8001E2A8 000064AC */  sw         $a0, 0x0($v1)
    /* E2AC 8001E2AC 0B80033C */  lui        $v1, %hi(D_800B62D0)
    /* E2B0 8001E2B0 D062638C */  lw         $v1, %lo(D_800B62D0)($v1)
    /* E2B4 8001E2B4 25130224 */  addiu      $v0, $zero, 0x1325
    /* E2B8 8001E2B8 000062AC */  sw         $v0, 0x0($v1)
    /* E2BC 8001E2BC 1480033C */  lui        $v1, %hi(StSTART_FLAG)
    /* E2C0 8001E2C0 D09B638C */  lw         $v1, %lo(StSTART_FLAG)($v1)
    /* E2C4 8001E2C4 01000224 */  addiu      $v0, $zero, 0x1
    /* E2C8 8001E2C8 1C006214 */  bne        $v1, $v0, .L8001E33C
    /* E2CC 8001E2CC 00000000 */   nop
    /* E2D0 8001E2D0 1380043C */  lui        $a0, %hi(StStartFrame)
    /* E2D4 8001E2D4 1852848C */  lw         $a0, %lo(StStartFrame)($a0)
    /* E2D8 8001E2D8 00000000 */  nop
    /* E2DC 8001E2DC 17008010 */  beqz       $a0, .L8001E33C
    /* E2E0 8001E2E0 00000000 */   nop
    /* E2E4 8001E2E4 1380033C */  lui        $v1, %hi(D_80132580)
    /* E2E8 8001E2E8 8025638C */  lw         $v1, %lo(D_80132580)($v1)
    /* E2EC 8001E2EC 00000000 */  nop
    /* E2F0 8001E2F0 08006294 */  lhu        $v0, 0x8($v1)
    /* E2F4 8001E2F4 00000000 */  nop
    /* E2F8 8001E2F8 0E008210 */  beq        $a0, $v0, .L8001E334
    /* E2FC 8001E2FC 00000000 */   nop
    /* E300 8001E300 000060A4 */  sh         $zero, 0x0($v1)
    /* E304 8001E304 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E308 8001E308 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E30C 8001E30C 00000000 */  nop
    /* E310 8001E310 79014010 */  beqz       $v0, .L8001E8F8
    /* E314 8001E314 00000000 */   nop
    /* E318 8001E318 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E31C 8001E31C B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E320 8001E320 00000000 */  nop
    /* E324 8001E324 01004224 */  addiu      $v0, $v0, 0x1
    /* E328 8001E328 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E32C 8001E32C 3E7A0008 */  j          .L8001E8F8
    /* E330 8001E330 B08322AC */   sw        $v0, %lo(StEmu_Idx)($at)
  .L8001E334:
    /* E334 8001E334 1480013C */  lui        $at, %hi(StSTART_FLAG)
    /* E338 8001E338 D09B20AC */  sw         $zero, %lo(StSTART_FLAG)($at)
  .L8001E33C:
    /* E33C 8001E33C 1380043C */  lui        $a0, %hi(D_80132580)
    /* E340 8001E340 8025848C */  lw         $a0, %lo(D_80132580)($a0)
    /* E344 8001E344 00000000 */  nop
    /* E348 8001E348 00008394 */  lhu        $v1, 0x0($a0)
    /* E34C 8001E34C 60010224 */  addiu      $v0, $zero, 0x160
    /* E350 8001E350 08006214 */  bne        $v1, $v0, .L8001E374
    /* E354 8001E354 00000000 */   nop
    /* E358 8001E358 02008294 */  lhu        $v0, 0x2($a0)
    /* E35C 8001E35C 1380033C */  lui        $v1, %hi(CChannel)
    /* E360 8001E360 1C52638C */  lw         $v1, %lo(CChannel)($v1)
    /* E364 8001E364 82120200 */  srl        $v0, $v0, 10
    /* E368 8001E368 1F004230 */  andi       $v0, $v0, 0x1F
    /* E36C 8001E36C 11004310 */  beq        $v0, $v1, .L8001E3B4
    /* E370 8001E370 00000000 */   nop
  .L8001E374:
    /* E374 8001E374 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E378 8001E378 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E37C 8001E37C 00000000 */  nop
    /* E380 8001E380 04004010 */  beqz       $v0, .L8001E394
    /* E384 8001E384 00000000 */   nop
    /* E388 8001E388 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E38C 8001E38C E6780008 */  j          .L8001E398
    /* E390 8001E390 B08320AC */   sw        $zero, %lo(StEmu_Idx)($at)
  .L8001E394:
    /* E394 8001E394 00008294 */  lhu        $v0, 0x0($a0)
  .L8001E398:
    /* E398 8001E398 1380033C */  lui        $v1, %hi(D_80132580)
    /* E39C 8001E39C 8025638C */  lw         $v1, %lo(D_80132580)($v1)
    /* E3A0 8001E3A0 05000224 */  addiu      $v0, $zero, 0x5
    /* E3A4 8001E3A4 0B80013C */  lui        $at, %hi(debug_cause)
    /* E3A8 8001E3A8 046322AC */  sw         $v0, %lo(debug_cause)($at)
    /* E3AC 8001E3AC 3E7A0008 */  j          .L8001E8F8
    /* E3B0 8001E3B0 000060A4 */   sh        $zero, 0x0($v1)
  .L8001E3B4:
    /* E3B4 8001E3B4 1380033C */  lui        $v1, %hi(Stsector_offset)
    /* E3B8 8001E3B8 D0516384 */  lh         $v1, %lo(Stsector_offset)($v1)
    /* E3BC 8001E3BC 04008294 */  lhu        $v0, 0x4($a0)
    /* E3C0 8001E3C0 00000000 */  nop
    /* E3C4 8001E3C4 0A006214 */  bne        $v1, $v0, .L8001E3F0
    /* E3C8 8001E3C8 00000000 */   nop
    /* E3CC 8001E3CC 1380033C */  lui        $v1, %hi(Stframe_no)
    /* E3D0 8001E3D0 4050638C */  lw         $v1, %lo(Stframe_no)($v1)
    /* E3D4 8001E3D4 00000000 */  nop
    /* E3D8 8001E3D8 25006010 */  beqz       $v1, .L8001E470
    /* E3DC 8001E3DC 00000000 */   nop
    /* E3E0 8001E3E0 08008294 */  lhu        $v0, 0x8($a0)
    /* E3E4 8001E3E4 00000000 */  nop
    /* E3E8 8001E3E8 21006210 */  beq        $v1, $v0, .L8001E470
    /* E3EC 8001E3EC 00000000 */   nop
  .L8001E3F0:
    /* E3F0 8001E3F0 1480043C */  lui        $a0, %hi(StRingIdx2)
    /* E3F4 8001E3F4 BC9B848C */  lw         $a0, %lo(StRingIdx2)($a0)
    /* E3F8 8001E3F8 1480053C */  lui        $a1, %hi(StRingIdx1)
    /* E3FC 8001E3FC B89BA58C */  lw         $a1, %lo(StRingIdx1)($a1)
    /* E400 8001E400 1380013C */  lui        $at, %hi(Stframe_no)
    /* E404 8001E404 405020AC */  sw         $zero, %lo(Stframe_no)($at)
    /* E408 8001E408 1380013C */  lui        $at, %hi(Stsector_offset)
    /* E40C 8001E40C D05120A4 */  sh         $zero, %lo(Stsector_offset)($at)
    /* E410 8001E410 E377000C */  jal        init_ring_status
    /* E414 8001E414 2328A400 */   subu      $a1, $a1, $a0
    /* E418 8001E418 1480023C */  lui        $v0, %hi(StRingIdx2)
    /* E41C 8001E41C BC9B428C */  lw         $v0, %lo(StRingIdx2)($v0)
    /* E420 8001E420 1380033C */  lui        $v1, %hi(D_80132580)
    /* E424 8001E424 8025638C */  lw         $v1, %lo(D_80132580)($v1)
    /* E428 8001E428 1480013C */  lui        $at, %hi(StRingIdx1)
    /* E42C 8001E42C B89B22AC */  sw         $v0, %lo(StRingIdx1)($at)
    /* E430 8001E430 000060A4 */  sh         $zero, 0x0($v1)
    /* E434 8001E434 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E438 8001E438 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E43C 8001E43C 00000000 */  nop
    /* E440 8001E440 08004010 */  beqz       $v0, .L8001E464
    /* E444 8001E444 06000224 */   addiu     $v0, $zero, 0x6
    /* E448 8001E448 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E44C 8001E44C B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E450 8001E450 00000000 */  nop
    /* E454 8001E454 01004224 */  addiu      $v0, $v0, 0x1
    /* E458 8001E458 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E45C 8001E45C B08322AC */  sw         $v0, %lo(StEmu_Idx)($at)
    /* E460 8001E460 06000224 */  addiu      $v0, $zero, 0x6
  .L8001E464:
    /* E464 8001E464 0B80013C */  lui        $at, %hi(debug_cause)
    /* E468 8001E468 3E7A0008 */  j          .L8001E8F8
    /* E46C 8001E46C 046322AC */   sw        $v0, %lo(debug_cause)($at)
  .L8001E470:
    /* E470 8001E470 1380033C */  lui        $v1, %hi(D_80132580)
    /* E474 8001E474 8025638C */  lw         $v1, %lo(D_80132580)($v1)
    /* E478 8001E478 00000000 */  nop
    /* E47C 8001E47C 04006294 */  lhu        $v0, 0x4($v1)
    /* E480 8001E480 00000000 */  nop
    /* E484 8001E484 8D004014 */  bnez       $v0, .L8001E6BC
    /* E488 8001E488 0A000224 */   addiu     $v0, $zero, 0xA
    /* E48C 8001E48C 08006294 */  lhu        $v0, 0x8($v1)
    /* E490 8001E490 1480033C */  lui        $v1, %hi(StEndFrame)
    /* E494 8001E494 CC9B638C */  lw         $v1, %lo(StEndFrame)($v1)
    /* E498 8001E498 1380013C */  lui        $at, %hi(Stsector_offset)
    /* E49C 8001E49C D05120A4 */  sh         $zero, %lo(Stsector_offset)($at)
    /* E4A0 8001E4A0 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* E4A4 8001E4A4 1380013C */  lui        $at, %hi(Stframe_no)
    /* E4A8 8001E4A8 405022AC */  sw         $v0, %lo(Stframe_no)($at)
    /* E4AC 8001E4AC 2B006010 */  beqz       $v1, .L8001E55C
    /* E4B0 8001E4B0 2B104300 */   sltu      $v0, $v0, $v1
    /* E4B4 8001E4B4 29004014 */  bnez       $v0, .L8001E55C
    /* E4B8 8001E4B8 00000000 */   nop
    /* E4BC 8001E4BC 1480043C */  lui        $a0, %hi(StRingIdx2)
    /* E4C0 8001E4C0 BC9B848C */  lw         $a0, %lo(StRingIdx2)($a0)
    /* E4C4 8001E4C4 1480053C */  lui        $a1, %hi(StRingIdx1)
    /* E4C8 8001E4C8 B89BA58C */  lw         $a1, %lo(StRingIdx1)($a1)
    /* E4CC 8001E4CC 1380013C */  lui        $at, %hi(Stframe_no)
    /* E4D0 8001E4D0 405020AC */  sw         $zero, %lo(Stframe_no)($at)
    /* E4D4 8001E4D4 1380013C */  lui        $at, %hi(Stsector_offset)
    /* E4D8 8001E4D8 D05120A4 */  sh         $zero, %lo(Stsector_offset)($at)
    /* E4DC 8001E4DC E377000C */  jal        init_ring_status
    /* E4E0 8001E4E0 2328A400 */   subu      $a1, $a1, $a0
    /* E4E4 8001E4E4 1480023C */  lui        $v0, %hi(StRingIdx2)
    /* E4E8 8001E4E8 BC9B428C */  lw         $v0, %lo(StRingIdx2)($v0)
    /* E4EC 8001E4EC 1380033C */  lui        $v1, %hi(D_80132580)
    /* E4F0 8001E4F0 8025638C */  lw         $v1, %lo(D_80132580)($v1)
    /* E4F4 8001E4F4 1480013C */  lui        $at, %hi(StRingIdx1)
    /* E4F8 8001E4F8 B89B22AC */  sw         $v0, %lo(StRingIdx1)($at)
    /* E4FC 8001E4FC 000060A4 */  sh         $zero, 0x0($v1)
    /* E500 8001E500 1380033C */  lui        $v1, %hi(StFunc2)
    /* E504 8001E504 E051638C */  lw         $v1, %lo(StFunc2)($v1)
    /* E508 8001E508 01000224 */  addiu      $v0, $zero, 0x1
    /* E50C 8001E50C 1480013C */  lui        $at, %hi(StSTART_FLAG)
    /* E510 8001E510 03006010 */  beqz       $v1, .L8001E520
    /* E514 8001E514 D09B22AC */   sw        $v0, %lo(StSTART_FLAG)($at)
    /* E518 8001E518 09F86000 */  jalr       $v1
    /* E51C 8001E51C 00000000 */   nop
  .L8001E520:
    /* E520 8001E520 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E524 8001E524 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E528 8001E528 00000000 */  nop
    /* E52C 8001E52C 08004010 */  beqz       $v0, .L8001E550
    /* E530 8001E530 07000224 */   addiu     $v0, $zero, 0x7
    /* E534 8001E534 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E538 8001E538 B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E53C 8001E53C 00000000 */  nop
    /* E540 8001E540 01004224 */  addiu      $v0, $v0, 0x1
    /* E544 8001E544 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E548 8001E548 B08322AC */  sw         $v0, %lo(StEmu_Idx)($at)
    /* E54C 8001E54C 07000224 */  addiu      $v0, $zero, 0x7
  .L8001E550:
    /* E550 8001E550 0B80013C */  lui        $at, %hi(debug_cause)
    /* E554 8001E554 3E7A0008 */  j          .L8001E8F8
    /* E558 8001E558 046322AC */   sw        $v0, %lo(debug_cause)($at)
  .L8001E55C:
    /* E55C 8001E55C 1480023C */  lui        $v0, %hi(StRingSize)
    /* E560 8001E560 F09B428C */  lw         $v0, %lo(StRingSize)($v0)
    /* E564 8001E564 1480033C */  lui        $v1, %hi(StRingIdx1)
    /* E568 8001E568 B89B638C */  lw         $v1, %lo(StRingIdx1)($v1)
    /* E56C 8001E56C 1380043C */  lui        $a0, %hi(D_80132580)
    /* E570 8001E570 8025848C */  lw         $a0, %lo(D_80132580)($a0)
    /* E574 8001E574 23104300 */  subu       $v0, $v0, $v1
    /* E578 8001E578 06008394 */  lhu        $v1, 0x6($a0)
    /* E57C 8001E57C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* E580 8001E580 2B104300 */  sltu       $v0, $v0, $v1
    /* E584 8001E584 48004010 */  beqz       $v0, .L8001E6A8
    /* E588 8001E588 00000000 */   nop
    /* E58C 8001E58C 1480023C */  lui        $v0, %hi(StEndFrame)
    /* E590 8001E590 CC9B428C */  lw         $v0, %lo(StEndFrame)($v0)
    /* E594 8001E594 00000000 */  nop
    /* E598 8001E598 19004014 */  bnez       $v0, .L8001E600
    /* E59C 8001E59C 01000224 */   addiu     $v0, $zero, 0x1
    /* E5A0 8001E5A0 000082A4 */  sh         $v0, 0x0($a0)
    /* E5A4 8001E5A4 1380033C */  lui        $v1, %hi(StFunc2)
    /* E5A8 8001E5A8 E051638C */  lw         $v1, %lo(StFunc2)($v1)
    /* E5AC 8001E5AC 01000224 */  addiu      $v0, $zero, 0x1
    /* E5B0 8001E5B0 1480013C */  lui        $at, %hi(StSTART_FLAG)
    /* E5B4 8001E5B4 03006010 */  beqz       $v1, .L8001E5C4
    /* E5B8 8001E5B8 D09B22AC */   sw        $v0, %lo(StSTART_FLAG)($at)
    /* E5BC 8001E5BC 09F86000 */  jalr       $v1
    /* E5C0 8001E5C0 00000000 */   nop
  .L8001E5C4:
    /* E5C4 8001E5C4 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E5C8 8001E5C8 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E5CC 8001E5CC 00000000 */  nop
    /* E5D0 8001E5D0 08004010 */  beqz       $v0, .L8001E5F4
    /* E5D4 8001E5D4 08000224 */   addiu     $v0, $zero, 0x8
    /* E5D8 8001E5D8 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E5DC 8001E5DC B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E5E0 8001E5E0 00000000 */  nop
    /* E5E4 8001E5E4 01004224 */  addiu      $v0, $v0, 0x1
    /* E5E8 8001E5E8 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E5EC 8001E5EC B08322AC */  sw         $v0, %lo(StEmu_Idx)($at)
    /* E5F0 8001E5F0 08000224 */  addiu      $v0, $zero, 0x8
  .L8001E5F4:
    /* E5F4 8001E5F4 0B80013C */  lui        $at, %hi(debug_cause)
    /* E5F8 8001E5F8 3E7A0008 */  j          .L8001E8F8
    /* E5FC 8001E5FC 046322AC */   sw        $v0, %lo(debug_cause)($at)
  .L8001E600:
    /* E600 8001E600 1480023C */  lui        $v0, %hi(StRingAddr)
    /* E604 8001E604 D89B428C */  lw         $v0, %lo(StRingAddr)($v0)
    /* E608 8001E608 00000000 */  nop
    /* E60C 8001E60C 00004284 */  lh         $v0, 0x0($v0)
    /* E610 8001E610 00000000 */  nop
    /* E614 8001E614 11004010 */  beqz       $v0, .L8001E65C
    /* E618 8001E618 01000224 */   addiu     $v0, $zero, 0x1
    /* E61C 8001E61C 000080A4 */  sh         $zero, 0x0($a0)
    /* E620 8001E620 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E624 8001E624 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E628 8001E628 00000000 */  nop
    /* E62C 8001E62C 08004010 */  beqz       $v0, .L8001E650
    /* E630 8001E630 09000224 */   addiu     $v0, $zero, 0x9
    /* E634 8001E634 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E638 8001E638 B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E63C 8001E63C 00000000 */  nop
    /* E640 8001E640 01004224 */  addiu      $v0, $v0, 0x1
    /* E644 8001E644 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E648 8001E648 B08322AC */  sw         $v0, %lo(StEmu_Idx)($at)
    /* E64C 8001E64C 09000224 */  addiu      $v0, $zero, 0x9
  .L8001E650:
    /* E650 8001E650 0B80013C */  lui        $at, %hi(debug_cause)
    /* E654 8001E654 3E7A0008 */  j          .L8001E8F8
    /* E658 8001E658 046322AC */   sw        $v0, %lo(debug_cause)($at)
  .L8001E65C:
    /* E65C 8001E65C 000082A4 */  sh         $v0, 0x0($a0)
    /* E660 8001E660 1480053C */  lui        $a1, %hi(StRingAddr)
    /* E664 8001E664 D89BA58C */  lw         $a1, %lo(StRingAddr)($a1)
    /* E668 8001E668 1380033C */  lui        $v1, %hi(D_80132580)
    /* E66C 8001E66C 8025638C */  lw         $v1, %lo(D_80132580)($v1)
    /* E670 8001E670 21200000 */  addu       $a0, $zero, $zero
    /* E674 8001E674 1480013C */  lui        $at, %hi(StRingIdx1)
    /* E678 8001E678 B89B20AC */  sw         $zero, %lo(StRingIdx1)($at)
  .L8001E67C:
    /* E67C 8001E67C 0000628C */  lw         $v0, 0x0($v1)
    /* E680 8001E680 04006324 */  addiu      $v1, $v1, 0x4
    /* E684 8001E684 01008424 */  addiu      $a0, $a0, 0x1
    /* E688 8001E688 0000A2AC */  sw         $v0, 0x0($a1)
    /* E68C 8001E68C 0800822C */  sltiu      $v0, $a0, 0x8
    /* E690 8001E690 FAFF4014 */  bnez       $v0, .L8001E67C
    /* E694 8001E694 0400A524 */   addiu     $a1, $a1, 0x4
    /* E698 8001E698 1480023C */  lui        $v0, %hi(StRingAddr)
    /* E69C 8001E69C D89B428C */  lw         $v0, %lo(StRingAddr)($v0)
    /* E6A0 8001E6A0 1380013C */  lui        $at, %hi(D_80132580)
    /* E6A4 8001E6A4 802522AC */  sw         $v0, %lo(D_80132580)($at)
  .L8001E6A8:
    /* E6A8 8001E6A8 1480023C */  lui        $v0, %hi(StRingIdx1)
    /* E6AC 8001E6AC B89B428C */  lw         $v0, %lo(StRingIdx1)($v0)
    /* E6B0 8001E6B0 1480013C */  lui        $at, %hi(StRingIdx2)
    /* E6B4 8001E6B4 BC9B22AC */  sw         $v0, %lo(StRingIdx2)($at)
    /* E6B8 8001E6B8 0A000224 */  addiu      $v0, $zero, 0xA
  .L8001E6BC:
    /* E6BC 8001E6BC 0B80013C */  lui        $at, %hi(debug_cause)
    /* E6C0 8001E6C0 046322AC */  sw         $v0, %lo(debug_cause)($at)
    /* E6C4 8001E6C4 1380023C */  lui        $v0, %hi(Stsector_offset)
    /* E6C8 8001E6C8 D0514294 */  lhu        $v0, %lo(Stsector_offset)($v0)
    /* E6CC 8001E6CC 1480043C */  lui        $a0, %hi(StRingSize)
    /* E6D0 8001E6D0 F09B848C */  lw         $a0, %lo(StRingSize)($a0)
    /* E6D4 8001E6D4 1480033C */  lui        $v1, %hi(StRingAddr)
    /* E6D8 8001E6D8 D89B638C */  lw         $v1, %lo(StRingAddr)($v1)
    /* E6DC 8001E6DC 1480053C */  lui        $a1, %hi(StRingIdx1)
    /* E6E0 8001E6E0 B89BA58C */  lw         $a1, %lo(StRingIdx1)($a1)
    /* E6E4 8001E6E4 01004224 */  addiu      $v0, $v0, 0x1
    /* E6E8 8001E6E8 40210400 */  sll        $a0, $a0, 5
    /* E6EC 8001E6EC 21186400 */  addu       $v1, $v1, $a0
    /* E6F0 8001E6F0 1380013C */  lui        $at, %hi(Stsector_offset)
    /* E6F4 8001E6F4 D05122A4 */  sh         $v0, %lo(Stsector_offset)($at)
    /* E6F8 8001E6F8 80110500 */  sll        $v0, $a1, 6
    /* E6FC 8001E6FC 23104500 */  subu       $v0, $v0, $a1
    /* E700 8001E700 40110200 */  sll        $v0, $v0, 5
    /* E704 8001E704 1380043C */  lui        $a0, %hi(StRgb24)
    /* E708 8001E708 D451848C */  lw         $a0, %lo(StRgb24)($a0)
    /* E70C 8001E70C 21186200 */  addu       $v1, $v1, $v0
    /* E710 8001E710 1480013C */  lui        $at, %hi(StRingBase)
    /* E714 8001E714 D49B23AC */  sw         $v1, %lo(StRingBase)($at)
    /* E718 8001E718 0B008010 */  beqz       $a0, .L8001E748
    /* E71C 8001E71C 0011083C */   lui       $t0, (0x11000000 >> 16)
    /* E720 8001E720 0200033C */  lui        $v1, (0x20943 >> 16)
    /* E724 8001E724 0B80023C */  lui        $v0, %hi(D_800B62CC)
    /* E728 8001E728 CC62428C */  lw         $v0, %lo(D_800B62CC)($v0)
    /* E72C 8001E72C 43096334 */  ori        $v1, $v1, (0x20943 & 0xFFFF)
    /* E730 8001E730 000043AC */  sw         $v1, 0x0($v0)
    /* E734 8001E734 0B80033C */  lui        $v1, %hi(D_800B62D0)
    /* E738 8001E738 D062638C */  lw         $v1, %lo(D_800B62D0)($v1)
    /* E73C 8001E73C 23130224 */  addiu      $v0, $zero, 0x1323
    /* E740 8001E740 D9790008 */  j          .L8001E764
    /* E744 8001E744 000062AC */   sw        $v0, 0x0($v1)
  .L8001E748:
    /* E748 8001E748 0221033C */  lui        $v1, (0x21020843 >> 16)
    /* E74C 8001E74C 43086334 */  ori        $v1, $v1, (0x21020843 & 0xFFFF)
    /* E750 8001E750 4011083C */  lui        $t0, (0x11400100 >> 16)
    /* E754 8001E754 0B80023C */  lui        $v0, %hi(D_800B62CC)
    /* E758 8001E758 CC62428C */  lw         $v0, %lo(D_800B62CC)($v0)
    /* E75C 8001E75C 00010835 */  ori        $t0, $t0, (0x11400100 & 0xFFFF)
    /* E760 8001E760 000043AC */  sw         $v1, 0x0($v0)
  .L8001E764:
    /* E764 8001E764 1380023C */  lui        $v0, %hi(D_80132580)
    /* E768 8001E768 8025428C */  lw         $v0, %lo(D_80132580)($v0)
    /* E76C 8001E76C 00000000 */  nop
    /* E770 8001E770 06004394 */  lhu        $v1, 0x6($v0)
    /* E774 8001E774 04004294 */  lhu        $v0, 0x4($v0)
    /* E778 8001E778 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* E77C 8001E77C 29006214 */  bne        $v1, $v0, .L8001E824
    /* E780 8001E780 01000324 */   addiu     $v1, $zero, 0x1
    /* E784 8001E784 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E788 8001E788 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E78C 8001E78C 1380013C */  lui        $at, %hi(StFinalSector)
    /* E790 8001E790 287223AC */  sw         $v1, %lo(StFinalSector)($at)
    /* E794 8001E794 11004010 */  beqz       $v0, .L8001E7DC
    /* E798 8001E798 F8010624 */   addiu     $a2, $zero, 0x1F8
    /* E79C 8001E79C 01000724 */  addiu      $a3, $zero, 0x1
    /* E7A0 8001E7A0 1480053C */  lui        $a1, %hi(StEmu_Idx)
    /* E7A4 8001E7A4 B083A58C */  lw         $a1, %lo(StEmu_Idx)($a1)
    /* E7A8 8001E7A8 1480043C */  lui        $a0, %hi(StRingBase)
    /* E7AC 8001E7AC D49B848C */  lw         $a0, %lo(StRingBase)($a0)
    /* E7B0 8001E7B0 C02A0500 */  sll        $a1, $a1, 11
    /* E7B4 8001E7B4 21284500 */  addu       $a1, $v0, $a1
    /* E7B8 8001E7B8 427A000C */  jal        func_8001E908
    /* E7BC 8001E7BC 2000A524 */   addiu     $a1, $a1, 0x20
    /* E7C0 8001E7C0 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E7C4 8001E7C4 B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E7C8 8001E7C8 00000000 */  nop
    /* E7CC 8001E7CC 01004224 */  addiu      $v0, $v0, 0x1
    /* E7D0 8001E7D0 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E7D4 8001E7D4 007A0008 */  j          .L8001E800
    /* E7D8 8001E7D8 B08322AC */   sw        $v0, %lo(StEmu_Idx)($at)
  .L8001E7DC:
    /* E7DC 8001E7DC 03000424 */  addiu      $a0, $zero, 0x3
    /* E7E0 8001E7E0 21300000 */  addu       $a2, $zero, $zero
    /* E7E4 8001E7E4 1480053C */  lui        $a1, %hi(StRingBase)
    /* E7E8 8001E7E8 D49BA58C */  lw         $a1, %lo(StRingBase)($a1)
    /* E7EC 8001E7EC F8010724 */  addiu      $a3, $zero, 0x1F8
    /* E7F0 8001E7F0 1000A8AF */  sw         $t0, 0x10($sp)
    /* E7F4 8001E7F4 1400A3AF */  sw         $v1, 0x14($sp)
    /* E7F8 8001E7F8 4D7A000C */  jal        func_8001E934
    /* E7FC 8001E7FC 1800A0AF */   sw        $zero, 0x18($sp)
  .L8001E800:
    /* E800 8001E800 1380023C */  lui        $v0, %hi(StCHANNEL)
    /* E804 8001E804 1452428C */  lw         $v0, %lo(StCHANNEL)($v0)
    /* E808 8001E808 1380013C */  lui        $at, %hi(Stsector_offset)
    /* E80C 8001E80C D05120A4 */  sh         $zero, %lo(Stsector_offset)($at)
    /* E810 8001E810 1380013C */  lui        $at, %hi(Stframe_no)
    /* E814 8001E814 405020AC */  sw         $zero, %lo(Stframe_no)($at)
    /* E818 8001E818 1380013C */  lui        $at, %hi(CChannel)
    /* E81C 8001E81C 277A0008 */  j          .L8001E89C
    /* E820 8001E820 1C5222AC */   sw        $v0, %lo(CChannel)($at)
  .L8001E824:
    /* E824 8001E824 1480023C */  lui        $v0, %hi(StEmu_Addr)
    /* E828 8001E828 C89B428C */  lw         $v0, %lo(StEmu_Addr)($v0)
    /* E82C 8001E82C 00000000 */  nop
    /* E830 8001E830 11004010 */  beqz       $v0, .L8001E878
    /* E834 8001E834 F8010624 */   addiu     $a2, $zero, 0x1F8
    /* E838 8001E838 21380000 */  addu       $a3, $zero, $zero
    /* E83C 8001E83C 1480053C */  lui        $a1, %hi(StEmu_Idx)
    /* E840 8001E840 B083A58C */  lw         $a1, %lo(StEmu_Idx)($a1)
    /* E844 8001E844 1480043C */  lui        $a0, %hi(StRingBase)
    /* E848 8001E848 D49B848C */  lw         $a0, %lo(StRingBase)($a0)
    /* E84C 8001E84C C02A0500 */  sll        $a1, $a1, 11
    /* E850 8001E850 21284500 */  addu       $a1, $v0, $a1
    /* E854 8001E854 427A000C */  jal        func_8001E908
    /* E858 8001E858 2000A524 */   addiu     $a1, $a1, 0x20
    /* E85C 8001E85C 1480023C */  lui        $v0, %hi(StEmu_Idx)
    /* E860 8001E860 B083428C */  lw         $v0, %lo(StEmu_Idx)($v0)
    /* E864 8001E864 00000000 */  nop
    /* E868 8001E868 01004224 */  addiu      $v0, $v0, 0x1
    /* E86C 8001E86C 1480013C */  lui        $at, %hi(StEmu_Idx)
    /* E870 8001E870 277A0008 */  j          .L8001E89C
    /* E874 8001E874 B08322AC */   sw        $v0, %lo(StEmu_Idx)($at)
  .L8001E878:
    /* E878 8001E878 03000424 */  addiu      $a0, $zero, 0x3
    /* E87C 8001E87C 21300000 */  addu       $a2, $zero, $zero
    /* E880 8001E880 1480053C */  lui        $a1, %hi(StRingBase)
    /* E884 8001E884 D49BA58C */  lw         $a1, %lo(StRingBase)($a1)
    /* E888 8001E888 F8010724 */  addiu      $a3, $zero, 0x1F8
    /* E88C 8001E88C 1000A8AF */  sw         $t0, 0x10($sp)
    /* E890 8001E890 1400A0AF */  sw         $zero, 0x14($sp)
    /* E894 8001E894 4D7A000C */  jal        func_8001E934
    /* E898 8001E898 1800A0AF */   sw        $zero, 0x18($sp)
  .L8001E89C:
    /* E89C 8001E89C 0B80033C */  lui        $v1, %hi(D_800B62D0)
    /* E8A0 8001E8A0 D062638C */  lw         $v1, %lo(D_800B62D0)($v1)
    /* E8A4 8001E8A4 25130224 */  addiu      $v0, $zero, 0x1325
    /* E8A8 8001E8A8 000062AC */  sw         $v0, 0x0($v1)
    /* E8AC 8001E8AC 1380033C */  lui        $v1, %hi(D_80132580)
    /* E8B0 8001E8B0 8025638C */  lw         $v1, %lo(D_80132580)($v1)
    /* E8B4 8001E8B4 03000224 */  addiu      $v0, $zero, 0x3
    /* E8B8 8001E8B8 000062A4 */  sh         $v0, 0x0($v1)
    /* E8BC 8001E8BC 1480023C */  lui        $v0, %hi(StRingIdx1)
    /* E8C0 8001E8C0 B89B428C */  lw         $v0, %lo(StRingIdx1)($v0)
    /* E8C4 8001E8C4 1480033C */  lui        $v1, %hi(StEmu_Addr)
    /* E8C8 8001E8C8 C89B638C */  lw         $v1, %lo(StEmu_Addr)($v1)
    /* E8CC 8001E8CC 01004224 */  addiu      $v0, $v0, 0x1
    /* E8D0 8001E8D0 1480013C */  lui        $at, %hi(StRingIdx1)
    /* E8D4 8001E8D4 08006010 */  beqz       $v1, .L8001E8F8
    /* E8D8 8001E8D8 B89B22AC */   sw        $v0, %lo(StRingIdx1)($at)
    /* E8DC 8001E8DC 1380023C */  lui        $v0, %hi(StFinalSector)
    /* E8E0 8001E8E0 2872428C */  lw         $v0, %lo(StFinalSector)($v0)
    /* E8E4 8001E8E4 00000000 */  nop
    /* E8E8 8001E8E8 03004010 */  beqz       $v0, .L8001E8F8
    /* E8EC 8001E8EC 00000000 */   nop
    /* E8F0 8001E8F0 5F77000C */  jal        data_ready_callback
    /* E8F4 8001E8F4 00000000 */   nop
  .L8001E8F8:
    /* E8F8 8001E8F8 3800BF8F */  lw         $ra, 0x38($sp)
    /* E8FC 8001E8FC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* E900 8001E900 0800E003 */  jr         $ra
    /* E904 8001E904 00000000 */   nop
endlabel StCdInterrupt
