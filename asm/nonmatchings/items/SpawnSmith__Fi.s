.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpawnSmith__Fi, 0x32C

glabel SpawnSmith__Fi
    /* 3A540 8004A540 58FFBD27 */  addiu      $sp, $sp, -0xA8
    /* 3A544 8004A544 9000B2AF */  sw         $s2, 0x90($sp)
    /* 3A548 8004A548 21908000 */  addu       $s2, $a0, $zero
    /* 3A54C 8004A54C 1000A727 */  addiu      $a3, $sp, 0x10
    /* 3A550 8004A550 0D80063C */  lui        $a2, %hi(item)
    /* 3A554 8004A554 541DC624 */  addiu      $a2, $a2, %lo(item)
    /* 3A558 8004A558 6000C824 */  addiu      $t0, $a2, 0x60
    /* 3A55C 8004A55C A000BFAF */  sw         $ra, 0xA0($sp)
    /* 3A560 8004A560 9C00B5AF */  sw         $s5, 0x9C($sp)
    /* 3A564 8004A564 9800B4AF */  sw         $s4, 0x98($sp)
    /* 3A568 8004A568 9400B3AF */  sw         $s3, 0x94($sp)
    /* 3A56C 8004A56C 8C00B1AF */  sw         $s1, 0x8C($sp)
    /* 3A570 8004A570 8800B0AF */  sw         $s0, 0x88($sp)
  .L8004A574:
    /* 3A574 8004A574 0000C28C */  lw         $v0, 0x0($a2)
    /* 3A578 8004A578 0400C38C */  lw         $v1, 0x4($a2)
    /* 3A57C 8004A57C 0800C48C */  lw         $a0, 0x8($a2)
    /* 3A580 8004A580 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3A584 8004A584 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3A588 8004A588 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3A58C 8004A58C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3A590 8004A590 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3A594 8004A594 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3A598 8004A598 F6FFC814 */  bne        $a2, $t0, .L8004A574
    /* 3A59C 8004A59C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3A5A0 8004A5A0 0000C28C */  lw         $v0, 0x0($a2)
    /* 3A5A4 8004A5A4 0400C38C */  lw         $v1, 0x4($a2)
    /* 3A5A8 8004A5A8 0800C48C */  lw         $a0, 0x8($a2)
    /* 3A5AC 8004A5AC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3A5B0 8004A5B0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3A5B4 8004A5B4 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3A5B8 8004A5B8 C9F6000C */  jal        ENG_random__Fl
    /* 3A5BC 8004A5BC 0A000424 */   addiu     $a0, $zero, 0xA
    /* 3A5C0 8004A5C0 0A005324 */  addiu      $s3, $v0, 0xA
    /* 3A5C4 8004A5C4 6F00601A */  blez       $s3, .L8004A784
    /* 3A5C8 8004A5C8 21800000 */   addu      $s0, $zero, $zero
    /* 3A5CC 8004A5CC 0D80153C */  lui        $s5, %hi(item + 0x10)
    /* 3A5D0 8004A5D0 641DB526 */  addiu      $s5, $s5, %lo(item + 0x10)
    /* 3A5D4 8004A5D4 0200143C */  lui        $s4, (0x222E0 >> 16)
    /* 3A5D8 8004A5D8 E0229436 */  ori        $s4, $s4, (0x222E0 & 0xFFFF)
    /* 3A5DC 8004A5DC 21880000 */  addu       $s1, $zero, $zero
  .L8004A5E0:
    /* 3A5E0 8004A5E0 B7F6000C */  jal        GetRndSeed__Fv
    /* 3A5E4 8004A5E4 00000000 */   nop
    /* 3A5E8 8004A5E8 21204000 */  addu       $a0, $v0, $zero
    /* 3A5EC 8004A5EC B3F6000C */  jal        SetRndSeed__Fl
    /* 3A5F0 8004A5F0 0000A4AE */   sw        $a0, 0x0($s5)
    /* 3A5F4 8004A5F4 9B25010C */  jal        RndSmithItem__Fi
    /* 3A5F8 8004A5F8 21204002 */   addu      $a0, $s2, $zero
    /* 3A5FC 8004A5FC 21200000 */  addu       $a0, $zero, $zero
    /* 3A600 8004A600 FFFF4524 */  addiu      $a1, $v0, -0x1
    /* 3A604 8004A604 A704010C */  jal        GetItemAttrs__Fiii
    /* 3A608 8004A608 21304002 */   addu      $a2, $s2, $zero
    /* 3A60C 8004A60C 0800A28E */  lw         $v0, 0x8($s5)
    /* 3A610 8004A610 00000000 */  nop
    /* 3A614 8004A614 2A108202 */  slt        $v0, $s4, $v0
    /* 3A618 8004A618 F1FF4014 */  bnez       $v0, .L8004A5E0
    /* 3A61C 8004A61C 00000000 */   nop
    /* 3A620 8004A620 0D80073C */  lui        $a3, %hi(item)
    /* 3A624 8004A624 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3A628 8004A628 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3A62C 8004A62C 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3A630 8004A630 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3A634 8004A634 0E80043C */  lui        $a0, %hi(_smithitem)
    /* 3A638 8004A638 28E48424 */  addiu      $a0, $a0, %lo(_smithitem)
    /* 3A63C 8004A63C 00190200 */  sll        $v1, $v0, 4
    /* 3A640 8004A640 21186200 */  addu       $v1, $v1, $v0
    /* 3A644 8004A644 C0180300 */  sll        $v1, $v1, 3
    /* 3A648 8004A648 23186200 */  subu       $v1, $v1, $v0
    /* 3A64C 8004A64C 00190300 */  sll        $v1, $v1, 4
    /* 3A650 8004A650 21186400 */  addu       $v1, $v1, $a0
    /* 3A654 8004A654 21302302 */  addu       $a2, $s1, $v1
  .L8004A658:
    /* 3A658 8004A658 0000E28C */  lw         $v0, 0x0($a3)
    /* 3A65C 8004A65C 0400E38C */  lw         $v1, 0x4($a3)
    /* 3A660 8004A660 0800E48C */  lw         $a0, 0x8($a3)
    /* 3A664 8004A664 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3A668 8004A668 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3A66C 8004A66C 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3A670 8004A670 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3A674 8004A674 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3A678 8004A678 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3A67C 8004A67C F6FFE814 */  bne        $a3, $t0, .L8004A658
    /* 3A680 8004A680 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3A684 8004A684 0000E28C */  lw         $v0, 0x0($a3)
    /* 3A688 8004A688 0400E38C */  lw         $v1, 0x4($a3)
    /* 3A68C 8004A68C 0800E48C */  lw         $a0, 0x8($a3)
    /* 3A690 8004A690 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3A694 8004A694 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3A698 8004A698 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3A69C 8004A69C 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3A6A0 8004A6A0 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3A6A4 8004A6A4 00000000 */  nop
    /* 3A6A8 8004A6A8 00110300 */  sll        $v0, $v1, 4
    /* 3A6AC 8004A6AC 21104300 */  addu       $v0, $v0, $v1
    /* 3A6B0 8004A6B0 C0100200 */  sll        $v0, $v0, 3
    /* 3A6B4 8004A6B4 23104300 */  subu       $v0, $v0, $v1
    /* 3A6B8 8004A6B8 00110200 */  sll        $v0, $v0, 4
    /* 3A6BC 8004A6BC 21102202 */  addu       $v0, $s1, $v0
    /* 3A6C0 8004A6C0 01000324 */  addiu      $v1, $zero, 0x1
    /* 3A6C4 8004A6C4 0E80013C */  lui        $at, %hi(_smithitem + 0x69)
    /* 3A6C8 8004A6C8 21082200 */  addu       $at, $at, $v0
    /* 3A6CC 8004A6CC 91E423A0 */  sb         $v1, %lo(_smithitem + 0x69)($at)
    /* 3A6D0 8004A6D0 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3A6D4 8004A6D4 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 3A6D8 8004A6D8 00044336 */  ori        $v1, $s2, 0x400
    /* 3A6DC 8004A6DC 0E80013C */  lui        $at, %hi(_smithitem + 0x24)
    /* 3A6E0 8004A6E0 21082200 */  addu       $at, $at, $v0
    /* 3A6E4 8004A6E4 4CE423A4 */  sh         $v1, %lo(_smithitem + 0x24)($at)
    /* 3A6E8 8004A6E8 00110400 */  sll        $v0, $a0, 4
    /* 3A6EC 8004A6EC 21104400 */  addu       $v0, $v0, $a0
    /* 3A6F0 8004A6F0 C0100200 */  sll        $v0, $v0, 3
    /* 3A6F4 8004A6F4 23104400 */  subu       $v0, $v0, $a0
    /* 3A6F8 8004A6F8 00110200 */  sll        $v0, $v0, 4
    /* 3A6FC 8004A6FC 0E80043C */  lui        $a0, %hi(_smithitem)
    /* 3A700 8004A700 28E48424 */  addiu      $a0, $a0, %lo(_smithitem)
    /* 3A704 8004A704 21202402 */  addu       $a0, $s1, $a0
    /* 3A708 8004A708 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 3A70C 8004A70C 21204400 */   addu      $a0, $v0, $a0
    /* 3A710 8004A710 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3A714 8004A714 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 3A718 8004A718 00000000 */  nop
    /* 3A71C 8004A71C 00190400 */  sll        $v1, $a0, 4
    /* 3A720 8004A720 21186400 */  addu       $v1, $v1, $a0
    /* 3A724 8004A724 C0180300 */  sll        $v1, $v1, 3
    /* 3A728 8004A728 23186400 */  subu       $v1, $v1, $a0
    /* 3A72C 8004A72C 00190300 */  sll        $v1, $v1, 4
    /* 3A730 8004A730 21182302 */  addu       $v1, $s1, $v1
    /* 3A734 8004A734 0E80013C */  lui        $at, %hi(_smithitem + 0x66)
    /* 3A738 8004A738 21082300 */  addu       $at, $at, $v1
    /* 3A73C 8004A73C 8EE422A0 */  sb         $v0, %lo(_smithitem + 0x66)($at)
    /* 3A740 8004A740 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3A744 8004A744 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3A748 8004A748 01001026 */  addiu      $s0, $s0, 0x1
    /* 3A74C 8004A74C 00110300 */  sll        $v0, $v1, 4
    /* 3A750 8004A750 21104300 */  addu       $v0, $v0, $v1
    /* 3A754 8004A754 C0100200 */  sll        $v0, $v0, 3
    /* 3A758 8004A758 23104300 */  subu       $v0, $v0, $v1
    /* 3A75C 8004A75C 00110200 */  sll        $v0, $v0, 4
    /* 3A760 8004A760 21102202 */  addu       $v0, $s1, $v0
    /* 3A764 8004A764 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3A768 8004A768 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3A76C 8004A76C 0E80013C */  lui        $at, %hi(_smithitem + 0x65)
    /* 3A770 8004A770 21082200 */  addu       $at, $at, $v0
    /* 3A774 8004A774 8DE423A0 */  sb         $v1, %lo(_smithitem + 0x65)($at)
    /* 3A778 8004A778 2A101302 */  slt        $v0, $s0, $s3
    /* 3A77C 8004A77C 98FF4014 */  bnez       $v0, .L8004A5E0
    /* 3A780 8004A780 6C003126 */   addiu     $s1, $s1, 0x6C
  .L8004A784:
    /* 3A784 8004A784 21806002 */  addu       $s0, $s3, $zero
    /* 3A788 8004A788 1400022A */  slti       $v0, $s0, 0x14
    /* 3A78C 8004A78C 16004010 */  beqz       $v0, .L8004A7E8
    /* 3A790 8004A790 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 3A794 8004A794 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3A798 8004A798 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3A79C 8004A79C 00000000 */  nop
    /* 3A7A0 8004A7A0 00190200 */  sll        $v1, $v0, 4
    /* 3A7A4 8004A7A4 21186200 */  addu       $v1, $v1, $v0
    /* 3A7A8 8004A7A8 C0180300 */  sll        $v1, $v1, 3
    /* 3A7AC 8004A7AC 23186200 */  subu       $v1, $v1, $v0
    /* 3A7B0 8004A7B0 00190300 */  sll        $v1, $v1, 4
    /* 3A7B4 8004A7B4 C0101000 */  sll        $v0, $s0, 3
    /* 3A7B8 8004A7B8 23105000 */  subu       $v0, $v0, $s0
    /* 3A7BC 8004A7BC 80100200 */  sll        $v0, $v0, 2
    /* 3A7C0 8004A7C0 23105000 */  subu       $v0, $v0, $s0
    /* 3A7C4 8004A7C4 80100200 */  sll        $v0, $v0, 2
    /* 3A7C8 8004A7C8 21184300 */  addu       $v1, $v0, $v1
  .L8004A7CC:
    /* 3A7CC 8004A7CC 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 3A7D0 8004A7D0 21082300 */  addu       $at, $at, $v1
    /* 3A7D4 8004A7D4 54E424A4 */  sh         $a0, %lo(_smithitem + 0x2C)($at)
    /* 3A7D8 8004A7D8 01001026 */  addiu      $s0, $s0, 0x1
    /* 3A7DC 8004A7DC 1400022A */  slti       $v0, $s0, 0x14
    /* 3A7E0 8004A7E0 FAFF4014 */  bnez       $v0, .L8004A7CC
    /* 3A7E4 8004A7E4 6C006324 */   addiu     $v1, $v1, 0x6C
  .L8004A7E8:
    /* 3A7E8 8004A7E8 C02D010C */  jal        SortSmith__Fv
    /* 3A7EC 8004A7EC 00000000 */   nop
    /* 3A7F0 8004A7F0 0D80073C */  lui        $a3, %hi(item)
    /* 3A7F4 8004A7F4 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3A7F8 8004A7F8 1000A627 */  addiu      $a2, $sp, 0x10
    /* 3A7FC 8004A7FC 7000A827 */  addiu      $t0, $sp, 0x70
  .L8004A800:
    /* 3A800 8004A800 0000C28C */  lw         $v0, 0x0($a2)
    /* 3A804 8004A804 0400C38C */  lw         $v1, 0x4($a2)
    /* 3A808 8004A808 0800C48C */  lw         $a0, 0x8($a2)
    /* 3A80C 8004A80C 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3A810 8004A810 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3A814 8004A814 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3A818 8004A818 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3A81C 8004A81C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3A820 8004A820 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3A824 8004A824 F6FFC814 */  bne        $a2, $t0, .L8004A800
    /* 3A828 8004A828 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3A82C 8004A82C 0000C28C */  lw         $v0, 0x0($a2)
    /* 3A830 8004A830 0400C38C */  lw         $v1, 0x4($a2)
    /* 3A834 8004A834 0800C48C */  lw         $a0, 0x8($a2)
    /* 3A838 8004A838 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3A83C 8004A83C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3A840 8004A840 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3A844 8004A844 A000BF8F */  lw         $ra, 0xA0($sp)
    /* 3A848 8004A848 9C00B58F */  lw         $s5, 0x9C($sp)
    /* 3A84C 8004A84C 9800B48F */  lw         $s4, 0x98($sp)
    /* 3A850 8004A850 9400B38F */  lw         $s3, 0x94($sp)
    /* 3A854 8004A854 9000B28F */  lw         $s2, 0x90($sp)
    /* 3A858 8004A858 8C00B18F */  lw         $s1, 0x8C($sp)
    /* 3A85C 8004A85C 8800B08F */  lw         $s0, 0x88($sp)
    /* 3A860 8004A860 A800BD27 */  addiu      $sp, $sp, 0xA8
    /* 3A864 8004A864 0800E003 */  jr         $ra
    /* 3A868 8004A868 00000000 */   nop
endlabel SpawnSmith__Fi
