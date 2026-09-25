.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching particlejump__Fii, 0x1D0

glabel particlejump__Fii
    /* 8F0DC 8009F0DC B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 8F0E0 8009F0E0 4800BEAF */  sw         $fp, 0x48($sp)
    /* 8F0E4 8009F0E4 21F00000 */  addu       $fp, $zero, $zero
    /* 8F0E8 8009F0E8 4400B7AF */  sw         $s7, 0x44($sp)
    /* 8F0EC 8009F0EC 21B80000 */  addu       $s7, $zero, $zero
    /* 8F0F0 8009F0F0 2800B0AF */  sw         $s0, 0x28($sp)
    /* 8F0F4 8009F0F4 1280103C */  lui        $s0, %hi(D_8011CE08)
    /* 8F0F8 8009F0F8 08CE1026 */  addiu      $s0, $s0, %lo(D_8011CE08)
    /* 8F0FC 8009F0FC 4000B6AF */  sw         $s6, 0x40($sp)
    /* 8F100 8009F100 14001626 */  addiu      $s6, $s0, 0x14
    /* 8F104 8009F104 3000B2AF */  sw         $s2, 0x30($sp)
    /* 8F108 8009F108 FCFF1226 */  addiu      $s2, $s0, -0x4
    /* 8F10C 8009F10C 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 8F110 8009F110 F8FF1126 */  addiu      $s1, $s0, -0x8
    /* 8F114 8009F114 3800B4AF */  sw         $s4, 0x38($sp)
    /* 8F118 8009F118 08001426 */  addiu      $s4, $s0, 0x8
    /* 8F11C 8009F11C 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 8F120 8009F120 04001526 */  addiu      $s5, $s0, 0x4
    /* 8F124 8009F124 3400B3AF */  sw         $s3, 0x34($sp)
    /* 8F128 8009F128 21980000 */  addu       $s3, $zero, $zero
    /* 8F12C 8009F12C 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 8F130 8009F130 1800A4AF */  sw         $a0, 0x18($sp)
    /* 8F134 8009F134 2000A5AF */  sw         $a1, 0x20($sp)
  .L8009F138:
    /* 8F138 8009F138 0000A28E */  lw         $v0, 0x0($s5)
    /* 8F13C 8009F13C 00000000 */  nop
    /* 8F140 8009F140 40004010 */  beqz       $v0, .L8009F244
    /* 8F144 8009F144 00000000 */   nop
    /* 8F148 8009F148 0000838E */  lw         $v1, 0x0($s4)
    /* 8F14C 8009F14C 1280013C */  lui        $at, %hi(D_8011CE14)
    /* 8F150 8009F150 21083300 */  addu       $at, $at, $s3
    /* 8F154 8009F154 14CE228C */  lw         $v0, %lo(D_8011CE14)($at)
    /* 8F158 8009F158 00000000 */  nop
    /* 8F15C 8009F15C 2A104300 */  slt        $v0, $v0, $v1
    /* 8F160 8009F160 0D004010 */  beqz       $v0, .L8009F198
    /* 8F164 8009F164 00000000 */   nop
    /* 8F168 8009F168 0000A0AE */  sw         $zero, 0x0($s5)
    /* 8F16C 8009F16C 02002486 */  lh         $a0, 0x2($s1)
    /* 8F170 8009F170 1800A88F */  lw         $t0, 0x18($sp)
    /* 8F174 8009F174 0000458E */  lw         $a1, 0x0($s2)
    /* 8F178 8009F178 0000C68E */  lw         $a2, 0x0($s6)
    /* 8F17C 8009F17C 0000078E */  lw         $a3, 0x0($s0)
    /* 8F180 8009F180 7809828F */  lw         $v0, %gp_rel(D_8011B0F8)($gp)
    /* 8F184 8009F184 581F838F */  lw         $v1, %gp_rel(D_8011C6D8)($gp)
    /* 8F188 8009F188 21200401 */  addu       $a0, $t0, $a0
    /* 8F18C 8009F18C 2000A88F */  lw         $t0, 0x20($sp)
    /* 8F190 8009F190 8E7C0208 */  j          .L8009F238
    /* 8F194 8009F194 1000A2AF */   sw        $v0, 0x10($sp)
  .L8009F198:
    /* 8F198 8009F198 7C09828F */  lw         $v0, %gp_rel(D_8011B0FC)($gp)
    /* 8F19C 8009F19C 00000000 */  nop
    /* 8F1A0 8009F1A0 1A004014 */  bnez       $v0, .L8009F20C
    /* 8F1A4 8009F1A4 00000000 */   nop
    /* 8F1A8 8009F1A8 0000228E */  lw         $v0, 0x0($s1)
    /* 8F1AC 8009F1AC 1280013C */  lui        $at, %hi(D_8011CE18)
    /* 8F1B0 8009F1B0 21083300 */  addu       $at, $at, $s3
    /* 8F1B4 8009F1B4 18CE238C */  lw         $v1, %lo(D_8011CE18)($at)
    /* 8F1B8 8009F1B8 00000000 */  nop
    /* 8F1BC 8009F1BC 21104300 */  addu       $v0, $v0, $v1
    /* 8F1C0 8009F1C0 000022AE */  sw         $v0, 0x0($s1)
    /* 8F1C4 8009F1C4 0000028E */  lw         $v0, 0x0($s0)
    /* 8F1C8 8009F1C8 00000000 */  nop
    /* 8F1CC 8009F1CC 01004224 */  addiu      $v0, $v0, 0x1
    /* 8F1D0 8009F1D0 1280013C */  lui        $at, %hi(D_8011CE08)
    /* 8F1D4 8009F1D4 21083300 */  addu       $at, $at, $s3
    /* 8F1D8 8009F1D8 08CE22AC */  sw         $v0, %lo(D_8011CE08)($at)
    /* 8F1DC 8009F1DC 0000028E */  lw         $v0, 0x0($s0)
    /* 8F1E0 8009F1E0 00000000 */  nop
    /* 8F1E4 8009F1E4 07004230 */  andi       $v0, $v0, 0x7
    /* 8F1E8 8009F1E8 000002AE */  sw         $v0, 0x0($s0)
    /* 8F1EC 8009F1EC 0000828E */  lw         $v0, 0x0($s4)
    /* 8F1F0 8009F1F0 00000000 */  nop
    /* 8F1F4 8009F1F4 02004224 */  addiu      $v0, $v0, 0x2
    /* 8F1F8 8009F1F8 000082AE */  sw         $v0, 0x0($s4)
    /* 8F1FC 8009F1FC 0000438E */  lw         $v1, 0x0($s2)
    /* 8F200 8009F200 83100200 */  sra        $v0, $v0, 2
    /* 8F204 8009F204 21186200 */  addu       $v1, $v1, $v0
    /* 8F208 8009F208 000043AE */  sw         $v1, 0x0($s2)
  .L8009F20C:
    /* 8F20C 8009F20C 02002486 */  lh         $a0, 0x2($s1)
    /* 8F210 8009F210 1800A88F */  lw         $t0, 0x18($sp)
    /* 8F214 8009F214 0000458E */  lw         $a1, 0x0($s2)
    /* 8F218 8009F218 0000C68E */  lw         $a2, 0x0($s6)
    /* 8F21C 8009F21C 0000078E */  lw         $a3, 0x0($s0)
    /* 8F220 8009F220 7809828F */  lw         $v0, %gp_rel(D_8011B0F8)($gp)
    /* 8F224 8009F224 581F838F */  lw         $v1, %gp_rel(D_8011C6D8)($gp)
    /* 8F228 8009F228 21200401 */  addu       $a0, $t0, $a0
    /* 8F22C 8009F22C 2000A88F */  lw         $t0, 0x20($sp)
    /* 8F230 8009F230 01001E24 */  addiu      $fp, $zero, 0x1
    /* 8F234 8009F234 1000A2AF */  sw         $v0, 0x10($sp)
  .L8009F238:
    /* 8F238 8009F238 1400A3AF */  sw         $v1, 0x14($sp)
    /* 8F23C 8009F23C F87A020C */  jal        drawparticle__Fiiiiii
    /* 8F240 8009F240 21280501 */   addu      $a1, $t0, $a1
  .L8009F244:
    /* 8F244 8009F244 24001026 */  addiu      $s0, $s0, 0x24
    /* 8F248 8009F248 2400D626 */  addiu      $s6, $s6, 0x24
    /* 8F24C 8009F24C 24005226 */  addiu      $s2, $s2, 0x24
    /* 8F250 8009F250 24003126 */  addiu      $s1, $s1, 0x24
    /* 8F254 8009F254 24009426 */  addiu      $s4, $s4, 0x24
    /* 8F258 8009F258 2400B526 */  addiu      $s5, $s5, 0x24
    /* 8F25C 8009F25C 0100F726 */  addiu      $s7, $s7, 0x1
    /* 8F260 8009F260 1000E22A */  slti       $v0, $s7, 0x10
    /* 8F264 8009F264 B4FF4014 */  bnez       $v0, .L8009F138
    /* 8F268 8009F268 24007326 */   addiu     $s3, $s3, 0x24
    /* 8F26C 8009F26C 0200C017 */  bnez       $fp, .L8009F278
    /* 8F270 8009F270 00000000 */   nop
    /* 8F274 8009F274 700980AF */  sw         $zero, %gp_rel(D_8011B0F0)($gp)
  .L8009F278:
    /* 8F278 8009F278 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 8F27C 8009F27C 4800BE8F */  lw         $fp, 0x48($sp)
    /* 8F280 8009F280 4400B78F */  lw         $s7, 0x44($sp)
    /* 8F284 8009F284 4000B68F */  lw         $s6, 0x40($sp)
    /* 8F288 8009F288 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 8F28C 8009F28C 3800B48F */  lw         $s4, 0x38($sp)
    /* 8F290 8009F290 3400B38F */  lw         $s3, 0x34($sp)
    /* 8F294 8009F294 3000B28F */  lw         $s2, 0x30($sp)
    /* 8F298 8009F298 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 8F29C 8009F29C 2800B08F */  lw         $s0, 0x28($sp)
    /* 8F2A0 8009F2A0 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 8F2A4 8009F2A4 0800E003 */  jr         $ra
    /* 8F2A8 8009F2A8 00000000 */   nop
endlabel particlejump__Fii
