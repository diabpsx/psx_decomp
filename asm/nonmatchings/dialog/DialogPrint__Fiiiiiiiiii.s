.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DialogPrint__Fiiiiiiiiii, 0x980

glabel DialogPrint__Fiiiiiiiiii
    /* 7ADC8 8008ADC8 60FFBD27 */  addiu      $sp, $sp, -0xA0
    /* 7ADCC 8008ADCC 8800B4AF */  sw         $s4, 0x88($sp)
    /* 7ADD0 8008ADD0 B000B48F */  lw         $s4, 0xB0($sp)
    /* 7ADD4 8008ADD4 7800B0AF */  sw         $s0, 0x78($sp)
    /* 7ADD8 8008ADD8 2180A000 */  addu       $s0, $a1, $zero
    /* 7ADDC 8008ADDC 8000B2AF */  sw         $s2, 0x80($sp)
    /* 7ADE0 8008ADE0 2190C000 */  addu       $s2, $a2, $zero
    /* 7ADE4 8008ADE4 8400B3AF */  sw         $s3, 0x84($sp)
    /* 7ADE8 8008ADE8 2198E000 */  addu       $s3, $a3, $zero
    /* 7ADEC 8008ADEC 7C00B1AF */  sw         $s1, 0x7C($sp)
    /* 7ADF0 8008ADF0 21880000 */  addu       $s1, $zero, $zero
    /* 7ADF4 8008ADF4 9000B6AF */  sw         $s6, 0x90($sp)
    /* 7ADF8 8008ADF8 BC00B68F */  lw         $s6, 0xBC($sp)
    /* 7ADFC 8008ADFC FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 7AE00 8008AE00 9800BEAF */  sw         $fp, 0x98($sp)
    /* 7AE04 8008AE04 C000BE8F */  lw         $fp, 0xC0($sp)
    /* 7AE08 8008AE08 CC1E8293 */  lbu        $v0, %gp_rel(D_8011C64C)($gp)
    /* 7AE0C 8008AE0C 02000324 */  addiu      $v1, $zero, 0x2
    /* 7AE10 8008AE10 9C00BFAF */  sw         $ra, 0x9C($sp)
    /* 7AE14 8008AE14 9400B7AF */  sw         $s7, 0x94($sp)
    /* 7AE18 8008AE18 8C00B5AF */  sw         $s5, 0x8C($sp)
    /* 7AE1C 8008AE1C 2F004314 */  bne        $v0, $v1, .L8008AEDC
    /* 7AE20 8008AE20 1000A4AF */   sw        $a0, 0x10($sp)
    /* 7AE24 8008AE24 CE1E8383 */  lb         $v1, %gp_rel(D_8011C64E)($gp)
    /* 7AE28 8008AE28 00000000 */  nop
    /* 7AE2C 8008AE2C 02006104 */  bgez       $v1, .L8008AE38
    /* 7AE30 8008AE30 21106000 */   addu      $v0, $v1, $zero
    /* 7AE34 8008AE34 07006224 */  addiu      $v0, $v1, 0x7
  .L8008AE38:
    /* 7AE38 8008AE38 C3100200 */  sra        $v0, $v0, 3
    /* 7AE3C 8008AE3C C0100200 */  sll        $v0, $v0, 3
    /* 7AE40 8008AE40 23106200 */  subu       $v0, $v1, $v0
    /* 7AE44 8008AE44 00160200 */  sll        $v0, $v0, 24
    /* 7AE48 8008AE48 03160200 */  sra        $v0, $v0, 24
    /* 7AE4C 8008AE4C CD1E8483 */  lb         $a0, %gp_rel(D_8011C64D)($gp)
    /* 7AE50 8008AE50 1280013C */  lui        $at, %hi(D_8011C654)
    /* 7AE54 8008AE54 21082200 */  addu       $at, $at, $v0
    /* 7AE58 8008AE58 54C62390 */  lbu        $v1, %lo(D_8011C654)($at)
    /* 7AE5C 8008AE5C 02008104 */  bgez       $a0, .L8008AE68
    /* 7AE60 8008AE60 21288000 */   addu      $a1, $a0, $zero
    /* 7AE64 8008AE64 07008524 */  addiu      $a1, $a0, 0x7
  .L8008AE68:
    /* 7AE68 8008AE68 C3100500 */  sra        $v0, $a1, 3
    /* 7AE6C 8008AE6C C0100200 */  sll        $v0, $v0, 3
    /* 7AE70 8008AE70 23108200 */  subu       $v0, $a0, $v0
    /* 7AE74 8008AE74 07104300 */  srav       $v0, $v1, $v0
    /* 7AE78 8008AE78 01004230 */  andi       $v0, $v0, 0x1
    /* 7AE7C 8008AE7C 17004010 */  beqz       $v0, .L8008AEDC
    /* 7AE80 8008AE80 07000224 */   addiu     $v0, $zero, 0x7
    /* 7AE84 8008AE84 1000AA8F */  lw         $t2, 0x10($sp)
    /* 7AE88 8008AE88 00000000 */  nop
    /* 7AE8C 8008AE8C 04004215 */  bne        $t2, $v0, .L8008AEA0
    /* 7AE90 8008AE90 0C000224 */   addiu     $v0, $zero, 0xC
    /* 7AE94 8008AE94 0E000A24 */  addiu      $t2, $zero, 0xE
    /* 7AE98 8008AE98 1000AAAF */  sw         $t2, 0x10($sp)
    /* 7AE9C 8008AE9C 1000AA8F */  lw         $t2, 0x10($sp)
  .L8008AEA0:
    /* 7AEA0 8008AEA0 00000000 */  nop
    /* 7AEA4 8008AEA4 02004215 */  bne        $t2, $v0, .L8008AEB0
    /* 7AEA8 8008AEA8 11000A24 */   addiu     $t2, $zero, 0x11
    /* 7AEAC 8008AEAC 1000AAAF */  sw         $t2, 0x10($sp)
  .L8008AEB0:
    /* 7AEB0 8008AEB0 1000AA8F */  lw         $t2, 0x10($sp)
    /* 7AEB4 8008AEB4 0A000224 */  addiu      $v0, $zero, 0xA
    /* 7AEB8 8008AEB8 04004215 */  bne        $t2, $v0, .L8008AECC
    /* 7AEBC 8008AEBC 09000224 */   addiu     $v0, $zero, 0x9
    /* 7AEC0 8008AEC0 10000A24 */  addiu      $t2, $zero, 0x10
    /* 7AEC4 8008AEC4 1000AAAF */  sw         $t2, 0x10($sp)
    /* 7AEC8 8008AEC8 1000AA8F */  lw         $t2, 0x10($sp)
  .L8008AECC:
    /* 7AECC 8008AECC 00000000 */  nop
    /* 7AED0 8008AED0 02004215 */  bne        $t2, $v0, .L8008AEDC
    /* 7AED4 8008AED4 0F000A24 */   addiu     $t2, $zero, 0xF
    /* 7AED8 8008AED8 1000AAAF */  sw         $t2, 0x10($sp)
  .L8008AEDC:
    /* 7AEDC 8008AEDC 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7AEE0 8008AEE0 1000A58F */  lw         $a1, 0x10($sp)
    /* 7AEE4 8008AEE4 9634020C */  jal        GetFr__7TextDati_8008d258
    /* 7AEE8 8008AEE8 00000000 */   nop
    /* 7AEEC 8008AEEC 2000A2AF */  sw         $v0, 0x20($sp)
    /* 7AEF0 8008AEF0 0800448C */  lw         $a0, 0x8($v0)
    /* 7AEF4 8008AEF4 04004280 */  lb         $v0, 0x4($v0)
    /* 7AEF8 8008AEF8 2000AA8F */  lw         $t2, 0x20($sp)
    /* 7AEFC 8008AEFC 422A0400 */  srl        $a1, $a0, 9
    /* 7AF00 8008AF00 FF01A530 */  andi       $a1, $a1, 0x1FF
    /* 7AF04 8008AF04 21800202 */  addu       $s0, $s0, $v0
    /* 7AF08 8008AF08 FF018430 */  andi       $a0, $a0, 0x1FF
    /* 7AF0C 8008AF0C 05004381 */  lb         $v1, 0x5($t2)
    /* 7AF10 8008AF10 01004691 */  lbu        $a2, 0x1($t2)
    /* 7AF14 8008AF14 2000AA8F */  lw         $t2, 0x20($sp)
    /* 7AF18 8008AF18 21904302 */  addu       $s2, $s2, $v1
    /* 7AF1C 8008AF1C 1800AAAF */  sw         $t2, 0x18($sp)
    /* 7AF20 8008AF20 0400428D */  lw         $v0, 0x4($t2)
    /* 7AF24 8008AF24 0002033C */  lui        $v1, (0x2000000 >> 16)
    /* 7AF28 8008AF28 24104300 */  and        $v0, $v0, $v1
    /* 7AF2C 8008AF2C 00004391 */  lbu        $v1, 0x0($t2)
    /* 7AF30 8008AF30 1A004014 */  bnez       $v0, .L8008AF9C
    /* 7AF34 8008AF34 2138C000 */   addu      $a3, $a2, $zero
    /* 7AF38 8008AF38 2800B0AF */  sw         $s0, 0x28($sp)
    /* 7AF3C 8008AF3C 21981302 */  addu       $s3, $s0, $s3
    /* 7AF40 8008AF40 4800B2AF */  sw         $s2, 0x48($sp)
    /* 7AF44 8008AF44 21906000 */  addu       $s2, $v1, $zero
    /* 7AF48 8008AF48 21A8C000 */  addu       $s5, $a2, $zero
    /* 7AF4C 8008AF4C 4800AA8F */  lw         $t2, 0x48($sp)
    /* 7AF50 8008AF50 21104402 */  addu       $v0, $s2, $a0
    /* 7AF54 8008AF54 3000B3AF */  sw         $s3, 0x30($sp)
    /* 7AF58 8008AF58 5000AAAF */  sw         $t2, 0x50($sp)
    /* 7AF5C 8008AF5C 2800AA8F */  lw         $t2, 0x28($sp)
    /* 7AF60 8008AF60 21985600 */  addu       $s3, $v0, $s6
    /* 7AF64 8008AF64 3800AAAF */  sw         $t2, 0x38($sp)
    /* 7AF68 8008AF68 5000AA8F */  lw         $t2, 0x50($sp)
    /* 7AF6C 8008AF6C 21B84002 */  addu       $s7, $s2, $zero
    /* 7AF70 8008AF70 21A05401 */  addu       $s4, $t2, $s4
    /* 7AF74 8008AF74 5800B4AF */  sw         $s4, 0x58($sp)
    /* 7AF78 8008AF78 21A0A002 */  addu       $s4, $s5, $zero
    /* 7AF7C 8008AF7C 21108502 */  addu       $v0, $s4, $a1
    /* 7AF80 8008AF80 3000AA8F */  lw         $t2, 0x30($sp)
    /* 7AF84 8008AF84 21B05E00 */  addu       $s6, $v0, $fp
    /* 7AF88 8008AF88 4000AAAF */  sw         $t2, 0x40($sp)
    /* 7AF8C 8008AF8C 5800AA8F */  lw         $t2, 0x58($sp)
    /* 7AF90 8008AF90 21F06002 */  addu       $fp, $s3, $zero
    /* 7AF94 8008AF94 022C0208 */  j          .L8008B008
    /* 7AF98 8008AF98 6800B6AF */   sw        $s6, 0x68($sp)
  .L8008AF9C:
    /* 7AF9C 8008AF9C FFFF0A26 */  addiu      $t2, $s0, -0x1
    /* 7AFA0 8008AFA0 21101302 */  addu       $v0, $s0, $s3
    /* 7AFA4 8008AFA4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 7AFA8 8008AFA8 4800B2AF */  sw         $s2, 0x48($sp)
    /* 7AFAC 8008AFAC 21906000 */  addu       $s2, $v1, $zero
    /* 7AFB0 8008AFB0 2118E400 */  addu       $v1, $a3, $a0
    /* 7AFB4 8008AFB4 3000A2AF */  sw         $v0, 0x30($sp)
    /* 7AFB8 8008AFB8 FFFFC226 */  addiu      $v0, $s6, -0x1
    /* 7AFBC 8008AFBC 21A86200 */  addu       $s5, $v1, $v0
    /* 7AFC0 8008AFC0 21984002 */  addu       $s3, $s2, $zero
    /* 7AFC4 8008AFC4 2800AAAF */  sw         $t2, 0x28($sp)
    /* 7AFC8 8008AFC8 4800AA8F */  lw         $t2, 0x48($sp)
    /* 7AFCC 8008AFCC 21106502 */  addu       $v0, $s3, $a1
    /* 7AFD0 8008AFD0 5000AAAF */  sw         $t2, 0x50($sp)
    /* 7AFD4 8008AFD4 2800AA8F */  lw         $t2, 0x28($sp)
    /* 7AFD8 8008AFD8 21B85E00 */  addu       $s7, $v0, $fp
    /* 7AFDC 8008AFDC 3800AAAF */  sw         $t2, 0x38($sp)
    /* 7AFE0 8008AFE0 5000AA8F */  lw         $t2, 0x50($sp)
    /* 7AFE4 8008AFE4 21B0A002 */  addu       $s6, $s5, $zero
    /* 7AFE8 8008AFE8 21A05401 */  addu       $s4, $t2, $s4
    /* 7AFEC 8008AFEC 3000AA8F */  lw         $t2, 0x30($sp)
    /* 7AFF0 8008AFF0 21F0E002 */  addu       $fp, $s7, $zero
    /* 7AFF4 8008AFF4 5800B4AF */  sw         $s4, 0x58($sp)
    /* 7AFF8 8008AFF8 4000AAAF */  sw         $t2, 0x40($sp)
    /* 7AFFC 8008AFFC 5800AA8F */  lw         $t2, 0x58($sp)
    /* 7B000 8008B000 21A0E000 */  addu       $s4, $a3, $zero
    /* 7B004 8008B004 6800B4AF */  sw         $s4, 0x68($sp)
  .L8008B008:
    /* 7B008 8008B008 6000AAAF */  sw         $t2, 0x60($sp)
    /* 7B00C 8008B00C CC1E8293 */  lbu        $v0, %gp_rel(D_8011C64C)($gp)
    /* 7B010 8008B010 00000000 */  nop
    /* 7B014 8008B014 85004014 */  bnez       $v0, .L8008B22C
    /* 7B018 8008B018 00000000 */   nop
    /* 7B01C 8008B01C 8F0F020C */  jal        PRIM_GetNextPolyFt4__Fv
    /* 7B020 8008B020 00000000 */   nop
    /* 7B024 8008B024 21804000 */  addu       $s0, $v0, $zero
    /* 7B028 8008B028 0C0052A0 */  sb         $s2, 0xC($v0)
    /* 7B02C 8008B02C 0D0015A2 */  sb         $s5, 0xD($s0)
    /* 7B030 8008B030 140013A2 */  sb         $s3, 0x14($s0)
    /* 7B034 8008B034 150014A2 */  sb         $s4, 0x15($s0)
    /* 7B038 8008B038 1C0017A2 */  sb         $s7, 0x1C($s0)
    /* 7B03C 8008B03C 1D0016A2 */  sb         $s6, 0x1D($s0)
    /* 7B040 8008B040 24001EA2 */  sb         $fp, 0x24($s0)
    /* 7B044 8008B044 6800AA93 */  lbu        $t2, 0x68($sp)
    /* 7B048 8008B048 00000000 */  nop
    /* 7B04C 8008B04C 25000AA2 */  sb         $t2, 0x25($s0)
    /* 7B050 8008B050 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7B054 8008B054 2800AA97 */  lhu        $t2, 0x28($sp)
    /* 7B058 8008B058 00000000 */  nop
    /* 7B05C 8008B05C 08000AA6 */  sh         $t2, 0x8($s0)
    /* 7B060 8008B060 4800AA97 */  lhu        $t2, 0x48($sp)
    /* 7B064 8008B064 00000000 */  nop
    /* 7B068 8008B068 0A000AA6 */  sh         $t2, 0xA($s0)
    /* 7B06C 8008B06C 3000AA97 */  lhu        $t2, 0x30($sp)
    /* 7B070 8008B070 00000000 */  nop
    /* 7B074 8008B074 10000AA6 */  sh         $t2, 0x10($s0)
    /* 7B078 8008B078 5000AA97 */  lhu        $t2, 0x50($sp)
    /* 7B07C 8008B07C 00000000 */  nop
    /* 7B080 8008B080 12000AA6 */  sh         $t2, 0x12($s0)
    /* 7B084 8008B084 3800AA97 */  lhu        $t2, 0x38($sp)
    /* 7B088 8008B088 00000000 */  nop
    /* 7B08C 8008B08C 18000AA6 */  sh         $t2, 0x18($s0)
    /* 7B090 8008B090 5800AA97 */  lhu        $t2, 0x58($sp)
    /* 7B094 8008B094 00000000 */  nop
    /* 7B098 8008B098 1A000AA6 */  sh         $t2, 0x1A($s0)
    /* 7B09C 8008B09C 4000AA97 */  lhu        $t2, 0x40($sp)
    /* 7B0A0 8008B0A0 00000000 */  nop
    /* 7B0A4 8008B0A4 20000AA6 */  sh         $t2, 0x20($s0)
    /* 7B0A8 8008B0A8 6000AA97 */  lhu        $t2, 0x60($sp)
    /* 7B0AC 8008B0AC 00000000 */  nop
    /* 7B0B0 8008B0B0 22000AA6 */  sh         $t2, 0x22($s0)
    /* 7B0B4 8008B0B4 1800AA8F */  lw         $t2, 0x18($sp)
    /* 7B0B8 8008B0B8 00000000 */  nop
    /* 7B0BC 8008B0BC 06004591 */  lbu        $a1, 0x6($t2)
    /* 7B0C0 8008B0C0 8F34020C */  jal        GetPal__7TextDati_8008d23c
    /* 7B0C4 8008B0C4 00000000 */   nop
    /* 7B0C8 8008B0C8 21184000 */  addu       $v1, $v0, $zero
    /* 7B0CC 8008B0CC 0000628C */  lw         $v0, 0x0($v1)
    /* 7B0D0 8008B0D0 00000000 */  nop
    /* 7B0D4 8008B0D4 01004230 */  andi       $v0, $v0, 0x1
    /* 7B0D8 8008B0D8 04004010 */  beqz       $v0, .L8008B0EC
    /* 7B0DC 8008B0DC 00000000 */   nop
    /* 7B0E0 8008B0E0 02006294 */  lhu        $v0, 0x2($v1)
    /* 7B0E4 8008B0E4 432C0208 */  j          .L8008B10C
    /* 7B0E8 8008B0E8 0E0002A6 */   sh        $v0, 0xE($s0)
  .L8008B0EC:
    /* 7B0EC 8008B0EC 1180023C */  lui        $v0, %hi(D_801104EC)
    /* 7B0F0 8008B0F0 EC044224 */  addiu      $v0, $v0, %lo(D_801104EC)
    /* 7B0F4 8008B0F4 05004010 */  beqz       $v0, .L8008B10C
    /* 7B0F8 8008B0F8 21200000 */   addu      $a0, $zero, $zero
    /* 7B0FC 8008B0FC 1180053C */  lui        $a1, %hi(D_801104FC)
    /* 7B100 8008B100 FC04A524 */  addiu      $a1, $a1, %lo(D_801104FC)
    /* 7B104 8008B104 A583000C */  jal        DBG_Error
    /* 7B108 8008B108 3A010624 */   addiu     $a2, $zero, 0x13A
  .L8008B10C:
    /* 7B10C 8008B10C 09000224 */  addiu      $v0, $zero, 0x9
    /* 7B110 8008B110 030002A2 */  sb         $v0, 0x3($s0)
    /* 7B114 8008B114 2C000224 */  addiu      $v0, $zero, 0x2C
    /* 7B118 8008B118 070002A2 */  sb         $v0, 0x7($s0)
    /* 7B11C 8008B11C C400AA8F */  lw         $t2, 0xC4($sp)
    /* 7B120 8008B120 00000000 */  nop
    /* 7B124 8008B124 02004011 */  beqz       $t2, .L8008B130
    /* 7B128 8008B128 2E000224 */   addiu     $v0, $zero, 0x2E
    /* 7B12C 8008B12C 070002A2 */  sb         $v0, 0x7($s0)
  .L8008B130:
    /* 7B130 8008B130 07000292 */  lbu        $v0, 0x7($s0)
    /* 7B134 8008B134 00000000 */  nop
    /* 7B138 8008B138 FE004230 */  andi       $v0, $v0, 0xFE
    /* 7B13C 8008B13C 070002A2 */  sb         $v0, 0x7($s0)
    /* 7B140 8008B140 1000AA8F */  lw         $t2, 0x10($sp)
    /* 7B144 8008B144 94000224 */  addiu      $v0, $zero, 0x94
    /* 7B148 8008B148 19004215 */  bne        $t2, $v0, .L8008B1B0
    /* 7B14C 8008B14C 00000000 */   nop
    /* 7B150 8008B150 80048293 */  lbu        $v0, %gp_rel(DialogTRed)($gp)
    /* 7B154 8008B154 0C000392 */  lbu        $v1, 0xC($s0)
    /* 7B158 8008B158 040002A2 */  sb         $v0, 0x4($s0)
    /* 7B15C 8008B15C 81048293 */  lbu        $v0, %gp_rel(DialogTGreen)($gp)
    /* 7B160 8008B160 00000000 */  nop
    /* 7B164 8008B164 050002A2 */  sb         $v0, 0x5($s0)
    /* 7B168 8008B168 82048493 */  lbu        $a0, %gp_rel(DialogTBlue)($gp)
    /* 7B16C 8008B16C 0C000292 */  lbu        $v0, 0xC($s0)
    /* 7B170 8008B170 01006324 */  addiu      $v1, $v1, 0x1
    /* 7B174 8008B174 240003A2 */  sb         $v1, 0x24($s0)
    /* 7B178 8008B178 0D000392 */  lbu        $v1, 0xD($s0)
    /* 7B17C 8008B17C 01004224 */  addiu      $v0, $v0, 0x1
    /* 7B180 8008B180 140002A2 */  sb         $v0, 0x14($s0)
    /* 7B184 8008B184 0D000292 */  lbu        $v0, 0xD($s0)
    /* 7B188 8008B188 01006324 */  addiu      $v1, $v1, 0x1
    /* 7B18C 8008B18C 250003A2 */  sb         $v1, 0x25($s0)
    /* 7B190 8008B190 060004A2 */  sb         $a0, 0x6($s0)
    /* 7B194 8008B194 01004224 */  addiu      $v0, $v0, 0x1
    /* 7B198 8008B198 1D0002A2 */  sb         $v0, 0x1D($s0)
    /* 7B19C 8008B19C 2000AA8F */  lw         $t2, 0x20($sp)
    /* 7B1A0 8008B1A0 00000000 */  nop
    /* 7B1A4 8008B1A4 02004295 */  lhu        $v0, 0x2($t2)
    /* 7B1A8 8008B1A8 782C0208 */  j          .L8008B1E0
    /* 7B1AC 8008B1AC 40004234 */   ori       $v0, $v0, 0x40
  .L8008B1B0:
    /* 7B1B0 8008B1B0 7D048293 */  lbu        $v0, %gp_rel(DialogRed)($gp)
    /* 7B1B4 8008B1B4 00000000 */  nop
    /* 7B1B8 8008B1B8 040002A2 */  sb         $v0, 0x4($s0)
    /* 7B1BC 8008B1BC 7E048293 */  lbu        $v0, %gp_rel(DialogGreen)($gp)
    /* 7B1C0 8008B1C0 00000000 */  nop
    /* 7B1C4 8008B1C4 050002A2 */  sb         $v0, 0x5($s0)
    /* 7B1C8 8008B1C8 7F048293 */  lbu        $v0, %gp_rel(DialogBlue)($gp)
    /* 7B1CC 8008B1CC 00000000 */  nop
    /* 7B1D0 8008B1D0 060002A2 */  sb         $v0, 0x6($s0)
    /* 7B1D4 8008B1D4 2000AA8F */  lw         $t2, 0x20($sp)
    /* 7B1D8 8008B1D8 00000000 */  nop
    /* 7B1DC 8008B1DC 02004295 */  lhu        $v0, 0x2($t2)
  .L8008B1E0:
    /* 7B1E0 8008B1E0 00000000 */  nop
    /* 7B1E4 8008B1E4 160002A6 */  sh         $v0, 0x16($s0)
    /* 7B1E8 8008B1E8 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 7B1EC 8008B1EC FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 7B1F0 8008B1F0 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 7B1F4 8008B1F4 0000048E */  lw         $a0, 0x0($s0)
    /* 7B1F8 8008B1F8 F404838F */  lw         $v1, %gp_rel(MY_DialogOTpos)($gp)
    /* 7B1FC 8008B1FC 1280023C */  lui        $v0, %hi(ThisOt)
    /* 7B200 8008B200 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 7B204 8008B204 80180300 */  sll        $v1, $v1, 2
    /* 7B208 8008B208 21186200 */  addu       $v1, $v1, $v0
    /* 7B20C 8008B20C 0000628C */  lw         $v0, 0x0($v1)
    /* 7B210 8008B210 24208600 */  and        $a0, $a0, $a2
    /* 7B214 8008B214 24104500 */  and        $v0, $v0, $a1
    /* 7B218 8008B218 25208200 */  or         $a0, $a0, $v0
    /* 7B21C 8008B21C 000004AE */  sw         $a0, 0x0($s0)
    /* 7B220 8008B220 0000628C */  lw         $v0, 0x0($v1)
    /* 7B224 8008B224 C12D0208 */  j          .L8008B704
    /* 7B228 8008B228 24280502 */   and       $a1, $s0, $a1
  .L8008B22C:
    /* 7B22C 8008B22C 950F020C */  jal        PRIM_GetNextPolyGt4__Fv
    /* 7B230 8008B230 00000000 */   nop
    /* 7B234 8008B234 21884000 */  addu       $s1, $v0, $zero
    /* 7B238 8008B238 0C0052A0 */  sb         $s2, 0xC($v0)
    /* 7B23C 8008B23C 0D0035A2 */  sb         $s5, 0xD($s1)
    /* 7B240 8008B240 180033A2 */  sb         $s3, 0x18($s1)
    /* 7B244 8008B244 190034A2 */  sb         $s4, 0x19($s1)
    /* 7B248 8008B248 240037A2 */  sb         $s7, 0x24($s1)
    /* 7B24C 8008B24C 250036A2 */  sb         $s6, 0x25($s1)
    /* 7B250 8008B250 30003EA2 */  sb         $fp, 0x30($s1)
    /* 7B254 8008B254 6800AA93 */  lbu        $t2, 0x68($sp)
    /* 7B258 8008B258 00000000 */  nop
    /* 7B25C 8008B25C 31002AA2 */  sb         $t2, 0x31($s1)
    /* 7B260 8008B260 8404848F */  lw         $a0, %gp_rel(DialogTData)($gp)
    /* 7B264 8008B264 2800AA97 */  lhu        $t2, 0x28($sp)
    /* 7B268 8008B268 00000000 */  nop
    /* 7B26C 8008B26C 08002AA6 */  sh         $t2, 0x8($s1)
    /* 7B270 8008B270 4800AA97 */  lhu        $t2, 0x48($sp)
    /* 7B274 8008B274 00000000 */  nop
    /* 7B278 8008B278 0A002AA6 */  sh         $t2, 0xA($s1)
    /* 7B27C 8008B27C 3000AA97 */  lhu        $t2, 0x30($sp)
    /* 7B280 8008B280 00000000 */  nop
    /* 7B284 8008B284 14002AA6 */  sh         $t2, 0x14($s1)
    /* 7B288 8008B288 5000AA97 */  lhu        $t2, 0x50($sp)
    /* 7B28C 8008B28C 00000000 */  nop
    /* 7B290 8008B290 16002AA6 */  sh         $t2, 0x16($s1)
    /* 7B294 8008B294 3800AA97 */  lhu        $t2, 0x38($sp)
    /* 7B298 8008B298 00000000 */  nop
    /* 7B29C 8008B29C 20002AA6 */  sh         $t2, 0x20($s1)
    /* 7B2A0 8008B2A0 5800AA97 */  lhu        $t2, 0x58($sp)
    /* 7B2A4 8008B2A4 00000000 */  nop
    /* 7B2A8 8008B2A8 22002AA6 */  sh         $t2, 0x22($s1)
    /* 7B2AC 8008B2AC 4000AA97 */  lhu        $t2, 0x40($sp)
    /* 7B2B0 8008B2B0 00000000 */  nop
    /* 7B2B4 8008B2B4 2C002AA6 */  sh         $t2, 0x2C($s1)
    /* 7B2B8 8008B2B8 6000AA97 */  lhu        $t2, 0x60($sp)
    /* 7B2BC 8008B2BC 00000000 */  nop
    /* 7B2C0 8008B2C0 2E002AA6 */  sh         $t2, 0x2E($s1)
    /* 7B2C4 8008B2C4 1800AA8F */  lw         $t2, 0x18($sp)
    /* 7B2C8 8008B2C8 00000000 */  nop
    /* 7B2CC 8008B2CC 06004591 */  lbu        $a1, 0x6($t2)
    /* 7B2D0 8008B2D0 8F34020C */  jal        GetPal__7TextDati_8008d23c
    /* 7B2D4 8008B2D4 00000000 */   nop
    /* 7B2D8 8008B2D8 21184000 */  addu       $v1, $v0, $zero
    /* 7B2DC 8008B2DC 0000628C */  lw         $v0, 0x0($v1)
    /* 7B2E0 8008B2E0 00000000 */  nop
    /* 7B2E4 8008B2E4 01004230 */  andi       $v0, $v0, 0x1
    /* 7B2E8 8008B2E8 04004010 */  beqz       $v0, .L8008B2FC
    /* 7B2EC 8008B2EC 00000000 */   nop
    /* 7B2F0 8008B2F0 02006294 */  lhu        $v0, 0x2($v1)
    /* 7B2F4 8008B2F4 C72C0208 */  j          .L8008B31C
    /* 7B2F8 8008B2F8 0E0022A6 */   sh        $v0, 0xE($s1)
  .L8008B2FC:
    /* 7B2FC 8008B2FC 1180023C */  lui        $v0, %hi(D_801104EC)
    /* 7B300 8008B300 EC044224 */  addiu      $v0, $v0, %lo(D_801104EC)
    /* 7B304 8008B304 05004010 */  beqz       $v0, .L8008B31C
    /* 7B308 8008B308 21200000 */   addu      $a0, $zero, $zero
    /* 7B30C 8008B30C 1180053C */  lui        $a1, %hi(D_801104FC)
    /* 7B310 8008B310 FC04A524 */  addiu      $a1, $a1, %lo(D_801104FC)
    /* 7B314 8008B314 A583000C */  jal        DBG_Error
    /* 7B318 8008B318 61010624 */   addiu     $a2, $zero, 0x161
  .L8008B31C:
    /* 7B31C 8008B31C 0C000224 */  addiu      $v0, $zero, 0xC
    /* 7B320 8008B320 030022A2 */  sb         $v0, 0x3($s1)
    /* 7B324 8008B324 3C000224 */  addiu      $v0, $zero, 0x3C
    /* 7B328 8008B328 070022A2 */  sb         $v0, 0x7($s1)
    /* 7B32C 8008B32C C400AA8F */  lw         $t2, 0xC4($sp)
    /* 7B330 8008B330 00000000 */  nop
    /* 7B334 8008B334 03004011 */  beqz       $t2, .L8008B344
    /* 7B338 8008B338 00000000 */   nop
    /* 7B33C 8008B33C 3E000224 */  addiu      $v0, $zero, 0x3E
    /* 7B340 8008B340 070022A2 */  sb         $v0, 0x7($s1)
  .L8008B344:
    /* 7B344 8008B344 07002292 */  lbu        $v0, 0x7($s1)
    /* 7B348 8008B348 00000000 */  nop
    /* 7B34C 8008B34C FE004230 */  andi       $v0, $v0, 0xFE
    /* 7B350 8008B350 070022A2 */  sb         $v0, 0x7($s1)
    /* 7B354 8008B354 CD1E8383 */  lb         $v1, %gp_rel(D_8011C64D)($gp)
    /* 7B358 8008B358 00000000 */  nop
    /* 7B35C 8008B35C 02006104 */  bgez       $v1, .L8008B368
    /* 7B360 8008B360 21106000 */   addu      $v0, $v1, $zero
    /* 7B364 8008B364 07006224 */  addiu      $v0, $v1, 0x7
  .L8008B368:
    /* 7B368 8008B368 CE1E8583 */  lb         $a1, %gp_rel(D_8011C64E)($gp)
    /* 7B36C 8008B36C C3100200 */  sra        $v0, $v0, 3
    /* 7B370 8008B370 C0100200 */  sll        $v0, $v0, 3
    /* 7B374 8008B374 23106200 */  subu       $v0, $v1, $v0
    /* 7B378 8008B378 00160200 */  sll        $v0, $v0, 24
    /* 7B37C 8008B37C 03460200 */  sra        $t0, $v0, 24
    /* 7B380 8008B380 0200A104 */  bgez       $a1, .L8008B38C
    /* 7B384 8008B384 2120A000 */   addu      $a0, $a1, $zero
    /* 7B388 8008B388 0700A424 */  addiu      $a0, $a1, 0x7
  .L8008B38C:
    /* 7B38C 8008B38C 0100A624 */  addiu      $a2, $a1, 0x1
    /* 7B390 8008B390 2138C000 */  addu       $a3, $a2, $zero
    /* 7B394 8008B394 C3100400 */  sra        $v0, $a0, 3
    /* 7B398 8008B398 C0100200 */  sll        $v0, $v0, 3
    /* 7B39C 8008B39C 2310A200 */  subu       $v0, $a1, $v0
    /* 7B3A0 8008B3A0 00160200 */  sll        $v0, $v0, 24
    /* 7B3A4 8008B3A4 43150200 */  sra        $v0, $v0, 21
    /* 7B3A8 8008B3A8 21104800 */  addu       $v0, $v0, $t0
    /* 7B3AC 8008B3AC 0C80043C */  lui        $a0, %hi(D_800B8AD0)
    /* 7B3B0 8008B3B0 D08A8424 */  addiu      $a0, $a0, %lo(D_800B8AD0)
    /* 7B3B4 8008B3B4 01008924 */  addiu      $t1, $a0, 0x1
    /* 7B3B8 8008B3B8 0C80013C */  lui        $at, %hi(D_800B8AD0)
    /* 7B3BC 8008B3BC 21082200 */  addu       $at, $at, $v0
    /* 7B3C0 8008B3C0 D08A2390 */  lbu        $v1, %lo(D_800B8AD0)($at)
    /* 7B3C4 8008B3C4 21104900 */  addu       $v0, $v0, $t1
    /* 7B3C8 8008B3C8 00004290 */  lbu        $v0, 0x0($v0)
    /* 7B3CC 8008B3CC 001E0300 */  sll        $v1, $v1, 24
    /* 7B3D0 8008B3D0 03860300 */  sra        $s0, $v1, 24
    /* 7B3D4 8008B3D4 00160200 */  sll        $v0, $v0, 24
    /* 7B3D8 8008B3D8 0200C104 */  bgez       $a2, .L8008B3E4
    /* 7B3DC 8008B3DC 03960200 */   sra       $s2, $v0, 24
    /* 7B3E0 8008B3E0 0800A724 */  addiu      $a3, $a1, 0x8
  .L8008B3E4:
    /* 7B3E4 8008B3E4 C3100700 */  sra        $v0, $a3, 3
    /* 7B3E8 8008B3E8 C0100200 */  sll        $v0, $v0, 3
    /* 7B3EC 8008B3EC 2310C200 */  subu       $v0, $a2, $v0
    /* 7B3F0 8008B3F0 C0100200 */  sll        $v0, $v0, 3
    /* 7B3F4 8008B3F4 21104800 */  addu       $v0, $v0, $t0
    /* 7B3F8 8008B3F8 21184400 */  addu       $v1, $v0, $a0
    /* 7B3FC 8008B3FC 21104900 */  addu       $v0, $v0, $t1
    /* 7B400 8008B400 00006390 */  lbu        $v1, 0x0($v1)
    /* 7B404 8008B404 00004290 */  lbu        $v0, 0x0($v0)
    /* 7B408 8008B408 001E0300 */  sll        $v1, $v1, 24
    /* 7B40C 8008B40C 039E0300 */  sra        $s3, $v1, 24
    /* 7B410 8008B410 00160200 */  sll        $v0, $v0, 24
    /* 7B414 8008B414 03A60200 */  sra        $s4, $v0, 24
    /* 7B418 8008B418 CC1E8393 */  lbu        $v1, %gp_rel(D_8011C64C)($gp)
    /* 7B41C 8008B41C 02000224 */  addiu      $v0, $zero, 0x2
    /* 7B420 8008B420 51006214 */  bne        $v1, $v0, .L8008B568
    /* 7B424 8008B424 00000000 */   nop
    /* 7B428 8008B428 7D048493 */  lbu        $a0, %gp_rel(DialogRed)($gp)
    /* 7B42C 8008B42C 00000000 */  nop
    /* 7B430 8008B430 23209000 */  subu       $a0, $a0, $s0
    /* 7B434 8008B434 00240400 */  sll        $a0, $a0, 16
    /* 7B438 8008B438 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B43C 8008B43C 03240400 */   sra       $a0, $a0, 16
    /* 7B440 8008B440 040022A2 */  sb         $v0, 0x4($s1)
    /* 7B444 8008B444 7E048493 */  lbu        $a0, %gp_rel(DialogGreen)($gp)
    /* 7B448 8008B448 00000000 */  nop
    /* 7B44C 8008B44C 23209000 */  subu       $a0, $a0, $s0
    /* 7B450 8008B450 00240400 */  sll        $a0, $a0, 16
    /* 7B454 8008B454 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B458 8008B458 03240400 */   sra       $a0, $a0, 16
    /* 7B45C 8008B45C 050022A2 */  sb         $v0, 0x5($s1)
    /* 7B460 8008B460 7F048493 */  lbu        $a0, %gp_rel(DialogBlue)($gp)
    /* 7B464 8008B464 00000000 */  nop
    /* 7B468 8008B468 23209000 */  subu       $a0, $a0, $s0
    /* 7B46C 8008B46C 00240400 */  sll        $a0, $a0, 16
    /* 7B470 8008B470 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B474 8008B474 03240400 */   sra       $a0, $a0, 16
    /* 7B478 8008B478 060022A2 */  sb         $v0, 0x6($s1)
    /* 7B47C 8008B47C 7D048493 */  lbu        $a0, %gp_rel(DialogRed)($gp)
    /* 7B480 8008B480 00000000 */  nop
    /* 7B484 8008B484 23209200 */  subu       $a0, $a0, $s2
    /* 7B488 8008B488 00240400 */  sll        $a0, $a0, 16
    /* 7B48C 8008B48C 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B490 8008B490 03240400 */   sra       $a0, $a0, 16
    /* 7B494 8008B494 100022A2 */  sb         $v0, 0x10($s1)
    /* 7B498 8008B498 7E048493 */  lbu        $a0, %gp_rel(DialogGreen)($gp)
    /* 7B49C 8008B49C 00000000 */  nop
    /* 7B4A0 8008B4A0 23209200 */  subu       $a0, $a0, $s2
    /* 7B4A4 8008B4A4 00240400 */  sll        $a0, $a0, 16
    /* 7B4A8 8008B4A8 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B4AC 8008B4AC 03240400 */   sra       $a0, $a0, 16
    /* 7B4B0 8008B4B0 110022A2 */  sb         $v0, 0x11($s1)
    /* 7B4B4 8008B4B4 7F048493 */  lbu        $a0, %gp_rel(DialogBlue)($gp)
    /* 7B4B8 8008B4B8 00000000 */  nop
    /* 7B4BC 8008B4BC 23209200 */  subu       $a0, $a0, $s2
    /* 7B4C0 8008B4C0 00240400 */  sll        $a0, $a0, 16
    /* 7B4C4 8008B4C4 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B4C8 8008B4C8 03240400 */   sra       $a0, $a0, 16
    /* 7B4CC 8008B4CC 120022A2 */  sb         $v0, 0x12($s1)
    /* 7B4D0 8008B4D0 7D048493 */  lbu        $a0, %gp_rel(DialogRed)($gp)
    /* 7B4D4 8008B4D4 00000000 */  nop
    /* 7B4D8 8008B4D8 23209300 */  subu       $a0, $a0, $s3
    /* 7B4DC 8008B4DC 00240400 */  sll        $a0, $a0, 16
    /* 7B4E0 8008B4E0 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B4E4 8008B4E4 03240400 */   sra       $a0, $a0, 16
    /* 7B4E8 8008B4E8 1C0022A2 */  sb         $v0, 0x1C($s1)
    /* 7B4EC 8008B4EC 7E048493 */  lbu        $a0, %gp_rel(DialogGreen)($gp)
    /* 7B4F0 8008B4F0 00000000 */  nop
    /* 7B4F4 8008B4F4 23209300 */  subu       $a0, $a0, $s3
    /* 7B4F8 8008B4F8 00240400 */  sll        $a0, $a0, 16
    /* 7B4FC 8008B4FC 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B500 8008B500 03240400 */   sra       $a0, $a0, 16
    /* 7B504 8008B504 1D0022A2 */  sb         $v0, 0x1D($s1)
    /* 7B508 8008B508 7F048493 */  lbu        $a0, %gp_rel(DialogBlue)($gp)
    /* 7B50C 8008B50C 00000000 */  nop
    /* 7B510 8008B510 23209300 */  subu       $a0, $a0, $s3
    /* 7B514 8008B514 00240400 */  sll        $a0, $a0, 16
    /* 7B518 8008B518 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B51C 8008B51C 03240400 */   sra       $a0, $a0, 16
    /* 7B520 8008B520 1E0022A2 */  sb         $v0, 0x1E($s1)
    /* 7B524 8008B524 7D048493 */  lbu        $a0, %gp_rel(DialogRed)($gp)
    /* 7B528 8008B528 00000000 */  nop
    /* 7B52C 8008B52C 23209400 */  subu       $a0, $a0, $s4
    /* 7B530 8008B530 00240400 */  sll        $a0, $a0, 16
    /* 7B534 8008B534 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B538 8008B538 03240400 */   sra       $a0, $a0, 16
    /* 7B53C 8008B53C 280022A2 */  sb         $v0, 0x28($s1)
    /* 7B540 8008B540 7E048493 */  lbu        $a0, %gp_rel(DialogGreen)($gp)
    /* 7B544 8008B544 00000000 */  nop
    /* 7B548 8008B548 23209400 */  subu       $a0, $a0, $s4
    /* 7B54C 8008B54C 00240400 */  sll        $a0, $a0, 16
    /* 7B550 8008B550 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B554 8008B554 03240400 */   sra       $a0, $a0, 16
    /* 7B558 8008B558 290022A2 */  sb         $v0, 0x29($s1)
    /* 7B55C 8008B55C 7F048493 */  lbu        $a0, %gp_rel(DialogBlue)($gp)
    /* 7B560 8008B560 AA2D0208 */  j          .L8008B6A8
    /* 7B564 8008B564 23209400 */   subu      $a0, $a0, $s4
  .L8008B568:
    /* 7B568 8008B568 7A048493 */  lbu        $a0, %gp_rel(BACKR)($gp)
    /* 7B56C 8008B56C 00000000 */  nop
    /* 7B570 8008B570 21209000 */  addu       $a0, $a0, $s0
    /* 7B574 8008B574 00240400 */  sll        $a0, $a0, 16
    /* 7B578 8008B578 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B57C 8008B57C 03240400 */   sra       $a0, $a0, 16
    /* 7B580 8008B580 040022A2 */  sb         $v0, 0x4($s1)
    /* 7B584 8008B584 7B048493 */  lbu        $a0, %gp_rel(BACKG)($gp)
    /* 7B588 8008B588 00000000 */  nop
    /* 7B58C 8008B58C 21209000 */  addu       $a0, $a0, $s0
    /* 7B590 8008B590 00240400 */  sll        $a0, $a0, 16
    /* 7B594 8008B594 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B598 8008B598 03240400 */   sra       $a0, $a0, 16
    /* 7B59C 8008B59C 050022A2 */  sb         $v0, 0x5($s1)
    /* 7B5A0 8008B5A0 7C048493 */  lbu        $a0, %gp_rel(BACKB)($gp)
    /* 7B5A4 8008B5A4 00000000 */  nop
    /* 7B5A8 8008B5A8 21209000 */  addu       $a0, $a0, $s0
    /* 7B5AC 8008B5AC 00240400 */  sll        $a0, $a0, 16
    /* 7B5B0 8008B5B0 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B5B4 8008B5B4 03240400 */   sra       $a0, $a0, 16
    /* 7B5B8 8008B5B8 060022A2 */  sb         $v0, 0x6($s1)
    /* 7B5BC 8008B5BC 7A048493 */  lbu        $a0, %gp_rel(BACKR)($gp)
    /* 7B5C0 8008B5C0 00000000 */  nop
    /* 7B5C4 8008B5C4 21209200 */  addu       $a0, $a0, $s2
    /* 7B5C8 8008B5C8 00240400 */  sll        $a0, $a0, 16
    /* 7B5CC 8008B5CC 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B5D0 8008B5D0 03240400 */   sra       $a0, $a0, 16
    /* 7B5D4 8008B5D4 100022A2 */  sb         $v0, 0x10($s1)
    /* 7B5D8 8008B5D8 7B048493 */  lbu        $a0, %gp_rel(BACKG)($gp)
    /* 7B5DC 8008B5DC 00000000 */  nop
    /* 7B5E0 8008B5E0 21209200 */  addu       $a0, $a0, $s2
    /* 7B5E4 8008B5E4 00240400 */  sll        $a0, $a0, 16
    /* 7B5E8 8008B5E8 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B5EC 8008B5EC 03240400 */   sra       $a0, $a0, 16
    /* 7B5F0 8008B5F0 110022A2 */  sb         $v0, 0x11($s1)
    /* 7B5F4 8008B5F4 7C048493 */  lbu        $a0, %gp_rel(BACKB)($gp)
    /* 7B5F8 8008B5F8 00000000 */  nop
    /* 7B5FC 8008B5FC 21209200 */  addu       $a0, $a0, $s2
    /* 7B600 8008B600 00240400 */  sll        $a0, $a0, 16
    /* 7B604 8008B604 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B608 8008B608 03240400 */   sra       $a0, $a0, 16
    /* 7B60C 8008B60C 120022A2 */  sb         $v0, 0x12($s1)
    /* 7B610 8008B610 7A048493 */  lbu        $a0, %gp_rel(BACKR)($gp)
    /* 7B614 8008B614 00000000 */  nop
    /* 7B618 8008B618 21209300 */  addu       $a0, $a0, $s3
    /* 7B61C 8008B61C 00240400 */  sll        $a0, $a0, 16
    /* 7B620 8008B620 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B624 8008B624 03240400 */   sra       $a0, $a0, 16
    /* 7B628 8008B628 1C0022A2 */  sb         $v0, 0x1C($s1)
    /* 7B62C 8008B62C 7B048493 */  lbu        $a0, %gp_rel(BACKG)($gp)
    /* 7B630 8008B630 00000000 */  nop
    /* 7B634 8008B634 21209300 */  addu       $a0, $a0, $s3
    /* 7B638 8008B638 00240400 */  sll        $a0, $a0, 16
    /* 7B63C 8008B63C 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B640 8008B640 03240400 */   sra       $a0, $a0, 16
    /* 7B644 8008B644 1D0022A2 */  sb         $v0, 0x1D($s1)
    /* 7B648 8008B648 7C048493 */  lbu        $a0, %gp_rel(BACKB)($gp)
    /* 7B64C 8008B64C 00000000 */  nop
    /* 7B650 8008B650 21209300 */  addu       $a0, $a0, $s3
    /* 7B654 8008B654 00240400 */  sll        $a0, $a0, 16
    /* 7B658 8008B658 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B65C 8008B65C 03240400 */   sra       $a0, $a0, 16
    /* 7B660 8008B660 1E0022A2 */  sb         $v0, 0x1E($s1)
    /* 7B664 8008B664 7A048493 */  lbu        $a0, %gp_rel(BACKR)($gp)
    /* 7B668 8008B668 00000000 */  nop
    /* 7B66C 8008B66C 21209400 */  addu       $a0, $a0, $s4
    /* 7B670 8008B670 00240400 */  sll        $a0, $a0, 16
    /* 7B674 8008B674 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B678 8008B678 03240400 */   sra       $a0, $a0, 16
    /* 7B67C 8008B67C 280022A2 */  sb         $v0, 0x28($s1)
    /* 7B680 8008B680 7B048493 */  lbu        $a0, %gp_rel(BACKG)($gp)
    /* 7B684 8008B684 00000000 */  nop
    /* 7B688 8008B688 21209400 */  addu       $a0, $a0, $s4
    /* 7B68C 8008B68C 00240400 */  sll        $a0, $a0, 16
    /* 7B690 8008B690 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B694 8008B694 03240400 */   sra       $a0, $a0, 16
    /* 7B698 8008B698 290022A2 */  sb         $v0, 0x29($s1)
    /* 7B69C 8008B69C 7C048493 */  lbu        $a0, %gp_rel(BACKB)($gp)
    /* 7B6A0 8008B6A0 00000000 */  nop
    /* 7B6A4 8008B6A4 21209400 */  addu       $a0, $a0, $s4
  .L8008B6A8:
    /* 7B6A8 8008B6A8 00240400 */  sll        $a0, $a0, 16
    /* 7B6AC 8008B6AC 642B020C */  jal        TrimCol__Fs_8008ad90
    /* 7B6B0 8008B6B0 03240400 */   sra       $a0, $a0, 16
    /* 7B6B4 8008B6B4 2A0022A2 */  sb         $v0, 0x2A($s1)
    /* 7B6B8 8008B6B8 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 7B6BC 8008B6BC FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 7B6C0 8008B6C0 0000248E */  lw         $a0, 0x0($s1)
    /* 7B6C4 8008B6C4 2000AA8F */  lw         $t2, 0x20($sp)
    /* 7B6C8 8008B6C8 F404838F */  lw         $v1, %gp_rel(MY_DialogOTpos)($gp)
    /* 7B6CC 8008B6CC 02004295 */  lhu        $v0, 0x2($t2)
    /* 7B6D0 8008B6D0 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 7B6D4 8008B6D4 1A0022A6 */  sh         $v0, 0x1A($s1)
    /* 7B6D8 8008B6D8 1280023C */  lui        $v0, %hi(ThisOt)
    /* 7B6DC 8008B6DC B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 7B6E0 8008B6E0 80180300 */  sll        $v1, $v1, 2
    /* 7B6E4 8008B6E4 21186200 */  addu       $v1, $v1, $v0
    /* 7B6E8 8008B6E8 0000628C */  lw         $v0, 0x0($v1)
    /* 7B6EC 8008B6EC 24208600 */  and        $a0, $a0, $a2
    /* 7B6F0 8008B6F0 24104500 */  and        $v0, $v0, $a1
    /* 7B6F4 8008B6F4 25208200 */  or         $a0, $a0, $v0
    /* 7B6F8 8008B6F8 000024AE */  sw         $a0, 0x0($s1)
    /* 7B6FC 8008B6FC 0000628C */  lw         $v0, 0x0($v1)
    /* 7B700 8008B700 24282502 */  and        $a1, $s1, $a1
  .L8008B704:
    /* 7B704 8008B704 24104600 */  and        $v0, $v0, $a2
    /* 7B708 8008B708 25104500 */  or         $v0, $v0, $a1
    /* 7B70C 8008B70C 000062AC */  sw         $v0, 0x0($v1)
    /* 7B710 8008B710 21102002 */  addu       $v0, $s1, $zero
    /* 7B714 8008B714 9C00BF8F */  lw         $ra, 0x9C($sp)
    /* 7B718 8008B718 9800BE8F */  lw         $fp, 0x98($sp)
    /* 7B71C 8008B71C 9400B78F */  lw         $s7, 0x94($sp)
    /* 7B720 8008B720 9000B68F */  lw         $s6, 0x90($sp)
    /* 7B724 8008B724 8C00B58F */  lw         $s5, 0x8C($sp)
    /* 7B728 8008B728 8800B48F */  lw         $s4, 0x88($sp)
    /* 7B72C 8008B72C 8400B38F */  lw         $s3, 0x84($sp)
    /* 7B730 8008B730 8000B28F */  lw         $s2, 0x80($sp)
    /* 7B734 8008B734 7C00B18F */  lw         $s1, 0x7C($sp)
    /* 7B738 8008B738 7800B08F */  lw         $s0, 0x78($sp)
    /* 7B73C 8008B73C A000BD27 */  addiu      $sp, $sp, 0xA0
    /* 7B740 8008B740 0800E003 */  jr         $ra
    /* 7B744 8008B744 00000000 */   nop
endlabel DialogPrint__Fiiiiiiiiii
