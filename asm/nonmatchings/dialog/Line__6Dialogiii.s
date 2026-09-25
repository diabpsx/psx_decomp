.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Line__6Dialogiii, 0x230

glabel Line__6Dialogiii
    /* 7CFF8 8008CFF8 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 7CFFC 8008CFFC 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 7D000 8008D000 2198A000 */  addu       $s3, $a1, $zero
    /* 7D004 8008D004 5000B4AF */  sw         $s4, 0x50($sp)
    /* 7D008 8008D008 21A0C000 */  addu       $s4, $a2, $zero
    /* 7D00C 8008D00C 4800B2AF */  sw         $s2, 0x48($sp)
    /* 7D010 8008D010 6000BFAF */  sw         $ra, 0x60($sp)
    /* 7D014 8008D014 5C00B7AF */  sw         $s7, 0x5C($sp)
    /* 7D018 8008D018 5800B6AF */  sw         $s6, 0x58($sp)
    /* 7D01C 8008D01C 5400B5AF */  sw         $s5, 0x54($sp)
    /* 7D020 8008D020 4400B1AF */  sw         $s1, 0x44($sp)
    /* 7D024 8008D024 4000B0AF */  sw         $s0, 0x40($sp)
    /* 7D028 8008D028 CC1E80A3 */  sb         $zero, %gp_rel(D_8011C64C)($gp)
    /* 7D02C 8008D02C 172F020C */  jal        GetSizes__6Dialog
    /* 7D030 8008D030 2190E000 */   addu      $s2, $a3, $zero
    /* 7D034 8008D034 21A86002 */  addu       $s5, $s3, $zero
    /* 7D038 8008D038 21B08002 */  addu       $s6, $s4, $zero
    /* 7D03C 8008D03C 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7D040 8008D040 12000224 */  addiu      $v0, $zero, 0x12
    /* 7D044 8008D044 CC1E80A3 */  sb         $zero, %gp_rel(D_8011C64C)($gp)
    /* 7D048 8008D048 03008210 */  beq        $a0, $v0, .L8008D058
    /* 7D04C 8008D04C 21B84002 */   addu      $s7, $s2, $zero
    /* 7D050 8008D050 02000224 */  addiu      $v0, $zero, 0x2
    /* 7D054 8008D054 CC1E82A3 */  sb         $v0, %gp_rel(D_8011C64C)($gp)
  .L8008D058:
    /* 7D058 8008D058 B804878F */  lw         $a3, %gp_rel(DialogBorderTW)($gp)
    /* 7D05C 8008D05C 01000624 */  addiu      $a2, $zero, 0x1
    /* 7D060 8008D060 CD1E86A3 */  sb         $a2, %gp_rel(D_8011C64D)($gp)
    /* 7D064 8008D064 CE1E86A3 */  sb         $a2, %gp_rel(D_8011C64E)($gp)
    /* 7D068 8008D068 2A104702 */  slt        $v0, $s2, $a3
    /* 7D06C 8008D06C 51004014 */  bnez       $v0, .L8008D1B4
    /* 7D070 8008D070 C21F1200 */   srl       $v1, $s2, 31
    /* 7D074 8008D074 21184302 */  addu       $v1, $s2, $v1
    /* 7D078 8008D078 43180300 */  sra        $v1, $v1, 1
    /* 7D07C 8008D07C C2170700 */  srl        $v0, $a3, 31
    /* 7D080 8008D080 2110E200 */  addu       $v0, $a3, $v0
    /* 7D084 8008D084 43100200 */  sra        $v0, $v0, 1
    /* 7D088 8008D088 23886200 */  subu       $s1, $v1, $v0
    /* 7D08C 8008D08C 1A002702 */  div        $zero, $s1, $a3
    /* 7D090 8008D090 10800000 */  mfhi       $s0
    /* 7D094 8008D094 CD1E86A3 */  sb         $a2, %gp_rel(D_8011C64D)($gp)
    /* 7D098 8008D098 0D00001A */  blez       $s0, .L8008D0D0
    /* 7D09C 8008D09C 01008424 */   addiu     $a0, $a0, 0x1
    /* 7D0A0 8008D0A0 21286002 */  addu       $a1, $s3, $zero
    /* 7D0A4 8008D0A4 BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7D0A8 8008D0A8 21380002 */  addu       $a3, $s0, $zero
    /* 7D0AC 8008D0AC CE1E86A3 */  sb         $a2, %gp_rel(D_8011C64E)($gp)
    /* 7D0B0 8008D0B0 1400B0AF */  sw         $s0, 0x14($sp)
    /* 7D0B4 8008D0B4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7D0B8 8008D0B8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7D0BC 8008D0BC 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7D0C0 8008D0C0 23308202 */  subu       $a2, $s4, $v0
    /* 7D0C4 8008D0C4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7D0C8 8008D0C8 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7D0CC 8008D0CC 1800A2AF */   sw        $v0, 0x18($sp)
  .L8008D0D0:
    /* 7D0D0 8008D0D0 CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7D0D4 8008D0D4 B804838F */  lw         $v1, %gp_rel(DialogBorderTW)($gp)
    /* 7D0D8 8008D0D8 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D0DC 8008D0DC CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7D0E0 8008D0E0 2A107200 */  slt        $v0, $v1, $s2
    /* 7D0E4 8008D0E4 24004010 */  beqz       $v0, .L8008D178
    /* 7D0E8 8008D0E8 21880002 */   addu      $s1, $s0, $zero
    /* 7D0EC 8008D0EC 23105002 */  subu       $v0, $s2, $s0
    /* 7D0F0 8008D0F0 1A004300 */  div        $zero, $v0, $v1
    /* 7D0F4 8008D0F4 12280000 */  mflo       $a1
    /* 7D0F8 8008D0F8 00000000 */  nop
    /* 7D0FC 8008D0FC 1E00A018 */  blez       $a1, .L8008D178
    /* 7D100 8008D100 21800000 */   addu      $s0, $zero, $zero
    /* 7D104 8008D104 21980000 */  addu       $s3, $zero, $zero
    /* 7D108 8008D108 21904000 */  addu       $s2, $v0, $zero
  .L8008D10C:
    /* 7D10C 8008D10C 2128B102 */  addu       $a1, $s5, $s1
    /* 7D110 8008D110 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7D114 8008D114 01000224 */  addiu      $v0, $zero, 0x1
    /* 7D118 8008D118 CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7D11C 8008D11C BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7D120 8008D120 21386000 */  addu       $a3, $v1, $zero
    /* 7D124 8008D124 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7D128 8008D128 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7D12C 8008D12C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7D130 8008D130 2400B3AF */  sw         $s3, 0x24($sp)
    /* 7D134 8008D134 01008424 */  addiu      $a0, $a0, 0x1
    /* 7D138 8008D138 2330C202 */  subu       $a2, $s6, $v0
    /* 7D13C 8008D13C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7D140 8008D140 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7D144 8008D144 1800A2AF */   sw        $v0, 0x18($sp)
    /* 7D148 8008D148 B804838F */  lw         $v1, %gp_rel(DialogBorderTW)($gp)
    /* 7D14C 8008D14C 00000000 */  nop
    /* 7D150 8008D150 1A004302 */  div        $zero, $s2, $v1
    /* 7D154 8008D154 12280000 */  mflo       $a1
    /* 7D158 8008D158 01001026 */  addiu      $s0, $s0, 0x1
    /* 7D15C 8008D15C CD1E8293 */  lbu        $v0, %gp_rel(D_8011C64D)($gp)
    /* 7D160 8008D160 00000000 */  nop
    /* 7D164 8008D164 01004224 */  addiu      $v0, $v0, 0x1
    /* 7D168 8008D168 CD1E82A3 */  sb         $v0, %gp_rel(D_8011C64D)($gp)
    /* 7D16C 8008D16C 2A100502 */  slt        $v0, $s0, $a1
    /* 7D170 8008D170 E6FF4014 */  bnez       $v0, .L8008D10C
    /* 7D174 8008D174 21882302 */   addu      $s1, $s1, $v1
  .L8008D178:
    /* 7D178 8008D178 2380F102 */  subu       $s0, $s7, $s1
    /* 7D17C 8008D17C 1E00001A */  blez       $s0, .L8008D1F8
    /* 7D180 8008D180 2128B102 */   addu      $a1, $s5, $s1
    /* 7D184 8008D184 9404848F */  lw         $a0, %gp_rel(DialogBorderGfx)($gp)
    /* 7D188 8008D188 01000224 */  addiu      $v0, $zero, 0x1
    /* 7D18C 8008D18C CE1E82A3 */  sb         $v0, %gp_rel(D_8011C64E)($gp)
    /* 7D190 8008D190 BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7D194 8008D194 21380002 */  addu       $a3, $s0, $zero
    /* 7D198 8008D198 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7D19C 8008D19C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7D1A0 8008D1A0 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7D1A4 8008D1A4 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7D1A8 8008D1A8 01008424 */  addiu      $a0, $a0, 0x1
    /* 7D1AC 8008D1AC 7B340208 */  j          .L8008D1EC
    /* 7D1B0 8008D1B0 2330C202 */   subu      $a2, $s6, $v0
  .L8008D1B4:
    /* 7D1B4 8008D1B4 1A004702 */  div        $zero, $s2, $a3
    /* 7D1B8 8008D1B8 10800000 */  mfhi       $s0
    /* 7D1BC 8008D1BC CD1E86A3 */  sb         $a2, %gp_rel(D_8011C64D)($gp)
    /* 7D1C0 8008D1C0 0D00001A */  blez       $s0, .L8008D1F8
    /* 7D1C4 8008D1C4 01008424 */   addiu     $a0, $a0, 0x1
    /* 7D1C8 8008D1C8 21286002 */  addu       $a1, $s3, $zero
    /* 7D1CC 8008D1CC BC04828F */  lw         $v0, %gp_rel(DialogBorderTH)($gp)
    /* 7D1D0 8008D1D0 21380002 */  addu       $a3, $s0, $zero
    /* 7D1D4 8008D1D4 CE1E86A3 */  sb         $a2, %gp_rel(D_8011C64E)($gp)
    /* 7D1D8 8008D1D8 1400A7AF */  sw         $a3, 0x14($sp)
    /* 7D1DC 8008D1DC 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 7D1E0 8008D1E0 2000A0AF */  sw         $zero, 0x20($sp)
    /* 7D1E4 8008D1E4 2400A0AF */  sw         $zero, 0x24($sp)
    /* 7D1E8 8008D1E8 23308202 */  subu       $a2, $s4, $v0
  .L8008D1EC:
    /* 7D1EC 8008D1EC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7D1F0 8008D1F0 722B020C */  jal        DialogPrint__Fiiiiiiiiii
    /* 7D1F4 8008D1F4 1800A2AF */   sw        $v0, 0x18($sp)
  .L8008D1F8:
    /* 7D1F8 8008D1F8 6000BF8F */  lw         $ra, 0x60($sp)
    /* 7D1FC 8008D1FC 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 7D200 8008D200 5800B68F */  lw         $s6, 0x58($sp)
    /* 7D204 8008D204 5400B58F */  lw         $s5, 0x54($sp)
    /* 7D208 8008D208 5000B48F */  lw         $s4, 0x50($sp)
    /* 7D20C 8008D20C 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 7D210 8008D210 4800B28F */  lw         $s2, 0x48($sp)
    /* 7D214 8008D214 4400B18F */  lw         $s1, 0x44($sp)
    /* 7D218 8008D218 4000B08F */  lw         $s0, 0x40($sp)
    /* 7D21C 8008D21C 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 7D220 8008D220 0800E003 */  jr         $ra
    /* 7D224 8008D224 00000000 */   nop
endlabel Line__6Dialogiii
