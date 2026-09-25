.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShowCardActionText__Fv, 0x2E4

glabel ShowCardActionText__Fv
    /* 95888 800A5888 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 9588C 800A588C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95890 800A5890 7400BFAF */  sw         $ra, 0x74($sp)
    /* 95894 800A5894 7000BEAF */  sw         $fp, 0x70($sp)
    /* 95898 800A5898 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 9589C 800A589C 6800B6AF */  sw         $s6, 0x68($sp)
    /* 958A0 800A58A0 6400B5AF */  sw         $s5, 0x64($sp)
    /* 958A4 800A58A4 6000B4AF */  sw         $s4, 0x60($sp)
    /* 958A8 800A58A8 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 958AC 800A58AC 5800B2AF */  sw         $s2, 0x58($sp)
    /* 958B0 800A58B0 5400B1AF */  sw         $s1, 0x54($sp)
    /* 958B4 800A58B4 129A020C */  jal        __6Dialog_800a6848
    /* 958B8 800A58B8 5000B0AF */   sw        $s0, 0x50($sp)
    /* 958BC 800A58BC 800A828F */  lw         $v0, %gp_rel(card_active)($gp)
    /* 958C0 800A58C0 00000000 */  nop
    /* 958C4 800A58C4 19004010 */  beqz       $v0, .L800A592C
    /* 958C8 800A58C8 00000000 */   nop
    /* 958CC 800A58CC 840A828F */  lw         $v0, %gp_rel(card_active + 0x4)($gp)
    /* 958D0 800A58D0 00000000 */  nop
    /* 958D4 800A58D4 15004010 */  beqz       $v0, .L800A592C
    /* 958D8 800A58D8 00000000 */   nop
    /* 958DC 800A58DC 900A828F */  lw         $v0, %gp_rel(new_card_flag)($gp)
    /* 958E0 800A58E0 00000000 */  nop
    /* 958E4 800A58E4 2C004014 */  bnez       $v0, .L800A5998
    /* 958E8 800A58E8 49030224 */   addiu     $v0, $zero, 0x349
    /* 958EC 800A58EC 1280023C */  lui        $v0, %hi(card_status)
    /* 958F0 800A58F0 DCB3428C */  lw         $v0, %lo(card_status)($v0)
    /* 958F4 800A58F4 03000324 */  addiu      $v1, $zero, 0x3
    /* 958F8 800A58F8 27004310 */  beq        $v0, $v1, .L800A5998
    /* 958FC 800A58FC 49030224 */   addiu     $v0, $zero, 0x349
    /* 95900 800A5900 940A828F */  lw         $v0, %gp_rel(new_card_flag + 0x4)($gp)
    /* 95904 800A5904 00000000 */  nop
    /* 95908 800A5908 23004014 */  bnez       $v0, .L800A5998
    /* 9590C 800A590C 4A030224 */   addiu     $v0, $zero, 0x34A
    /* 95910 800A5910 1280023C */  lui        $v0, %hi(card_status + 0x4)
    /* 95914 800A5914 E0B3428C */  lw         $v0, %lo(card_status + 0x4)($v0)
    /* 95918 800A5918 00000000 */  nop
    /* 9591C 800A591C 11004314 */  bne        $v0, $v1, .L800A5964
    /* 95920 800A5920 4A030224 */   addiu     $v0, $zero, 0x34A
    /* 95924 800A5924 66960208 */  j          .L800A5998
    /* 95928 800A5928 00000000 */   nop
  .L800A592C:
    /* 9592C 800A592C 1280023C */  lui        $v0, %hi(current_card)
    /* 95930 800A5930 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 95934 800A5934 00000000 */  nop
    /* 95938 800A5938 80200200 */  sll        $a0, $v0, 2
    /* 9593C 800A593C 1280013C */  lui        $at, %hi(card_status)
    /* 95940 800A5940 21082400 */  addu       $at, $at, $a0
    /* 95944 800A5944 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 95948 800A5948 00000000 */  nop
    /* 9594C 800A594C 09006014 */  bnez       $v1, .L800A5974
    /* 95950 800A5950 00000000 */   nop
    /* 95954 800A5954 F809828F */  lw         $v0, %gp_rel(saveflag)($gp)
    /* 95958 800A5958 00000000 */  nop
    /* 9595C 800A595C 10004014 */  bnez       $v0, .L800A59A0
    /* 95960 800A5960 00000000 */   nop
  .L800A5964:
    /* 95964 800A5964 1280013C */  lui        $at, %hi(StatusTxt)
    /* 95968 800A5968 5CB420AC */  sw         $zero, %lo(StatusTxt)($at)
    /* 9596C 800A596C 68960208 */  j          .L800A59A0
    /* 95970 800A5970 00000000 */   nop
  .L800A5974:
    /* 95974 800A5974 F809828F */  lw         $v0, %gp_rel(saveflag)($gp)
    /* 95978 800A5978 00000000 */  nop
    /* 9597C 800A597C 08004014 */  bnez       $v0, .L800A59A0
    /* 95980 800A5980 03000224 */   addiu     $v0, $zero, 0x3
    /* 95984 800A5984 06006214 */  bne        $v1, $v0, .L800A59A0
    /* 95988 800A5988 00000000 */   nop
    /* 9598C 800A598C 1280013C */  lui        $at, %hi(card_side_read)
    /* 95990 800A5990 21082400 */  addu       $at, $at, $a0
    /* 95994 800A5994 90B1228C */  lw         $v0, %lo(card_side_read)($at)
  .L800A5998:
    /* 95998 800A5998 1280013C */  lui        $at, %hi(StatusTxt)
    /* 9599C 800A599C 5CB422AC */  sw         $v0, %lo(StatusTxt)($at)
  .L800A59A0:
    /* 959A0 800A59A0 1280023C */  lui        $v0, %hi(StatusTxt)
    /* 959A4 800A59A4 5CB4428C */  lw         $v0, %lo(StatusTxt)($v0)
    /* 959A8 800A59A8 00000000 */  nop
    /* 959AC 800A59AC 5F004010 */  beqz       $v0, .L800A5B2C
    /* 959B0 800A59B0 4A001124 */   addiu     $s1, $zero, 0x4A
    /* 959B4 800A59B4 30000324 */  addiu      $v1, $zero, 0x30
    /* 959B8 800A59B8 E0001224 */  addiu      $s2, $zero, 0xE0
    /* 959BC 800A59BC 1280023C */  lui        $v0, %hi(optionsflag)
    /* 959C0 800A59C0 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 959C4 800A59C4 01001E24 */  addiu      $fp, $zero, 0x1
    /* 959C8 800A59C8 02005E14 */  bne        $v0, $fp, .L800A59D4
    /* 959CC 800A59CC 3A001424 */   addiu     $s4, $zero, 0x3A
    /* 959D0 800A59D0 5A001124 */  addiu      $s1, $zero, 0x5A
  .L800A59D4:
    /* 959D4 800A59D4 3800A3A7 */  sh         $v1, 0x38($sp)
    /* 959D8 800A59D8 3A00B1A7 */  sh         $s1, 0x3A($sp)
    /* 959DC 800A59DC 3C00B2A7 */  sh         $s2, 0x3C($sp)
    /* 959E0 800A59E0 329A020C */  jal        GetOverlayOtBase__7CBlocks_800a68c8
    /* 959E4 800A59E4 3E00B4A7 */   sh        $s4, 0x3E($sp)
    /* 959E8 800A59E8 2800A427 */  addiu      $a0, $sp, 0x28
    /* 959EC 800A59EC 08005024 */  addiu      $s0, $v0, 0x8
    /* 959F0 800A59F0 8A34020C */  jal        SetOTpos__6Dialogi
    /* 959F4 800A59F4 21280002 */   addu      $a1, $s0, $zero
    /* 959F8 800A59F8 0C80153C */  lui        $s5, %hi(MediumFont)
    /* 959FC 800A59FC D882B526 */  addiu      $s5, $s5, %lo(MediumFont)
    /* 95A00 800A5A00 2120A002 */  addu       $a0, $s5, $zero
    /* 95A04 800A5A04 21280002 */  addu       $a1, $s0, $zero
    /* 95A08 800A5A08 E82A020C */  jal        SetOTpos__5CFonti
    /* 95A0C 800A5A0C 4000A2AF */   sw        $v0, 0x40($sp)
    /* 95A10 800A5A10 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95A14 800A5A14 12000524 */  addiu      $a1, $zero, 0x12
    /* 95A18 800A5A18 069A020C */  jal        SetBorder__6Dialogi_800a6818
    /* 95A1C 800A5A1C 21B84000 */   addu      $s7, $v0, $zero
    /* 95A20 800A5A20 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95A24 800A5A24 049A020C */  jal        SetBack__6Dialogi_800a6810
    /* 95A28 800A5A28 05000524 */   addiu     $a1, $zero, 0x5
    /* 95A2C 800A5A2C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95A30 800A5A30 40000524 */  addiu      $a1, $zero, 0x40
    /* 95A34 800A5A34 40000624 */  addiu      $a2, $zero, 0x40
    /* 95A38 800A5A38 FC99020C */  jal        SetRGB__6DialogUcUcUc_800a67f0
    /* 95A3C 800A5A3C 40000724 */   addiu     $a3, $zero, 0x40
    /* 95A40 800A5A40 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95A44 800A5A44 30000524 */  addiu      $a1, $zero, 0x30
    /* 95A48 800A5A48 21302002 */  addu       $a2, $s1, $zero
    /* 95A4C 800A5A4C E0000724 */  addiu      $a3, $zero, 0xE0
    /* 95A50 800A5A50 B82F020C */  jal        Back__6Dialogiiii
    /* 95A54 800A5A54 1000B4AF */   sw        $s4, 0x10($sp)
    /* 95A58 800A5A58 1280043C */  lui        $a0, %hi(StatusTxt)
    /* 95A5C 800A5A5C 5CB4848C */  lw         $a0, %lo(StatusTxt)($a0)
    /* 95A60 800A5A60 4AED010C */  jal        GetStr__Fi
    /* 95A64 800A5A64 00000000 */   nop
    /* 95A68 800A5A68 2120A002 */  addu       $a0, $s5, $zero
    /* 95A6C 800A5A6C A92A020C */  jal        GetStrWidth__5CFontPc
    /* 95A70 800A5A70 21284000 */   addu      $a1, $v0, $zero
    /* 95A74 800A5A74 1A005200 */  div        $zero, $v0, $s2
    /* 95A78 800A5A78 12980000 */  mflo       $s3
    /* 95A7C 800A5A7C 1280043C */  lui        $a0, %hi(StatusTxt)
    /* 95A80 800A5A80 5CB4848C */  lw         $a0, %lo(StatusTxt)($a0)
    /* 95A84 800A5A84 01007326 */  addiu      $s3, $s3, 0x1
    /* 95A88 800A5A88 40881300 */  sll        $s1, $s3, 1
    /* 95A8C 800A5A8C 21883302 */  addu       $s1, $s1, $s3
    /* 95A90 800A5A90 80881100 */  sll        $s1, $s1, 2
    /* 95A94 800A5A94 23809102 */  subu       $s0, $s4, $s1
    /* 95A98 800A5A98 43801000 */  sra        $s0, $s0, 1
    /* 95A9C 800A5A9C 4AED010C */  jal        GetStr__Fi
    /* 95AA0 800A5AA0 03001026 */   addiu     $s0, $s0, 0x3
    /* 95AA4 800A5AA4 2120A002 */  addu       $a0, $s5, $zero
    /* 95AA8 800A5AA8 21280000 */  addu       $a1, $zero, $zero
    /* 95AAC 800A5AAC 21300002 */  addu       $a2, $s0, $zero
    /* 95AB0 800A5AB0 21384000 */  addu       $a3, $v0, $zero
    /* 95AB4 800A5AB4 1280163C */  lui        $s6, %hi(WHITER)
    /* 95AB8 800A5AB8 D1ABD692 */  lbu        $s6, %lo(WHITER)($s6)
    /* 95ABC 800A5ABC 1280123C */  lui        $s2, %hi(WHITEG)
    /* 95AC0 800A5AC0 D2AB5292 */  lbu        $s2, %lo(WHITEG)($s2)
    /* 95AC4 800A5AC4 3800B427 */  addiu      $s4, $sp, 0x38
    /* 95AC8 800A5AC8 1000BEAF */  sw         $fp, 0x10($sp)
    /* 95ACC 800A5ACC 1400B4AF */  sw         $s4, 0x14($sp)
    /* 95AD0 800A5AD0 1800B6AF */  sw         $s6, 0x18($sp)
    /* 95AD4 800A5AD4 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 95AD8 800A5AD8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 95ADC 800A5ADC 2000B2AF */   sw        $s2, 0x20($sp)
    /* 95AE0 800A5AE0 4AED010C */  jal        GetStr__Fi
    /* 95AE4 800A5AE4 0E050424 */   addiu     $a0, $zero, 0x50E
    /* 95AE8 800A5AE8 2120A002 */  addu       $a0, $s5, $zero
    /* 95AEC 800A5AEC 21280000 */  addu       $a1, $zero, $zero
    /* 95AF0 800A5AF0 21883302 */  addu       $s1, $s1, $s3
    /* 95AF4 800A5AF4 21301102 */  addu       $a2, $s0, $s1
    /* 95AF8 800A5AF8 21384000 */  addu       $a3, $v0, $zero
    /* 95AFC 800A5AFC 1000BEAF */  sw         $fp, 0x10($sp)
    /* 95B00 800A5B00 1400B4AF */  sw         $s4, 0x14($sp)
    /* 95B04 800A5B04 1800B6AF */  sw         $s6, 0x18($sp)
    /* 95B08 800A5B08 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 95B0C 800A5B0C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 95B10 800A5B10 2000B2AF */   sw        $s2, 0x20($sp)
    /* 95B14 800A5B14 4000A58F */  lw         $a1, 0x40($sp)
    /* 95B18 800A5B18 8A34020C */  jal        SetOTpos__6Dialogi
    /* 95B1C 800A5B1C 2800A427 */   addiu     $a0, $sp, 0x28
    /* 95B20 800A5B20 2120A002 */  addu       $a0, $s5, $zero
    /* 95B24 800A5B24 E82A020C */  jal        SetOTpos__5CFonti
    /* 95B28 800A5B28 2128E002 */   addu      $a1, $s7, $zero
  .L800A5B2C:
    /* 95B2C 800A5B2C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 95B30 800A5B30 089A020C */  jal        ___6Dialog_800a6820
    /* 95B34 800A5B34 02000524 */   addiu     $a1, $zero, 0x2
    /* 95B38 800A5B38 7400BF8F */  lw         $ra, 0x74($sp)
    /* 95B3C 800A5B3C 7000BE8F */  lw         $fp, 0x70($sp)
    /* 95B40 800A5B40 6C00B78F */  lw         $s7, 0x6C($sp)
    /* 95B44 800A5B44 6800B68F */  lw         $s6, 0x68($sp)
    /* 95B48 800A5B48 6400B58F */  lw         $s5, 0x64($sp)
    /* 95B4C 800A5B4C 6000B48F */  lw         $s4, 0x60($sp)
    /* 95B50 800A5B50 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 95B54 800A5B54 5800B28F */  lw         $s2, 0x58($sp)
    /* 95B58 800A5B58 5400B18F */  lw         $s1, 0x54($sp)
    /* 95B5C 800A5B5C 5000B08F */  lw         $s0, 0x50($sp)
    /* 95B60 800A5B60 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 95B64 800A5B64 0800E003 */  jr         $ra
    /* 95B68 800A5B68 00000000 */   nop
endlabel ShowCardActionText__Fv
