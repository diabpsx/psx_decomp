.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MemcardPad__Fv, 0x924

glabel MemcardPad__Fv
    /* 988F0 800A88F0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 988F4 800A88F4 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 988F8 800A88F8 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 988FC 800A88FC 3400BFAF */  sw         $ra, 0x34($sp)
    /* 98900 800A8900 3000B2AF */  sw         $s2, 0x30($sp)
    /* 98904 800A8904 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 98908 800A8908 2800B0AF */  sw         $s0, 0x28($sp)
    /* 9890C 800A890C C0100200 */  sll        $v0, $v0, 3
    /* 98910 800A8910 0D80013C */  lui        $at, %hi(MenuList + 0x4)
    /* 98914 800A8914 21082200 */  addu       $at, $at, $v0
    /* 98918 800A8918 44D2328C */  lw         $s2, %lo(MenuList + 0x4)($at)
    /* 9891C 800A891C FD25020C */  jal        PAD_GetPad__FiUc
    /* 98920 800A8920 21280000 */   addu      $a1, $zero, $zero
    /* 98924 800A8924 21884000 */  addu       $s1, $v0, $zero
    /* 98928 800A8928 21202002 */  addu       $a0, $s1, $zero
    /* 9892C 800A892C 6BAD020C */  jal        SetPadTick__4CPadUs_800ab5ac
    /* 98930 800A8930 08000524 */   addiu     $a1, $zero, 0x8
    /* 98934 800A8934 21202002 */  addu       $a0, $s1, $zero
    /* 98938 800A8938 69AD020C */  jal        SetPadTickMask__4CPadUs_800ab5a4
    /* 9893C 800A893C 03000524 */   addiu     $a1, $zero, 0x3
    /* 98940 800A8940 1280023C */  lui        $v0, %hi(cardondelay)
    /* 98944 800A8944 FCB1428C */  lw         $v0, %lo(cardondelay)($v0)
    /* 98948 800A8948 00000000 */  nop
    /* 9894C 800A894C 0C004018 */  blez       $v0, .L800A8980
    /* 98950 800A8950 21800000 */   addu      $s0, $zero, $zero
    /* 98954 800A8954 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 98958 800A8958 1280013C */  lui        $at, %hi(cardondelay)
    /* 9895C 800A895C FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 98960 800A8960 05004010 */  beqz       $v0, .L800A8978
    /* 98964 800A8964 01000424 */   addiu     $a0, $zero, 0x1
    /* 98968 800A8968 9797020C */  jal        ShowLoadingBox__Fi
    /* 9896C 800A896C 48030424 */   addiu     $a0, $zero, 0x348
    /* 98970 800A8970 7EA40208 */  j          .L800A91F8
    /* 98974 800A8974 00000000 */   nop
  .L800A8978:
    /* 98978 800A8978 E495020C */  jal        ActivateMemcard__Fii
    /* 9897C 800A897C 01000524 */   addiu     $a1, $zero, 0x1
  .L800A8980:
    /* 98980 800A8980 1280023C */  lui        $v0, %hi(AlertTxt)
    /* 98984 800A8984 58B4428C */  lw         $v0, %lo(AlertTxt)($v0)
    /* 98988 800A8988 00000000 */  nop
    /* 9898C 800A898C BC014014 */  bnez       $v0, .L800A9080
    /* 98990 800A8990 00000000 */   nop
    /* 98994 800A8994 1280023C */  lui        $v0, %hi(saveflag)
    /* 98998 800A8998 78B1428C */  lw         $v0, %lo(saveflag)($v0)
    /* 9899C 800A899C 00000000 */  nop
    /* 989A0 800A89A0 E0014014 */  bnez       $v0, .L800A9124
    /* 989A4 800A89A4 03004228 */   slti      $v0, $v0, 0x3
    /* 989A8 800A89A8 1280023C */  lui        $v0, %hi(loadflag)
    /* 989AC 800A89AC 7CB1428C */  lw         $v0, %lo(loadflag)($v0)
    /* 989B0 800A89B0 00000000 */  nop
    /* 989B4 800A89B4 B2014014 */  bnez       $v0, .L800A9080
    /* 989B8 800A89B8 00000000 */   nop
    /* 989BC 800A89BC 2296020C */  jal        ShowCardActionText__Fv
    /* 989C0 800A89C0 00000000 */   nop
    /* 989C4 800A89C4 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 989C8 800A89C8 21202002 */   addu      $a0, $s1, $zero
    /* 989CC 800A89CC 01004230 */  andi       $v0, $v0, 0x1
    /* 989D0 800A89D0 02004010 */  beqz       $v0, .L800A89DC
    /* 989D4 800A89D4 00000000 */   nop
    /* 989D8 800A89D8 FFFF1024 */  addiu      $s0, $zero, -0x1
  .L800A89DC:
    /* 989DC 800A89DC 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 989E0 800A89E0 21202002 */   addu      $a0, $s1, $zero
    /* 989E4 800A89E4 02004230 */  andi       $v0, $v0, 0x2
    /* 989E8 800A89E8 02004010 */  beqz       $v0, .L800A89F4
    /* 989EC 800A89EC 00000000 */   nop
    /* 989F0 800A89F0 01001024 */  addiu      $s0, $zero, 0x1
  .L800A89F4:
    /* 989F4 800A89F4 B00A858F */  lw         $a1, %gp_rel(D_8011B230)($gp)
    /* 989F8 800A89F8 00000000 */  nop
    /* 989FC 800A89FC 2110B000 */  addu       $v0, $a1, $s0
    /* 98A00 800A8A00 40180200 */  sll        $v1, $v0, 1
    /* 98A04 800A8A04 21186200 */  addu       $v1, $v1, $v0
    /* 98A08 800A8A08 C0180300 */  sll        $v1, $v1, 3
    /* 98A0C 800A8A0C 21187200 */  addu       $v1, $v1, $s2
    /* 98A10 800A8A10 0400638C */  lw         $v1, 0x4($v1)
    /* 98A14 800A8A14 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 98A18 800A8A18 1D006014 */  bnez       $v1, .L800A8A90
    /* 98A1C 800A8A1C 00000000 */   nop
    /* 98A20 800A8A20 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98A24 800A8A24 00000000 */  nop
    /* 98A28 800A8A28 C0200200 */  sll        $a0, $v0, 3
  .L800A8A2C:
    /* 98A2C 800A8A2C 02000016 */  bnez       $s0, .L800A8A38
    /* 98A30 800A8A30 00000000 */   nop
    /* 98A34 800A8A34 01001024 */  addiu      $s0, $zero, 0x1
  .L800A8A38:
    /* 98A38 800A8A38 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 98A3C 800A8A3C 00000000 */  nop
    /* 98A40 800A8A40 02006104 */  bgez       $v1, .L800A8A4C
    /* 98A44 800A8A44 00000000 */   nop
    /* 98A48 800A8A48 01001024 */  addiu      $s0, $zero, 0x1
  .L800A8A4C:
    /* 98A4C 800A8A4C 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 98A50 800A8A50 21082400 */  addu       $at, $at, $a0
    /* 98A54 800A8A54 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 98A58 800A8A58 00000000 */  nop
    /* 98A5C 800A8A5C 2A106200 */  slt        $v0, $v1, $v0
    /* 98A60 800A8A60 03004014 */  bnez       $v0, .L800A8A70
    /* 98A64 800A8A64 21107000 */   addu      $v0, $v1, $s0
    /* 98A68 800A8A68 FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 98A6C 800A8A6C 21107000 */  addu       $v0, $v1, $s0
  .L800A8A70:
    /* 98A70 800A8A70 40180200 */  sll        $v1, $v0, 1
    /* 98A74 800A8A74 21186200 */  addu       $v1, $v1, $v0
    /* 98A78 800A8A78 C0180300 */  sll        $v1, $v1, 3
    /* 98A7C 800A8A7C 21187200 */  addu       $v1, $v1, $s2
    /* 98A80 800A8A80 0400638C */  lw         $v1, 0x4($v1)
    /* 98A84 800A8A84 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 98A88 800A8A88 E8FF6010 */  beqz       $v1, .L800A8A2C
    /* 98A8C 800A8A8C 00000000 */   nop
  .L800A8A90:
    /* 98A90 800A8A90 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 98A94 800A8A94 00000000 */  nop
    /* 98A98 800A8A98 0A00401C */  bgtz       $v0, .L800A8AC4
    /* 98A9C 800A8A9C 00000000 */   nop
    /* 98AA0 800A8AA0 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98AA4 800A8AA4 00000000 */  nop
    /* 98AA8 800A8AA8 C0100200 */  sll        $v0, $v0, 3
    /* 98AAC 800A8AAC 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 98AB0 800A8AB0 21082200 */  addu       $at, $at, $v0
    /* 98AB4 800A8AB4 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 98AB8 800A8AB8 00000000 */  nop
    /* 98ABC 800A8ABC FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 98AC0 800A8AC0 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800A8AC4:
    /* 98AC4 800A8AC4 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98AC8 800A8AC8 00000000 */  nop
    /* 98ACC 800A8ACC C0100200 */  sll        $v0, $v0, 3
    /* 98AD0 800A8AD0 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 98AD4 800A8AD4 21082200 */  addu       $at, $at, $v0
    /* 98AD8 800A8AD8 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 98ADC 800A8ADC B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 98AE0 800A8AE0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 98AE4 800A8AE4 2A186200 */  slt        $v1, $v1, $v0
    /* 98AE8 800A8AE8 02006014 */  bnez       $v1, .L800A8AF4
    /* 98AEC 800A8AEC 01000224 */   addiu     $v0, $zero, 0x1
    /* 98AF0 800A8AF0 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800A8AF4:
    /* 98AF4 800A8AF4 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 98AF8 800A8AF8 00000000 */  nop
    /* 98AFC 800A8AFC 03004510 */  beq        $v0, $a1, .L800A8B0C
    /* 98B00 800A8B00 00000000 */   nop
    /* 98B04 800A8B04 C6F5000C */  jal        PlaySFX__Fi
    /* 98B08 800A8B08 32000424 */   addiu     $a0, $zero, 0x32
  .L800A8B0C:
    /* 98B0C 800A8B0C 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 98B10 800A8B10 21202002 */   addu      $a0, $s1, $zero
    /* 98B14 800A8B14 00014230 */  andi       $v0, $v0, 0x100
    /* 98B18 800A8B18 1C004010 */  beqz       $v0, .L800A8B8C
    /* 98B1C 800A8B1C 00000000 */   nop
    /* 98B20 800A8B20 C6F5000C */  jal        PlaySFX__Fi
    /* 98B24 800A8B24 33000424 */   addiu     $a0, $zero, 0x33
    /* 98B28 800A8B28 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98B2C 800A8B2C 00000000 */  nop
    /* 98B30 800A8B30 C0100200 */  sll        $v0, $v0, 3
    /* 98B34 800A8B34 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 98B38 800A8B38 21082200 */  addu       $at, $at, $v0
    /* 98B3C 800A8B3C 43D22390 */  lbu        $v1, %lo(MenuList + 0x3)($at)
    /* 98B40 800A8B40 00000000 */  nop
    /* 98B44 800A8B44 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 98B48 800A8B48 40100300 */  sll        $v0, $v1, 1
    /* 98B4C 800A8B4C 21104300 */  addu       $v0, $v0, $v1
    /* 98B50 800A8B50 C0100200 */  sll        $v0, $v0, 3
    /* 98B54 800A8B54 21105200 */  addu       $v0, $v0, $s2
    /* 98B58 800A8B58 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 98B5C 800A8B5C 1400438C */  lw         $v1, 0x14($v0)
    /* 98B60 800A8B60 FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 98B64 800A8B64 09006210 */  beq        $v1, $v0, .L800A8B8C
    /* 98B68 800A8B68 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 98B6C 800A8B6C B40A838F */  lw         $v1, %gp_rel(D_8011B234)($gp)
    /* 98B70 800A8B70 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 98B74 800A8B74 05000224 */  addiu      $v0, $zero, 0x5
    /* 98B78 800A8B78 1280013C */  lui        $at, %hi(cardondelay)
    /* 98B7C 800A8B7C FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 98B80 800A8B80 B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 98B84 800A8B84 7EA40208 */  j          .L800A91F8
    /* 98B88 800A8B88 00000000 */   nop
  .L800A8B8C:
    /* 98B8C 800A8B8C 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 98B90 800A8B90 21202002 */   addu      $a0, $s1, $zero
    /* 98B94 800A8B94 40004230 */  andi       $v0, $v0, 0x40
    /* 98B98 800A8B98 0B014010 */  beqz       $v0, .L800A8FC8
    /* 98B9C 800A8B9C 00000000 */   nop
    /* 98BA0 800A8BA0 1280023C */  lui        $v0, %hi(saveflag)
    /* 98BA4 800A8BA4 78B1428C */  lw         $v0, %lo(saveflag)($v0)
    /* 98BA8 800A8BA8 00000000 */  nop
    /* 98BAC 800A8BAC 06014014 */  bnez       $v0, .L800A8FC8
    /* 98BB0 800A8BB0 00000000 */   nop
    /* 98BB4 800A8BB4 1280023C */  lui        $v0, %hi(loadflag)
    /* 98BB8 800A8BB8 7CB1428C */  lw         $v0, %lo(loadflag)($v0)
    /* 98BBC 800A8BBC 00000000 */  nop
    /* 98BC0 800A8BC0 54014014 */  bnez       $v0, .L800A9114
    /* 98BC4 800A8BC4 01000324 */   addiu     $v1, $zero, 0x1
    /* 98BC8 800A8BC8 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 98BCC 800A8BCC 00000000 */  nop
    /* 98BD0 800A8BD0 05004314 */  bne        $v0, $v1, .L800A8BE8
    /* 98BD4 800A8BD4 00000000 */   nop
    /* 98BD8 800A8BD8 1280013C */  lui        $at, %hi(current_card)
    /* 98BDC 800A8BDC 60B420AC */  sw         $zero, %lo(current_card)($at)
    /* 98BE0 800A8BE0 FCA20208 */  j          .L800A8BF0
    /* 98BE4 800A8BE4 00000000 */   nop
  .L800A8BE8:
    /* 98BE8 800A8BE8 1280013C */  lui        $at, %hi(current_card)
    /* 98BEC 800A8BEC 60B423AC */  sw         $v1, %lo(current_card)($at)
  .L800A8BF0:
    /* 98BF0 800A8BF0 C6F5000C */  jal        PlaySFX__Fi
    /* 98BF4 800A8BF4 33000424 */   addiu     $a0, $zero, 0x33
    /* 98BF8 800A8BF8 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98BFC 800A8BFC 00000000 */  nop
    /* 98C00 800A8C00 F7FF4324 */  addiu      $v1, $v0, -0x9
    /* 98C04 800A8C04 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 98C08 800A8C08 B0004010 */  beqz       $v0, .L800A8ECC
    /* 98C0C 800A8C0C 80100300 */   sll       $v0, $v1, 2
    /* 98C10 800A8C10 1180013C */  lui        $at, %hi(jtbl_80110D28)
    /* 98C14 800A8C14 21082200 */  addu       $at, $at, $v0
    /* 98C18 800A8C18 280D228C */  lw         $v0, %lo(jtbl_80110D28)($at)
    /* 98C1C 800A8C1C 00000000 */  nop
    /* 98C20 800A8C20 08004000 */  jr         $v0
    /* 98C24 800A8C24 00000000 */   nop
  jlabel .L800A8C28
    /* 98C28 800A8C28 1280053C */  lui        $a1, %hi(DiabloOptionFile)
    /* 98C2C 800A8C2C 14B4A58C */  lw         $a1, %lo(DiabloOptionFile)($a1)
    /* 98C30 800A8C30 01001124 */  addiu      $s1, $zero, 0x1
    /* 98C34 800A8C34 1280013C */  lui        $at, %hi(save_blocks)
    /* 98C38 800A8C38 F4B131AC */  sw         $s1, %lo(save_blocks)($at)
    /* 98C3C 800A8C3C 1280013C */  lui        $at, %hi(Savefilename)
    /* 98C40 800A8C40 08B225AC */  sw         $a1, %lo(Savefilename)($at)
    /* 98C44 800A8C44 9F69050C */  jal        func_8015A67C
    /* 98C48 800A8C48 01000424 */   addiu     $a0, $zero, 0x1
    /* 98C4C 800A8C4C 7F004010 */  beqz       $v0, .L800A8E4C
    /* 98C50 800A8C50 00000000 */   nop
    /* 98C54 800A8C54 1280043C */  lui        $a0, %hi(current_card)
    /* 98C58 800A8C58 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 98C5C 800A8C5C 1280013C */  lui        $at, %hi(saveflag)
    /* 98C60 800A8C60 78B131AC */  sw         $s1, %lo(saveflag)($at)
    /* 98C64 800A8C64 FD0A050C */  jal        func_80142BF4
    /* 98C68 800A8C68 21800000 */   addu      $s0, $zero, $zero
    /* 98C6C 800A8C6C 09004010 */  beqz       $v0, .L800A8C94
    /* 98C70 800A8C70 00000000 */   nop
    /* 98C74 800A8C74 1280043C */  lui        $a0, %hi(current_card)
    /* 98C78 800A8C78 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 98C7C 800A8C7C 1280053C */  lui        $a1, %hi(Savefilename)
    /* 98C80 800A8C80 08B2A58C */  lw         $a1, %lo(Savefilename)($a1)
    /* 98C84 800A8C84 6465050C */  jal        func_80159590
    /* 98C88 800A8C88 00000000 */   nop
    /* 98C8C 800A8C8C 27100200 */  nor        $v0, $zero, $v0
    /* 98C90 800A8C90 2B800200 */  sltu       $s0, $zero, $v0
  .L800A8C94:
    /* 98C94 800A8C94 9D000012 */  beqz       $s0, .L800A8F0C
    /* 98C98 800A8C98 00000000 */   nop
    /* 98C9C 800A8C9C 6AA30208 */  j          .L800A8DA8
    /* 98CA0 800A8CA0 00000000 */   nop
  jlabel .L800A8CA4
    /* 98CA4 800A8CA4 1280043C */  lui        $a0, %hi(current_card)
    /* 98CA8 800A8CA8 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 98CAC 800A8CAC 00000000 */  nop
    /* 98CB0 800A8CB0 80280400 */  sll        $a1, $a0, 2
    /* 98CB4 800A8CB4 1280013C */  lui        $at, %hi(card_status)
    /* 98CB8 800A8CB8 21082500 */  addu       $at, $at, $a1
    /* 98CBC 800A8CBC DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 98CC0 800A8CC0 02000224 */  addiu      $v0, $zero, 0x2
    /* 98CC4 800A8CC4 06006214 */  bne        $v1, $v0, .L800A8CE0
    /* 98CC8 800A8CC8 00000000 */   nop
    /* 98CCC 800A8CCC 1280013C */  lui        $at, %hi(card_side_empty)
    /* 98CD0 800A8CD0 21082500 */  addu       $at, $at, $a1
    /* 98CD4 800A8CD4 88B1228C */  lw         $v0, %lo(card_side_empty)($at)
    /* 98CD8 800A8CD8 A5A30208 */  j          .L800A8E94
    /* 98CDC 800A8CDC 00000000 */   nop
  .L800A8CE0:
    /* 98CE0 800A8CE0 1280013C */  lui        $at, %hi(card_usable)
    /* 98CE4 800A8CE4 21082500 */  addu       $at, $at, $a1
    /* 98CE8 800A8CE8 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 98CEC 800A8CEC 00000000 */  nop
    /* 98CF0 800A8CF0 54004010 */  beqz       $v0, .L800A8E44
    /* 98CF4 800A8CF4 09050224 */   addiu     $v0, $zero, 0x509
    /* 98CF8 800A8CF8 1280053C */  lui        $a1, %hi(DiabloOptionFile)
    /* 98CFC 800A8CFC 14B4A58C */  lw         $a1, %lo(DiabloOptionFile)($a1)
    /* 98D00 800A8D00 6465050C */  jal        func_80159590
    /* 98D04 800A8D04 00000000 */   nop
    /* 98D08 800A8D08 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 98D0C 800A8D0C 0A004314 */  bne        $v0, $v1, .L800A8D38
    /* 98D10 800A8D10 00000000 */   nop
    /* 98D14 800A8D14 1280023C */  lui        $v0, %hi(current_card)
    /* 98D18 800A8D18 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 98D1C 800A8D1C 00000000 */  nop
    /* 98D20 800A8D20 80100200 */  sll        $v0, $v0, 2
    /* 98D24 800A8D24 1280013C */  lui        $at, %hi(card_side_noopt)
    /* 98D28 800A8D28 21082200 */  addu       $at, $at, $v0
    /* 98D2C 800A8D2C A0B1228C */  lw         $v0, %lo(card_side_noopt)($at)
    /* 98D30 800A8D30 A5A30208 */  j          .L800A8E94
    /* 98D34 800A8D34 00000000 */   nop
  .L800A8D38:
    /* 98D38 800A8D38 1280033C */  lui        $v1, %hi(DiabloOptionFile)
    /* 98D3C 800A8D3C 14B4638C */  lw         $v1, %lo(DiabloOptionFile)($v1)
    /* 98D40 800A8D40 ADA30208 */  j          .L800A8EB4
    /* 98D44 800A8D44 04000224 */   addiu     $v0, $zero, 0x4
  jlabel .L800A8D48
    /* 98D48 800A8D48 0A000224 */  addiu      $v0, $zero, 0xA
    /* 98D4C 800A8D4C 1280013C */  lui        $at, %hi(save_blocks)
    /* 98D50 800A8D50 F4B122AC */  sw         $v0, %lo(save_blocks)($at)
    /* 98D54 800A8D54 1280053C */  lui        $a1, %hi(DiabloGameFile)
    /* 98D58 800A8D58 10B4A58C */  lw         $a1, %lo(DiabloGameFile)($a1)
    /* 98D5C 800A8D5C 1280043C */  lui        $a0, %hi(save_blocks)
    /* 98D60 800A8D60 F4B1848C */  lw         $a0, %lo(save_blocks)($a0)
    /* 98D64 800A8D64 1280013C */  lui        $at, %hi(Savefilename)
    /* 98D68 800A8D68 08B225AC */  sw         $a1, %lo(Savefilename)($at)
    /* 98D6C 800A8D6C 9F69050C */  jal        func_8015A67C
    /* 98D70 800A8D70 00000000 */   nop
    /* 98D74 800A8D74 35004010 */  beqz       $v0, .L800A8E4C
    /* 98D78 800A8D78 01000224 */   addiu     $v0, $zero, 0x1
    /* 98D7C 800A8D7C 1280043C */  lui        $a0, %hi(current_card)
    /* 98D80 800A8D80 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 98D84 800A8D84 1280053C */  lui        $a1, %hi(Savefilename)
    /* 98D88 800A8D88 08B2A58C */  lw         $a1, %lo(Savefilename)($a1)
    /* 98D8C 800A8D8C 1280013C */  lui        $at, %hi(saveflag)
    /* 98D90 800A8D90 78B122AC */  sw         $v0, %lo(saveflag)($at)
    /* 98D94 800A8D94 6465050C */  jal        func_80159590
    /* 98D98 800A8D98 00000000 */   nop
    /* 98D9C 800A8D9C FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 98DA0 800A8DA0 5A004310 */  beq        $v0, $v1, .L800A8F0C
    /* 98DA4 800A8DA4 00000000 */   nop
  .L800A8DA8:
    /* 98DA8 800A8DA8 1280053C */  lui        $a1, %hi(current_card)
    /* 98DAC 800A8DAC 60B4A58C */  lw         $a1, %lo(current_card)($a1)
    /* 98DB0 800A8DB0 00000000 */  nop
    /* 98DB4 800A8DB4 0100A42C */  sltiu      $a0, $a1, 0x1
    /* 98DB8 800A8DB8 0100A538 */  xori       $a1, $a1, 0x1
    /* 98DBC 800A8DBC E495020C */  jal        ActivateMemcard__Fii
    /* 98DC0 800A8DC0 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 98DC4 800A8DC4 02000324 */  addiu      $v1, $zero, 0x2
    /* 98DC8 800A8DC8 BC0A848F */  lw         $a0, %gp_rel(cmenu)($gp)
    /* 98DCC 800A8DCC B00A858F */  lw         $a1, %gp_rel(D_8011B230)($gp)
    /* 98DD0 800A8DD0 13000224 */  addiu      $v0, $zero, 0x13
    /* 98DD4 800A8DD4 CC0A83AF */  sw         $v1, %gp_rel(ReturnCards)($gp)
    /* 98DD8 800A8DD8 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 98DDC 800A8DDC B00A83AF */  sw         $v1, %gp_rel(D_8011B230)($gp)
    /* 98DE0 800A8DE0 0C0B84AF */  sw         $a0, %gp_rel(ReturnMenu)($gp)
    /* 98DE4 800A8DE4 B80A85AF */  sw         $a1, %gp_rel(D_8011B238)($gp)
    /* 98DE8 800A8DE8 7EA40208 */  j          .L800A91F8
    /* 98DEC 800A8DEC 00000000 */   nop
  jlabel .L800A8DF0
    /* 98DF0 800A8DF0 1280043C */  lui        $a0, %hi(current_card)
    /* 98DF4 800A8DF4 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 98DF8 800A8DF8 00000000 */  nop
    /* 98DFC 800A8DFC 80280400 */  sll        $a1, $a0, 2
    /* 98E00 800A8E00 1280013C */  lui        $at, %hi(card_status)
    /* 98E04 800A8E04 21082500 */  addu       $at, $at, $a1
    /* 98E08 800A8E08 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 98E0C 800A8E0C 02000224 */  addiu      $v0, $zero, 0x2
    /* 98E10 800A8E10 06006214 */  bne        $v1, $v0, .L800A8E2C
    /* 98E14 800A8E14 00000000 */   nop
    /* 98E18 800A8E18 1280013C */  lui        $at, %hi(card_side_empty)
    /* 98E1C 800A8E1C 21082500 */  addu       $at, $at, $a1
    /* 98E20 800A8E20 88B1228C */  lw         $v0, %lo(card_side_empty)($at)
    /* 98E24 800A8E24 A5A30208 */  j          .L800A8E94
    /* 98E28 800A8E28 00000000 */   nop
  .L800A8E2C:
    /* 98E2C 800A8E2C 1280013C */  lui        $at, %hi(card_usable)
    /* 98E30 800A8E30 21082500 */  addu       $at, $at, $a1
    /* 98E34 800A8E34 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 98E38 800A8E38 00000000 */  nop
    /* 98E3C 800A8E3C 07004014 */  bnez       $v0, .L800A8E5C
    /* 98E40 800A8E40 09050224 */   addiu     $v0, $zero, 0x509
  .L800A8E44:
    /* 98E44 800A8E44 1280013C */  lui        $at, %hi(AlertTxt)
    /* 98E48 800A8E48 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
  .L800A8E4C:
    /* 98E4C 800A8E4C C6F5000C */  jal        PlaySFX__Fi
    /* 98E50 800A8E50 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 98E54 800A8E54 C3A30208 */  j          .L800A8F0C
    /* 98E58 800A8E58 00000000 */   nop
  .L800A8E5C:
    /* 98E5C 800A8E5C 1280053C */  lui        $a1, %hi(DiabloGameFile)
    /* 98E60 800A8E60 10B4A58C */  lw         $a1, %lo(DiabloGameFile)($a1)
    /* 98E64 800A8E64 6465050C */  jal        func_80159590
    /* 98E68 800A8E68 00000000 */   nop
    /* 98E6C 800A8E6C FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 98E70 800A8E70 0E004314 */  bne        $v0, $v1, .L800A8EAC
    /* 98E74 800A8E74 04000224 */   addiu     $v0, $zero, 0x4
    /* 98E78 800A8E78 1280023C */  lui        $v0, %hi(current_card)
    /* 98E7C 800A8E7C 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 98E80 800A8E80 00000000 */  nop
    /* 98E84 800A8E84 80100200 */  sll        $v0, $v0, 2
    /* 98E88 800A8E88 1280013C */  lui        $at, %hi(card_side_nogame)
    /* 98E8C 800A8E8C 21082200 */  addu       $at, $at, $v0
    /* 98E90 800A8E90 98B1228C */  lw         $v0, %lo(card_side_nogame)($at)
  .L800A8E94:
    /* 98E94 800A8E94 1280013C */  lui        $at, %hi(AlertTxt)
    /* 98E98 800A8E98 58B422AC */  sw         $v0, %lo(AlertTxt)($at)
    /* 98E9C 800A8E9C C6F5000C */  jal        PlaySFX__Fi
    /* 98EA0 800A8EA0 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 98EA4 800A8EA4 C3A30208 */  j          .L800A8F0C
    /* 98EA8 800A8EA8 00000000 */   nop
  .L800A8EAC:
    /* 98EAC 800A8EAC 1280033C */  lui        $v1, %hi(DiabloGameFile)
    /* 98EB0 800A8EB0 10B4638C */  lw         $v1, %lo(DiabloGameFile)($v1)
  .L800A8EB4:
    /* 98EB4 800A8EB4 1280013C */  lui        $at, %hi(loadflag)
    /* 98EB8 800A8EB8 7CB122AC */  sw         $v0, %lo(loadflag)($at)
    /* 98EBC 800A8EBC 1280013C */  lui        $at, %hi(Loadfilename)
    /* 98EC0 800A8EC0 0CB223AC */  sw         $v1, %lo(Loadfilename)($at)
    /* 98EC4 800A8EC4 C3A30208 */  j          .L800A8F0C
    /* 98EC8 800A8EC8 00000000 */   nop
  jlabel .L800A8ECC
    /* 98ECC 800A8ECC B00A848F */  lw         $a0, %gp_rel(D_8011B230)($gp)
    /* 98ED0 800A8ED0 00000000 */  nop
    /* 98ED4 800A8ED4 40100400 */  sll        $v0, $a0, 1
    /* 98ED8 800A8ED8 21104400 */  addu       $v0, $v0, $a0
    /* 98EDC 800A8EDC C0100200 */  sll        $v0, $v0, 3
    /* 98EE0 800A8EE0 21105200 */  addu       $v0, $v0, $s2
    /* 98EE4 800A8EE4 1400438C */  lw         $v1, 0x14($v0)
    /* 98EE8 800A8EE8 FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 98EEC 800A8EEC 07006210 */  beq        $v1, $v0, .L800A8F0C
    /* 98EF0 800A8EF0 FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 98EF4 800A8EF4 BC0A82AF */  sw         $v0, %gp_rel(cmenu)($gp)
    /* 98EF8 800A8EF8 01000224 */  addiu      $v0, $zero, 0x1
    /* 98EFC 800A8EFC B40A84AF */  sw         $a0, %gp_rel(D_8011B234)($gp)
    /* 98F00 800A8F00 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 98F04 800A8F04 7EA40208 */  j          .L800A91F8
    /* 98F08 800A8F08 00000000 */   nop
  .L800A8F0C:
    /* 98F0C 800A8F0C 1280023C */  lui        $v0, %hi(saveflag)
    /* 98F10 800A8F10 78B1428C */  lw         $v0, %lo(saveflag)($v0)
    /* 98F14 800A8F14 00000000 */  nop
    /* 98F18 800A8F18 2B004010 */  beqz       $v0, .L800A8FC8
    /* 98F1C 800A8F1C 02001024 */   addiu     $s0, $zero, 0x2
    /* 98F20 800A8F20 1280043C */  lui        $a0, %hi(current_card)
    /* 98F24 800A8F24 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 98F28 800A8F28 00000000 */  nop
    /* 98F2C 800A8F2C 80180400 */  sll        $v1, $a0, 2
    /* 98F30 800A8F30 1280013C */  lui        $at, %hi(card_status)
    /* 98F34 800A8F34 21082300 */  addu       $at, $at, $v1
    /* 98F38 800A8F38 DCB3228C */  lw         $v0, %lo(card_status)($at)
    /* 98F3C 800A8F3C 00000000 */  nop
    /* 98F40 800A8F40 21005010 */  beq        $v0, $s0, .L800A8FC8
    /* 98F44 800A8F44 00000000 */   nop
    /* 98F48 800A8F48 1280013C */  lui        $at, %hi(card_usable)
    /* 98F4C 800A8F4C 21082300 */  addu       $at, $at, $v1
    /* 98F50 800A8F50 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 98F54 800A8F54 00000000 */  nop
    /* 98F58 800A8F58 1B004014 */  bnez       $v0, .L800A8FC8
    /* 98F5C 800A8F5C 00000000 */   nop
    /* 98F60 800A8F60 B295020C */  jal        read_card_block__Fii
    /* 98F64 800A8F64 21280000 */   addu      $a1, $zero, $zero
    /* 98F68 800A8F68 15004010 */  beqz       $v0, .L800A8FC0
    /* 98F6C 800A8F6C 4D000224 */   addiu     $v0, $zero, 0x4D
    /* 98F70 800A8F70 0D80033C */  lui        $v1, %hi(block_buf)
    /* 98F74 800A8F74 E8C76390 */  lbu        $v1, %lo(block_buf)($v1)
    /* 98F78 800A8F78 00000000 */  nop
    /* 98F7C 800A8F7C 10006210 */  beq        $v1, $v0, .L800A8FC0
    /* 98F80 800A8F80 43000224 */   addiu     $v0, $zero, 0x43
    /* 98F84 800A8F84 0D80033C */  lui        $v1, %hi(block_buf + 0x1)
    /* 98F88 800A8F88 E9C76390 */  lbu        $v1, %lo(block_buf + 0x1)($v1)
    /* 98F8C 800A8F8C 00000000 */  nop
    /* 98F90 800A8F90 0B006210 */  beq        $v1, $v0, .L800A8FC0
    /* 98F94 800A8F94 10000324 */   addiu     $v1, $zero, 0x10
    /* 98F98 800A8F98 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98F9C 800A8F9C B00A848F */  lw         $a0, %gp_rel(D_8011B230)($gp)
    /* 98FA0 800A8FA0 BC0A83AF */  sw         $v1, %gp_rel(cmenu)($gp)
    /* 98FA4 800A8FA4 1280013C */  lui        $at, %hi(formatflag)
    /* 98FA8 800A8FA8 80B120AC */  sw         $zero, %lo(formatflag)($at)
    /* 98FAC 800A8FAC B00A90AF */  sw         $s0, %gp_rel(D_8011B230)($gp)
    /* 98FB0 800A8FB0 0C0B82AF */  sw         $v0, %gp_rel(ReturnMenu)($gp)
    /* 98FB4 800A8FB4 B80A84AF */  sw         $a0, %gp_rel(D_8011B238)($gp)
    /* 98FB8 800A8FB8 7EA40208 */  j          .L800A91F8
    /* 98FBC 800A8FBC 00000000 */   nop
  .L800A8FC0:
    /* 98FC0 800A8FC0 1280013C */  lui        $at, %hi(saveflag)
    /* 98FC4 800A8FC4 78B120AC */  sw         $zero, %lo(saveflag)($at)
  .L800A8FC8:
    /* 98FC8 800A8FC8 1280023C */  lui        $v0, %hi(loadflag)
    /* 98FCC 800A8FCC 7CB1428C */  lw         $v0, %lo(loadflag)($v0)
    /* 98FD0 800A8FD0 00000000 */  nop
    /* 98FD4 800A8FD4 4F004014 */  bnez       $v0, .L800A9114
    /* 98FD8 800A8FD8 00000000 */   nop
    /* 98FDC 800A8FDC 1280023C */  lui        $v0, %hi(saveflag)
    /* 98FE0 800A8FE0 78B1428C */  lw         $v0, %lo(saveflag)($v0)
    /* 98FE4 800A8FE4 00000000 */  nop
    /* 98FE8 800A8FE8 4E004014 */  bnez       $v0, .L800A9124
    /* 98FEC 800A8FEC 03004228 */   slti      $v0, $v0, 0x3
    /* 98FF0 800A8FF0 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 98FF4 800A8FF4 00000000 */  nop
    /* 98FF8 800A8FF8 EFFF4224 */  addiu      $v0, $v0, -0x11
    /* 98FFC 800A8FFC 0200422C */  sltiu      $v0, $v0, 0x2
    /* 99000 800A9000 0E004010 */  beqz       $v0, .L800A903C
    /* 99004 800A9004 1C000224 */   addiu     $v0, $zero, 0x1C
    /* 99008 800A9008 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9900C 800A900C 971F828B */  lwl        $v0, %gp_rel(D_8011C717)($gp)
    /* 99010 800A9010 941F829B */  lwr        $v0, %gp_rel(D_8011C714)($gp)
    /* 99014 800A9014 00000000 */  nop
    /* 99018 800A9018 1300A2AB */  swl        $v0, 0x13($sp)
    /* 9901C 800A901C 1000A2BB */  swr        $v0, 0x10($sp)
    /* 99020 800A9020 21280000 */  addu       $a1, $zero, $zero
    /* 99024 800A9024 901F8297 */  lhu        $v0, %gp_rel(D_8011C710)($gp)
    /* 99028 800A9028 921F8797 */  lhu        $a3, %gp_rel(D_8011C712)($gp)
    /* 9902C 800A902C 1280043C */  lui        $a0, %hi(DiabloOptionFile)
    /* 99030 800A9030 14B4848C */  lw         $a0, %lo(DiabloOptionFile)($a0)
    /* 99034 800A9034 1BA40208 */  j          .L800A906C
    /* 99038 800A9038 0D000624 */   addiu     $a2, $zero, 0xD
  .L800A903C:
    /* 9903C 800A903C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 99040 800A9040 971F828B */  lwl        $v0, %gp_rel(D_8011C717)($gp)
    /* 99044 800A9044 941F829B */  lwr        $v0, %gp_rel(D_8011C714)($gp)
    /* 99048 800A9048 00000000 */  nop
    /* 9904C 800A904C 1300A2AB */  swl        $v0, 0x13($sp)
    /* 99050 800A9050 1000A2BB */  swr        $v0, 0x10($sp)
    /* 99054 800A9054 21280000 */  addu       $a1, $zero, $zero
    /* 99058 800A9058 0D000624 */  addiu      $a2, $zero, 0xD
    /* 9905C 800A905C 901F8297 */  lhu        $v0, %gp_rel(D_8011C710)($gp)
    /* 99060 800A9060 921F8797 */  lhu        $a3, %gp_rel(D_8011C712)($gp)
    /* 99064 800A9064 1280043C */  lui        $a0, %hi(DiabloGameFile)
    /* 99068 800A9068 10B4848C */  lw         $a0, %lo(DiabloGameFile)($a0)
  .L800A906C:
    /* 9906C 800A906C 003C0700 */  sll        $a3, $a3, 16
    /* 99070 800A9070 E769050C */  jal        func_8015A79C
    /* 99074 800A9074 25384700 */   or        $a3, $v0, $a3
    /* 99078 800A9078 45A40208 */  j          .L800A9114
    /* 9907C 800A907C 00000000 */   nop
  .L800A9080:
    /* 99080 800A9080 1280023C */  lui        $v0, %hi(saveflag)
    /* 99084 800A9084 78B1428C */  lw         $v0, %lo(saveflag)($v0)
    /* 99088 800A9088 00000000 */  nop
    /* 9908C 800A908C 25004014 */  bnez       $v0, .L800A9124
    /* 99090 800A9090 03004228 */   slti      $v0, $v0, 0x3
    /* 99094 800A9094 1280023C */  lui        $v0, %hi(loadflag)
    /* 99098 800A9098 7CB1428C */  lw         $v0, %lo(loadflag)($v0)
    /* 9909C 800A909C 00000000 */  nop
    /* 990A0 800A90A0 1C004014 */  bnez       $v0, .L800A9114
    /* 990A4 800A90A4 00000000 */   nop
    /* 990A8 800A90A8 EF68050C */  jal        func_8015A3BC
    /* 990AC 800A90AC 21800000 */   addu      $s0, $zero, $zero
    /* 990B0 800A90B0 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 990B4 800A90B4 21202002 */   addu      $a0, $s1, $zero
    /* 990B8 800A90B8 40004230 */  andi       $v0, $v0, 0x40
    /* 990BC 800A90BC 06004014 */  bnez       $v0, .L800A90D8
    /* 990C0 800A90C0 00000000 */   nop
    /* 990C4 800A90C4 55AD020C */  jal        GetDown__C4CPad_800ab554
    /* 990C8 800A90C8 21202002 */   addu      $a0, $s1, $zero
    /* 990CC 800A90CC 10004230 */  andi       $v0, $v0, 0x10
    /* 990D0 800A90D0 02004010 */  beqz       $v0, .L800A90DC
    /* 990D4 800A90D4 00000000 */   nop
  .L800A90D8:
    /* 990D8 800A90D8 01001024 */  addiu      $s0, $zero, 0x1
  .L800A90DC:
    /* 990DC 800A90DC 0D000012 */  beqz       $s0, .L800A9114
    /* 990E0 800A90E0 00000000 */   nop
    /* 990E4 800A90E4 1280013C */  lui        $at, %hi(loadflag)
    /* 990E8 800A90E8 7CB120AC */  sw         $zero, %lo(loadflag)($at)
    /* 990EC 800A90EC 1280013C */  lui        $at, %hi(saveflag)
    /* 990F0 800A90F0 78B120AC */  sw         $zero, %lo(saveflag)($at)
    /* 990F4 800A90F4 1280013C */  lui        $at, %hi(formatflag)
    /* 990F8 800A90F8 80B120AC */  sw         $zero, %lo(formatflag)($at)
    /* 990FC 800A90FC 1280013C */  lui        $at, %hi(AlertTxt)
    /* 99100 800A9100 58B420AC */  sw         $zero, %lo(AlertTxt)($at)
    /* 99104 800A9104 1280013C */  lui        $at, %hi(StatusTxt)
    /* 99108 800A9108 5CB420AC */  sw         $zero, %lo(StatusTxt)($at)
    /* 9910C 800A910C C6F5000C */  jal        PlaySFX__Fi
    /* 99110 800A9110 33000424 */   addiu     $a0, $zero, 0x33
  .L800A9114:
    /* 99114 800A9114 1280023C */  lui        $v0, %hi(saveflag)
    /* 99118 800A9118 78B1428C */  lw         $v0, %lo(saveflag)($v0)
    /* 9911C 800A911C 00000000 */  nop
    /* 99120 800A9120 03004228 */  slti       $v0, $v0, 0x3
  .L800A9124:
    /* 99124 800A9124 0F004014 */  bnez       $v0, .L800A9164
    /* 99128 800A9128 00000000 */   nop
    /* 9912C 800A912C 1280023C */  lui        $v0, %hi(AlertTxt)
    /* 99130 800A9130 58B4428C */  lw         $v0, %lo(AlertTxt)($v0)
    /* 99134 800A9134 00000000 */  nop
    /* 99138 800A9138 0A004014 */  bnez       $v0, .L800A9164
    /* 9913C 800A913C 00000000 */   nop
    /* 99140 800A9140 1280023C */  lui        $v0, %hi(current_card)
    /* 99144 800A9144 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 99148 800A9148 00000000 */  nop
    /* 9914C 800A914C 80100200 */  sll        $v0, $v0, 2
    /* 99150 800A9150 1280013C */  lui        $at, %hi(card_side_save)
    /* 99154 800A9154 21082200 */  addu       $at, $at, $v0
    /* 99158 800A9158 B0B1248C */  lw         $a0, %lo(card_side_save)($at)
    /* 9915C 800A915C 9797020C */  jal        ShowLoadingBox__Fi
    /* 99160 800A9160 00000000 */   nop
  .L800A9164:
    /* 99164 800A9164 1280023C */  lui        $v0, %hi(loadflag)
    /* 99168 800A9168 7CB1428C */  lw         $v0, %lo(loadflag)($v0)
    /* 9916C 800A916C 00000000 */  nop
    /* 99170 800A9170 18004010 */  beqz       $v0, .L800A91D4
    /* 99174 800A9174 00000000 */   nop
    /* 99178 800A9178 1280023C */  lui        $v0, %hi(AlertTxt)
    /* 9917C 800A917C 58B4428C */  lw         $v0, %lo(AlertTxt)($v0)
    /* 99180 800A9180 00000000 */  nop
    /* 99184 800A9184 0A004014 */  bnez       $v0, .L800A91B0
    /* 99188 800A9188 00000000 */   nop
    /* 9918C 800A918C 1280023C */  lui        $v0, %hi(current_card)
    /* 99190 800A9190 60B4428C */  lw         $v0, %lo(current_card)($v0)
    /* 99194 800A9194 00000000 */  nop
    /* 99198 800A9198 80100200 */  sll        $v0, $v0, 2
    /* 9919C 800A919C 1280013C */  lui        $at, %hi(card_side_load)
    /* 991A0 800A91A0 21082200 */  addu       $at, $at, $v0
    /* 991A4 800A91A4 B8B1248C */  lw         $a0, %lo(card_side_load)($at)
    /* 991A8 800A91A8 9797020C */  jal        ShowLoadingBox__Fi
    /* 991AC 800A91AC 00000000 */   nop
  .L800A91B0:
    /* 991B0 800A91B0 1280043C */  lui        $a0, %hi(loadflag)
    /* 991B4 800A91B4 7CB1848C */  lw         $a0, %lo(loadflag)($a0)
    /* 991B8 800A91B8 00000000 */  nop
    /* 991BC 800A91BC 05008018 */  blez       $a0, .L800A91D4
    /* 991C0 800A91C0 00000000 */   nop
    /* 991C4 800A91C4 DB96020C */  jal        CountdownLoad__Fi
    /* 991C8 800A91C8 00000000 */   nop
    /* 991CC 800A91CC 1280013C */  lui        $at, %hi(loadflag)
    /* 991D0 800A91D0 7CB122AC */  sw         $v0, %lo(loadflag)($at)
  .L800A91D4:
    /* 991D4 800A91D4 1280043C */  lui        $a0, %hi(saveflag)
    /* 991D8 800A91D8 78B1848C */  lw         $a0, %lo(saveflag)($a0)
    /* 991DC 800A91DC 00000000 */  nop
    /* 991E0 800A91E0 05008018 */  blez       $a0, .L800A91F8
    /* 991E4 800A91E4 00000000 */   nop
    /* 991E8 800A91E8 5F97020C */  jal        CountdownSave__Fi
    /* 991EC 800A91EC 00000000 */   nop
    /* 991F0 800A91F0 1280013C */  lui        $at, %hi(saveflag)
    /* 991F4 800A91F4 78B122AC */  sw         $v0, %lo(saveflag)($at)
  .L800A91F8:
    /* 991F8 800A91F8 3400BF8F */  lw         $ra, 0x34($sp)
    /* 991FC 800A91FC 3000B28F */  lw         $s2, 0x30($sp)
    /* 99200 800A9200 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 99204 800A9204 2800B08F */  lw         $s0, 0x28($sp)
    /* 99208 800A9208 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 9920C 800A920C 0800E003 */  jr         $ra
    /* 99210 800A9210 00000000 */   nop
endlabel MemcardPad__Fv
