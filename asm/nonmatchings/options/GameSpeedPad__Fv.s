.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GameSpeedPad__Fv, 0x128

glabel GameSpeedPad__Fv
    /* 9A1A8 800AA1A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9A1AC 800AA1AC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9A1B0 800AA1B0 21880000 */  addu       $s1, $zero, $zero
    /* 9A1B4 800AA1B4 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9A1B8 800AA1B8 21280000 */  addu       $a1, $zero, $zero
    /* 9A1BC 800AA1BC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9A1C0 800AA1C0 FD25020C */  jal        PAD_GetPad__FiUc
    /* 9A1C4 800AA1C4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 9A1C8 800AA1C8 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9A1CC 800AA1CC 21204000 */   addu      $a0, $v0, $zero
    /* 9A1D0 800AA1D0 EFE6000C */  jal        GetSpeed__Fv
    /* 9A1D4 800AA1D4 FFFF5030 */   andi      $s0, $v0, 0xFFFF
    /* 9A1D8 800AA1D8 55A8020C */  jal        AlterSpeedMenu__F9GM_SPEEDS
    /* 9A1DC 800AA1DC 21204000 */   addu      $a0, $v0, $zero
    /* 9A1E0 800AA1E0 00010232 */  andi       $v0, $s0, 0x100
    /* 9A1E4 800AA1E4 05004010 */  beqz       $v0, .L800AA1FC
    /* 9A1E8 800AA1E8 02000232 */   andi      $v0, $s0, 0x2
    /* 9A1EC 800AA1EC C6F5000C */  jal        PlaySFX__Fi
    /* 9A1F0 800AA1F0 33000424 */   addiu     $a0, $zero, 0x33
    /* 9A1F4 800AA1F4 01001124 */  addiu      $s1, $zero, 0x1
    /* 9A1F8 800AA1F8 02000232 */  andi       $v0, $s0, 0x2
  .L800AA1FC:
    /* 9A1FC 800AA1FC 0D004010 */  beqz       $v0, .L800AA234
    /* 9A200 800AA200 01000232 */   andi      $v0, $s0, 0x1
    /* 9A204 800AA204 C6F5000C */  jal        PlaySFX__Fi
    /* 9A208 800AA208 32000424 */   addiu     $a0, $zero, 0x32
    /* 9A20C 800AA20C B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A210 800AA210 00000000 */  nop
    /* 9A214 800AA214 01004224 */  addiu      $v0, $v0, 0x1
    /* 9A218 800AA218 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A21C 800AA21C 03004228 */  slti       $v0, $v0, 0x3
    /* 9A220 800AA220 04004014 */  bnez       $v0, .L800AA234
    /* 9A224 800AA224 01000232 */   andi      $v0, $s0, 0x1
    /* 9A228 800AA228 01000224 */  addiu      $v0, $zero, 0x1
    /* 9A22C 800AA22C B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A230 800AA230 01000232 */  andi       $v0, $s0, 0x1
  .L800AA234:
    /* 9A234 800AA234 0C004010 */  beqz       $v0, .L800AA268
    /* 9A238 800AA238 40000232 */   andi      $v0, $s0, 0x40
    /* 9A23C 800AA23C C6F5000C */  jal        PlaySFX__Fi
    /* 9A240 800AA240 32000424 */   addiu     $a0, $zero, 0x32
    /* 9A244 800AA244 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A248 800AA248 00000000 */  nop
    /* 9A24C 800AA24C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9A250 800AA250 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A254 800AA254 04004014 */  bnez       $v0, .L800AA268
    /* 9A258 800AA258 40000232 */   andi      $v0, $s0, 0x40
    /* 9A25C 800AA25C 02000224 */  addiu      $v0, $zero, 0x2
    /* 9A260 800AA260 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9A264 800AA264 40000232 */  andi       $v0, $s0, 0x40
  .L800AA268:
    /* 9A268 800AA268 0E004010 */  beqz       $v0, .L800AA2A4
    /* 9A26C 800AA26C 00000000 */   nop
    /* 9A270 800AA270 C6F5000C */  jal        PlaySFX__Fi
    /* 9A274 800AA274 33000424 */   addiu     $a0, $zero, 0x33
    /* 9A278 800AA278 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 9A27C 800AA27C 01000224 */  addiu      $v0, $zero, 0x1
    /* 9A280 800AA280 05006210 */  beq        $v1, $v0, .L800AA298
    /* 9A284 800AA284 02000224 */   addiu     $v0, $zero, 0x2
    /* 9A288 800AA288 04006210 */  beq        $v1, $v0, .L800AA29C
    /* 9A28C 800AA28C 01000424 */   addiu     $a0, $zero, 0x1
    /* 9A290 800AA290 A9A80208 */  j          .L800AA2A4
    /* 9A294 800AA294 00000000 */   nop
  .L800AA298:
    /* 9A298 800AA298 21200000 */  addu       $a0, $zero, $zero
  .L800AA29C:
    /* 9A29C 800AA29C EAE6000C */  jal        SetSpeed__F9GM_SPEEDS
    /* 9A2A0 800AA2A0 00000000 */   nop
  .L800AA2A4:
    /* 9A2A4 800AA2A4 04002012 */  beqz       $s1, .L800AA2B8
    /* 9A2A8 800AA2A8 01000224 */   addiu     $v0, $zero, 0x1
    /* 9A2AC 800AA2AC BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 9A2B0 800AA2B0 0A000224 */  addiu      $v0, $zero, 0xA
    /* 9A2B4 800AA2B4 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800AA2B8:
    /* 9A2B8 800AA2B8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9A2BC 800AA2BC 1400B18F */  lw         $s1, 0x14($sp)
    /* 9A2C0 800AA2C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 9A2C4 800AA2C4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9A2C8 800AA2C8 0800E003 */  jr         $ra
    /* 9A2CC 800AA2CC 00000000 */   nop
endlabel GameSpeedPad__Fv
