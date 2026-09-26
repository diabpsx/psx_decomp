.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4Subs__Fv, 0x1E0

glabel DRLG_L4Subs__Fv
    /* 18984 8015257C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 18988 80152580 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1898C 80152584 21980000 */  addu       $s3, $zero, $zero
    /* 18990 80152588 3000BEAF */  sw         $fp, 0x30($sp)
    /* 18994 8015258C 0E801E3C */  lui        $fp, %hi(dungeon)
    /* 18998 80152590 C440DE27 */  addiu      $fp, $fp, %lo(dungeon)
    /* 1899C 80152594 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 189A0 80152598 8C001724 */  addiu      $s7, $zero, 0x8C
    /* 189A4 8015259C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 189A8 801525A0 21A80000 */  addu       $s5, $zero, $zero
    /* 189AC 801525A4 3400BFAF */  sw         $ra, 0x34($sp)
    /* 189B0 801525A8 2800B6AF */  sw         $s6, 0x28($sp)
    /* 189B4 801525AC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 189B8 801525B0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 189BC 801525B4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 189C0 801525B8 1000B0AF */  sw         $s0, 0x10($sp)
  .L801525BC:
    /* 189C4 801525BC 21880000 */  addu       $s1, $zero, $zero
    /* 189C8 801525C0 40A01300 */  sll        $s4, $s3, 1
    /* 189CC 801525C4 21B0A002 */  addu       $s6, $s5, $zero
    /* 189D0 801525C8 2190C003 */  addu       $s2, $fp, $zero
  .L801525CC:
    /* 189D4 801525CC C9F6000C */  jal        ENG_random__Fl
    /* 189D8 801525D0 03000424 */   addiu     $a0, $zero, 0x3
    /* 189DC 801525D4 26004014 */  bnez       $v0, .L80152670
    /* 189E0 801525D8 21109202 */   addu      $v0, $s4, $s2
    /* 189E4 801525DC 00004290 */  lbu        $v0, 0x0($v0)
    /* 189E8 801525E0 1580013C */  lui        $at, %hi(L4BTYPES)
    /* 189EC 801525E4 21082200 */  addu       $at, $at, $v0
    /* 189F0 801525E8 1CF43090 */  lbu        $s0, %lo(L4BTYPES)($at)
    /* 189F4 801525EC 00000000 */  nop
    /* 189F8 801525F0 1F000012 */  beqz       $s0, .L80152670
    /* 189FC 801525F4 00000000 */   nop
    /* 18A00 801525F8 1280023C */  lui        $v0, %hi(mydflags)
    /* 18A04 801525FC D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 18A08 80152600 2118D102 */  addu       $v1, $s6, $s1
    /* 18A0C 80152604 21104300 */  addu       $v0, $v0, $v1
    /* 18A10 80152608 00004290 */  lbu        $v0, 0x0($v0)
    /* 18A14 8015260C 00000000 */  nop
    /* 18A18 80152610 17004014 */  bnez       $v0, .L80152670
    /* 18A1C 80152614 00000000 */   nop
    /* 18A20 80152618 C9F6000C */  jal        ENG_random__Fl
    /* 18A24 8015261C 10000424 */   addiu     $a0, $zero, 0x10
    /* 18A28 80152620 21184000 */  addu       $v1, $v0, $zero
    /* 18A2C 80152624 10006004 */  bltz       $v1, .L80152668
    /* 18A30 80152628 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 18A34 8015262C 21280002 */  addu       $a1, $s0, $zero
    /* 18A38 80152630 01008424 */  addiu      $a0, $a0, 0x1
  .L80152634:
    /* 18A3C 80152634 02009714 */  bne        $a0, $s7, .L80152640
    /* 18A40 80152638 00000000 */   nop
    /* 18A44 8015263C 21200000 */  addu       $a0, $zero, $zero
  .L80152640:
    /* 18A48 80152640 1580013C */  lui        $at, %hi(L4BTYPES)
    /* 18A4C 80152644 21082400 */  addu       $at, $at, $a0
    /* 18A50 80152648 1CF42290 */  lbu        $v0, %lo(L4BTYPES)($at)
    /* 18A54 8015264C 00000000 */  nop
    /* 18A58 80152650 0200A214 */  bne        $a1, $v0, .L8015265C
    /* 18A5C 80152654 00000000 */   nop
    /* 18A60 80152658 FFFF6324 */  addiu      $v1, $v1, -0x1
  .L8015265C:
    /* 18A64 8015265C F5FF6104 */  bgez       $v1, .L80152634
    /* 18A68 80152660 01008424 */   addiu     $a0, $a0, 0x1
    /* 18A6C 80152664 FFFF8424 */  addiu      $a0, $a0, -0x1
  .L80152668:
    /* 18A70 80152668 21109202 */  addu       $v0, $s4, $s2
    /* 18A74 8015266C 000044A4 */  sh         $a0, 0x0($v0)
  .L80152670:
    /* 18A78 80152670 01003126 */  addiu      $s1, $s1, 0x1
    /* 18A7C 80152674 2800222A */  slti       $v0, $s1, 0x28
    /* 18A80 80152678 D4FF4014 */  bnez       $v0, .L801525CC
    /* 18A84 8015267C 60005226 */   addiu     $s2, $s2, 0x60
    /* 18A88 80152680 01007326 */  addiu      $s3, $s3, 0x1
    /* 18A8C 80152684 2800622A */  slti       $v0, $s3, 0x28
    /* 18A90 80152688 CCFF4014 */  bnez       $v0, .L801525BC
    /* 18A94 8015268C 2800B526 */   addiu     $s5, $s5, 0x28
    /* 18A98 80152690 21980000 */  addu       $s3, $zero, $zero
    /* 18A9C 80152694 0E80153C */  lui        $s5, %hi(dungeon)
    /* 18AA0 80152698 C440B526 */  addiu      $s5, $s5, %lo(dungeon)
    /* 18AA4 8015269C 21A00000 */  addu       $s4, $zero, $zero
  .L801526A0:
    /* 18AA8 801526A0 21880000 */  addu       $s1, $zero, $zero
    /* 18AAC 801526A4 2190A002 */  addu       $s2, $s5, $zero
  .L801526A8:
    /* 18AB0 801526A8 C9F6000C */  jal        ENG_random__Fl
    /* 18AB4 801526AC 0A000424 */   addiu     $a0, $zero, 0xA
    /* 18AB8 801526B0 15004014 */  bnez       $v0, .L80152708
    /* 18ABC 801526B4 40101300 */   sll       $v0, $s3, 1
    /* 18AC0 801526B8 21805200 */  addu       $s0, $v0, $s2
    /* 18AC4 801526BC 00000292 */  lbu        $v0, 0x0($s0)
    /* 18AC8 801526C0 1580013C */  lui        $at, %hi(L4BTYPES)
    /* 18ACC 801526C4 21082200 */  addu       $at, $at, $v0
    /* 18AD0 801526C8 1CF42390 */  lbu        $v1, %lo(L4BTYPES)($at)
    /* 18AD4 801526CC 06000224 */  addiu      $v0, $zero, 0x6
    /* 18AD8 801526D0 0D006214 */  bne        $v1, $v0, .L80152708
    /* 18ADC 801526D4 21189102 */   addu      $v1, $s4, $s1
    /* 18AE0 801526D8 1280023C */  lui        $v0, %hi(mydflags)
    /* 18AE4 801526DC D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 18AE8 801526E0 00000000 */  nop
    /* 18AEC 801526E4 21104300 */  addu       $v0, $v0, $v1
    /* 18AF0 801526E8 00004290 */  lbu        $v0, 0x0($v0)
    /* 18AF4 801526EC 00000000 */  nop
    /* 18AF8 801526F0 05004014 */  bnez       $v0, .L80152708
    /* 18AFC 801526F4 00000000 */   nop
    /* 18B00 801526F8 C9F6000C */  jal        ENG_random__Fl
    /* 18B04 801526FC 03000424 */   addiu     $a0, $zero, 0x3
    /* 18B08 80152700 5F004224 */  addiu      $v0, $v0, 0x5F
    /* 18B0C 80152704 000002A6 */  sh         $v0, 0x0($s0)
  .L80152708:
    /* 18B10 80152708 01003126 */  addiu      $s1, $s1, 0x1
    /* 18B14 8015270C 2800222A */  slti       $v0, $s1, 0x28
    /* 18B18 80152710 E5FF4014 */  bnez       $v0, .L801526A8
    /* 18B1C 80152714 60005226 */   addiu     $s2, $s2, 0x60
    /* 18B20 80152718 01007326 */  addiu      $s3, $s3, 0x1
    /* 18B24 8015271C 2800622A */  slti       $v0, $s3, 0x28
    /* 18B28 80152720 DFFF4014 */  bnez       $v0, .L801526A0
    /* 18B2C 80152724 28009426 */   addiu     $s4, $s4, 0x28
    /* 18B30 80152728 3400BF8F */  lw         $ra, 0x34($sp)
    /* 18B34 8015272C 3000BE8F */  lw         $fp, 0x30($sp)
    /* 18B38 80152730 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 18B3C 80152734 2800B68F */  lw         $s6, 0x28($sp)
    /* 18B40 80152738 2400B58F */  lw         $s5, 0x24($sp)
    /* 18B44 8015273C 2000B48F */  lw         $s4, 0x20($sp)
    /* 18B48 80152740 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 18B4C 80152744 1800B28F */  lw         $s2, 0x18($sp)
    /* 18B50 80152748 1400B18F */  lw         $s1, 0x14($sp)
    /* 18B54 8015274C 1000B08F */  lw         $s0, 0x10($sp)
    /* 18B58 80152750 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 18B5C 80152754 0800E003 */  jr         $ra
    /* 18B60 80152758 00000000 */   nop
endlabel DRLG_L4Subs__Fv
