.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeNewNameMenuCtrl__Fv, 0x5C8

glabel FeNewNameMenuCtrl__Fv
    /* 18F4 8013B4EC 1280023C */  lui        $v0, %hi(qtextflag)
    /* 18F8 8013B4F0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 18FC 8013B4F4 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1900 8013B4F8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1904 8013B4FC 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 1908 8013B500 66014014 */  bnez       $v0, .L8013BA9C
    /* 190C 8013B504 2800B0AF */   sw        $s0, 0x28($sp)
    /* 1910 8013B508 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 1914 8013B50C ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 1918 8013B510 00000000 */  nop
    /* 191C 8013B514 61014014 */  bnez       $v0, .L8013BA9C
    /* 1920 8013B518 00000000 */   nop
    /* 1924 8013B51C 1280023C */  lui        $v0, %hi(PauseMode)
    /* 1928 8013B520 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 192C 8013B524 00000000 */  nop
    /* 1930 8013B528 5C014014 */  bnez       $v0, .L8013BA9C
    /* 1934 8013B52C 00000000 */   nop
    /* 1938 8013B530 1280023C */  lui        $v0, %hi(DavesPad)
    /* 193C 8013B534 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1940 8013B538 00000000 */  nop
    /* 1944 8013B53C 04004230 */  andi       $v0, $v0, 0x4
    /* 1948 8013B540 14004010 */  beqz       $v0, .L8013B594
    /* 194C 8013B544 6666023C */   lui       $v0, (0x66666667 >> 16)
    /* 1950 8013B548 140C858F */  lw         $a1, %gp_rel(FeCurMenu)($gp)
    /* 1954 8013B54C 00000000 */  nop
    /* 1958 8013B550 0400A68C */  lw         $a2, 0x4($a1)
    /* 195C 8013B554 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
    /* 1960 8013B558 FFFFC424 */  addiu      $a0, $a2, -0x1
    /* 1964 8013B55C 18008200 */  mult       $a0, $v0
    /* 1968 8013B560 C3170400 */  sra        $v0, $a0, 31
    /* 196C 8013B564 10380000 */  mfhi       $a3
    /* 1970 8013B568 83180700 */  sra        $v1, $a3, 2
    /* 1974 8013B56C 23186200 */  subu       $v1, $v1, $v0
    /* 1978 8013B570 80100300 */  sll        $v0, $v1, 2
    /* 197C 8013B574 21104300 */  addu       $v0, $v0, $v1
    /* 1980 8013B578 40100200 */  sll        $v0, $v0, 1
    /* 1984 8013B57C 03008214 */  bne        $a0, $v0, .L8013B58C
    /* 1988 8013B580 0400A4AC */   sw        $a0, 0x4($a1)
    /* 198C 8013B584 0900C224 */  addiu      $v0, $a2, 0x9
    /* 1990 8013B588 0400A2AC */  sw         $v0, 0x4($a1)
  .L8013B58C:
    /* 1994 8013B58C C6F5000C */  jal        PlaySFX__Fi
    /* 1998 8013B590 32000424 */   addiu     $a0, $zero, 0x32
  .L8013B594:
    /* 199C 8013B594 1280023C */  lui        $v0, %hi(DavesPad)
    /* 19A0 8013B598 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 19A4 8013B59C 00000000 */  nop
    /* 19A8 8013B5A0 08004230 */  andi       $v0, $v0, 0x8
    /* 19AC 8013B5A4 15004010 */  beqz       $v0, .L8013B5FC
    /* 19B0 8013B5A8 6666023C */   lui       $v0, (0x66666667 >> 16)
    /* 19B4 8013B5AC 140C858F */  lw         $a1, %gp_rel(FeCurMenu)($gp)
    /* 19B8 8013B5B0 00000000 */  nop
    /* 19BC 8013B5B4 0400A68C */  lw         $a2, 0x4($a1)
    /* 19C0 8013B5B8 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
    /* 19C4 8013B5BC 0100C424 */  addiu      $a0, $a2, 0x1
    /* 19C8 8013B5C0 18008200 */  mult       $a0, $v0
    /* 19CC 8013B5C4 C3170400 */  sra        $v0, $a0, 31
    /* 19D0 8013B5C8 0400A4AC */  sw         $a0, 0x4($a1)
    /* 19D4 8013B5CC FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 19D8 8013B5D0 10380000 */  mfhi       $a3
    /* 19DC 8013B5D4 83180700 */  sra        $v1, $a3, 2
    /* 19E0 8013B5D8 23186200 */  subu       $v1, $v1, $v0
    /* 19E4 8013B5DC 80100300 */  sll        $v0, $v1, 2
    /* 19E8 8013B5E0 21104300 */  addu       $v0, $v0, $v1
    /* 19EC 8013B5E4 40100200 */  sll        $v0, $v0, 1
    /* 19F0 8013B5E8 02004414 */  bne        $v0, $a0, .L8013B5F4
    /* 19F4 8013B5EC F7FFC224 */   addiu     $v0, $a2, -0x9
    /* 19F8 8013B5F0 0400A2AC */  sw         $v0, 0x4($a1)
  .L8013B5F4:
    /* 19FC 8013B5F4 C6F5000C */  jal        PlaySFX__Fi
    /* 1A00 8013B5F8 32000424 */   addiu     $a0, $zero, 0x32
  .L8013B5FC:
    /* 1A04 8013B5FC 1280023C */  lui        $v0, %hi(DavesPad)
    /* 1A08 8013B600 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1A0C 8013B604 00000000 */  nop
    /* 1A10 8013B608 01004230 */  andi       $v0, $v0, 0x1
    /* 1A14 8013B60C 0C004010 */  beqz       $v0, .L8013B640
    /* 1A18 8013B610 00000000 */   nop
    /* 1A1C 8013B614 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 1A20 8013B618 00000000 */  nop
    /* 1A24 8013B61C 0400648C */  lw         $a0, 0x4($v1)
    /* 1A28 8013B620 00000000 */  nop
    /* 1A2C 8013B624 F6FF8224 */  addiu      $v0, $a0, -0xA
    /* 1A30 8013B628 0300401C */  bgtz       $v0, .L8013B638
    /* 1A34 8013B62C 040062AC */   sw        $v0, 0x4($v1)
    /* 1A38 8013B630 1E008224 */  addiu      $v0, $a0, 0x1E
    /* 1A3C 8013B634 040062AC */  sw         $v0, 0x4($v1)
  .L8013B638:
    /* 1A40 8013B638 C6F5000C */  jal        PlaySFX__Fi
    /* 1A44 8013B63C 32000424 */   addiu     $a0, $zero, 0x32
  .L8013B640:
    /* 1A48 8013B640 1280023C */  lui        $v0, %hi(DavesPad)
    /* 1A4C 8013B644 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1A50 8013B648 00000000 */  nop
    /* 1A54 8013B64C 02004230 */  andi       $v0, $v0, 0x2
    /* 1A58 8013B650 0D004010 */  beqz       $v0, .L8013B688
    /* 1A5C 8013B654 00000000 */   nop
    /* 1A60 8013B658 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 1A64 8013B65C 00000000 */  nop
    /* 1A68 8013B660 0400648C */  lw         $a0, 0x4($v1)
    /* 1A6C 8013B664 00000000 */  nop
    /* 1A70 8013B668 0A008224 */  addiu      $v0, $a0, 0xA
    /* 1A74 8013B66C 040062AC */  sw         $v0, 0x4($v1)
    /* 1A78 8013B670 29004228 */  slti       $v0, $v0, 0x29
    /* 1A7C 8013B674 02004014 */  bnez       $v0, .L8013B680
    /* 1A80 8013B678 E2FF8224 */   addiu     $v0, $a0, -0x1E
    /* 1A84 8013B67C 040062AC */  sw         $v0, 0x4($v1)
  .L8013B680:
    /* 1A88 8013B680 C6F5000C */  jal        PlaySFX__Fi
    /* 1A8C 8013B684 32000424 */   addiu     $a0, $zero, 0x32
  .L8013B688:
    /* 1A90 8013B688 1280033C */  lui        $v1, %hi(DavesPad)
    /* 1A94 8013B68C 12AB6394 */  lhu        $v1, %lo(DavesPad)($v1)
    /* 1A98 8013B690 00000000 */  nop
    /* 1A9C 8013B694 00016230 */  andi       $v0, $v1, 0x100
    /* 1AA0 8013B698 05004010 */  beqz       $v0, .L8013B6B0
    /* 1AA4 8013B69C 10006230 */   andi      $v0, $v1, 0x10
    /* 1AA8 8013B6A0 49E9040C */  jal        FePrevMenu__Fv
    /* 1AAC 8013B6A4 00000000 */   nop
    /* 1AB0 8013B6A8 A5EE0408 */  j          .L8013BA94
    /* 1AB4 8013B6AC 00000000 */   nop
  .L8013B6B0:
    /* 1AB8 8013B6B0 23004010 */  beqz       $v0, .L8013B740
    /* 1ABC 8013B6B4 00000000 */   nop
    /* 1AC0 8013B6B8 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1AC4 8013B6BC 00000000 */  nop
    /* 1AC8 8013B6C0 40200200 */  sll        $a0, $v0, 1
    /* 1ACC 8013B6C4 21208200 */  addu       $a0, $a0, $v0
    /* 1AD0 8013B6C8 80200400 */  sll        $a0, $a0, 2
    /* 1AD4 8013B6CC 23208200 */  subu       $a0, $a0, $v0
    /* 1AD8 8013B6D0 0D80023C */  lui        $v0, %hi(FePlayerName)
    /* 1ADC 8013B6D4 F8E24224 */  addiu      $v0, $v0, %lo(FePlayerName)
    /* 1AE0 8013B6D8 8767000C */  jal        strlen
    /* 1AE4 8013B6DC 21208200 */   addu      $a0, $a0, $v0
    /* 1AE8 8013B6E0 05004014 */  bnez       $v0, .L8013B6F8
    /* 1AEC 8013B6E4 00000000 */   nop
    /* 1AF0 8013B6E8 C6F5000C */  jal        PlaySFX__Fi
    /* 1AF4 8013B6EC D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 1AF8 8013B6F0 D0ED0408 */  j          .L8013B740
    /* 1AFC 8013B6F4 00000000 */   nop
  .L8013B6F8:
    /* 1B00 8013B6F8 C6F5000C */  jal        PlaySFX__Fi
    /* 1B04 8013B6FC 33000424 */   addiu     $a0, $zero, 0x33
    /* 1B08 8013B700 040C838F */  lw         $v1, %gp_rel(FeNoOfPlayers)($gp)
    /* 1B0C 8013B704 00000000 */  nop
    /* 1B10 8013B708 09006018 */  blez       $v1, .L8013B730
    /* 1B14 8013B70C FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 1B18 8013B710 0D80043C */  lui        $a0, %hi(FeNewP2ClassMenu)
    /* 1B1C 8013B714 0CD78424 */  addiu      $a0, $a0, %lo(FeNewP2ClassMenu)
    /* 1B20 8013B718 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1B24 8013B71C 040C83AF */  sw         $v1, %gp_rel(FeNoOfPlayers)($gp)
    /* 1B28 8013B720 01004224 */  addiu      $v0, $v0, 0x1
    /* 1B2C 8013B724 F80B82AF */  sw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1B30 8013B728 CEED0408 */  j          .L8013B738
    /* 1B34 8013B72C 00000000 */   nop
  .L8013B730:
    /* 1B38 8013B730 0D80043C */  lui        $a0, %hi(FeDifficultyMenu)
    /* 1B3C 8013B734 44D78424 */  addiu      $a0, $a0, %lo(FeDifficultyMenu)
  .L8013B738:
    /* 1B40 8013B738 29E9040C */  jal        FeNewMenu__FP7FeTable
    /* 1B44 8013B73C 00000000 */   nop
  .L8013B740:
    /* 1B48 8013B740 1280023C */  lui        $v0, %hi(DavesPad)
    /* 1B4C 8013B744 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1B50 8013B748 00000000 */  nop
    /* 1B54 8013B74C 40004230 */  andi       $v0, $v0, 0x40
    /* 1B58 8013B750 D0004010 */  beqz       $v0, .L8013BA94
    /* 1B5C 8013B754 00000000 */   nop
    /* 1B60 8013B758 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 1B64 8013B75C 00000000 */  nop
    /* 1B68 8013B760 0400438C */  lw         $v1, 0x4($v0)
    /* 1B6C 8013B764 00000000 */  nop
    /* 1B70 8013B768 40100300 */  sll        $v0, $v1, 1
    /* 1B74 8013B76C 21104300 */  addu       $v0, $v0, $v1
    /* 1B78 8013B770 C0100200 */  sll        $v0, $v0, 3
    /* 1B7C 8013B774 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 1B80 8013B778 21082200 */  addu       $at, $at, $v0
    /* 1B84 8013B77C 84DB238C */  lw         $v1, %lo(FeBuffer + 0xC)($at)
    /* 1B88 8013B780 7B100224 */  addiu      $v0, $zero, 0x107B
    /* 1B8C 8013B784 03006210 */  beq        $v1, $v0, .L8013B794
    /* 1B90 8013B788 7D100224 */   addiu     $v0, $zero, 0x107D
    /* 1B94 8013B78C 0F006214 */  bne        $v1, $v0, .L8013B7CC
    /* 1B98 8013B790 00000000 */   nop
  .L8013B794:
    /* 1B9C 8013B794 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1BA0 8013B798 00000000 */  nop
    /* 1BA4 8013B79C 40200200 */  sll        $a0, $v0, 1
    /* 1BA8 8013B7A0 21208200 */  addu       $a0, $a0, $v0
    /* 1BAC 8013B7A4 80200400 */  sll        $a0, $a0, 2
    /* 1BB0 8013B7A8 23208200 */  subu       $a0, $a0, $v0
    /* 1BB4 8013B7AC 0D80023C */  lui        $v0, %hi(FePlayerName)
    /* 1BB8 8013B7B0 F8E24224 */  addiu      $v0, $v0, %lo(FePlayerName)
    /* 1BBC 8013B7B4 8767000C */  jal        strlen
    /* 1BC0 8013B7B8 21208200 */   addu      $a0, $a0, $v0
    /* 1BC4 8013B7BC 10004010 */  beqz       $v0, .L8013B800
    /* 1BC8 8013B7C0 33000424 */   addiu     $a0, $zero, 0x33
    /* 1BCC 8013B7C4 01EE0408 */  j          .L8013B804
    /* 1BD0 8013B7C8 00000000 */   nop
  .L8013B7CC:
    /* 1BD4 8013B7CC F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1BD8 8013B7D0 00000000 */  nop
    /* 1BDC 8013B7D4 40200200 */  sll        $a0, $v0, 1
    /* 1BE0 8013B7D8 21208200 */  addu       $a0, $a0, $v0
    /* 1BE4 8013B7DC 80200400 */  sll        $a0, $a0, 2
    /* 1BE8 8013B7E0 23208200 */  subu       $a0, $a0, $v0
    /* 1BEC 8013B7E4 0D80023C */  lui        $v0, %hi(FePlayerName)
    /* 1BF0 8013B7E8 F8E24224 */  addiu      $v0, $v0, %lo(FePlayerName)
    /* 1BF4 8013B7EC 8767000C */  jal        strlen
    /* 1BF8 8013B7F0 21208200 */   addu      $a0, $a0, $v0
    /* 1BFC 8013B7F4 0A00422C */  sltiu      $v0, $v0, 0xA
    /* 1C00 8013B7F8 02004014 */  bnez       $v0, .L8013B804
    /* 1C04 8013B7FC 33000424 */   addiu     $a0, $zero, 0x33
  .L8013B800:
    /* 1C08 8013B800 D3030424 */  addiu      $a0, $zero, 0x3D3
  .L8013B804:
    /* 1C0C 8013B804 C6F5000C */  jal        PlaySFX__Fi
    /* 1C10 8013B808 00000000 */   nop
    /* 1C14 8013B80C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 1C18 8013B810 00000000 */  nop
    /* 1C1C 8013B814 0400438C */  lw         $v1, 0x4($v0)
    /* 1C20 8013B818 00000000 */  nop
    /* 1C24 8013B81C 40100300 */  sll        $v0, $v1, 1
    /* 1C28 8013B820 21104300 */  addu       $v0, $v0, $v1
    /* 1C2C 8013B824 C0100200 */  sll        $v0, $v0, 3
    /* 1C30 8013B828 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 1C34 8013B82C 21082200 */  addu       $at, $at, $v0
    /* 1C38 8013B830 84DB238C */  lw         $v1, %lo(FeBuffer + 0xC)($at)
    /* 1C3C 8013B834 7B100224 */  addiu      $v0, $zero, 0x107B
    /* 1C40 8013B838 2A006214 */  bne        $v1, $v0, .L8013B8E4
    /* 1C44 8013B83C 7D100224 */   addiu     $v0, $zero, 0x107D
    /* 1C48 8013B840 F80B838F */  lw         $v1, %gp_rel(FePlayerNo)($gp)
    /* 1C4C 8013B844 1280013C */  lui        $at, %hi(FePlayerNameFlag)
    /* 1C50 8013B848 21082300 */  addu       $at, $at, $v1
    /* 1C54 8013B84C 9CB32290 */  lbu        $v0, %lo(FePlayerNameFlag)($at)
    /* 1C58 8013B850 1280043C */  lui        $a0, %hi(FePlayerNameFlag)
    /* 1C5C 8013B854 9CB38424 */  addiu      $a0, $a0, %lo(FePlayerNameFlag)
    /* 1C60 8013B858 0B004010 */  beqz       $v0, .L8013B888
    /* 1C64 8013B85C 40100300 */   sll       $v0, $v1, 1
    /* 1C68 8013B860 21104300 */  addu       $v0, $v0, $v1
    /* 1C6C 8013B864 80100200 */  sll        $v0, $v0, 2
    /* 1C70 8013B868 23104300 */  subu       $v0, $v0, $v1
    /* 1C74 8013B86C 0D80013C */  lui        $at, %hi(FePlayerName)
    /* 1C78 8013B870 21082200 */  addu       $at, $at, $v0
    /* 1C7C 8013B874 F8E220A0 */  sb         $zero, %lo(FePlayerName)($at)
    /* 1C80 8013B878 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1C84 8013B87C 00000000 */  nop
    /* 1C88 8013B880 21104400 */  addu       $v0, $v0, $a0
    /* 1C8C 8013B884 000040A0 */  sb         $zero, 0x0($v0)
  .L8013B888:
    /* 1C90 8013B888 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1C94 8013B88C 0D80113C */  lui        $s1, %hi(FePlayerName)
    /* 1C98 8013B890 F8E23126 */  addiu      $s1, $s1, %lo(FePlayerName)
    /* 1C9C 8013B894 40200200 */  sll        $a0, $v0, 1
    /* 1CA0 8013B898 21208200 */  addu       $a0, $a0, $v0
    /* 1CA4 8013B89C 80200400 */  sll        $a0, $a0, 2
    /* 1CA8 8013B8A0 23208200 */  subu       $a0, $a0, $v0
    /* 1CAC 8013B8A4 8767000C */  jal        strlen
    /* 1CB0 8013B8A8 21209100 */   addu      $a0, $a0, $s1
    /* 1CB4 8013B8AC 79004010 */  beqz       $v0, .L8013BA94
    /* 1CB8 8013B8B0 00000000 */   nop
    /* 1CBC 8013B8B4 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1CC0 8013B8B8 00000000 */  nop
    /* 1CC4 8013B8BC 40800200 */  sll        $s0, $v0, 1
    /* 1CC8 8013B8C0 21800202 */  addu       $s0, $s0, $v0
    /* 1CCC 8013B8C4 80801000 */  sll        $s0, $s0, 2
    /* 1CD0 8013B8C8 23800202 */  subu       $s0, $s0, $v0
    /* 1CD4 8013B8CC 21801102 */  addu       $s0, $s0, $s1
    /* 1CD8 8013B8D0 8767000C */  jal        strlen
    /* 1CDC 8013B8D4 21200002 */   addu      $a0, $s0, $zero
    /* 1CE0 8013B8D8 21800202 */  addu       $s0, $s0, $v0
    /* 1CE4 8013B8DC A5EE0408 */  j          .L8013BA94
    /* 1CE8 8013B8E0 FFFF00A2 */   sb        $zero, -0x1($s0)
  .L8013B8E4:
    /* 1CEC 8013B8E4 21006214 */  bne        $v1, $v0, .L8013B96C
    /* 1CF0 8013B8E8 00000000 */   nop
    /* 1CF4 8013B8EC F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1CF8 8013B8F0 00000000 */  nop
    /* 1CFC 8013B8F4 40200200 */  sll        $a0, $v0, 1
    /* 1D00 8013B8F8 21208200 */  addu       $a0, $a0, $v0
    /* 1D04 8013B8FC 80200400 */  sll        $a0, $a0, 2
    /* 1D08 8013B900 23208200 */  subu       $a0, $a0, $v0
    /* 1D0C 8013B904 0D80023C */  lui        $v0, %hi(FePlayerName)
    /* 1D10 8013B908 F8E24224 */  addiu      $v0, $v0, %lo(FePlayerName)
    /* 1D14 8013B90C 8767000C */  jal        strlen
    /* 1D18 8013B910 21208200 */   addu      $a0, $a0, $v0
    /* 1D1C 8013B914 5F004010 */  beqz       $v0, .L8013BA94
    /* 1D20 8013B918 00000000 */   nop
    /* 1D24 8013B91C 040C838F */  lw         $v1, %gp_rel(FeNoOfPlayers)($gp)
    /* 1D28 8013B920 00000000 */  nop
    /* 1D2C 8013B924 0B006018 */  blez       $v1, .L8013B954
    /* 1D30 8013B928 FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 1D34 8013B92C 0D80043C */  lui        $a0, %hi(FeNewP2ClassMenu)
    /* 1D38 8013B930 0CD78424 */  addiu      $a0, $a0, %lo(FeNewP2ClassMenu)
    /* 1D3C 8013B934 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1D40 8013B938 040C83AF */  sw         $v1, %gp_rel(FeNoOfPlayers)($gp)
    /* 1D44 8013B93C 01004224 */  addiu      $v0, $v0, 0x1
    /* 1D48 8013B940 F80B82AF */  sw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1D4C 8013B944 29E9040C */  jal        FeNewMenu__FP7FeTable
    /* 1D50 8013B948 00000000 */   nop
    /* 1D54 8013B94C A5EE0408 */  j          .L8013BA94
    /* 1D58 8013B950 00000000 */   nop
  .L8013B954:
    /* 1D5C 8013B954 0D80043C */  lui        $a0, %hi(FeDifficultyMenu)
    /* 1D60 8013B958 44D78424 */  addiu      $a0, $a0, %lo(FeDifficultyMenu)
    /* 1D64 8013B95C 29E9040C */  jal        FeNewMenu__FP7FeTable
    /* 1D68 8013B960 00000000 */   nop
    /* 1D6C 8013B964 A5EE0408 */  j          .L8013BA94
    /* 1D70 8013B968 00000000 */   nop
  .L8013B96C:
    /* 1D74 8013B96C F80B838F */  lw         $v1, %gp_rel(FePlayerNo)($gp)
    /* 1D78 8013B970 1280013C */  lui        $at, %hi(FePlayerNameFlag)
    /* 1D7C 8013B974 21082300 */  addu       $at, $at, $v1
    /* 1D80 8013B978 9CB32290 */  lbu        $v0, %lo(FePlayerNameFlag)($at)
    /* 1D84 8013B97C 1280043C */  lui        $a0, %hi(FePlayerNameFlag)
    /* 1D88 8013B980 9CB38424 */  addiu      $a0, $a0, %lo(FePlayerNameFlag)
    /* 1D8C 8013B984 0B004010 */  beqz       $v0, .L8013B9B4
    /* 1D90 8013B988 40100300 */   sll       $v0, $v1, 1
    /* 1D94 8013B98C 21104300 */  addu       $v0, $v0, $v1
    /* 1D98 8013B990 80100200 */  sll        $v0, $v0, 2
    /* 1D9C 8013B994 23104300 */  subu       $v0, $v0, $v1
    /* 1DA0 8013B998 0D80013C */  lui        $at, %hi(FePlayerName)
    /* 1DA4 8013B99C 21082200 */  addu       $at, $at, $v0
    /* 1DA8 8013B9A0 F8E220A0 */  sb         $zero, %lo(FePlayerName)($at)
    /* 1DAC 8013B9A4 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1DB0 8013B9A8 00000000 */  nop
    /* 1DB4 8013B9AC 21104400 */  addu       $v0, $v0, $a0
    /* 1DB8 8013B9B0 000040A0 */  sb         $zero, 0x0($v0)
  .L8013B9B4:
    /* 1DBC 8013B9B4 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1DC0 8013B9B8 0D80103C */  lui        $s0, %hi(FePlayerName)
    /* 1DC4 8013B9BC F8E21026 */  addiu      $s0, $s0, %lo(FePlayerName)
    /* 1DC8 8013B9C0 40200200 */  sll        $a0, $v0, 1
    /* 1DCC 8013B9C4 21208200 */  addu       $a0, $a0, $v0
    /* 1DD0 8013B9C8 80200400 */  sll        $a0, $a0, 2
    /* 1DD4 8013B9CC 23208200 */  subu       $a0, $a0, $v0
    /* 1DD8 8013B9D0 8767000C */  jal        strlen
    /* 1DDC 8013B9D4 21209000 */   addu      $a0, $a0, $s0
    /* 1DE0 8013B9D8 0A00422C */  sltiu      $v0, $v0, 0xA
    /* 1DE4 8013B9DC 2B004010 */  beqz       $v0, .L8013BA8C
    /* 1DE8 8013B9E0 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 1DEC 8013B9E4 140C848F */  lw         $a0, %gp_rel(FeCurMenu)($gp)
    /* 1DF0 8013B9E8 00000000 */  nop
    /* 1DF4 8013B9EC 0400838C */  lw         $v1, 0x4($a0)
    /* 1DF8 8013B9F0 00000000 */  nop
    /* 1DFC 8013B9F4 40100300 */  sll        $v0, $v1, 1
    /* 1E00 8013B9F8 21104300 */  addu       $v0, $v0, $v1
    /* 1E04 8013B9FC C0100200 */  sll        $v0, $v0, 3
    /* 1E08 8013BA00 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 1E0C 8013BA04 21082200 */  addu       $at, $at, $v0
    /* 1E10 8013BA08 84DB238C */  lw         $v1, %lo(FeBuffer + 0xC)($at)
    /* 1E14 8013BA0C 5E100224 */  addiu      $v0, $zero, 0x105E
    /* 1E18 8013BA10 0C006214 */  bne        $v1, $v0, .L8013BA44
    /* 1E1C 8013BA14 1000A527 */   addiu     $a1, $sp, 0x10
    /* 1E20 8013BA18 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1E24 8013BA1C 1280053C */  lui        $a1, %hi(D_8011B340)
    /* 1E28 8013BA20 40B3A524 */  addiu      $a1, $a1, %lo(D_8011B340)
    /* 1E2C 8013BA24 40200200 */  sll        $a0, $v0, 1
    /* 1E30 8013BA28 21208200 */  addu       $a0, $a0, $v0
    /* 1E34 8013BA2C 80200400 */  sll        $a0, $a0, 2
    /* 1E38 8013BA30 23208200 */  subu       $a0, $a0, $v0
    /* 1E3C 8013BA34 FC40000C */  jal        strcat
    /* 1E40 8013BA38 21209000 */   addu      $a0, $a0, $s0
    /* 1E44 8013BA3C A5EE0408 */  j          .L8013BA94
    /* 1E48 8013BA40 00000000 */   nop
  .L8013BA44:
    /* 1E4C 8013BA44 1100A0A3 */  sb         $zero, 0x11($sp)
    /* 1E50 8013BA48 0400828C */  lw         $v0, 0x4($a0)
    /* 1E54 8013BA4C 00000000 */  nop
    /* 1E58 8013BA50 40180200 */  sll        $v1, $v0, 1
    /* 1E5C 8013BA54 21186200 */  addu       $v1, $v1, $v0
    /* 1E60 8013BA58 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1E64 8013BA5C C0180300 */  sll        $v1, $v1, 3
    /* 1E68 8013BA60 40200200 */  sll        $a0, $v0, 1
    /* 1E6C 8013BA64 21208200 */  addu       $a0, $a0, $v0
    /* 1E70 8013BA68 80200400 */  sll        $a0, $a0, 2
    /* 1E74 8013BA6C 23208200 */  subu       $a0, $a0, $v0
    /* 1E78 8013BA70 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 1E7C 8013BA74 21082300 */  addu       $at, $at, $v1
    /* 1E80 8013BA78 84DB228C */  lw         $v0, %lo(FeBuffer + 0xC)($at)
    /* 1E84 8013BA7C 21209000 */  addu       $a0, $a0, $s0
    /* 1E88 8013BA80 FC40000C */  jal        strcat
    /* 1E8C 8013BA84 1000A2A3 */   sb        $v0, 0x10($sp)
    /* 1E90 8013BA88 33000424 */  addiu      $a0, $zero, 0x33
  .L8013BA8C:
    /* 1E94 8013BA8C C6F5000C */  jal        PlaySFX__Fi
    /* 1E98 8013BA90 00000000 */   nop
  .L8013BA94:
    /* 1E9C 8013BA94 EDEB040C */  jal        FeDrawChrClass__Fv
    /* 1EA0 8013BA98 00000000 */   nop
  .L8013BA9C:
    /* 1EA4 8013BA9C 3000BF8F */  lw         $ra, 0x30($sp)
    /* 1EA8 8013BAA0 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 1EAC 8013BAA4 2800B08F */  lw         $s0, 0x28($sp)
    /* 1EB0 8013BAA8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1EB4 8013BAAC 0800E003 */  jr         $ra
    /* 1EB8 8013BAB0 00000000 */   nop
endlabel FeNewNameMenuCtrl__Fv
