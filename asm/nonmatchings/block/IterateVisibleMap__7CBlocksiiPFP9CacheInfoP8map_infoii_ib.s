.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IterateVisibleMap__7CBlocksiiPFP9CacheInfoP8map_infoii_ib, 0x478

glabel IterateVisibleMap__7CBlocksiiPFP9CacheInfoP8map_infoii_ib
    /* 7F098 8008F098 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 7F09C 8008F09C DC1E828F */  lw         $v0, %gp_rel(D_8011C65C)($gp)
    /* 7F0A0 8008F0A0 A000A98F */  lw         $t1, 0xA0($sp)
    /* 7F0A4 8008F0A4 21408000 */  addu       $t0, $a0, $zero
    /* 7F0A8 8008F0A8 8C00BFAF */  sw         $ra, 0x8C($sp)
    /* 7F0AC 8008F0AC 8800BEAF */  sw         $fp, 0x88($sp)
    /* 7F0B0 8008F0B0 8400B7AF */  sw         $s7, 0x84($sp)
    /* 7F0B4 8008F0B4 8000B6AF */  sw         $s6, 0x80($sp)
    /* 7F0B8 8008F0B8 7C00B5AF */  sw         $s5, 0x7C($sp)
    /* 7F0BC 8008F0BC 7800B4AF */  sw         $s4, 0x78($sp)
    /* 7F0C0 8008F0C0 7400B3AF */  sw         $s3, 0x74($sp)
    /* 7F0C4 8008F0C4 7000B2AF */  sw         $s2, 0x70($sp)
    /* 7F0C8 8008F0C8 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* 7F0CC 8008F0CC 6800B0AF */  sw         $s0, 0x68($sp)
    /* 7F0D0 8008F0D0 1000A5AF */  sw         $a1, 0x10($sp)
    /* 7F0D4 8008F0D4 1800A7AF */  sw         $a3, 0x18($sp)
    /* 7F0D8 8008F0D8 02004010 */  beqz       $v0, .L8008F0E4
    /* 7F0DC 8008F0DC 4800A9AF */   sw        $t1, 0x48($sp)
    /* 7F0E0 8008F0E0 4800A0AF */  sw         $zero, 0x48($sp)
  .L8008F0E4:
    /* 7F0E4 8008F0E4 A800028D */  lw         $v0, 0xA8($t0)
    /* 7F0E8 8008F0E8 00000000 */  nop
    /* 7F0EC 8008F0EC 0B004014 */  bnez       $v0, .L8008F11C
    /* 7F0F0 8008F0F0 21900000 */   addu      $s2, $zero, $zero
    /* 7F0F4 8008F0F4 1000AA8F */  lw         $t2, 0x10($sp)
    /* 7F0F8 8008F0F8 00000000 */  nop
    /* 7F0FC 8008F0FC C0FE4A25 */  addiu      $t2, $t2, -0x140
    /* 7F100 8008F100 C0FEC624 */  addiu      $a2, $a2, -0x140
    /* 7F104 8008F104 08000924 */  addiu      $t1, $zero, 0x8
    /* 7F108 8008F108 1000AAAF */  sw         $t2, 0x10($sp)
    /* 7F10C 8008F10C 08000A24 */  addiu      $t2, $zero, 0x8
    /* 7F110 8008F110 3800A9AF */  sw         $t1, 0x38($sp)
    /* 7F114 8008F114 493C0208 */  j          .L8008F124
    /* 7F118 8008F118 4000AAAF */   sw        $t2, 0x40($sp)
  .L8008F11C:
    /* 7F11C 8008F11C 3800A0AF */  sw         $zero, 0x38($sp)
    /* 7F120 8008F120 4000A0AF */  sw         $zero, 0x40($sp)
  .L8008F124:
    /* 7F124 8008F124 6666023C */  lui        $v0, (0x66666667 >> 16)
    /* 7F128 8008F128 1000A98F */  lw         $t1, 0x10($sp)
    /* 7F12C 8008F12C 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
    /* 7F130 8008F130 18002201 */  mult       $t1, $v0
    /* 7F134 8008F134 10180000 */  mfhi       $v1
    /* 7F138 8008F138 00000000 */  nop
    /* 7F13C 8008F13C 00000000 */  nop
    /* 7F140 8008F140 1800C200 */  mult       $a2, $v0
    /* 7F144 8008F144 03190300 */  sra        $v1, $v1, 4
    /* 7F148 8008F148 C3170900 */  sra        $v0, $t1, 31
    /* 7F14C 8008F14C 23386200 */  subu       $a3, $v1, $v0
    /* 7F150 8008F150 2120E000 */  addu       $a0, $a3, $zero
    /* 7F154 8008F154 80100400 */  sll        $v0, $a0, 2
    /* 7F158 8008F158 21104400 */  addu       $v0, $v0, $a0
    /* 7F15C 8008F15C C0100200 */  sll        $v0, $v0, 3
    /* 7F160 8008F160 23382201 */  subu       $a3, $t1, $v0
    /* 7F164 8008F164 C3170600 */  sra        $v0, $a2, 31
    /* 7F168 8008F168 2000A4AF */  sw         $a0, 0x20($sp)
    /* 7F16C 8008F16C 10280000 */  mfhi       $a1
    /* 7F170 8008F170 03190500 */  sra        $v1, $a1, 4
    /* 7F174 8008F174 23286200 */  subu       $a1, $v1, $v0
    /* 7F178 8008F178 2118A000 */  addu       $v1, $a1, $zero
    /* 7F17C 8008F17C 80100300 */  sll        $v0, $v1, 2
    /* 7F180 8008F180 21104300 */  addu       $v0, $v0, $v1
    /* 7F184 8008F184 C0100200 */  sll        $v0, $v0, 3
    /* 7F188 8008F188 2328C200 */  subu       $a1, $a2, $v0
    /* 7F18C 8008F18C 05002105 */  bgez       $t1, .L8008F1A4
    /* 7F190 8008F190 2800A3AF */   sw        $v1, 0x28($sp)
    /* 7F194 8008F194 21488000 */  addu       $t1, $a0, $zero
    /* 7F198 8008F198 FFFF2925 */  addiu      $t1, $t1, -0x1
    /* 7F19C 8008F19C 2000A9AF */  sw         $t1, 0x20($sp)
    /* 7F1A0 8008F1A0 2800E724 */  addiu      $a3, $a3, 0x28
  .L8008F1A4:
    /* 7F1A4 8008F1A4 2310A700 */  subu       $v0, $a1, $a3
    /* 7F1A8 8008F1A8 D8FF4224 */  addiu      $v0, $v0, -0x28
    /* 7F1AC 8008F1AC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7F1B0 8008F1B0 C0000285 */  lh         $v0, 0xC0($t0)
    /* 7F1B4 8008F1B4 1000AA8F */  lw         $t2, 0x10($sp)
    /* 7F1B8 8008F1B8 C4000385 */  lh         $v1, 0xC4($t0)
    /* 7F1BC 8008F1BC 21504201 */  addu       $t2, $t2, $v0
    /* 7F1C0 8008F1C0 21104300 */  addu       $v0, $v0, $v1
    /* 7F1C4 8008F1C4 5000A2AF */  sw         $v0, 0x50($sp)
    /* 7F1C8 8008F1C8 2310E500 */  subu       $v0, $a3, $a1
    /* 7F1CC 8008F1CC 0A004104 */  bgez       $v0, .L8008F1F8
    /* 7F1D0 8008F1D0 1000AAAF */   sw        $t2, 0x10($sp)
    /* 7F1D4 8008F1D4 2000A98F */  lw         $t1, 0x20($sp)
    /* 7F1D8 8008F1D8 00000000 */  nop
    /* 7F1DC 8008F1DC FFFF2925 */  addiu      $t1, $t1, -0x1
    /* 7F1E0 8008F1E0 D8FF4A25 */  addiu      $t2, $t2, -0x28
    /* 7F1E4 8008F1E4 1000AAAF */  sw         $t2, 0x10($sp)
    /* 7F1E8 8008F1E8 01000A24 */  addiu      $t2, $zero, 0x1
    /* 7F1EC 8008F1EC 2000A9AF */  sw         $t1, 0x20($sp)
    /* 7F1F0 8008F1F0 7F3C0208 */  j          .L8008F1FC
    /* 7F1F4 8008F1F4 3000AAAF */   sw        $t2, 0x30($sp)
  .L8008F1F8:
    /* 7F1F8 8008F1F8 3000A0AF */  sw         $zero, 0x30($sp)
  .L8008F1FC:
    /* 7F1FC 8008F1FC 1000A98F */  lw         $t1, 0x10($sp)
    /* 7F200 8008F200 5000AA8F */  lw         $t2, 0x50($sp)
    /* 7F204 8008F204 00000000 */  nop
    /* 7F208 8008F208 2A102A01 */  slt        $v0, $t1, $t2
    /* 7F20C 8008F20C B1004010 */  beqz       $v0, .L8008F4D4
    /* 7F210 8008F210 00000000 */   nop
    /* 7F214 8008F214 2000BE8F */  lw         $fp, 0x20($sp)
    /* 7F218 8008F218 2800B78F */  lw         $s7, 0x28($sp)
    /* 7F21C 8008F21C 5800A0AF */  sw         $zero, 0x58($sp)
  .L8008F220:
    /* 7F220 8008F220 2E00E22A */  slti       $v0, $s7, 0x2E
    /* 7F224 8008F224 96004010 */  beqz       $v0, .L8008F480
    /* 7F228 8008F228 2E00C22B */   slti      $v0, $fp, 0x2E
    /* 7F22C 8008F22C 94004010 */  beqz       $v0, .L8008F480
    /* 7F230 8008F230 00000000 */   nop
    /* 7F234 8008F234 5800A98F */  lw         $t1, 0x58($sp)
    /* 7F238 8008F238 00000000 */  nop
    /* 7F23C 8008F23C 01002925 */  addiu      $t1, $t1, 0x1
    /* 7F240 8008F240 0B002229 */  slti       $v0, $t1, 0xB
    /* 7F244 8008F244 8E004010 */  beqz       $v0, .L8008F480
    /* 7F248 8008F248 5800A9AF */   sw        $t1, 0x58($sp)
    /* 7F24C 8008F24C 2E00E22E */  sltiu      $v0, $s7, 0x2E
    /* 7F250 8008F250 88004010 */  beqz       $v0, .L8008F474
    /* 7F254 8008F254 2F00C22F */   sltiu     $v0, $fp, 0x2F
    /* 7F258 8008F258 86004010 */  beqz       $v0, .L8008F474
    /* 7F25C 8008F25C 00000000 */   nop
    /* 7F260 8008F260 3800AA8F */  lw         $t2, 0x38($sp)
    /* 7F264 8008F264 4000A98F */  lw         $t1, 0x40($sp)
    /* 7F268 8008F268 2118CA03 */  addu       $v1, $fp, $t2
    /* 7F26C 8008F26C 40800300 */  sll        $s0, $v1, 1
    /* 7F270 8008F270 21A80002 */  addu       $s5, $s0, $zero
    /* 7F274 8008F274 2120E902 */  addu       $a0, $s7, $t1
    /* 7F278 8008F278 40880400 */  sll        $s1, $a0, 1
    /* 7F27C 8008F27C 21A02002 */  addu       $s4, $s1, $zero
    /* 7F280 8008F280 00190300 */  sll        $v1, $v1, 4
    /* 7F284 8008F284 23187000 */  subu       $v1, $v1, $s0
    /* 7F288 8008F288 C0190300 */  sll        $v1, $v1, 7
    /* 7F28C 8008F28C 00210400 */  sll        $a0, $a0, 4
    /* 7F290 8008F290 0E800A3C */  lui        $t2, %hi(dung_map)
    /* 7F294 8008F294 287A4A25 */  addiu      $t2, $t2, %lo(dung_map)
    /* 7F298 8008F298 21108A00 */  addu       $v0, $a0, $t2
    /* 7F29C 8008F29C 21286200 */  addu       $a1, $v1, $v0
    /* 7F2A0 8008F2A0 80034225 */  addiu      $v0, $t2, 0x380
    /* 7F2A4 8008F2A4 21108200 */  addu       $v0, $a0, $v0
    /* 7F2A8 8008F2A8 21986200 */  addu       $s3, $v1, $v0
    /* 7F2AC 8008F2AC 08004225 */  addiu      $v0, $t2, 0x8
    /* 7F2B0 8008F2B0 21106200 */  addu       $v0, $v1, $v0
    /* 7F2B4 8008F2B4 21B04400 */  addu       $s6, $v0, $a0
    /* 7F2B8 8008F2B8 0E80093C */  lui        $t1, %hi(dung_map + 0x388)
    /* 7F2BC 8008F2BC B07D2925 */  addiu      $t1, $t1, %lo(dung_map + 0x388)
    /* 7F2C0 8008F2C0 21186900 */  addu       $v1, $v1, $t1
    /* 7F2C4 8008F2C4 4800AA8F */  lw         $t2, 0x48($sp)
    /* 7F2C8 8008F2C8 21186400 */  addu       $v1, $v1, $a0
    /* 7F2CC 8008F2CC 3C004011 */  beqz       $t2, .L8008F3C0
    /* 7F2D0 8008F2D0 6000A3AF */   sw        $v1, 0x60($sp)
    /* 7F2D4 8008F2D4 0600A290 */  lbu        $v0, 0x6($a1)
    /* 7F2D8 8008F2D8 00000000 */  nop
    /* 7F2DC 8008F2DC 03004230 */  andi       $v0, $v0, 0x3
    /* 7F2E0 8008F2E0 0A004010 */  beqz       $v0, .L8008F30C
    /* 7F2E4 8008F2E4 80201200 */   sll       $a0, $s2, 2
    /* 7F2E8 8008F2E8 04008424 */  addiu      $a0, $a0, 0x4
    /* 7F2EC 8008F2EC 801F093C */  lui        $t1, (0x1F800000 >> 16)
    /* 7F2F0 8008F2F0 21202401 */  addu       $a0, $t1, $a0
    /* 7F2F4 8008F2F4 21300002 */  addu       $a2, $s0, $zero
    /* 7F2F8 8008F2F8 1800AA8F */  lw         $t2, 0x18($sp)
    /* 7F2FC 8008F2FC 00000000 */  nop
    /* 7F300 8008F300 09F84001 */  jalr       $t2
    /* 7F304 8008F304 21382002 */   addu      $a3, $s1, $zero
    /* 7F308 8008F308 21904202 */  addu       $s2, $s2, $v0
  .L8008F30C:
    /* 7F30C 8008F30C 06006292 */  lbu        $v0, 0x6($s3)
    /* 7F310 8008F310 00000000 */  nop
    /* 7F314 8008F314 03004230 */  andi       $v0, $v0, 0x3
    /* 7F318 8008F318 0B004010 */  beqz       $v0, .L8008F348
    /* 7F31C 8008F31C 80201200 */   sll       $a0, $s2, 2
    /* 7F320 8008F320 04008424 */  addiu      $a0, $a0, 0x4
    /* 7F324 8008F324 801F093C */  lui        $t1, (0x1F800000 >> 16)
    /* 7F328 8008F328 21202401 */  addu       $a0, $t1, $a0
    /* 7F32C 8008F32C 21286002 */  addu       $a1, $s3, $zero
    /* 7F330 8008F330 01000636 */  ori        $a2, $s0, 0x1
    /* 7F334 8008F334 1800AA8F */  lw         $t2, 0x18($sp)
    /* 7F338 8008F338 00000000 */  nop
    /* 7F33C 8008F33C 09F84001 */  jalr       $t2
    /* 7F340 8008F340 21382002 */   addu      $a3, $s1, $zero
    /* 7F344 8008F344 21904202 */  addu       $s2, $s2, $v0
  .L8008F348:
    /* 7F348 8008F348 0600C292 */  lbu        $v0, 0x6($s6)
    /* 7F34C 8008F34C 00000000 */  nop
    /* 7F350 8008F350 03004230 */  andi       $v0, $v0, 0x3
    /* 7F354 8008F354 0B004010 */  beqz       $v0, .L8008F384
    /* 7F358 8008F358 80201200 */   sll       $a0, $s2, 2
    /* 7F35C 8008F35C 04008424 */  addiu      $a0, $a0, 0x4
    /* 7F360 8008F360 801F093C */  lui        $t1, (0x1F800000 >> 16)
    /* 7F364 8008F364 21202401 */  addu       $a0, $t1, $a0
    /* 7F368 8008F368 2128C002 */  addu       $a1, $s6, $zero
    /* 7F36C 8008F36C 21300002 */  addu       $a2, $s0, $zero
    /* 7F370 8008F370 1800AA8F */  lw         $t2, 0x18($sp)
    /* 7F374 8008F374 00000000 */  nop
    /* 7F378 8008F378 09F84001 */  jalr       $t2
    /* 7F37C 8008F37C 01002736 */   ori       $a3, $s1, 0x1
    /* 7F380 8008F380 21904202 */  addu       $s2, $s2, $v0
  .L8008F384:
    /* 7F384 8008F384 6000A98F */  lw         $t1, 0x60($sp)
    /* 7F388 8008F388 00000000 */  nop
    /* 7F38C 8008F38C 06002291 */  lbu        $v0, 0x6($t1)
    /* 7F390 8008F390 00000000 */  nop
    /* 7F394 8008F394 03004230 */  andi       $v0, $v0, 0x3
    /* 7F398 8008F398 36004010 */  beqz       $v0, .L8008F474
    /* 7F39C 8008F39C 80201200 */   sll       $a0, $s2, 2
    /* 7F3A0 8008F3A0 04008424 */  addiu      $a0, $a0, 0x4
    /* 7F3A4 8008F3A4 801F0A3C */  lui        $t2, (0x1F800000 >> 16)
    /* 7F3A8 8008F3A8 21204401 */  addu       $a0, $t2, $a0
    /* 7F3AC 8008F3AC 01000636 */  ori        $a2, $s0, 0x1
    /* 7F3B0 8008F3B0 6000A58F */  lw         $a1, 0x60($sp)
    /* 7F3B4 8008F3B4 1800A98F */  lw         $t1, 0x18($sp)
    /* 7F3B8 8008F3B8 1A3D0208 */  j          .L8008F468
    /* 7F3BC 8008F3BC 01002736 */   ori       $a3, $s1, 0x1
  .L8008F3C0:
    /* 7F3C0 8008F3C0 80201200 */  sll        $a0, $s2, 2
    /* 7F3C4 8008F3C4 04008424 */  addiu      $a0, $a0, 0x4
    /* 7F3C8 8008F3C8 801F0A3C */  lui        $t2, (0x1F800000 >> 16)
    /* 7F3CC 8008F3CC 21204401 */  addu       $a0, $t2, $a0
    /* 7F3D0 8008F3D0 2130A002 */  addu       $a2, $s5, $zero
    /* 7F3D4 8008F3D4 1800A98F */  lw         $t1, 0x18($sp)
    /* 7F3D8 8008F3D8 00000000 */  nop
    /* 7F3DC 8008F3DC 09F82001 */  jalr       $t1
    /* 7F3E0 8008F3E0 21388002 */   addu      $a3, $s4, $zero
    /* 7F3E4 8008F3E4 21904202 */  addu       $s2, $s2, $v0
    /* 7F3E8 8008F3E8 80201200 */  sll        $a0, $s2, 2
    /* 7F3EC 8008F3EC 04008424 */  addiu      $a0, $a0, 0x4
    /* 7F3F0 8008F3F0 801F0A3C */  lui        $t2, (0x1F800000 >> 16)
    /* 7F3F4 8008F3F4 21204401 */  addu       $a0, $t2, $a0
    /* 7F3F8 8008F3F8 21286002 */  addu       $a1, $s3, $zero
    /* 7F3FC 8008F3FC 0100B126 */  addiu      $s1, $s5, 0x1
    /* 7F400 8008F400 21302002 */  addu       $a2, $s1, $zero
    /* 7F404 8008F404 1800A98F */  lw         $t1, 0x18($sp)
    /* 7F408 8008F408 00000000 */  nop
    /* 7F40C 8008F40C 09F82001 */  jalr       $t1
    /* 7F410 8008F410 21388002 */   addu      $a3, $s4, $zero
    /* 7F414 8008F414 21904202 */  addu       $s2, $s2, $v0
    /* 7F418 8008F418 80201200 */  sll        $a0, $s2, 2
    /* 7F41C 8008F41C 04008424 */  addiu      $a0, $a0, 0x4
    /* 7F420 8008F420 801F0A3C */  lui        $t2, (0x1F800000 >> 16)
    /* 7F424 8008F424 21204401 */  addu       $a0, $t2, $a0
    /* 7F428 8008F428 2128C002 */  addu       $a1, $s6, $zero
    /* 7F42C 8008F42C 2130A002 */  addu       $a2, $s5, $zero
    /* 7F430 8008F430 01009026 */  addiu      $s0, $s4, 0x1
    /* 7F434 8008F434 1800A98F */  lw         $t1, 0x18($sp)
    /* 7F438 8008F438 00000000 */  nop
    /* 7F43C 8008F43C 09F82001 */  jalr       $t1
    /* 7F440 8008F440 21380002 */   addu      $a3, $s0, $zero
    /* 7F444 8008F444 21904202 */  addu       $s2, $s2, $v0
    /* 7F448 8008F448 80201200 */  sll        $a0, $s2, 2
    /* 7F44C 8008F44C 04008424 */  addiu      $a0, $a0, 0x4
    /* 7F450 8008F450 801F0A3C */  lui        $t2, (0x1F800000 >> 16)
    /* 7F454 8008F454 21204401 */  addu       $a0, $t2, $a0
    /* 7F458 8008F458 21302002 */  addu       $a2, $s1, $zero
    /* 7F45C 8008F45C 6000A58F */  lw         $a1, 0x60($sp)
    /* 7F460 8008F460 1800A98F */  lw         $t1, 0x18($sp)
    /* 7F464 8008F464 21380002 */  addu       $a3, $s0, $zero
  .L8008F468:
    /* 7F468 8008F468 09F82001 */  jalr       $t1
    /* 7F46C 8008F46C 00000000 */   nop
    /* 7F470 8008F470 21904202 */  addu       $s2, $s2, $v0
  .L8008F474:
    /* 7F474 8008F474 0100DE27 */  addiu      $fp, $fp, 0x1
    /* 7F478 8008F478 883C0208 */  j          .L8008F220
    /* 7F47C 8008F47C 0100F726 */   addiu     $s7, $s7, 0x1
  .L8008F480:
    /* 7F480 8008F480 3000AA8F */  lw         $t2, 0x30($sp)
    /* 7F484 8008F484 00000000 */  nop
    /* 7F488 8008F488 01004231 */  andi       $v0, $t2, 0x1
    /* 7F48C 8008F48C 06004014 */  bnez       $v0, .L8008F4A8
    /* 7F490 8008F490 00000000 */   nop
    /* 7F494 8008F494 2800A98F */  lw         $t1, 0x28($sp)
    /* 7F498 8008F498 00000000 */  nop
    /* 7F49C 8008F49C FFFF2925 */  addiu      $t1, $t1, -0x1
    /* 7F4A0 8008F4A0 2E3D0208 */  j          .L8008F4B8
    /* 7F4A4 8008F4A4 2800A9AF */   sw        $t1, 0x28($sp)
  .L8008F4A8:
    /* 7F4A8 8008F4A8 2000AA8F */  lw         $t2, 0x20($sp)
    /* 7F4AC 8008F4AC 00000000 */  nop
    /* 7F4B0 8008F4B0 01004A25 */  addiu      $t2, $t2, 0x1
    /* 7F4B4 8008F4B4 2000AAAF */  sw         $t2, 0x20($sp)
  .L8008F4B8:
    /* 7F4B8 8008F4B8 1000A98F */  lw         $t1, 0x10($sp)
    /* 7F4BC 8008F4BC 3000AA8F */  lw         $t2, 0x30($sp)
    /* 7F4C0 8008F4C0 28002925 */  addiu      $t1, $t1, 0x28
    /* 7F4C4 8008F4C4 01004A25 */  addiu      $t2, $t2, 0x1
    /* 7F4C8 8008F4C8 1000A9AF */  sw         $t1, 0x10($sp)
    /* 7F4CC 8008F4CC 7F3C0208 */  j          .L8008F1FC
    /* 7F4D0 8008F4D0 3000AAAF */   sw        $t2, 0x30($sp)
  .L8008F4D4:
    /* 7F4D4 8008F4D4 801F013C */  lui        $at, (0x1F800000 >> 16)
    /* 7F4D8 8008F4D8 000032AC */  sw         $s2, (0x1F800000 & 0xFFFF)($at)
    /* 7F4DC 8008F4DC 8C00BF8F */  lw         $ra, 0x8C($sp)
    /* 7F4E0 8008F4E0 8800BE8F */  lw         $fp, 0x88($sp)
    /* 7F4E4 8008F4E4 8400B78F */  lw         $s7, 0x84($sp)
    /* 7F4E8 8008F4E8 8000B68F */  lw         $s6, 0x80($sp)
    /* 7F4EC 8008F4EC 7C00B58F */  lw         $s5, 0x7C($sp)
    /* 7F4F0 8008F4F0 7800B48F */  lw         $s4, 0x78($sp)
    /* 7F4F4 8008F4F4 7400B38F */  lw         $s3, 0x74($sp)
    /* 7F4F8 8008F4F8 7000B28F */  lw         $s2, 0x70($sp)
    /* 7F4FC 8008F4FC 6C00B18F */  lw         $s1, 0x6C($sp)
    /* 7F500 8008F500 6800B08F */  lw         $s0, 0x68($sp)
    /* 7F504 8008F504 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 7F508 8008F508 0800E003 */  jr         $ra
    /* 7F50C 8008F50C 00000000 */   nop
endlabel IterateVisibleMap__7CBlocksiiPFP9CacheInfoP8map_infoii_ib
