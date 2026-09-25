.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawHelp__Fv, 0x278

glabel DrawHelp__Fv
    /* 9ECD0 800AECD0 740B828F */  lw         $v0, %gp_rel(D_8011B2F4)($gp)
    /* 9ECD4 800AECD4 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 9ECD8 800AECD8 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 9ECDC 800AECDC 3800B4AF */  sw         $s4, 0x38($sp)
    /* 9ECE0 800AECE0 3400B3AF */  sw         $s3, 0x34($sp)
    /* 9ECE4 800AECE4 3000B2AF */  sw         $s2, 0x30($sp)
    /* 9ECE8 800AECE8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 9ECEC 800AECEC 07004014 */  bnez       $v0, .L800AED0C
    /* 9ECF0 800AECF0 2800B0AF */   sw        $s0, 0x28($sp)
    /* 9ECF4 800AECF4 01000224 */  addiu      $v0, $zero, 0x1
    /* 9ECF8 800AECF8 740B82AF */  sw         $v0, %gp_rel(D_8011B2F4)($gp)
    /* 9ECFC 800AECFC 1280043C */  lui        $a0, %hi(D_80121C78)
    /* 9ED00 800AED00 781C8424 */  addiu      $a0, $a0, %lo(D_80121C78)
    /* 9ED04 800AED04 00BC020C */  jal        __6Dialog_800af000
    /* 9ED08 800AED08 00000000 */   nop
  .L800AED0C:
    /* 9ED0C 800AED0C 20BC020C */  jal        GetOverlayOtBase__7CBlocks_800af080
    /* 9ED10 800AED10 00000000 */   nop
    /* 9ED14 800AED14 1280113C */  lui        $s1, %hi(D_80121C88)
    /* 9ED18 800AED18 881C3126 */  addiu      $s1, $s1, %lo(D_80121C88)
    /* 9ED1C 800AED1C 21202002 */  addu       $a0, $s1, $zero
    /* 9ED20 800AED20 21804000 */  addu       $s0, $v0, $zero
    /* 9ED24 800AED24 8A34020C */  jal        SetOTpos__6Dialogi
    /* 9ED28 800AED28 21280002 */   addu      $a1, $s0, $zero
    /* 9ED2C 800AED2C 0C80123C */  lui        $s2, %hi(MediumFont)
    /* 9ED30 800AED30 D8825226 */  addiu      $s2, $s2, %lo(MediumFont)
    /* 9ED34 800AED34 21204002 */  addu       $a0, $s2, $zero
    /* 9ED38 800AED38 01000526 */  addiu      $a1, $s0, 0x1
    /* 9ED3C 800AED3C E82A020C */  jal        SetOTpos__5CFonti
    /* 9ED40 800AED40 21984000 */   addu      $s3, $v0, $zero
    /* 9ED44 800AED44 600B838F */  lw         $v1, %gp_rel(D_8011B2E0)($gp)
    /* 9ED48 800AED48 00000000 */  nop
    /* 9ED4C 800AED4C 03006014 */  bnez       $v1, .L800AED5C
    /* 9ED50 800AED50 21A04000 */   addu      $s4, $v0, $zero
    /* 9ED54 800AED54 BCB9020C */  jal        InitHelp__Fv
    /* 9ED58 800AED58 00000000 */   nop
  .L800AED5C:
    /* 9ED5C 800AED5C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9ED60 800AED60 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9ED64 800AED64 00000000 */  nop
    /* 9ED68 800AED68 12004010 */  beqz       $v0, .L800AEDB4
    /* 9ED6C 800AED6C 20000624 */   addiu     $a2, $zero, 0x20
    /* 9ED70 800AED70 4AED010C */  jal        GetStr__Fi
    /* 9ED74 800AED74 E5010424 */   addiu     $a0, $zero, 0x1E5
    /* 9ED78 800AED78 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 9ED7C 800AED7C F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 9ED80 800AED80 21280000 */  addu       $a1, $zero, $zero
    /* 9ED84 800AED84 2E000624 */  addiu      $a2, $zero, 0x2E
    /* 9ED88 800AED88 21384000 */  addu       $a3, $v0, $zero
    /* 9ED8C 800AED8C 1280033C */  lui        $v1, %hi(BLUER)
    /* 9ED90 800AED90 D4AB6390 */  lbu        $v1, %lo(BLUER)($v1)
    /* 9ED94 800AED94 1280083C */  lui        $t0, %hi(BLUEG)
    /* 9ED98 800AED98 D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 9ED9C 800AED9C 1280093C */  lui        $t1, %hi(BLUEB)
    /* 9EDA0 800AEDA0 D6AB2991 */  lbu        $t1, %lo(BLUEB)($t1)
    /* 9EDA4 800AEDA4 01000224 */  addiu      $v0, $zero, 0x1
    /* 9EDA8 800AEDA8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9EDAC 800AEDAC 8BBB0208 */  j          .L800AEE2C
    /* 9EDB0 800AEDB0 1400A0AF */   sw        $zero, 0x14($sp)
  .L800AEDB4:
    /* 9EDB4 800AEDB4 21202002 */  addu       $a0, $s1, $zero
    /* 9EDB8 800AEDB8 10000524 */  addiu      $a1, $zero, 0x10
    /* 9EDBC 800AEDBC 1A010724 */  addiu      $a3, $zero, 0x11A
    /* 9EDC0 800AEDC0 10000324 */  addiu      $v1, $zero, 0x10
    /* 9EDC4 800AEDC4 20000224 */  addiu      $v0, $zero, 0x20
    /* 9EDC8 800AEDC8 BE1F82A7 */  sh         $v0, %gp_rel(D_8011C73E)($gp)
    /* 9EDCC 800AEDCC 11010224 */  addiu      $v0, $zero, 0x111
    /* 9EDD0 800AEDD0 C01F82A7 */  sh         $v0, %gp_rel(D_8011C740)($gp)
    /* 9EDD4 800AEDD4 10000224 */  addiu      $v0, $zero, 0x10
    /* 9EDD8 800AEDD8 BC1F83A7 */  sh         $v1, %gp_rel(D_8011C73C)($gp)
    /* 9EDDC 800AEDDC C21F83A7 */  sh         $v1, %gp_rel(D_8011C742)($gp)
    /* 9EDE0 800AEDE0 B82F020C */  jal        Back__6Dialogiiii
    /* 9EDE4 800AEDE4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 9EDE8 800AEDE8 4AED010C */  jal        GetStr__Fi
    /* 9EDEC 800AEDEC E5010424 */   addiu     $a0, $zero, 0x1E5
    /* 9EDF0 800AEDF0 21204002 */  addu       $a0, $s2, $zero
    /* 9EDF4 800AEDF4 21280000 */  addu       $a1, $zero, $zero
    /* 9EDF8 800AEDF8 0B000624 */  addiu      $a2, $zero, 0xB
    /* 9EDFC 800AEDFC 21384000 */  addu       $a3, $v0, $zero
    /* 9EE00 800AEE00 1280033C */  lui        $v1, %hi(GOLDR)
    /* 9EE04 800AEE04 DAAB6390 */  lbu        $v1, %lo(GOLDR)($v1)
    /* 9EE08 800AEE08 1280083C */  lui        $t0, %hi(GOLDG)
    /* 9EE0C 800AEE0C DBAB0891 */  lbu        $t0, %lo(GOLDG)($t0)
    /* 9EE10 800AEE10 1280093C */  lui        $t1, %hi(GOLDB)
    /* 9EE14 800AEE14 DCAB2991 */  lbu        $t1, %lo(GOLDB)($t1)
    /* 9EE18 800AEE18 01000224 */  addiu      $v0, $zero, 0x1
    /* 9EE1C 800AEE1C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9EE20 800AEE20 1280023C */  lui        $v0, %hi(D_8011C73C)
    /* 9EE24 800AEE24 3CC74224 */  addiu      $v0, $v0, %lo(D_8011C73C)
    /* 9EE28 800AEE28 1400A2AF */  sw         $v0, 0x14($sp)
  .L800AEE2C:
    /* 9EE2C 800AEE2C 1800A3AF */  sw         $v1, 0x18($sp)
    /* 9EE30 800AEE30 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 9EE34 800AEE34 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9EE38 800AEE38 2000A9AF */   sw        $t1, 0x20($sp)
    /* 9EE3C 800AEE3C 1280103C */  lui        $s0, %hi(D_80121C88)
    /* 9EE40 800AEE40 881C1026 */  addiu      $s0, $s0, %lo(D_80121C88)
    /* 9EE44 800AEE44 21200002 */  addu       $a0, $s0, $zero
    /* 9EE48 800AEE48 F4BB020C */  jal        SetBorder__6Dialogi_800aefd0
    /* 9EE4C 800AEE4C 12000524 */   addiu     $a1, $zero, 0x12
    /* 9EE50 800AEE50 1280053C */  lui        $a1, %hi(BORDERR)
    /* 9EE54 800AEE54 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 9EE58 800AEE58 1280063C */  lui        $a2, %hi(BORDERG)
    /* 9EE5C 800AEE5C F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 9EE60 800AEE60 1280073C */  lui        $a3, %hi(BORDERB)
    /* 9EE64 800AEE64 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 9EE68 800AEE68 ECBB020C */  jal        SetRGB__6DialogUcUcUc_800aefb0
    /* 9EE6C 800AEE6C 21200002 */   addu      $a0, $s0, $zero
    /* 9EE70 800AEE70 21200002 */  addu       $a0, $s0, $zero
    /* 9EE74 800AEE74 10000524 */  addiu      $a1, $zero, 0x10
    /* 9EE78 800AEE78 34000624 */  addiu      $a2, $zero, 0x34
    /* 9EE7C 800AEE7C 19010724 */  addiu      $a3, $zero, 0x119
    /* 9EE80 800AEE80 9A000224 */  addiu      $v0, $zero, 0x9A
    /* 9EE84 800AEE84 B82F020C */  jal        Back__6Dialogiiii
    /* 9EE88 800AEE88 1000A2AF */   sw        $v0, 0x10($sp)
    /* 9EE8C 800AEE8C 20000224 */  addiu      $v0, $zero, 0x20
    /* 9EE90 800AEE90 BC1F82A7 */  sh         $v0, %gp_rel(D_8011C73C)($gp)
    /* 9EE94 800AEE94 34000224 */  addiu      $v0, $zero, 0x34
    /* 9EE98 800AEE98 BE1F82A7 */  sh         $v0, %gp_rel(D_8011C73E)($gp)
    /* 9EE9C 800AEE9C 01010224 */  addiu      $v0, $zero, 0x101
    /* 9EEA0 800AEEA0 C01F82A7 */  sh         $v0, %gp_rel(D_8011C740)($gp)
    /* 9EEA4 800AEEA4 9A000224 */  addiu      $v0, $zero, 0x9A
    /* 9EEA8 800AEEA8 C21F82A7 */  sh         $v0, %gp_rel(D_8011C742)($gp)
    /* 9EEAC 800AEEAC E8B8020C */  jal        HelpPad__Fv
    /* 9EEB0 800AEEB0 00000000 */   nop
    /* 9EEB4 800AEEB4 54BA020C */  jal        DisplayHelp__Fv
    /* 9EEB8 800AEEB8 00000000 */   nop
    /* 9EEBC 800AEEBC C51F8383 */  lb         $v1, %gp_rel(D_8011C745)($gp)
    /* 9EEC0 800AEEC0 00000000 */  nop
    /* 9EEC4 800AEEC4 40100300 */  sll        $v0, $v1, 1
    /* 9EEC8 800AEEC8 21104300 */  addu       $v0, $v0, $v1
    /* 9EECC 800AEECC 80100200 */  sll        $v0, $v0, 2
    /* 9EED0 800AEED0 0D80013C */  lui        $at, %hi(D_800CD524)
    /* 9EED4 800AEED4 21082200 */  addu       $at, $at, $v0
    /* 9EED8 800AEED8 24D52380 */  lb         $v1, %lo(D_800CD524)($at)
    /* 9EEDC 800AEEDC 03000224 */  addiu      $v0, $zero, 0x3
    /* 9EEE0 800AEEE0 06006214 */  bne        $v1, $v0, .L800AEEFC
    /* 9EEE4 800AEEE4 A0040424 */   addiu     $a0, $zero, 0x4A0
    /* 9EEE8 800AEEE8 780B828F */  lw         $v0, %gp_rel(displayinghelp)($gp)
    /* 9EEEC 800AEEEC 00000000 */  nop
    /* 9EEF0 800AEEF0 02004014 */  bnez       $v0, .L800AEEFC
    /* 9EEF4 800AEEF4 00000000 */   nop
    /* 9EEF8 800AEEF8 E6040424 */  addiu      $a0, $zero, 0x4E6
  .L800AEEFC:
    /* 9EEFC 800AEEFC 349A020C */  jal        PrintSelectBack__FUs
    /* 9EF00 800AEF00 00000000 */   nop
    /* 9EF04 800AEF04 1280043C */  lui        $a0, %hi(D_80121C88)
    /* 9EF08 800AEF08 881C8424 */  addiu      $a0, $a0, %lo(D_80121C88)
    /* 9EF0C 800AEF0C 8A34020C */  jal        SetOTpos__6Dialogi
    /* 9EF10 800AEF10 21286002 */   addu      $a1, $s3, $zero
    /* 9EF14 800AEF14 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9EF18 800AEF18 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9EF1C 800AEF1C E82A020C */  jal        SetOTpos__5CFonti
    /* 9EF20 800AEF20 21288002 */   addu      $a1, $s4, $zero
    /* 9EF24 800AEF24 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 9EF28 800AEF28 3800B48F */  lw         $s4, 0x38($sp)
    /* 9EF2C 800AEF2C 3400B38F */  lw         $s3, 0x34($sp)
    /* 9EF30 800AEF30 3000B28F */  lw         $s2, 0x30($sp)
    /* 9EF34 800AEF34 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 9EF38 800AEF38 2800B08F */  lw         $s0, 0x28($sp)
    /* 9EF3C 800AEF3C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 9EF40 800AEF40 0800E003 */  jr         $ra
    /* 9EF44 800AEF44 00000000 */   nop
endlabel DrawHelp__Fv
