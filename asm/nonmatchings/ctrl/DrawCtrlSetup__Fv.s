.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawCtrlSetup__Fv, 0x500

glabel DrawCtrlSetup__Fv
    /* 8D5D8 8009D5D8 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 8D5DC 8009D5DC 4000BFAF */  sw         $ra, 0x40($sp)
    /* 8D5E0 8009D5E0 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 8D5E4 8009D5E4 3800B4AF */  sw         $s4, 0x38($sp)
    /* 8D5E8 8009D5E8 3400B3AF */  sw         $s3, 0x34($sp)
    /* 8D5EC 8009D5EC 3000B2AF */  sw         $s2, 0x30($sp)
    /* 8D5F0 8009D5F0 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 8D5F4 8009D5F4 0872020C */  jal        Init_ctrl_pos__Fv
    /* 8D5F8 8009D5F8 2800B0AF */   sw        $s0, 0x28($sp)
    /* 8D5FC 8009D5FC FF004230 */  andi       $v0, $v0, 0xFF
    /* 8D600 8009D600 2B014010 */  beqz       $v0, .L8009DAB0
    /* 8D604 8009D604 00000000 */   nop
    /* 8D608 8009D608 A0088293 */  lbu        $v0, %gp_rel(ctrlflag)($gp)
    /* 8D60C 8009D60C 00000000 */  nop
    /* 8D610 8009D610 27014010 */  beqz       $v0, .L8009DAB0
    /* 8D614 8009D614 00000000 */   nop
    /* 8D618 8009D618 1280023C */  lui        $v0, %hi(options_pad)
    /* 8D61C 8009D61C 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 8D620 8009D620 00000000 */  nop
    /* 8D624 8009D624 80100200 */  sll        $v0, $v0, 2
    /* 8D628 8009D628 1280013C */  lui        $at, %hi(_spselflag)
    /* 8D62C 8009D62C 21082200 */  addu       $at, $at, $v0
    /* 8D630 8009D630 50B6228C */  lw         $v0, %lo(_spselflag)($at)
    /* 8D634 8009D634 00000000 */  nop
    /* 8D638 8009D638 1D014014 */  bnez       $v0, .L8009DAB0
    /* 8D63C 8009D63C 00000000 */   nop
    /* 8D640 8009D640 2A77020C */  jal        GetOverlayOtBase__7CBlocks_8009dca8
    /* 8D644 8009D644 00000000 */   nop
    /* 8D648 8009D648 1280113C */  lui        $s1, %hi(D_8011CDF0)
    /* 8D64C 8009D64C F0CD3126 */  addiu      $s1, $s1, %lo(D_8011CDF0)
    /* 8D650 8009D650 21202002 */  addu       $a0, $s1, $zero
    /* 8D654 8009D654 21804000 */  addu       $s0, $v0, $zero
    /* 8D658 8009D658 8A34020C */  jal        SetOTpos__6Dialogi
    /* 8D65C 8009D65C 21280002 */   addu      $a1, $s0, $zero
    /* 8D660 8009D660 EA72020C */  jal        main_ctrl_setup__Fv
    /* 8D664 8009D664 21A84000 */   addu      $s5, $v0, $zero
    /* 8D668 8009D668 FF004230 */  andi       $v0, $v0, 0xFF
    /* 8D66C 8009D66C 10014010 */  beqz       $v0, .L8009DAB0
    /* 8D670 8009D670 00000000 */   nop
    /* 8D674 8009D674 0C80123C */  lui        $s2, %hi(MediumFont)
    /* 8D678 8009D678 D8825226 */  addiu      $s2, $s2, %lo(MediumFont)
    /* 8D67C 8009D67C 21204002 */  addu       $a0, $s2, $zero
    /* 8D680 8009D680 E82A020C */  jal        SetOTpos__5CFonti
    /* 8D684 8009D684 01000526 */   addiu     $a1, $s0, 0x1
    /* 8D688 8009D688 21202002 */  addu       $a0, $s1, $zero
    /* 8D68C 8009D68C 12000524 */  addiu      $a1, $zero, 0x12
    /* 8D690 8009D690 FE76020C */  jal        SetBorder__6Dialogi_8009dbf8
    /* 8D694 8009D694 21A04000 */   addu      $s4, $v0, $zero
    /* 8D698 8009D698 1280053C */  lui        $a1, %hi(BORDERR)
    /* 8D69C 8009D69C F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 8D6A0 8009D6A0 1280063C */  lui        $a2, %hi(BORDERG)
    /* 8D6A4 8009D6A4 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 8D6A8 8009D6A8 1280073C */  lui        $a3, %hi(BORDERB)
    /* 8D6AC 8009D6AC F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 8D6B0 8009D6B0 F676020C */  jal        SetRGB__6DialogUcUcUc_8009dbd8
    /* 8D6B4 8009D6B4 21202002 */   addu      $a0, $s1, $zero
    /* 8D6B8 8009D6B8 1280023C */  lui        $v0, %hi(FeFlag)
    /* 8D6BC 8009D6BC 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 8D6C0 8009D6C0 00000000 */  nop
    /* 8D6C4 8009D6C4 12004010 */  beqz       $v0, .L8009D710
    /* 8D6C8 8009D6C8 21202002 */   addu      $a0, $s1, $zero
    /* 8D6CC 8009D6CC 4AED010C */  jal        GetStr__Fi
    /* 8D6D0 8009D6D0 CB000424 */   addiu     $a0, $zero, 0xCB
    /* 8D6D4 8009D6D4 0C80043C */  lui        $a0, %hi(LargeFont)
    /* 8D6D8 8009D6D8 F4848424 */  addiu      $a0, $a0, %lo(LargeFont)
    /* 8D6DC 8009D6DC 21280000 */  addu       $a1, $zero, $zero
    /* 8D6E0 8009D6E0 2E000624 */  addiu      $a2, $zero, 0x2E
    /* 8D6E4 8009D6E4 21384000 */  addu       $a3, $v0, $zero
    /* 8D6E8 8009D6E8 1280033C */  lui        $v1, %hi(BLUER)
    /* 8D6EC 8009D6EC D4AB6390 */  lbu        $v1, %lo(BLUER)($v1)
    /* 8D6F0 8009D6F0 1280083C */  lui        $t0, %hi(BLUEG)
    /* 8D6F4 8009D6F4 D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 8D6F8 8009D6F8 1280093C */  lui        $t1, %hi(BLUEB)
    /* 8D6FC 8009D6FC D6AB2991 */  lbu        $t1, %lo(BLUEB)($t1)
    /* 8D700 8009D700 01000224 */  addiu      $v0, $zero, 0x1
    /* 8D704 8009D704 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8D708 8009D708 E4750208 */  j          .L8009D790
    /* 8D70C 8009D70C 1400A0AF */   sw        $zero, 0x14($sp)
  .L8009D710:
    /* 8D710 8009D710 10000524 */  addiu      $a1, $zero, 0x10
    /* 8D714 8009D714 20000624 */  addiu      $a2, $zero, 0x20
    /* 8D718 8009D718 19010724 */  addiu      $a3, $zero, 0x119
    /* 8D71C 8009D71C 10000324 */  addiu      $v1, $zero, 0x10
    /* 8D720 8009D720 20000224 */  addiu      $v0, $zero, 0x20
    /* 8D724 8009D724 521F82A7 */  sh         $v0, %gp_rel(D_8011C6D2)($gp)
    /* 8D728 8009D728 19010224 */  addiu      $v0, $zero, 0x119
    /* 8D72C 8009D72C 541F82A7 */  sh         $v0, %gp_rel(D_8011C6D4)($gp)
    /* 8D730 8009D730 10000224 */  addiu      $v0, $zero, 0x10
    /* 8D734 8009D734 1280013C */  lui        $at, %hi(buttoncol)
    /* 8D738 8009D738 E0AB20AC */  sw         $zero, %lo(buttoncol)($at)
    /* 8D73C 8009D73C 501F83A7 */  sh         $v1, %gp_rel(D_8011C6D0)($gp)
    /* 8D740 8009D740 561F83A7 */  sh         $v1, %gp_rel(D_8011C6D6)($gp)
    /* 8D744 8009D744 B82F020C */  jal        Back__6Dialogiiii
    /* 8D748 8009D748 1000A2AF */   sw        $v0, 0x10($sp)
    /* 8D74C 8009D74C 4AED010C */  jal        GetStr__Fi
    /* 8D750 8009D750 CB000424 */   addiu     $a0, $zero, 0xCB
    /* 8D754 8009D754 21204002 */  addu       $a0, $s2, $zero
    /* 8D758 8009D758 21280000 */  addu       $a1, $zero, $zero
    /* 8D75C 8009D75C 0B000624 */  addiu      $a2, $zero, 0xB
    /* 8D760 8009D760 21384000 */  addu       $a3, $v0, $zero
    /* 8D764 8009D764 1280033C */  lui        $v1, %hi(GOLDR)
    /* 8D768 8009D768 DAAB6390 */  lbu        $v1, %lo(GOLDR)($v1)
    /* 8D76C 8009D76C 1280083C */  lui        $t0, %hi(GOLDG)
    /* 8D770 8009D770 DBAB0891 */  lbu        $t0, %lo(GOLDG)($t0)
    /* 8D774 8009D774 1280093C */  lui        $t1, %hi(GOLDB)
    /* 8D778 8009D778 DCAB2991 */  lbu        $t1, %lo(GOLDB)($t1)
    /* 8D77C 8009D77C 01000224 */  addiu      $v0, $zero, 0x1
    /* 8D780 8009D780 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8D784 8009D784 1280023C */  lui        $v0, %hi(D_8011C6D0)
    /* 8D788 8009D788 D0C64224 */  addiu      $v0, $v0, %lo(D_8011C6D0)
    /* 8D78C 8009D78C 1400A2AF */  sw         $v0, 0x14($sp)
  .L8009D790:
    /* 8D790 8009D790 1800A3AF */  sw         $v1, 0x18($sp)
    /* 8D794 8009D794 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 8D798 8009D798 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 8D79C 8009D79C 2000A9AF */   sw        $t1, 0x20($sp)
    /* 8D7A0 8009D7A0 1280043C */  lui        $a0, %hi(D_8011CDF0)
    /* 8D7A4 8009D7A4 F0CD8424 */  addiu      $a0, $a0, %lo(D_8011CDF0)
    /* 8D7A8 8009D7A8 10000524 */  addiu      $a1, $zero, 0x10
    /* 8D7AC 8009D7AC 34000624 */  addiu      $a2, $zero, 0x34
    /* 8D7B0 8009D7B0 19010724 */  addiu      $a3, $zero, 0x119
    /* 8D7B4 8009D7B4 9A000224 */  addiu      $v0, $zero, 0x9A
    /* 8D7B8 8009D7B8 B82F020C */  jal        Back__6Dialogiiii
    /* 8D7BC 8009D7BC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 8D7C0 8009D7C0 21800000 */  addu       $s0, $zero, $zero
    /* 8D7C4 8009D7C4 0D80113C */  lui        $s1, %hi(tempstr)
    /* 8D7C8 8009D7C8 10EA3126 */  addiu      $s1, $s1, %lo(tempstr)
    /* 8D7CC 8009D7CC 01000224 */  addiu      $v0, $zero, 0x1
    /* 8D7D0 8009D7D0 1280013C */  lui        $at, %hi(buttoncol)
    /* 8D7D4 8009D7D4 E0AB22AC */  sw         $v0, %lo(buttoncol)($at)
  .L8009D7D8:
    /* 8D7D8 8009D7D8 1280033C */  lui        $v1, %hi(FeFlag)
    /* 8D7DC 8009D7DC 74B36390 */  lbu        $v1, %lo(FeFlag)($v1)
    /* 8D7E0 8009D7E0 10000224 */  addiu      $v0, $zero, 0x10
    /* 8D7E4 8009D7E4 501F82A7 */  sh         $v0, %gp_rel(D_8011C6D0)($gp)
    /* 8D7E8 8009D7E8 34000224 */  addiu      $v0, $zero, 0x34
    /* 8D7EC 8009D7EC 521F82A7 */  sh         $v0, %gp_rel(D_8011C6D2)($gp)
    /* 8D7F0 8009D7F0 19010224 */  addiu      $v0, $zero, 0x119
    /* 8D7F4 8009D7F4 541F82A7 */  sh         $v0, %gp_rel(D_8011C6D4)($gp)
    /* 8D7F8 8009D7F8 9A000224 */  addiu      $v0, $zero, 0x9A
    /* 8D7FC 8009D7FC 561F82A7 */  sh         $v0, %gp_rel(D_8011C6D6)($gp)
    /* 8D800 8009D800 0E006010 */  beqz       $v1, .L8009D83C
    /* 8D804 8009D804 21202002 */   addu      $a0, $s1, $zero
    /* 8D808 8009D808 1280023C */  lui        $v0, %hi(options_pad)
    /* 8D80C 8009D80C 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 8D810 8009D810 00000000 */  nop
    /* 8D814 8009D814 05004014 */  bnez       $v0, .L8009D82C
    /* 8D818 8009D818 00000000 */   nop
    /* 8D81C 8009D81C 4AED010C */  jal        GetStr__Fi
    /* 8D820 8009D820 12030424 */   addiu     $a0, $zero, 0x312
    /* 8D824 8009D824 1E760208 */  j          .L8009D878
    /* 8D828 8009D828 21202002 */   addu      $a0, $s1, $zero
  .L8009D82C:
    /* 8D82C 8009D82C 4AED010C */  jal        GetStr__Fi
    /* 8D830 8009D830 13030424 */   addiu     $a0, $zero, 0x313
    /* 8D834 8009D834 1E760208 */  j          .L8009D878
    /* 8D838 8009D838 21202002 */   addu      $a0, $s1, $zero
  .L8009D83C:
    /* 8D83C 8009D83C 1280023C */  lui        $v0, %hi(options_pad)
    /* 8D840 8009D840 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 8D844 8009D844 00000000 */  nop
    /* 8D848 8009D848 40180200 */  sll        $v1, $v0, 1
    /* 8D84C 8009D84C 21186200 */  addu       $v1, $v1, $v0
    /* 8D850 8009D850 80180300 */  sll        $v1, $v1, 2
    /* 8D854 8009D854 21186200 */  addu       $v1, $v1, $v0
    /* 8D858 8009D858 00190300 */  sll        $v1, $v1, 4
    /* 8D85C 8009D85C 23186200 */  subu       $v1, $v1, $v0
    /* 8D860 8009D860 80180300 */  sll        $v1, $v1, 2
    /* 8D864 8009D864 21186200 */  addu       $v1, $v1, $v0
    /* 8D868 8009D868 C0180300 */  sll        $v1, $v1, 3
    /* 8D86C 8009D86C 0E80023C */  lui        $v0, %hi(plr + 0xD6)
    /* 8D870 8009D870 0EA64224 */  addiu      $v0, $v0, %lo(plr + 0xD6)
    /* 8D874 8009D874 21106200 */  addu       $v0, $v1, $v0
  .L8009D878:
    /* 8D878 8009D878 F240000C */  jal        strcpy
    /* 8D87C 8009D87C 21284000 */   addu      $a1, $v0, $zero
    /* 8D880 8009D880 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 8D884 8009D884 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 8D888 8009D888 21280000 */  addu       $a1, $zero, $zero
    /* 8D88C 8009D88C 0C000624 */  addiu      $a2, $zero, 0xC
    /* 8D890 8009D890 21382002 */  addu       $a3, $s1, $zero
    /* 8D894 8009D894 1280033C */  lui        $v1, %hi(BLUER)
    /* 8D898 8009D898 D4AB6390 */  lbu        $v1, %lo(BLUER)($v1)
    /* 8D89C 8009D89C 1280083C */  lui        $t0, %hi(BLUEG)
    /* 8D8A0 8009D8A0 D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 8D8A4 8009D8A4 1280093C */  lui        $t1, %hi(BLUEB)
    /* 8D8A8 8009D8A8 D6AB2991 */  lbu        $t1, %lo(BLUEB)($t1)
    /* 8D8AC 8009D8AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 8D8B0 8009D8B0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8D8B4 8009D8B4 1280023C */  lui        $v0, %hi(D_8011C6D0)
    /* 8D8B8 8009D8B8 D0C64224 */  addiu      $v0, $v0, %lo(D_8011C6D0)
    /* 8D8BC 8009D8BC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 8D8C0 8009D8C0 1800A3AF */  sw         $v1, 0x18($sp)
    /* 8D8C4 8009D8C4 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 8D8C8 8009D8C8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 8D8CC 8009D8CC 2000A9AF */   sw        $t1, 0x20($sp)
    /* 8D8D0 8009D8D0 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8D8D4 8009D8D4 00000000 */  nop
    /* 8D8D8 8009D8D8 07000216 */  bne        $s0, $v0, .L8009D8F8
    /* 8D8DC 8009D8DC 21200000 */   addu      $a0, $zero, $zero
    /* 8D8E0 8009D8E0 01000624 */  addiu      $a2, $zero, 0x1
    /* 8D8E4 8009D8E4 21380002 */  addu       $a3, $s0, $zero
    /* 8D8E8 8009D8E8 9C08858F */  lw         $a1, %gp_rel(D_8011B01C)($gp)
    /* 8D8EC 8009D8EC 03000224 */  addiu      $v0, $zero, 0x3
    /* 8D8F0 8009D8F0 42760208 */  j          .L8009D908
    /* 8D8F4 8009D8F4 1000A2AF */   sw        $v0, 0x10($sp)
  .L8009D8F8:
    /* 8D8F8 8009D8F8 01000624 */  addiu      $a2, $zero, 0x1
    /* 8D8FC 8009D8FC 9C08858F */  lw         $a1, %gp_rel(D_8011B01C)($gp)
    /* 8D900 8009D900 21380002 */  addu       $a3, $s0, $zero
    /* 8D904 8009D904 1000A0AF */  sw         $zero, 0x10($sp)
  .L8009D908:
    /* 8D908 8009D908 23280502 */  subu       $a1, $s0, $a1
    /* 8D90C 8009D90C 00290500 */  sll        $a1, $a1, 4
    /* 8D910 8009D910 2174020C */  jal        PrintCtrlString__FiiUcic
    /* 8D914 8009D914 2000A524 */   addiu     $a1, $a1, 0x20
    /* 8D918 8009D918 01001026 */  addiu      $s0, $s0, 0x1
    /* 8D91C 8009D91C 1400022A */  slti       $v0, $s0, 0x14
    /* 8D920 8009D920 ADFF4014 */  bnez       $v0, .L8009D7D8
    /* 8D924 8009D924 00000000 */   nop
    /* 8D928 8009D928 491F8283 */  lb         $v0, %gp_rel(D_8011C6C9)($gp)
    /* 8D92C 8009D92C 00000000 */  nop
    /* 8D930 8009D930 0E004014 */  bnez       $v0, .L8009D96C
    /* 8D934 8009D934 00000000 */   nop
    /* 8D938 8009D938 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8D93C 8009D93C 00000000 */  nop
    /* 8D940 8009D940 02004228 */  slti       $v0, $v0, 0x2
    /* 8D944 8009D944 05004010 */  beqz       $v0, .L8009D95C
    /* 8D948 8009D948 00000000 */   nop
    /* 8D94C 8009D94C 349A020C */  jal        PrintSelectBack__FUs
    /* 8D950 8009D950 E6040424 */   addiu     $a0, $zero, 0x4E6
    /* 8D954 8009D954 A2760208 */  j          .L8009DA88
    /* 8D958 8009D958 00000000 */   nop
  .L8009D95C:
    /* 8D95C 8009D95C 349A020C */  jal        PrintSelectBack__FUs
    /* 8D960 8009D960 A0040424 */   addiu     $a0, $zero, 0x4A0
    /* 8D964 8009D964 A2760208 */  j          .L8009DA88
    /* 8D968 8009D968 00000000 */   nop
  .L8009D96C:
    /* 8D96C 8009D96C 4AED010C */  jal        GetStr__Fi
    /* 8D970 8009D970 2D030424 */   addiu     $a0, $zero, 0x32D
    /* 8D974 8009D974 0D80133C */  lui        $s3, %hi(tempstr)
    /* 8D978 8009D978 10EA7326 */  addiu      $s3, $s3, %lo(tempstr)
    /* 8D97C 8009D97C 21206002 */  addu       $a0, $s3, $zero
    /* 8D980 8009D980 1280063C */  lui        $a2, %hi(D_8011B088)
    /* 8D984 8009D984 88B0C624 */  addiu      $a2, $a2, %lo(D_8011B088)
    /* 8D988 8009D988 9767000C */  jal        sprintf
    /* 8D98C 8009D98C 21284000 */   addu      $a1, $v0, $zero
    /* 8D990 8009D990 0C80123C */  lui        $s2, %hi(MediumFont)
    /* 8D994 8009D994 D8825226 */  addiu      $s2, $s2, %lo(MediumFont)
    /* 8D998 8009D998 21204002 */  addu       $a0, $s2, $zero
    /* 8D99C 8009D99C A92A020C */  jal        GetStrWidth__5CFontPc
    /* 8D9A0 8009D9A0 21286002 */   addu      $a1, $s3, $zero
    /* 8D9A4 8009D9A4 481F8383 */  lb         $v1, %gp_rel(D_8011C6C8)($gp)
    /* 8D9A8 8009D9A8 00000000 */  nop
    /* 8D9AC 8009D9AC 00190300 */  sll        $v1, $v1, 4
    /* 8D9B0 8009D9B0 0D80013C */  lui        $at, %hi(txt_actions)
    /* 8D9B4 8009D9B4 21082300 */  addu       $at, $at, $v1
    /* 8D9B8 8009D9B8 0CC4248C */  lw         $a0, %lo(txt_actions)($at)
    /* 8D9BC 8009D9BC 4AED010C */  jal        GetStr__Fi
    /* 8D9C0 8009D9C0 21884000 */   addu      $s1, $v0, $zero
    /* 8D9C4 8009D9C4 21204002 */  addu       $a0, $s2, $zero
    /* 8D9C8 8009D9C8 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 8D9CC 8009D9CC 21284000 */   addu      $a1, $v0, $zero
    /* 8D9D0 8009D9D0 21204002 */  addu       $a0, $s2, $zero
    /* 8D9D4 8009D9D4 21102202 */  addu       $v0, $s1, $v0
    /* 8D9D8 8009D9D8 00011024 */  addiu      $s0, $zero, 0x100
    /* 8D9DC 8009D9DC 23800202 */  subu       $s0, $s0, $v0
    /* 8D9E0 8009D9E0 C2171000 */  srl        $v0, $s0, 31
    /* 8D9E4 8009D9E4 21800202 */  addu       $s0, $s0, $v0
    /* 8D9E8 8009D9E8 43801000 */  sra        $s0, $s0, 1
    /* 8D9EC 8009D9EC 20000526 */  addiu      $a1, $s0, 0x20
    /* 8D9F0 8009D9F0 E0000624 */  addiu      $a2, $zero, 0xE0
    /* 8D9F4 8009D9F4 1280023C */  lui        $v0, %hi(WHITER)
    /* 8D9F8 8009D9F8 D1AB4290 */  lbu        $v0, %lo(WHITER)($v0)
    /* 8D9FC 8009D9FC 1280033C */  lui        $v1, %hi(WHITEG)
    /* 8DA00 8009DA00 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 8DA04 8009DA04 1280083C */  lui        $t0, %hi(WHITEB)
    /* 8DA08 8009DA08 D3AB0891 */  lbu        $t0, %lo(WHITEB)($t0)
    /* 8DA0C 8009DA0C 21386002 */  addu       $a3, $s3, $zero
    /* 8DA10 8009DA10 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8DA14 8009DA14 1400A0AF */  sw         $zero, 0x14($sp)
    /* 8DA18 8009DA18 1800A2AF */  sw         $v0, 0x18($sp)
    /* 8DA1C 8009DA1C 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 8DA20 8009DA20 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 8DA24 8009DA24 2000A8AF */   sw        $t0, 0x20($sp)
    /* 8DA28 8009DA28 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8DA2C 8009DA2C 00000000 */  nop
    /* 8DA30 8009DA30 00110200 */  sll        $v0, $v0, 4
    /* 8DA34 8009DA34 0D80013C */  lui        $at, %hi(txt_actions)
    /* 8DA38 8009DA38 21082200 */  addu       $at, $at, $v0
    /* 8DA3C 8009DA3C 0CC4248C */  lw         $a0, %lo(txt_actions)($at)
    /* 8DA40 8009DA40 4AED010C */  jal        GetStr__Fi
    /* 8DA44 8009DA44 20003126 */   addiu     $s1, $s1, 0x20
    /* 8DA48 8009DA48 21204002 */  addu       $a0, $s2, $zero
    /* 8DA4C 8009DA4C 21281102 */  addu       $a1, $s0, $s1
    /* 8DA50 8009DA50 E0000624 */  addiu      $a2, $zero, 0xE0
    /* 8DA54 8009DA54 1280033C */  lui        $v1, %hi(GOLDR)
    /* 8DA58 8009DA58 DAAB6390 */  lbu        $v1, %lo(GOLDR)($v1)
    /* 8DA5C 8009DA5C 1280083C */  lui        $t0, %hi(GOLDG)
    /* 8DA60 8009DA60 DBAB0891 */  lbu        $t0, %lo(GOLDG)($t0)
    /* 8DA64 8009DA64 1280093C */  lui        $t1, %hi(GOLDB)
    /* 8DA68 8009DA68 DCAB2991 */  lbu        $t1, %lo(GOLDB)($t1)
    /* 8DA6C 8009DA6C 21384000 */  addu       $a3, $v0, $zero
    /* 8DA70 8009DA70 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8DA74 8009DA74 1400A0AF */  sw         $zero, 0x14($sp)
    /* 8DA78 8009DA78 1800A3AF */  sw         $v1, 0x18($sp)
    /* 8DA7C 8009DA7C 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 8DA80 8009DA80 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 8DA84 8009DA84 2000A9AF */   sw        $t1, 0x20($sp)
  .L8009DA88:
    /* 8DA88 8009DA88 1280013C */  lui        $at, %hi(buttoncol)
    /* 8DA8C 8009DA8C E0AB20AC */  sw         $zero, %lo(buttoncol)($at)
    /* 8DA90 8009DA90 1280043C */  lui        $a0, %hi(D_8011CDF0)
    /* 8DA94 8009DA94 F0CD8424 */  addiu      $a0, $a0, %lo(D_8011CDF0)
    /* 8DA98 8009DA98 8A34020C */  jal        SetOTpos__6Dialogi
    /* 8DA9C 8009DA9C 2128A002 */   addu      $a1, $s5, $zero
    /* 8DAA0 8009DAA0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 8DAA4 8009DAA4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 8DAA8 8009DAA8 E82A020C */  jal        SetOTpos__5CFonti
    /* 8DAAC 8009DAAC 21288002 */   addu      $a1, $s4, $zero
  .L8009DAB0:
    /* 8DAB0 8009DAB0 4000BF8F */  lw         $ra, 0x40($sp)
    /* 8DAB4 8009DAB4 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 8DAB8 8009DAB8 3800B48F */  lw         $s4, 0x38($sp)
    /* 8DABC 8009DABC 3400B38F */  lw         $s3, 0x34($sp)
    /* 8DAC0 8009DAC0 3000B28F */  lw         $s2, 0x30($sp)
    /* 8DAC4 8009DAC4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 8DAC8 8009DAC8 2800B08F */  lw         $s0, 0x28($sp)
    /* 8DACC 8009DACC 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 8DAD0 8009DAD0 0800E003 */  jr         $ra
    /* 8DAD4 8009DAD4 00000000 */   nop
endlabel DrawCtrlSetup__Fv
