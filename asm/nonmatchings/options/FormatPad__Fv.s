.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FormatPad__Fv, 0x308

glabel FormatPad__Fv
    /* 9AB74 800AAB74 1280053C */  lui        $a1, %hi(current_card)
    /* 9AB78 800AAB78 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 9AB7C 800AAB7C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 9AB80 800AAB80 3000BFAF */  sw         $ra, 0x30($sp)
    /* 9AB84 800AAB84 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 9AB88 800AAB88 2800B0AF */  sw         $s0, 0x28($sp)
    /* 9AB8C 800AAB8C 0100A42C */  sltiu      $a0, $a1, 0x1
    /* 9AB90 800AAB90 0100A538 */  xori       $a1, $a1, 0x1
    /* 9AB94 800AAB94 E495020C */  jal        ActivateMemcard__Fii
    /* 9AB98 800AAB98 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 9AB9C 800AAB9C 1280023C */  lui        $v0, %hi(current_card)
    /* 9ABA0 800AABA0 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9ABA4 800AABA4 00000000 */  nop
    /* 9ABA8 800AABA8 02004014 */  bnez       $v0, .L800AABB4
    /* 9ABAC 800AABAC 89020424 */   addiu     $a0, $zero, 0x289
    /* 9ABB0 800AABB0 88020424 */  addiu      $a0, $zero, 0x288
  .L800AABB4:
    /* 9ABB4 800AABB4 4AED010C */  jal        GetStr__Fi
    /* 9ABB8 800AABB8 00000000 */   nop
    /* 9ABBC 800AABBC 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9ABC0 800AABC0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9ABC4 800AABC4 21280000 */  addu       $a1, $zero, $zero
    /* 9ABC8 800AABC8 1280063C */  lui        $a2, %hi(GOLDR)
    /* 9ABCC 800AABCC DAABC690 */  lbu        $a2, %lo(GOLDR)($a2)
    /* 9ABD0 800AABD0 1280073C */  lui        $a3, %hi(GOLDG)
    /* 9ABD4 800AABD4 DBABE790 */  lbu        $a3, %lo(GOLDG)($a3)
    /* 9ABD8 800AABD8 1280083C */  lui        $t0, %hi(GOLDB)
    /* 9ABDC 800AABDC DCAB0891 */  lbu        $t0, %lo(GOLDB)($t0)
    /* 9ABE0 800AABE0 01000324 */  addiu      $v1, $zero, 0x1
    /* 9ABE4 800AABE4 1000A3AF */  sw         $v1, 0x10($sp)
    /* 9ABE8 800AABE8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 9ABEC 800AABEC 1800A6AF */  sw         $a2, 0x18($sp)
    /* 9ABF0 800AABF0 38000624 */  addiu      $a2, $zero, 0x38
    /* 9ABF4 800AABF4 1C00A7AF */  sw         $a3, 0x1C($sp)
    /* 9ABF8 800AABF8 21384000 */  addu       $a3, $v0, $zero
    /* 9ABFC 800AABFC 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9AC00 800AAC00 2000A8AF */   sw        $t0, 0x20($sp)
    /* 9AC04 800AAC04 1280023C */  lui        $v0, %hi(current_card)
    /* 9AC08 800AAC08 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9AC0C 800AAC0C 00000000 */  nop
    /* 9AC10 800AAC10 80280200 */  sll        $a1, $v0, 2
    /* 9AC14 800AAC14 1280013C */  lui        $at, %hi(card_status)
    /* 9AC18 800AAC18 21082500 */  addu       $at, $at, $a1
    /* 9AC1C 800AAC1C DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 9AC20 800AAC20 02000224 */  addiu      $v0, $zero, 0x2
    /* 9AC24 800AAC24 12006214 */  bne        $v1, $v0, .L800AAC70
    /* 9AC28 800AAC28 01000424 */   addiu     $a0, $zero, 0x1
    /* 9AC2C 800AAC2C 1280013C */  lui        $at, %hi(card_side_empty)
    /* 9AC30 800AAC30 21082500 */  addu       $at, $at, $a1
    /* 9AC34 800AAC34 88B1228C */  lw         $v0, %lo(card_side_empty)($at)
    /* 9AC38 800AAC38 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9AC3C 800AAC3C 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 9AC40 800AAC40 E495020C */  jal        ActivateMemcard__Fii
    /* 9AC44 800AAC44 01000524 */   addiu     $a1, $zero, 0x1
    /* 9AC48 800AAC48 05000224 */  addiu      $v0, $zero, 0x5
    /* 9AC4C 800AAC4C 1280013C */  lui        $at, %hi(cardondelay)
    /* 9AC50 800AAC50 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 9AC54 800AAC54 1280023C */  lui        $v0, %hi(current_card)
    /* 9AC58 800AAC58 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9AC5C 800AAC5C 0C0B838F */  lw         $v1, %gp_rel(ReturnMenu)($gp)
    /* 9AC60 800AAC60 1280013C */  lui        $at, %hi(saveflag)
    /* 9AC64 800AAC64 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 9AC68 800AAC68 97AB0208 */  j          .L800AAE5C
    /* 9AC6C 800AAC6C 01004224 */   addiu     $v0, $v0, 0x1
  .L800AAC70:
    /* 9AC70 800AAC70 1280023C */  lui        $v0, %hi(formatflag)
    /* 9AC74 800AAC74 80B1428C */  lw         $v0, %lo(formatflag)($v0)
    /* 9AC78 800AAC78 00000000 */  nop
    /* 9AC7C 800AAC7C 44004014 */  bnez       $v0, .L800AAD90
    /* 9AC80 800AAC80 01004224 */   addiu     $v0, $v0, 0x1
    /* 9AC84 800AAC84 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9AC88 800AAC88 FD25020C */  jal        PAD_GetPad__FiUc
    /* 9AC8C 800AAC8C 21280000 */   addu      $a1, $zero, $zero
    /* 9AC90 800AAC90 21804000 */  addu       $s0, $v0, $zero
    /* 9AC94 800AAC94 C0AC020C */  jal        LAMBO_MovePad__FP4CPad
    /* 9AC98 800AAC98 21200002 */   addu      $a0, $s0, $zero
    /* 9AC9C 800AAC9C 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9ACA0 800AACA0 21200002 */   addu      $a0, $s0, $zero
    /* 9ACA4 800AACA4 00014230 */  andi       $v0, $v0, 0x100
    /* 9ACA8 800AACA8 0F004010 */  beqz       $v0, .L800AACE8
    /* 9ACAC 800AACAC 21880000 */   addu      $s1, $zero, $zero
    /* 9ACB0 800AACB0 C6F5000C */  jal        PlaySFX__Fi
    /* 9ACB4 800AACB4 33000424 */   addiu     $a0, $zero, 0x33
    /* 9ACB8 800AACB8 01000424 */  addiu      $a0, $zero, 0x1
    /* 9ACBC 800AACBC E495020C */  jal        ActivateMemcard__Fii
    /* 9ACC0 800AACC0 01000524 */   addiu     $a1, $zero, 0x1
    /* 9ACC4 800AACC4 1280023C */  lui        $v0, %hi(current_card)
    /* 9ACC8 800AACC8 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9ACCC 800AACCC 0C0B838F */  lw         $v1, %gp_rel(ReturnMenu)($gp)
    /* 9ACD0 800AACD0 1280013C */  lui        $at, %hi(saveflag)
    /* 9ACD4 800AACD4 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 9ACD8 800AACD8 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9ACDC 800AACDC 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
    /* 9ACE0 800AACE0 97AB0208 */  j          .L800AAE5C
    /* 9ACE4 800AACE4 01004224 */   addiu     $v0, $v0, 0x1
  .L800AACE8:
    /* 9ACE8 800AACE8 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9ACEC 800AACEC 21200002 */   addu      $a0, $s0, $zero
    /* 9ACF0 800AACF0 40004230 */  andi       $v0, $v0, 0x40
    /* 9ACF4 800AACF4 06004014 */  bnez       $v0, .L800AAD10
    /* 9ACF8 800AACF8 00000000 */   nop
    /* 9ACFC 800AACFC 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 9AD00 800AAD00 21200002 */   addu      $a0, $s0, $zero
    /* 9AD04 800AAD04 10004230 */  andi       $v0, $v0, 0x10
    /* 9AD08 800AAD08 02004010 */  beqz       $v0, .L800AAD14
    /* 9AD0C 800AAD0C 00000000 */   nop
  .L800AAD10:
    /* 9AD10 800AAD10 01001124 */  addiu      $s1, $zero, 0x1
  .L800AAD14:
    /* 9AD14 800AAD14 19002012 */  beqz       $s1, .L800AAD7C
    /* 9AD18 800AAD18 00000000 */   nop
    /* 9AD1C 800AAD1C C6F5000C */  jal        PlaySFX__Fi
    /* 9AD20 800AAD20 33000424 */   addiu     $a0, $zero, 0x33
    /* 9AD24 800AAD24 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 9AD28 800AAD28 01000224 */  addiu      $v0, $zero, 0x1
    /* 9AD2C 800AAD2C 05006214 */  bne        $v1, $v0, .L800AAD44
    /* 9AD30 800AAD30 01000424 */   addiu     $a0, $zero, 0x1
    /* 9AD34 800AAD34 1280013C */  lui        $at, %hi(formatflag)
    /* 9AD38 800AAD38 80B123AC */  sw         $v1, %lo(formatflag)($at)
    /* 9AD3C 800AAD3C 5FAB0208 */  j          .L800AAD7C
    /* 9AD40 800AAD40 00000000 */   nop
  .L800AAD44:
    /* 9AD44 800AAD44 1280013C */  lui        $at, %hi(formatflag)
    /* 9AD48 800AAD48 80B120AC */  sw         $zero, %lo(formatflag)($at)
    /* 9AD4C 800AAD4C 1280013C */  lui        $at, %hi(saveflag)
    /* 9AD50 800AAD50 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 9AD54 800AAD54 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9AD58 800AAD58 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
    /* 9AD5C 800AAD5C E495020C */  jal        ActivateMemcard__Fii
    /* 9AD60 800AAD60 01000524 */   addiu     $a1, $zero, 0x1
    /* 9AD64 800AAD64 1280023C */  lui        $v0, %hi(current_card)
    /* 9AD68 800AAD68 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9AD6C 800AAD6C 0C0B838F */  lw         $v1, %gp_rel(ReturnMenu)($gp)
    /* 9AD70 800AAD70 01004224 */  addiu      $v0, $v0, 0x1
    /* 9AD74 800AAD74 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9AD78 800AAD78 BC0A83AF */  sw         $v1, %gp_rel(cmenu)($gp)
  .L800AAD7C:
    /* 9AD7C 800AAD7C 1280023C */  lui        $v0, %hi(formatflag)
    /* 9AD80 800AAD80 80B1428C */  lw         $v0, %lo(formatflag)($v0)
    /* 9AD84 800AAD84 00000000 */  nop
    /* 9AD88 800AAD88 36004010 */  beqz       $v0, .L800AAE64
    /* 9AD8C 800AAD8C 01004224 */   addiu     $v0, $v0, 0x1
  .L800AAD90:
    /* 9AD90 800AAD90 1280013C */  lui        $at, %hi(formatflag)
    /* 9AD94 800AAD94 80B122AC */  sw         $v0, %lo(formatflag)($at)
    /* 9AD98 800AAD98 03004228 */  slti       $v0, $v0, 0x3
    /* 9AD9C 800AAD9C 31004014 */  bnez       $v0, .L800AAE64
    /* 9ADA0 800AADA0 00000000 */   nop
    /* 9ADA4 800AADA4 1280023C */  lui        $v0, %hi(current_card)
    /* 9ADA8 800AADA8 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 9ADAC 800AADAC 00000000 */  nop
    /* 9ADB0 800AADB0 80100200 */  sll        $v0, $v0, 2
    /* 9ADB4 800AADB4 1280013C */  lui        $at, %hi(card_side_format)
    /* 9ADB8 800AADB8 21082200 */  addu       $at, $at, $v0
    /* 9ADBC 800AADBC C0B1248C */  lw         $a0, %lo(card_side_format)($at)
    /* 9ADC0 800AADC0 9797020C */  jal        ShowLoadingBox__Fi
    /* 9ADC4 800AADC4 00000000 */   nop
    /* 9ADC8 800AADC8 1280023C */  lui        $v0, %hi(formatflag)
    /* 9ADCC 800AADCC 80B1428C */  lw         $v0, %lo(formatflag)($v0)
    /* 9ADD0 800AADD0 00000000 */  nop
    /* 9ADD4 800AADD4 0B004228 */  slti       $v0, $v0, 0xB
    /* 9ADD8 800AADD8 22004014 */  bnez       $v0, .L800AAE64
    /* 9ADDC 800AADDC 00000000 */   nop
    /* 9ADE0 800AADE0 1280043C */  lui        $a0, %hi(current_card)
    /* 9ADE4 800AADE4 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 9ADE8 800AADE8 FD0B050C */  jal        func_80142FF4
    /* 9ADEC 800AADEC 00000000 */   nop
    /* 9ADF0 800AADF0 14004014 */  bnez       $v0, .L800AAE44
    /* 9ADF4 800AADF4 01000424 */   addiu     $a0, $zero, 0x1
    /* 9ADF8 800AADF8 07050224 */  addiu      $v0, $zero, 0x507
    /* 9ADFC 800AADFC 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9AE00 800AAE00 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 9AE04 800AAE04 E495020C */  jal        ActivateMemcard__Fii
    /* 9AE08 800AAE08 01000524 */   addiu     $a1, $zero, 0x1
    /* 9AE0C 800AAE0C B40A838F */  lw         $v1, %gp_rel(D_8011B234)($gp)
    /* 9AE10 800AAE10 0C0B848F */  lw         $a0, %gp_rel(ReturnMenu)($gp)
    /* 9AE14 800AAE14 05000224 */  addiu      $v0, $zero, 0x5
    /* 9AE18 800AAE18 1280013C */  lui        $at, %hi(cardondelay)
    /* 9AE1C 800AAE1C FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 9AE20 800AAE20 C00A80AF */  sw         $zero, %gp_rel(CharacterBlockLoaded)($gp)
    /* 9AE24 800AAE24 1280013C */  lui        $at, %hi(saveflag)
    /* 9AE28 800AAE28 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 9AE2C 800AAE2C 1280013C */  lui        $at, %hi(formatflag)
    /* 9AE30 800AAE30 80B120AC */  sw         $zero, %lo(formatflag)($at)
    /* 9AE34 800AAE34 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 9AE38 800AAE38 BC0A84AF */  sw         $a0, %gp_rel(cmenu)($gp)
    /* 9AE3C 800AAE3C 99AB0208 */  j          .L800AAE64
    /* 9AE40 800AAE40 00000000 */   nop
  .L800AAE44:
    /* 9AE44 800AAE44 B40A828F */  lw         $v0, %gp_rel(D_8011B234)($gp)
    /* 9AE48 800AAE48 0C0B838F */  lw         $v1, %gp_rel(ReturnMenu)($gp)
    /* 9AE4C 800AAE4C 1280013C */  lui        $at, %hi(formatflag)
    /* 9AE50 800AAE50 80B120AC */  sw         $zero, %lo(formatflag)($at)
    /* 9AE54 800AAE54 1280013C */  lui        $at, %hi(AlertTxt)
    /* 9AE58 800AAE58 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
  .L800AAE5C:
    /* 9AE5C 800AAE5C B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9AE60 800AAE60 BC0A83AF */  sw         $v1, %gp_rel(cmenu)($gp)
  .L800AAE64:
    /* 9AE64 800AAE64 3000BF8F */  lw         $ra, 0x30($sp)
    /* 9AE68 800AAE68 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 9AE6C 800AAE6C 2800B08F */  lw         $s0, 0x28($sp)
    /* 9AE70 800AAE70 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 9AE74 800AAE74 0800E003 */  jr         $ra
    /* 9AE78 800AAE78 00000000 */   nop
endlabel FormatPad__Fv
