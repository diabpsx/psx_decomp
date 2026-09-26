.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeNewNameMenuCtrl__Fv, 0x200

glabel FeNewNameMenuCtrl__Fv
    /* 18F4 8013B4EC 1280023C */  lui        $v0, %hi(qtextflag)
    /* 18F8 8013B4F0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 18FC 8013B4F4 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1900 8013B4F8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1904 8013B4FC 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 1908 8013B500 66014014 */  bnez       $v0, D_8013BA9C
    /* 190C 8013B504 2800B0AF */   sw        $s0, 0x28($sp)
    /* 1910 8013B508 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 1914 8013B50C ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 1918 8013B510 00000000 */  nop
    /* 191C 8013B514 61014014 */  bnez       $v0, D_8013BA9C
    /* 1920 8013B518 00000000 */   nop
    /* 1924 8013B51C 1280023C */  lui        $v0, %hi(PauseMode)
    /* 1928 8013B520 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 192C 8013B524 00000000 */  nop
    /* 1930 8013B528 5C014014 */  bnez       $v0, D_8013BA9C
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
    /* 1AB0 8013B6A8 A5EE0408 */  j          D_8013BA94
    /* 1AB4 8013B6AC 00000000 */   nop
  .L8013B6B0:
    /* 1AB8 8013B6B0 23004010 */  beqz       $v0, D_8013B740
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
    /* 1AE8 8013B6E0 05004014 */  bnez       $v0, D_8013B6F8
    /* 1AEC 8013B6E4 00000000 */   nop
    /* 1AF0 8013B6E8 C6F5000C */  jal        PlaySFX__Fi
endlabel FeNewNameMenuCtrl__Fv
