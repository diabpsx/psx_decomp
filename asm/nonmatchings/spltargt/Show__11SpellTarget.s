.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Show__11SpellTarget, 0x51C

glabel Show__11SpellTarget
    /* 9F7F8 800AF7F8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 9F7FC 800AF7FC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 9F800 800AF800 21888000 */  addu       $s1, $a0, $zero
    /* 9F804 800AF804 3000BFAF */  sw         $ra, 0x30($sp)
    /* 9F808 800AF808 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 9F80C 800AF80C 2800B4AF */  sw         $s4, 0x28($sp)
    /* 9F810 800AF810 2400B3AF */  sw         $s3, 0x24($sp)
    /* 9F814 800AF814 2000B2AF */  sw         $s2, 0x20($sp)
    /* 9F818 800AF818 1800B0AF */  sw         $s0, 0x18($sp)
    /* 9F81C 800AF81C 1C00248E */  lw         $a0, 0x1C($s1)
    /* 9F820 800AF820 21280000 */  addu       $a1, $zero, $zero
    /* 9F824 800AF824 1000A0AF */  sw         $zero, 0x10($sp)
    /* 9F828 800AF828 FD25020C */  jal        PAD_GetPad__FiUc
    /* 9F82C 800AF82C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 9F830 800AF830 21804000 */  addu       $s0, $v0, $zero
    /* 9F834 800AF834 1080033C */  lui        $v1, %hi(AiProc + 0x18)
    /* 9F838 800AF838 2C536324 */  addiu      $v1, $v1, %lo(AiProc + 0x18)
    /* 9F83C 800AF83C 00002592 */  lbu        $a1, 0x0($s1)
    /* 9F840 800AF840 0400248E */  lw         $a0, 0x4($s1)
    /* 9F844 800AF844 40100500 */  sll        $v0, $a1, 1
    /* 9F848 800AF848 21104500 */  addu       $v0, $v0, $a1
    /* 9F84C 800AF84C 80100200 */  sll        $v0, $v0, 2
    /* 9F850 800AF850 21104500 */  addu       $v0, $v0, $a1
    /* 9F854 800AF854 C0100200 */  sll        $v0, $v0, 3
    /* 9F858 800AF858 03008014 */  bnez       $a0, .L800AF868
    /* 9F85C 800AF85C 21984300 */   addu      $s3, $v0, $v1
    /* 9F860 800AF860 2201A010 */  beqz       $a1, .L800AFCEC
    /* 9F864 800AF864 00000000 */   nop
  .L800AF868:
    /* 9F868 800AF868 1280023C */  lui        $v0, %hi(invflag)
    /* 9F86C 800AF86C 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 9F870 800AF870 00000000 */  nop
    /* 9F874 800AF874 1D014014 */  bnez       $v0, .L800AFCEC
    /* 9F878 800AF878 00000000 */   nop
    /* 9F87C 800AF87C 0C003486 */  lh         $s4, 0xC($s1)
    /* 9F880 800AF880 0E003586 */  lh         $s5, 0xE($s1)
    /* 9F884 800AF884 4C00A014 */  bnez       $a1, .L800AF9B8
    /* 9F888 800AF888 00000000 */   nop
    /* 9F88C 800AF88C 1C00248E */  lw         $a0, 0x1C($s1)
    /* 9F890 800AF890 E4DF010C */  jal        ClrCursor__Fi
    /* 9F894 800AF894 21908002 */   addu      $s2, $s4, $zero
    /* 9F898 800AF898 BDC0020C */  jal        GetCur__C4CPad_800b02f4
    /* 9F89C 800AF89C 21200002 */   addu      $a0, $s0, $zero
    /* 9F8A0 800AF8A0 1C00248E */  lw         $a0, 0x1C($s1)
    /* 9F8A4 800AF8A4 1FEC010C */  jal        GetPadStyle__Fi
    /* 9F8A8 800AF8A8 0F005030 */   andi      $s0, $v0, 0xF
    /* 9F8AC 800AF8AC 21200002 */  addu       $a0, $s0, $zero
    /* 9F8B0 800AF8B0 00160200 */  sll        $v0, $v0, 24
    /* 9F8B4 800AF8B4 30E1010C */  jal        pad_UpIsUpRight__Fic
    /* 9F8B8 800AF8B8 032E0200 */   sra       $a1, $v0, 24
    /* 9F8BC 800AF8BC 00160200 */  sll        $v0, $v0, 24
    /* 9F8C0 800AF8C0 03160200 */  sra        $v0, $v0, 24
    /* 9F8C4 800AF8C4 1280013C */  lui        $at, %hi(offset_x)
    /* 9F8C8 800AF8C8 21082200 */  addu       $at, $at, $v0
    /* 9F8CC 800AF8CC A8C22680 */  lb         $a2, %lo(offset_x)($at)
    /* 9F8D0 800AF8D0 2180A002 */  addu       $s0, $s5, $zero
    /* 9F8D4 800AF8D4 1000A6AF */  sw         $a2, 0x10($sp)
    /* 9F8D8 800AF8D8 1280013C */  lui        $at, %hi(offset_y)
    /* 9F8DC 800AF8DC 21082200 */  addu       $at, $at, $v0
    /* 9F8E0 800AF8E0 B0C22580 */  lb         $a1, %lo(offset_y)($at)
    /* 9F8E4 800AF8E4 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 9F8E8 800AF8E8 1D004310 */  beq        $v0, $v1, .L800AF960
    /* 9F8EC 800AF8EC 1400A5AF */   sw        $a1, 0x14($sp)
    /* 9F8F0 800AF8F0 40100600 */  sll        $v0, $a2, 1
    /* 9F8F4 800AF8F4 21904202 */  addu       $s2, $s2, $v0
    /* 9F8F8 800AF8F8 40100500 */  sll        $v0, $a1, 1
    /* 9F8FC 800AF8FC 1800248E */  lw         $a0, 0x18($s1)
    /* 9F900 800AF900 21800202 */  addu       $s0, $s0, $v0
    /* 9F904 800AF904 30008384 */  lh         $v1, 0x30($a0)
    /* 9F908 800AF908 C3101200 */  sra        $v0, $s2, 3
    /* 9F90C 800AF90C 0B006214 */  bne        $v1, $v0, .L800AF93C
    /* 9F910 800AF910 F0FF4224 */   addiu     $v0, $v0, -0x10
    /* 9F914 800AF914 32008384 */  lh         $v1, 0x32($a0)
    /* 9F918 800AF918 C3101000 */  sra        $v0, $s0, 3
    /* 9F91C 800AF91C 06006214 */  bne        $v1, $v0, .L800AF938
    /* 9F920 800AF920 C3101200 */   sra       $v0, $s2, 3
    /* 9F924 800AF924 C0100600 */  sll        $v0, $a2, 3
    /* 9F928 800AF928 21904202 */  addu       $s2, $s2, $v0
    /* 9F92C 800AF92C C0100500 */  sll        $v0, $a1, 3
    /* 9F930 800AF930 21800202 */  addu       $s0, $s0, $v0
    /* 9F934 800AF934 C3101200 */  sra        $v0, $s2, 3
  .L800AF938:
    /* 9F938 800AF938 F0FF4224 */  addiu      $v0, $v0, -0x10
  .L800AF93C:
    /* 9F93C 800AF93C 5200422C */  sltiu      $v0, $v0, 0x52
    /* 9F940 800AF940 02004014 */  bnez       $v0, .L800AF94C
    /* 9F944 800AF944 C3101000 */   sra       $v0, $s0, 3
    /* 9F948 800AF948 21908002 */  addu       $s2, $s4, $zero
  .L800AF94C:
    /* 9F94C 800AF94C F0FF4224 */  addiu      $v0, $v0, -0x10
    /* 9F950 800AF950 5200422C */  sltiu      $v0, $v0, 0x52
    /* 9F954 800AF954 03004014 */  bnez       $v0, .L800AF964
    /* 9F958 800AF958 C3201200 */   sra       $a0, $s2, 3
    /* 9F95C 800AF95C 2180A002 */  addu       $s0, $s5, $zero
  .L800AF960:
    /* 9F960 800AF960 C3201200 */  sra        $a0, $s2, 3
  .L800AF964:
    /* 9F964 800AF964 C3281000 */  sra        $a1, $s0, 3
    /* 9F968 800AF968 C0180500 */  sll        $v1, $a1, 3
    /* 9F96C 800AF96C C0100400 */  sll        $v0, $a0, 3
    /* 9F970 800AF970 23104400 */  subu       $v0, $v0, $a0
    /* 9F974 800AF974 C0110200 */  sll        $v0, $v0, 7
    /* 9F978 800AF978 21186200 */  addu       $v1, $v1, $v0
    /* 9F97C 800AF97C 1C00228E */  lw         $v0, 0x1C($s1)
    /* 9F980 800AF980 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 9F984 800AF984 21082300 */  addu       $at, $at, $v1
    /* 9F988 800AF988 2E7A2380 */  lb         $v1, %lo(dung_map + 0x6)($at)
    /* 9F98C 800AF98C 01004224 */  addiu      $v0, $v0, 0x1
    /* 9F990 800AF990 24186200 */  and        $v1, $v1, $v0
    /* 9F994 800AF994 35006010 */  beqz       $v1, .L800AFA6C
    /* 9F998 800AF998 00000000 */   nop
    /* 9F99C 800AF99C 1800228E */  lw         $v0, 0x18($s1)
    /* 9F9A0 800AF9A0 00000000 */  nop
    /* 9F9A4 800AF9A4 60004380 */  lb         $v1, 0x60($v0)
    /* 9F9A8 800AF9A8 C98D020C */  jal        CheckRangeObject__Fiii
    /* 9F9AC 800AF9AC 01000624 */   addiu     $a2, $zero, 0x1
    /* 9F9B0 800AF9B0 9BBE0208 */  j          .L800AFA6C
    /* 9F9B4 800AF9B4 00000000 */   nop
  .L800AF9B8:
    /* 9F9B8 800AF9B8 1800228E */  lw         $v0, 0x18($s1)
    /* 9F9BC 800AF9BC 00000000 */  nop
    /* 9F9C0 800AF9C0 6400448C */  lw         $a0, 0x64($v0)
    /* 9F9C4 800AF9C4 3CBC020C */  jal        IsAutoTarget__Fi
    /* 9F9C8 800AF9C8 00000000 */   nop
    /* 9F9CC 800AF9CC 01004238 */  xori       $v0, $v0, 0x1
    /* 9F9D0 800AF9D0 0C004014 */  bnez       $v0, .L800AFA04
    /* 9F9D4 800AF9D4 00000000 */   nop
    /* 9F9D8 800AF9D8 1800228E */  lw         $v0, 0x18($s1)
    /* 9F9DC 800AF9DC 00000000 */  nop
    /* 9F9E0 800AF9E0 68004380 */  lb         $v1, 0x68($v0)
    /* 9F9E4 800AF9E4 04000224 */  addiu      $v0, $zero, 0x4
    /* 9F9E8 800AF9E8 06006210 */  beq        $v1, $v0, .L800AFA04
    /* 9F9EC 800AF9EC 00000000 */   nop
    /* 9F9F0 800AF9F0 1000628E */  lw         $v0, 0x10($s3)
    /* 9F9F4 800AF9F4 00000000 */  nop
    /* 9F9F8 800AF9F8 83110200 */  sra        $v0, $v0, 6
    /* 9F9FC 800AF9FC 0300401C */  bgtz       $v0, .L800AFA0C
    /* 9FA00 800AFA00 00000000 */   nop
  .L800AFA04:
    /* 9FA04 800AFA04 3BBF0208 */  j          .L800AFCEC
    /* 9FA08 800AFA08 000020A2 */   sb        $zero, 0x0($s1)
  .L800AFA0C:
    /* 9FA0C 800AFA0C 34006282 */  lb         $v0, 0x34($s3)
    /* 9FA10 800AFA10 00000000 */  nop
    /* 9FA14 800AFA14 C0900200 */  sll        $s2, $v0, 3
    /* 9FA18 800AFA18 35006282 */  lb         $v0, 0x35($s3)
    /* 9FA1C 800AFA1C 1400238E */  lw         $v1, 0x14($s1)
    /* 9FA20 800AFA20 00000000 */  nop
    /* 9FA24 800AFA24 04006014 */  bnez       $v1, .L800AFA38
    /* 9FA28 800AFA28 C0800200 */   sll       $s0, $v0, 3
    /* 9FA2C 800AFA2C 080032A6 */  sh         $s2, 0x8($s1)
    /* 9FA30 800AFA30 9BBE0208 */  j          .L800AFA6C
    /* 9FA34 800AFA34 0A0030A6 */   sh        $s0, 0xA($s1)
  .L800AFA38:
    /* 9FA38 800AFA38 08002296 */  lhu        $v0, 0x8($s1)
    /* 9FA3C 800AFA3C C3181200 */  sra        $v1, $s2, 3
    /* 9FA40 800AFA40 00140200 */  sll        $v0, $v0, 16
    /* 9FA44 800AFA44 C3140200 */  sra        $v0, $v0, 19
    /* 9FA48 800AFA48 08004314 */  bne        $v0, $v1, .L800AFA6C
    /* 9FA4C 800AFA4C C3181000 */   sra       $v1, $s0, 3
    /* 9FA50 800AFA50 0A002296 */  lhu        $v0, 0xA($s1)
    /* 9FA54 800AFA54 00000000 */  nop
    /* 9FA58 800AFA58 00140200 */  sll        $v0, $v0, 16
    /* 9FA5C 800AFA5C C3140200 */  sra        $v0, $v0, 19
    /* 9FA60 800AFA60 02004314 */  bne        $v0, $v1, .L800AFA6C
    /* 9FA64 800AFA64 00000000 */   nop
    /* 9FA68 800AFA68 140020AE */  sw         $zero, 0x14($s1)
  .L800AFA6C:
    /* 9FA6C 800AFA6C 08002596 */  lhu        $a1, 0x8($s1)
    /* 9FA70 800AFA70 FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 9FA74 800AFA74 24204202 */  and        $a0, $s2, $v0
    /* 9FA78 800AFA78 2418A200 */  and        $v1, $a1, $v0
    /* 9FA7C 800AFA7C 001C0300 */  sll        $v1, $v1, 16
    /* 9FA80 800AFA80 031C0300 */  sra        $v1, $v1, 16
    /* 9FA84 800AFA84 2A106400 */  slt        $v0, $v1, $a0
    /* 9FA88 800AFA88 04004014 */  bnez       $v0, .L800AFA9C
    /* 9FA8C 800AFA8C 0200A224 */   addiu     $v0, $a1, 0x2
    /* 9FA90 800AFA90 2A108300 */  slt        $v0, $a0, $v1
    /* 9FA94 800AFA94 02004010 */  beqz       $v0, .L800AFAA0
    /* 9FA98 800AFA98 FEFFA224 */   addiu     $v0, $a1, -0x2
  .L800AFA9C:
    /* 9FA9C 800AFA9C 080022A6 */  sh         $v0, 0x8($s1)
  .L800AFAA0:
    /* 9FAA0 800AFAA0 0A002596 */  lhu        $a1, 0xA($s1)
    /* 9FAA4 800AFAA4 FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 9FAA8 800AFAA8 24200202 */  and        $a0, $s0, $v0
    /* 9FAAC 800AFAAC 2418A200 */  and        $v1, $a1, $v0
    /* 9FAB0 800AFAB0 001C0300 */  sll        $v1, $v1, 16
    /* 9FAB4 800AFAB4 031C0300 */  sra        $v1, $v1, 16
    /* 9FAB8 800AFAB8 2A106400 */  slt        $v0, $v1, $a0
    /* 9FABC 800AFABC 04004014 */  bnez       $v0, .L800AFAD0
    /* 9FAC0 800AFAC0 0200A224 */   addiu     $v0, $a1, 0x2
    /* 9FAC4 800AFAC4 2A108300 */  slt        $v0, $a0, $v1
    /* 9FAC8 800AFAC8 02004010 */  beqz       $v0, .L800AFAD4
    /* 9FACC 800AFACC FEFFA224 */   addiu     $v0, $a1, -0x2
  .L800AFAD0:
    /* 9FAD0 800AFAD0 0A0022A6 */  sh         $v0, 0xA($s1)
  .L800AFAD4:
    /* 9FAD4 800AFAD4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 9FAD8 800AFAD8 08002286 */  lh         $v0, 0x8($s1)
    /* 9FADC 800AFADC 0A002386 */  lh         $v1, 0xA($s1)
    /* 9FAE0 800AFAE0 1400A527 */  addiu      $a1, $sp, 0x14
    /* 9FAE4 800AFAE4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9FAE8 800AFAE8 6FBC020C */  jal        GetScrXY__FPiT0
    /* 9FAEC 800AFAEC 1400A3AF */   sw        $v1, 0x14($sp)
    /* 9FAF0 800AFAF0 00002292 */  lbu        $v0, 0x0($s1)
    /* 9FAF4 800AFAF4 00000000 */  nop
    /* 9FAF8 800AFAF8 34004014 */  bnez       $v0, .L800AFBCC
    /* 9FAFC 800AFAFC 00000000 */   nop
  .L800AFB00:
    /* 9FB00 800AFB00 1000A28F */  lw         $v0, 0x10($sp)
    /* 9FB04 800AFB04 00000000 */  nop
    /* 9FB08 800AFB08 4101422C */  sltiu      $v0, $v0, 0x141
    /* 9FB0C 800AFB0C 06004010 */  beqz       $v0, .L800AFB28
    /* 9FB10 800AFB10 00000000 */   nop
    /* 9FB14 800AFB14 1400A28F */  lw         $v0, 0x14($sp)
    /* 9FB18 800AFB18 00000000 */  nop
    /* 9FB1C 800AFB1C F100422C */  sltiu      $v0, $v0, 0xF1
    /* 9FB20 800AFB20 21004014 */  bnez       $v0, .L800AFBA8
    /* 9FB24 800AFB24 00000000 */   nop
  .L800AFB28:
    /* 9FB28 800AFB28 0C002486 */  lh         $a0, 0xC($s1)
    /* 9FB2C 800AFB2C 1800228E */  lw         $v0, 0x18($s1)
    /* 9FB30 800AFB30 0E002586 */  lh         $a1, 0xE($s1)
    /* 9FB34 800AFB34 2800468C */  lw         $a2, 0x28($v0)
    /* 9FB38 800AFB38 2C00478C */  lw         $a3, 0x2C($v0)
    /* 9FB3C 800AFB3C 8AF6000C */  jal        GetDirection__Fiiii
    /* 9FB40 800AFB40 00000000 */   nop
    /* 9FB44 800AFB44 1400A527 */  addiu      $a1, $sp, 0x14
    /* 9FB48 800AFB48 1280013C */  lui        $at, %hi(offset_x)
    /* 9FB4C 800AFB4C 21082200 */  addu       $at, $at, $v0
    /* 9FB50 800AFB50 A8C22390 */  lbu        $v1, %lo(offset_x)($at)
    /* 9FB54 800AFB54 08002496 */  lhu        $a0, 0x8($s1)
    /* 9FB58 800AFB58 001E0300 */  sll        $v1, $v1, 24
    /* 9FB5C 800AFB5C 031E0300 */  sra        $v1, $v1, 24
    /* 9FB60 800AFB60 21208300 */  addu       $a0, $a0, $v1
    /* 9FB64 800AFB64 080024A6 */  sh         $a0, 0x8($s1)
    /* 9FB68 800AFB68 1280013C */  lui        $at, %hi(offset_y)
    /* 9FB6C 800AFB6C 21082200 */  addu       $at, $at, $v0
    /* 9FB70 800AFB70 B0C22390 */  lbu        $v1, %lo(offset_y)($at)
    /* 9FB74 800AFB74 0A002296 */  lhu        $v0, 0xA($s1)
    /* 9FB78 800AFB78 001E0300 */  sll        $v1, $v1, 24
    /* 9FB7C 800AFB7C 031E0300 */  sra        $v1, $v1, 24
    /* 9FB80 800AFB80 21104300 */  addu       $v0, $v0, $v1
    /* 9FB84 800AFB84 0A0022A6 */  sh         $v0, 0xA($s1)
    /* 9FB88 800AFB88 08002286 */  lh         $v0, 0x8($s1)
    /* 9FB8C 800AFB8C 0A002386 */  lh         $v1, 0xA($s1)
    /* 9FB90 800AFB90 1000A427 */  addiu      $a0, $sp, 0x10
    /* 9FB94 800AFB94 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9FB98 800AFB98 6FBC020C */  jal        GetScrXY__FPiT0
    /* 9FB9C 800AFB9C 1400A3AF */   sw        $v1, 0x14($sp)
    /* 9FBA0 800AFBA0 C0BE0208 */  j          .L800AFB00
    /* 9FBA4 800AFBA4 00000000 */   nop
  .L800AFBA8:
    /* 9FBA8 800AFBA8 08002496 */  lhu        $a0, 0x8($s1)
    /* 9FBAC 800AFBAC 0A002396 */  lhu        $v1, 0xA($s1)
    /* 9FBB0 800AFBB0 00140400 */  sll        $v0, $a0, 16
    /* 9FBB4 800AFBB4 03940200 */  sra        $s2, $v0, 16
    /* 9FBB8 800AFBB8 00140300 */  sll        $v0, $v1, 16
    /* 9FBBC 800AFBBC 03840200 */  sra        $s0, $v0, 16
    /* 9FBC0 800AFBC0 0C0024A6 */  sh         $a0, 0xC($s1)
    /* 9FBC4 800AFBC4 F5BE0208 */  j          .L800AFBD4
    /* 9FBC8 800AFBC8 0E0023A6 */   sh        $v1, 0xE($s1)
  .L800AFBCC:
    /* 9FBCC 800AFBCC 0C0032A6 */  sh         $s2, 0xC($s1)
    /* 9FBD0 800AFBD0 0E0030A6 */  sh         $s0, 0xE($s1)
  .L800AFBD4:
    /* 9FBD4 800AFBD4 1280143C */  lui        $s4, %hi(sel_data)
    /* 9FBD8 800AFBD8 2CB7948E */  lw         $s4, %lo(sel_data)($s4)
    /* 9FBDC 800AFBDC 1C00228E */  lw         $v0, 0x1C($s1)
    /* 9FBE0 800AFBE0 C3901200 */  sra        $s2, $s2, 3
    /* 9FBE4 800AFBE4 1280013C */  lui        $at, %hi(sel_data)
    /* 9FBE8 800AFBE8 2CB722AC */  sw         $v0, %lo(sel_data)($at)
    /* 9FBEC 800AFBEC 00002292 */  lbu        $v0, 0x0($s1)
    /* 9FBF0 800AFBF0 00000000 */  nop
    /* 9FBF4 800AFBF4 15004010 */  beqz       $v0, .L800AFC4C
    /* 9FBF8 800AFBF8 C3801000 */   sra       $s0, $s0, 3
    /* 9FBFC 800AFBFC 1000A38F */  lw         $v1, 0x10($sp)
    /* 9FC00 800AFC00 3A006292 */  lbu        $v0, 0x3A($s3)
    /* 9FC04 800AFC04 FEFF6324 */  addiu      $v1, $v1, -0x2
    /* 9FC08 800AFC08 00160200 */  sll        $v0, $v0, 24
    /* 9FC0C 800AFC0C 43160200 */  sra        $v0, $v0, 25
    /* 9FC10 800AFC10 21186200 */  addu       $v1, $v1, $v0
    /* 9FC14 800AFC14 1000A3AF */  sw         $v1, 0x10($sp)
    /* 9FC18 800AFC18 1400A38F */  lw         $v1, 0x14($sp)
    /* 9FC1C 800AFC1C 3B006292 */  lbu        $v0, 0x3B($s3)
    /* 9FC20 800AFC20 04006324 */  addiu      $v1, $v1, 0x4
    /* 9FC24 800AFC24 00160200 */  sll        $v0, $v0, 24
    /* 9FC28 800AFC28 43160200 */  sra        $v0, $v0, 25
    /* 9FC2C 800AFC2C 21186200 */  addu       $v1, $v1, $v0
    /* 9FC30 800AFC30 1400A3AF */  sw         $v1, 0x14($sp)
    /* 9FC34 800AFC34 36006292 */  lbu        $v0, 0x36($s3)
    /* 9FC38 800AFC38 00000000 */  nop
    /* 9FC3C 800AFC3C 100022A2 */  sb         $v0, 0x10($s1)
    /* 9FC40 800AFC40 37006292 */  lbu        $v0, 0x37($s3)
    /* 9FC44 800AFC44 15BF0208 */  j          .L800AFC54
    /* 9FC48 800AFC48 110022A2 */   sb        $v0, 0x11($s1)
  .L800AFC4C:
    /* 9FC4C 800AFC4C 100032A2 */  sb         $s2, 0x10($s1)
    /* 9FC50 800AFC50 110030A2 */  sb         $s0, 0x11($s1)
  .L800AFC54:
    /* 9FC54 800AFC54 21202002 */  addu       $a0, $s1, $zero
    /* 9FC58 800AFC58 1400A68F */  lw         $a2, 0x14($sp)
    /* 9FC5C 800AFC5C 1000A58F */  lw         $a1, 0x10($sp)
    /* 9FC60 800AFC60 5FBD020C */  jal        DrawArrow__11SpellTargetii
    /* 9FC64 800AFC64 0A00C624 */   addiu     $a2, $a2, 0xA
    /* 9FC68 800AFC68 1280013C */  lui        $at, %hi(sel_data)
    /* 9FC6C 800AFC6C 2CB734AC */  sw         $s4, %lo(sel_data)($at)
    /* 9FC70 800AFC70 00002292 */  lbu        $v0, 0x0($s1)
    /* 9FC74 800AFC74 00000000 */  nop
    /* 9FC78 800AFC78 1C004014 */  bnez       $v0, .L800AFCEC
    /* 9FC7C 800AFC7C 21284002 */   addu      $a1, $s2, $zero
    /* 9FC80 800AFC80 2400248E */  lw         $a0, 0x24($s1)
    /* 9FC84 800AFC84 E134010C */  jal        ChangeLightXY__Fiii
    /* 9FC88 800AFC88 21300002 */   addu      $a2, $s0, $zero
    /* 9FC8C 800AFC8C 01004232 */  andi       $v0, $s2, 0x1
    /* 9FC90 800AFC90 02004010 */  beqz       $v0, .L800AFC9C
    /* 9FC94 800AFC94 FCFF0524 */   addiu     $a1, $zero, -0x4
    /* 9FC98 800AFC98 04000524 */  addiu      $a1, $zero, 0x4
  .L800AFC9C:
    /* 9FC9C 800AFC9C 01000232 */  andi       $v0, $s0, 0x1
    /* 9FCA0 800AFCA0 02004010 */  beqz       $v0, .L800AFCAC
    /* 9FCA4 800AFCA4 FCFF0624 */   addiu     $a2, $zero, -0x4
    /* 9FCA8 800AFCA8 04000624 */  addiu      $a2, $zero, 0x4
  .L800AFCAC:
    /* 9FCAC 800AFCAC 2400248E */  lw         $a0, 0x24($s1)
    /* 9FCB0 800AFCB0 EE34010C */  jal        ChangeLightOff__Fiii
    /* 9FCB4 800AFCB4 00000000 */   nop
    /* 9FCB8 800AFCB8 1800228E */  lw         $v0, 0x18($s1)
    /* 9FCBC 800AFCBC 21304002 */  addu       $a2, $s2, $zero
    /* 9FCC0 800AFCC0 30004484 */  lh         $a0, 0x30($v0)
    /* 9FCC4 800AFCC4 32004584 */  lh         $a1, 0x32($v0)
    /* 9FCC8 800AFCC8 8AF6000C */  jal        GetDirection__Fiiii
    /* 9FCCC 800AFCCC 21380002 */   addu      $a3, $s0, $zero
    /* 9FCD0 800AFCD0 1800238E */  lw         $v1, 0x18($s1)
    /* 9FCD4 800AFCD4 00000000 */  nop
    /* 9FCD8 800AFCD8 420062A0 */  sb         $v0, 0x42($v1)
    /* 9FCDC 800AFCDC 00160200 */  sll        $v0, $v0, 24
    /* 9FCE0 800AFCE0 1C00248E */  lw         $a0, 0x1C($s1)
    /* 9FCE4 800AFCE4 299B010C */  jal        StartStand__Fii
    /* 9FCE8 800AFCE8 032E0200 */   sra       $a1, $v0, 24
  .L800AFCEC:
    /* 9FCEC 800AFCEC 3000BF8F */  lw         $ra, 0x30($sp)
    /* 9FCF0 800AFCF0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 9FCF4 800AFCF4 2800B48F */  lw         $s4, 0x28($sp)
    /* 9FCF8 800AFCF8 2400B38F */  lw         $s3, 0x24($sp)
    /* 9FCFC 800AFCFC 2000B28F */  lw         $s2, 0x20($sp)
    /* 9FD00 800AFD00 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 9FD04 800AFD04 1800B08F */  lw         $s0, 0x18($sp)
    /* 9FD08 800AFD08 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 9FD0C 800AFD0C 0800E003 */  jr         $ra
    /* 9FD10 800AFD10 00000000 */   nop
endlabel Show__11SpellTarget
