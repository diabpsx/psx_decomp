.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReconstructSlotName__Fii, 0x3F8

glabel ReconstructSlotName__Fii
    /* 21828 8015B420 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 2182C 8015B424 2400B5AF */  sw         $s5, 0x24($sp)
    /* 21830 8015B428 21A88000 */  addu       $s5, $a0, $zero
    /* 21834 8015B42C 2800B6AF */  sw         $s6, 0x28($sp)
    /* 21838 8015B430 21B0A000 */  addu       $s6, $a1, $zero
    /* 2183C 8015B434 3F000324 */  addiu      $v1, $zero, 0x3F
    /* 21840 8015B438 1680023C */  lui        $v0, %hi(TempStr + 0x3F)
    /* 21844 8015B43C 0F954224 */  addiu      $v0, $v0, %lo(TempStr + 0x3F)
    /* 21848 8015B440 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 2184C 8015B444 2000B4AF */  sw         $s4, 0x20($sp)
    /* 21850 8015B448 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 21854 8015B44C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 21858 8015B450 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2185C 8015B454 1000B0AF */  sw         $s0, 0x10($sp)
  .L8015B458:
    /* 21860 8015B458 000040A0 */  sb         $zero, 0x0($v0)
    /* 21864 8015B45C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 21868 8015B460 FDFF6104 */  bgez       $v1, .L8015B458
    /* 2186C 8015B464 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 21870 8015B468 40921600 */  sll        $s2, $s6, 9
    /* 21874 8015B46C 409B1500 */  sll        $s3, $s5, 13
    /* 21878 8015B470 21A05302 */  addu       $s4, $s2, $s3
    /* 2187C 8015B474 1480013C */  lui        $at, %hi(card_header + 0xA)
    /* 21880 8015B478 21083400 */  addu       $at, $at, $s4
    /* 21884 8015B47C 02E72390 */  lbu        $v1, %lo(card_header + 0xA)($at)
    /* 21888 8015B480 31000224 */  addiu      $v0, $zero, 0x31
    /* 2188C 8015B484 51006214 */  bne        $v1, $v0, .L8015B5CC
    /* 21890 8015B488 32000224 */   addiu     $v0, $zero, 0x32
    /* 21894 8015B48C 1680113C */  lui        $s1, %hi(TempStr)
    /* 21898 8015B490 D0943126 */  addiu      $s1, $s1, %lo(TempStr)
    /* 2189C 8015B494 C00C8283 */  lb         $v0, %gp_rel(D_8011B440)($gp)
    /* 218A0 8015B498 C10C8383 */  lb         $v1, %gp_rel(D_8011B441)($gp)
    /* 218A4 8015B49C 000022A2 */  sb         $v0, 0x0($s1)
    /* 218A8 8015B4A0 010023A2 */  sb         $v1, 0x1($s1)
    /* 218AC 8015B4A4 4AED010C */  jal        GetStr__Fi
    /* 218B0 8015B4A8 92020424 */   addiu     $a0, $zero, 0x292
    /* 218B4 8015B4AC 21202002 */  addu       $a0, $s1, $zero
    /* 218B8 8015B4B0 FC40000C */  jal        strcat
    /* 218BC 8015B4B4 21284000 */   addu      $a1, $v0, $zero
    /* 218C0 8015B4B8 21202002 */  addu       $a0, $s1, $zero
    /* 218C4 8015B4BC 1280103C */  lui        $s0, %hi(D_8011B444)
    /* 218C8 8015B4C0 44B41026 */  addiu      $s0, $s0, %lo(D_8011B444)
    /* 218CC 8015B4C4 FC40000C */  jal        strcat
    /* 218D0 8015B4C8 21280002 */   addu      $a1, $s0, $zero
    /* 218D4 8015B4CC 4AED010C */  jal        GetStr__Fi
    /* 218D8 8015B4D0 90020424 */   addiu     $a0, $zero, 0x290
    /* 218DC 8015B4D4 21202002 */  addu       $a0, $s1, $zero
    /* 218E0 8015B4D8 FC40000C */  jal        strcat
    /* 218E4 8015B4DC 21284000 */   addu      $a1, $v0, $zero
    /* 218E8 8015B4E0 21202002 */  addu       $a0, $s1, $zero
    /* 218EC 8015B4E4 1480053C */  lui        $a1, %hi(card_header)
    /* 218F0 8015B4E8 F8E6A524 */  addiu      $a1, $a1, %lo(card_header)
    /* 218F4 8015B4EC 21284502 */  addu       $a1, $s2, $a1
    /* 218F8 8015B4F0 21286502 */  addu       $a1, $s3, $a1
    /* 218FC 8015B4F4 0E00A524 */  addiu      $a1, $a1, 0xE
    /* 21900 8015B4F8 7B67000C */  jal        strncat
    /* 21904 8015B4FC 02000624 */   addiu     $a2, $zero, 0x2
    /* 21908 8015B500 21202002 */  addu       $a0, $s1, $zero
    /* 2190C 8015B504 FC40000C */  jal        strcat
    /* 21910 8015B508 21280002 */   addu      $a1, $s0, $zero
    /* 21914 8015B50C 1480013C */  lui        $at, %hi(card_header + 0x11)
    /* 21918 8015B510 21083400 */  addu       $at, $at, $s4
    /* 2191C 8015B514 09E72390 */  lbu        $v1, %lo(card_header + 0x11)($at)
    /* 21920 8015B518 53000224 */  addiu      $v0, $zero, 0x53
    /* 21924 8015B51C 0F006210 */  beq        $v1, $v0, .L8015B55C
    /* 21928 8015B520 54006228 */   slti      $v0, $v1, 0x54
    /* 2192C 8015B524 05004010 */  beqz       $v0, .L8015B53C
    /* 21930 8015B528 52000224 */   addiu     $v0, $zero, 0x52
    /* 21934 8015B52C 10006210 */  beq        $v1, $v0, .L8015B570
    /* 21938 8015B530 00000000 */   nop
    /* 2193C 8015B534 616D0508 */  j          .L8015B584
    /* 21940 8015B538 00000000 */   nop
  .L8015B53C:
    /* 21944 8015B53C 57000224 */  addiu      $v0, $zero, 0x57
    /* 21948 8015B540 10006214 */  bne        $v1, $v0, .L8015B584
    /* 2194C 8015B544 00000000 */   nop
    /* 21950 8015B548 4AED010C */  jal        GetStr__Fi
    /* 21954 8015B54C BE040424 */   addiu     $a0, $zero, 0x4BE
    /* 21958 8015B550 21202002 */  addu       $a0, $s1, $zero
    /* 2195C 8015B554 656D0508 */  j          .L8015B594
    /* 21960 8015B558 21284000 */   addu      $a1, $v0, $zero
  .L8015B55C:
    /* 21964 8015B55C 4AED010C */  jal        GetStr__Fi
    /* 21968 8015B560 E8030424 */   addiu     $a0, $zero, 0x3E8
    /* 2196C 8015B564 21202002 */  addu       $a0, $s1, $zero
    /* 21970 8015B568 656D0508 */  j          .L8015B594
    /* 21974 8015B56C 21284000 */   addu      $a1, $v0, $zero
  .L8015B570:
    /* 21978 8015B570 4AED010C */  jal        GetStr__Fi
    /* 2197C 8015B574 75030424 */   addiu     $a0, $zero, 0x375
    /* 21980 8015B578 21202002 */  addu       $a0, $s1, $zero
    /* 21984 8015B57C 656D0508 */  j          .L8015B594
    /* 21988 8015B580 21284000 */   addu      $a1, $v0, $zero
  .L8015B584:
    /* 2198C 8015B584 1680043C */  lui        $a0, %hi(TempStr)
    /* 21990 8015B588 D0948424 */  addiu      $a0, $a0, %lo(TempStr)
    /* 21994 8015B58C 1280053C */  lui        $a1, %hi(D_8011B448)
    /* 21998 8015B590 48B4A524 */  addiu      $a1, $a1, %lo(D_8011B448)
  .L8015B594:
    /* 2199C 8015B594 FC40000C */  jal        strcat
    /* 219A0 8015B598 00000000 */   nop
    /* 219A4 8015B59C 1680043C */  lui        $a0, %hi(TempStr)
    /* 219A8 8015B5A0 D0948424 */  addiu      $a0, $a0, %lo(TempStr)
    /* 219AC 8015B5A4 402B1500 */  sll        $a1, $s5, 13
    /* 219B0 8015B5A8 40121600 */  sll        $v0, $s6, 9
    /* 219B4 8015B5AC 1480033C */  lui        $v1, %hi(card_header)
    /* 219B8 8015B5B0 F8E66324 */  addiu      $v1, $v1, %lo(card_header)
    /* 219BC 8015B5B4 21104300 */  addu       $v0, $v0, $v1
    /* 219C0 8015B5B8 2128A200 */  addu       $a1, $a1, $v0
    /* 219C4 8015B5BC FC40000C */  jal        strcat
    /* 219C8 8015B5C0 1400A524 */   addiu     $a1, $a1, 0x14
    /* 219CC 8015B5C4 F96D0508 */  j          .L8015B7E4
    /* 219D0 8015B5C8 00000000 */   nop
  .L8015B5CC:
    /* 219D4 8015B5CC 7F006214 */  bne        $v1, $v0, .L8015B7CC
    /* 219D8 8015B5D0 00000000 */   nop
    /* 219DC 8015B5D4 1680113C */  lui        $s1, %hi(TempStr)
    /* 219E0 8015B5D8 D0943126 */  addiu      $s1, $s1, %lo(TempStr)
    /* 219E4 8015B5DC D00C8283 */  lb         $v0, %gp_rel(D_8011B450)($gp)
    /* 219E8 8015B5E0 D10C8383 */  lb         $v1, %gp_rel(D_8011B451)($gp)
    /* 219EC 8015B5E4 000022A2 */  sb         $v0, 0x0($s1)
    /* 219F0 8015B5E8 010023A2 */  sb         $v1, 0x1($s1)
    /* 219F4 8015B5EC 4AED010C */  jal        GetStr__Fi
    /* 219F8 8015B5F0 92020424 */   addiu     $a0, $zero, 0x292
    /* 219FC 8015B5F4 21202002 */  addu       $a0, $s1, $zero
    /* 21A00 8015B5F8 FC40000C */  jal        strcat
    /* 21A04 8015B5FC 21284000 */   addu      $a1, $v0, $zero
    /* 21A08 8015B600 21202002 */  addu       $a0, $s1, $zero
    /* 21A0C 8015B604 1280103C */  lui        $s0, %hi(D_8011B444)
    /* 21A10 8015B608 44B41026 */  addiu      $s0, $s0, %lo(D_8011B444)
    /* 21A14 8015B60C FC40000C */  jal        strcat
    /* 21A18 8015B610 21280002 */   addu      $a1, $s0, $zero
    /* 21A1C 8015B614 4AED010C */  jal        GetStr__Fi
    /* 21A20 8015B618 90020424 */   addiu     $a0, $zero, 0x290
    /* 21A24 8015B61C 21202002 */  addu       $a0, $s1, $zero
    /* 21A28 8015B620 FC40000C */  jal        strcat
    /* 21A2C 8015B624 21284000 */   addu      $a1, $v0, $zero
    /* 21A30 8015B628 21202002 */  addu       $a0, $s1, $zero
    /* 21A34 8015B62C 1480053C */  lui        $a1, %hi(card_header)
    /* 21A38 8015B630 F8E6A524 */  addiu      $a1, $a1, %lo(card_header)
    /* 21A3C 8015B634 21284502 */  addu       $a1, $s2, $a1
    /* 21A40 8015B638 21286502 */  addu       $a1, $s3, $a1
    /* 21A44 8015B63C 0E00A524 */  addiu      $a1, $a1, 0xE
    /* 21A48 8015B640 7B67000C */  jal        strncat
    /* 21A4C 8015B644 02000624 */   addiu     $a2, $zero, 0x2
    /* 21A50 8015B648 21202002 */  addu       $a0, $s1, $zero
    /* 21A54 8015B64C FC40000C */  jal        strcat
    /* 21A58 8015B650 21280002 */   addu      $a1, $s0, $zero
    /* 21A5C 8015B654 1480013C */  lui        $at, %hi(card_header + 0x11)
    /* 21A60 8015B658 21083400 */  addu       $at, $at, $s4
    /* 21A64 8015B65C 09E72390 */  lbu        $v1, %lo(card_header + 0x11)($at)
    /* 21A68 8015B660 53000224 */  addiu      $v0, $zero, 0x53
    /* 21A6C 8015B664 0F006210 */  beq        $v1, $v0, .L8015B6A4
    /* 21A70 8015B668 54006228 */   slti      $v0, $v1, 0x54
    /* 21A74 8015B66C 05004010 */  beqz       $v0, .L8015B684
    /* 21A78 8015B670 52000224 */   addiu     $v0, $zero, 0x52
    /* 21A7C 8015B674 10006210 */  beq        $v1, $v0, .L8015B6B8
    /* 21A80 8015B678 00000000 */   nop
    /* 21A84 8015B67C B36D0508 */  j          .L8015B6CC
    /* 21A88 8015B680 00000000 */   nop
  .L8015B684:
    /* 21A8C 8015B684 57000224 */  addiu      $v0, $zero, 0x57
    /* 21A90 8015B688 10006214 */  bne        $v1, $v0, .L8015B6CC
    /* 21A94 8015B68C 00000000 */   nop
    /* 21A98 8015B690 4AED010C */  jal        GetStr__Fi
    /* 21A9C 8015B694 BE040424 */   addiu     $a0, $zero, 0x4BE
    /* 21AA0 8015B698 21202002 */  addu       $a0, $s1, $zero
    /* 21AA4 8015B69C B76D0508 */  j          .L8015B6DC
    /* 21AA8 8015B6A0 21284000 */   addu      $a1, $v0, $zero
  .L8015B6A4:
    /* 21AAC 8015B6A4 4AED010C */  jal        GetStr__Fi
    /* 21AB0 8015B6A8 E8030424 */   addiu     $a0, $zero, 0x3E8
    /* 21AB4 8015B6AC 21202002 */  addu       $a0, $s1, $zero
    /* 21AB8 8015B6B0 B76D0508 */  j          .L8015B6DC
    /* 21ABC 8015B6B4 21284000 */   addu      $a1, $v0, $zero
  .L8015B6B8:
    /* 21AC0 8015B6B8 4AED010C */  jal        GetStr__Fi
    /* 21AC4 8015B6BC 75030424 */   addiu     $a0, $zero, 0x375
    /* 21AC8 8015B6C0 21202002 */  addu       $a0, $s1, $zero
    /* 21ACC 8015B6C4 B76D0508 */  j          .L8015B6DC
    /* 21AD0 8015B6C8 21284000 */   addu      $a1, $v0, $zero
  .L8015B6CC:
    /* 21AD4 8015B6CC 1680043C */  lui        $a0, %hi(TempStr)
    /* 21AD8 8015B6D0 D0948424 */  addiu      $a0, $a0, %lo(TempStr)
    /* 21ADC 8015B6D4 1280053C */  lui        $a1, %hi(D_8011B448)
    /* 21AE0 8015B6D8 48B4A524 */  addiu      $a1, $a1, %lo(D_8011B448)
  .L8015B6DC:
    /* 21AE4 8015B6DC FC40000C */  jal        strcat
    /* 21AE8 8015B6E0 408B1500 */   sll       $s1, $s5, 13
    /* 21AEC 8015B6E4 1680123C */  lui        $s2, %hi(TempStr)
    /* 21AF0 8015B6E8 D0945226 */  addiu      $s2, $s2, %lo(TempStr)
    /* 21AF4 8015B6EC 1280053C */  lui        $a1, %hi(D_8011B454)
    /* 21AF8 8015B6F0 54B4A524 */  addiu      $a1, $a1, %lo(D_8011B454)
    /* 21AFC 8015B6F4 FC40000C */  jal        strcat
    /* 21B00 8015B6F8 21204002 */   addu      $a0, $s2, $zero
    /* 21B04 8015B6FC 4AED010C */  jal        GetStr__Fi
    /* 21B08 8015B700 90020424 */   addiu     $a0, $zero, 0x290
    /* 21B0C 8015B704 21204002 */  addu       $a0, $s2, $zero
    /* 21B10 8015B708 FC40000C */  jal        strcat
    /* 21B14 8015B70C 21284000 */   addu      $a1, $v0, $zero
    /* 21B18 8015B710 21204002 */  addu       $a0, $s2, $zero
    /* 21B1C 8015B714 40821600 */  sll        $s0, $s6, 9
    /* 21B20 8015B718 1480053C */  lui        $a1, %hi(card_header)
    /* 21B24 8015B71C F8E6A524 */  addiu      $a1, $a1, %lo(card_header)
    /* 21B28 8015B720 21280502 */  addu       $a1, $s0, $a1
    /* 21B2C 8015B724 21282502 */  addu       $a1, $s1, $a1
    /* 21B30 8015B728 1600A524 */  addiu      $a1, $a1, 0x16
    /* 21B34 8015B72C 7B67000C */  jal        strncat
    /* 21B38 8015B730 02000624 */   addiu     $a2, $zero, 0x2
    /* 21B3C 8015B734 1280053C */  lui        $a1, %hi(D_8011B444)
    /* 21B40 8015B738 44B4A524 */  addiu      $a1, $a1, %lo(D_8011B444)
    /* 21B44 8015B73C FC40000C */  jal        strcat
    /* 21B48 8015B740 21204002 */   addu      $a0, $s2, $zero
    /* 21B4C 8015B744 21801102 */  addu       $s0, $s0, $s1
    /* 21B50 8015B748 1480013C */  lui        $at, %hi(card_header + 0x19)
    /* 21B54 8015B74C 21083000 */  addu       $at, $at, $s0
    /* 21B58 8015B750 11E72390 */  lbu        $v1, %lo(card_header + 0x19)($at)
    /* 21B5C 8015B754 53000224 */  addiu      $v0, $zero, 0x53
    /* 21B60 8015B758 0C006210 */  beq        $v1, $v0, .L8015B78C
    /* 21B64 8015B75C 54006228 */   slti      $v0, $v1, 0x54
    /* 21B68 8015B760 05004010 */  beqz       $v0, .L8015B778
    /* 21B6C 8015B764 52000224 */   addiu     $v0, $zero, 0x52
    /* 21B70 8015B768 09006210 */  beq        $v1, $v0, .L8015B790
    /* 21B74 8015B76C 75030424 */   addiu     $a0, $zero, 0x375
    /* 21B78 8015B770 EB6D0508 */  j          .L8015B7AC
    /* 21B7C 8015B774 00000000 */   nop
  .L8015B778:
    /* 21B80 8015B778 57000224 */  addiu      $v0, $zero, 0x57
    /* 21B84 8015B77C 0B006214 */  bne        $v1, $v0, .L8015B7AC
    /* 21B88 8015B780 BE040424 */   addiu     $a0, $zero, 0x4BE
    /* 21B8C 8015B784 E46D0508 */  j          .L8015B790
    /* 21B90 8015B788 00000000 */   nop
  .L8015B78C:
    /* 21B94 8015B78C E8030424 */  addiu      $a0, $zero, 0x3E8
  .L8015B790:
    /* 21B98 8015B790 4AED010C */  jal        GetStr__Fi
    /* 21B9C 8015B794 00000000 */   nop
    /* 21BA0 8015B798 21204002 */  addu       $a0, $s2, $zero
    /* 21BA4 8015B79C FC40000C */  jal        strcat
    /* 21BA8 8015B7A0 21284000 */   addu      $a1, $v0, $zero
    /* 21BAC 8015B7A4 F96D0508 */  j          .L8015B7E4
    /* 21BB0 8015B7A8 00000000 */   nop
  .L8015B7AC:
    /* 21BB4 8015B7AC 1680043C */  lui        $a0, %hi(TempStr)
    /* 21BB8 8015B7B0 D0948424 */  addiu      $a0, $a0, %lo(TempStr)
    /* 21BBC 8015B7B4 1280053C */  lui        $a1, %hi(D_8011B448)
    /* 21BC0 8015B7B8 48B4A524 */  addiu      $a1, $a1, %lo(D_8011B448)
    /* 21BC4 8015B7BC FC40000C */  jal        strcat
    /* 21BC8 8015B7C0 00000000 */   nop
    /* 21BCC 8015B7C4 F96D0508 */  j          .L8015B7E4
    /* 21BD0 8015B7C8 00000000 */   nop
  .L8015B7CC:
    /* 21BD4 8015B7CC 4AED010C */  jal        GetStr__Fi
    /* 21BD8 8015B7D0 91020424 */   addiu     $a0, $zero, 0x291
    /* 21BDC 8015B7D4 1680043C */  lui        $a0, %hi(TempStr)
    /* 21BE0 8015B7D8 D0948424 */  addiu      $a0, $a0, %lo(TempStr)
    /* 21BE4 8015B7DC F240000C */  jal        strcpy
    /* 21BE8 8015B7E0 21284000 */   addu      $a1, $v0, $zero
  .L8015B7E4:
    /* 21BEC 8015B7E4 1680023C */  lui        $v0, %hi(TempStr)
    /* 21BF0 8015B7E8 D0944224 */  addiu      $v0, $v0, %lo(TempStr)
    /* 21BF4 8015B7EC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 21BF8 8015B7F0 2800B68F */  lw         $s6, 0x28($sp)
    /* 21BFC 8015B7F4 2400B58F */  lw         $s5, 0x24($sp)
    /* 21C00 8015B7F8 2000B48F */  lw         $s4, 0x20($sp)
    /* 21C04 8015B7FC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 21C08 8015B800 1800B28F */  lw         $s2, 0x18($sp)
    /* 21C0C 8015B804 1400B18F */  lw         $s1, 0x14($sp)
    /* 21C10 8015B808 1000B08F */  lw         $s0, 0x10($sp)
    /* 21C14 8015B80C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 21C18 8015B810 0800E003 */  jr         $ra
    /* 21C1C 8015B814 00000000 */   nop
endlabel ReconstructSlotName__Fii
