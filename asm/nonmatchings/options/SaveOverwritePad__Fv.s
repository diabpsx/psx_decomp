.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SaveOverwritePad__Fv, 0x23C

glabel SaveOverwritePad__Fv
    /* 9AE7C 800AAE7C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 9AE80 800AAE80 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9AE84 800AAE84 21280000 */  addu       $a1, $zero, $zero
    /* 9AE88 800AAE88 3000BFAF */  sw         $ra, 0x30($sp)
    /* 9AE8C 800AAE8C 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 9AE90 800AAE90 FD25020C */  jal        PAD_GetPad__FiUc
    /* 9AE94 800AAE94 2800B0AF */   sw        $s0, 0x28($sp)
    /* 9AE98 800AAE98 21884000 */  addu       $s1, $v0, $zero
    /* 9AE9C 800AAE9C C0AC020C */  jal        LAMBO_MovePad__FP4CPad
    /* 9AEA0 800AAEA0 21202002 */   addu      $a0, $s1, $zero
    /* 9AEA4 800AAEA4 1280023C */  lui        $v0, %hi(current_card)
    /* 9AEA8 800AAEA8 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9AEAC 800AAEAC 00000000 */  nop
    /* 9AEB0 800AAEB0 02004014 */  bnez       $v0, .L800AAEBC
    /* 9AEB4 800AAEB4 89020424 */   addiu     $a0, $zero, 0x289
    /* 9AEB8 800AAEB8 88020424 */  addiu      $a0, $zero, 0x288
  .L800AAEBC:
    /* 9AEBC 800AAEBC 4AED010C */  jal        GetStr__Fi
    /* 9AEC0 800AAEC0 00000000 */   nop
    /* 9AEC4 800AAEC4 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9AEC8 800AAEC8 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9AECC 800AAECC 21280000 */  addu       $a1, $zero, $zero
    /* 9AED0 800AAED0 1280063C */  lui        $a2, %hi(GOLDR)
    /* 9AED4 800AAED4 DAABC690 */  lbu        $a2, %lo(GOLDR)($a2)
    /* 9AED8 800AAED8 1280073C */  lui        $a3, %hi(GOLDG)
    /* 9AEDC 800AAEDC DBABE790 */  lbu        $a3, %lo(GOLDG)($a3)
    /* 9AEE0 800AAEE0 1280083C */  lui        $t0, %hi(GOLDB)
    /* 9AEE4 800AAEE4 DCAB0891 */  lbu        $t0, %lo(GOLDB)($t0)
    /* 9AEE8 800AAEE8 01000324 */  addiu      $v1, $zero, 0x1
    /* 9AEEC 800AAEEC 1000A3AF */  sw         $v1, 0x10($sp)
    /* 9AEF0 800AAEF0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 9AEF4 800AAEF4 1800A6AF */  sw         $a2, 0x18($sp)
    /* 9AEF8 800AAEF8 60000624 */  addiu      $a2, $zero, 0x60
    /* 9AEFC 800AAEFC 1C00A7AF */  sw         $a3, 0x1C($sp)
    /* 9AF00 800AAF00 21384000 */  addu       $a3, $v0, $zero
    /* 9AF04 800AAF04 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9AF08 800AAF08 2000A8AF */   sw        $t0, 0x20($sp)
    /* 9AF0C 800AAF0C 1280023C */  lui        $v0, %hi(current_card)
    /* 9AF10 800AAF10 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9AF14 800AAF14 00000000 */  nop
    /* 9AF18 800AAF18 80280200 */  sll        $a1, $v0, 2
    /* 9AF1C 800AAF1C 1280013C */  lui        $at, %hi(card_status)
    /* 9AF20 800AAF20 21082500 */  addu       $at, $at, $a1
    /* 9AF24 800AAF24 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 9AF28 800AAF28 02000224 */  addiu      $v0, $zero, 0x2
    /* 9AF2C 800AAF2C 10006214 */  bne        $v1, $v0, .L800AAF70
    /* 9AF30 800AAF30 21800000 */   addu      $s0, $zero, $zero
    /* 9AF34 800AAF34 01000424 */  addiu      $a0, $zero, 0x1
    /* 9AF38 800AAF38 1280013C */  lui        $at, %hi(card_side_empty)
    /* 9AF3C 800AAF3C 21082500 */  addu       $at, $at, $a1
    /* 9AF40 800AAF40 88B1228C */  lw         $v0, %lo(card_side_empty)($at)
    /* 9AF44 800AAF44 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9AF48 800AAF48 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 9AF4C 800AAF4C E495020C */  jal        ActivateMemcard__Fii
    /* 9AF50 800AAF50 01000524 */   addiu     $a1, $zero, 0x1
    /* 9AF54 800AAF54 1280023C */  lui        $v0, %hi(current_card)
    /* 9AF58 800AAF58 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9AF5C 800AAF5C 0C0B838F */  lw         $v1, %gp_rel(ReturnMenu)($gp)
    /* 9AF60 800AAF60 1280013C */  lui        $at, %hi(saveflag)
    /* 9AF64 800AAF64 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 9AF68 800AAF68 26AC0208 */  j          .L800AB098
    /* 9AF6C 800AAF6C 01004224 */   addiu     $v0, $v0, 0x1
  .L800AAF70:
    /* 9AF70 800AAF70 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9AF74 800AAF74 21202002 */   addu      $a0, $s1, $zero
    /* 9AF78 800AAF78 40004230 */  andi       $v0, $v0, 0x40
    /* 9AF7C 800AAF7C 06004014 */  bnez       $v0, .L800AAF98
    /* 9AF80 800AAF80 00000000 */   nop
    /* 9AF84 800AAF84 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9AF88 800AAF88 21202002 */   addu      $a0, $s1, $zero
    /* 9AF8C 800AAF8C 10004230 */  andi       $v0, $v0, 0x10
    /* 9AF90 800AAF90 02004010 */  beqz       $v0, .L800AAF9C
    /* 9AF94 800AAF94 00000000 */   nop
  .L800AAF98:
    /* 9AF98 800AAF98 01001024 */  addiu      $s0, $zero, 0x1
  .L800AAF9C:
    /* 9AF9C 800AAF9C 20000012 */  beqz       $s0, .L800AB020
    /* 9AFA0 800AAFA0 00000000 */   nop
    /* 9AFA4 800AAFA4 C6F5000C */  jal        PlaySFX__Fi
    /* 9AFA8 800AAFA8 33000424 */   addiu     $a0, $zero, 0x33
    /* 9AFAC 800AAFAC B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 9AFB0 800AAFB0 02000224 */  addiu      $v0, $zero, 0x2
    /* 9AFB4 800AAFB4 14006214 */  bne        $v1, $v0, .L800AB008
    /* 9AFB8 800AAFB8 01000224 */   addiu     $v0, $zero, 0x1
    /* 9AFBC 800AAFBC CC0A838F */  lw         $v1, %gp_rel(ReturnCards)($gp)
    /* 9AFC0 800AAFC0 00000000 */  nop
    /* 9AFC4 800AAFC4 0A006214 */  bne        $v1, $v0, .L800AAFF0
    /* 9AFC8 800AAFC8 01000424 */   addiu     $a0, $zero, 0x1
    /* 9AFCC 800AAFCC 1280053C */  lui        $a1, %hi(current_card)
    /* 9AFD0 800AAFD0 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 9AFD4 800AAFD4 00000000 */  nop
    /* 9AFD8 800AAFD8 0100A42C */  sltiu      $a0, $a1, 0x1
    /* 9AFDC 800AAFDC 0100A538 */  xori       $a1, $a1, 0x1
    /* 9AFE0 800AAFE0 F395020C */  jal        ActivateCharacterMemcard__Fii
    /* 9AFE4 800AAFE4 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 9AFE8 800AAFE8 FEAB0208 */  j          .L800AAFF8
    /* 9AFEC 800AAFEC 00000000 */   nop
  .L800AAFF0:
    /* 9AFF0 800AAFF0 E495020C */  jal        ActivateMemcard__Fii
    /* 9AFF4 800AAFF4 01000524 */   addiu     $a1, $zero, 0x1
  .L800AAFF8:
    /* 9AFF8 800AAFF8 1280013C */  lui        $at, %hi(loadflag)
    /* 9AFFC 800AAFFC 7CB120AC */  sw         $zero, %lo(loadflag)($at)
    /* 9B000 800AB000 1280013C */  lui        $at, %hi(saveflag)
    /* 9B004 800AB004 78B120AC */  sw         $zero, %lo(saveflag)($at)
  .L800AB008:
    /* 9B008 800AB008 B80A828F */  lw         $v0, %gp_rel(D_8011B238)($gp)
    /* 9B00C 800AB00C 0C0B838F */  lw         $v1, %gp_rel(ReturnMenu)($gp)
    /* 9B010 800AB010 1280013C */  lui        $at, %hi(StatusTxt)
    /* 9B014 800AB014 5CB420AC */  sw         $zero, %lo(StatusTxt)($at)
    /* 9B018 800AB018 26AC0208 */  j          .L800AB098
    /* 9B01C 800AB01C 00000000 */   nop
  .L800AB020:
    /* 9B020 800AB020 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9B024 800AB024 21202002 */   addu      $a0, $s1, $zero
    /* 9B028 800AB028 00014230 */  andi       $v0, $v0, 0x100
    /* 9B02C 800AB02C 1C004010 */  beqz       $v0, .L800AB0A0
    /* 9B030 800AB030 01000224 */   addiu     $v0, $zero, 0x1
    /* 9B034 800AB034 CC0A838F */  lw         $v1, %gp_rel(ReturnCards)($gp)
    /* 9B038 800AB038 00000000 */  nop
    /* 9B03C 800AB03C 0A006214 */  bne        $v1, $v0, .L800AB068
    /* 9B040 800AB040 01000424 */   addiu     $a0, $zero, 0x1
    /* 9B044 800AB044 1280053C */  lui        $a1, %hi(current_card)
    /* 9B048 800AB048 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 9B04C 800AB04C 00000000 */  nop
    /* 9B050 800AB050 0100A42C */  sltiu      $a0, $a1, 0x1
    /* 9B054 800AB054 0100A538 */  xori       $a1, $a1, 0x1
    /* 9B058 800AB058 F395020C */  jal        ActivateCharacterMemcard__Fii
    /* 9B05C 800AB05C 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 9B060 800AB060 1CAC0208 */  j          .L800AB070
    /* 9B064 800AB064 00000000 */   nop
  .L800AB068:
    /* 9B068 800AB068 E495020C */  jal        ActivateMemcard__Fii
    /* 9B06C 800AB06C 01000524 */   addiu     $a1, $zero, 0x1
  .L800AB070:
    /* 9B070 800AB070 C6F5000C */  jal        PlaySFX__Fi
    /* 9B074 800AB074 33000424 */   addiu     $a0, $zero, 0x33
    /* 9B078 800AB078 B80A828F */  lw         $v0, %gp_rel(D_8011B238)($gp)
    /* 9B07C 800AB07C 0C0B838F */  lw         $v1, %gp_rel(ReturnMenu)($gp)
    /* 9B080 800AB080 1280013C */  lui        $at, %hi(loadflag)
    /* 9B084 800AB084 7CB120AC */  sw         $zero, %lo(loadflag)($at)
    /* 9B088 800AB088 1280013C */  lui        $at, %hi(saveflag)
    /* 9B08C 800AB08C 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 9B090 800AB090 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9B094 800AB094 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
  .L800AB098:
    /* 9B098 800AB098 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9B09C 800AB09C BC0A83AF */  sw         $v1, %gp_rel(cmenu)($gp)
  .L800AB0A0:
    /* 9B0A0 800AB0A0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 9B0A4 800AB0A4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 9B0A8 800AB0A8 2800B08F */  lw         $s0, 0x28($sp)
    /* 9B0AC 800AB0AC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 9B0B0 800AB0B0 0800E003 */  jr         $ra
    /* 9B0B4 800AB0B4 00000000 */   nop
endlabel SaveOverwritePad__Fv
