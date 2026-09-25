.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Handle__7GamePad, 0x6BC

glabel Handle__7GamePad
    /* 6A578 8007A578 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6A57C 8007A57C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 6A580 8007A580 21888000 */  addu       $s1, $a0, $zero
    /* 6A584 8007A584 2400BFAF */  sw         $ra, 0x24($sp)
    /* 6A588 8007A588 2000B2AF */  sw         $s2, 0x20($sp)
    /* 6A58C 8007A58C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 6A590 8007A590 4C002482 */  lb         $a0, 0x4C($s1)
    /* 6A594 8007A594 FD25020C */  jal        PAD_GetPad__FiUc
    /* 6A598 8007A598 21280000 */   addu      $a1, $zero, $zero
    /* 6A59C 8007A59C 1280033C */  lui        $v1, %hi(FeFlag)
    /* 6A5A0 8007A5A0 74B36390 */  lbu        $v1, %lo(FeFlag)($v1)
    /* 6A5A4 8007A5A4 00000000 */  nop
    /* 6A5A8 8007A5A8 0F006010 */  beqz       $v1, .L8007A5E8
    /* 6A5AC 8007A5AC 580022AE */   sw        $v0, 0x58($s1)
    /* 6A5B0 8007A5B0 1280023C */  lui        $v0, %hi(qtextflag)
    /* 6A5B4 8007A5B4 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 6A5B8 8007A5B8 00000000 */  nop
    /* 6A5BC 8007A5BC 96014010 */  beqz       $v0, .L8007AC18
    /* 6A5C0 8007A5C0 00000000 */   nop
    /* 6A5C4 8007A5C4 EE80000C */  jal        TSK_Sleep
    /* 6A5C8 8007A5C8 01000424 */   addiu     $a0, $zero, 0x1
    /* 6A5CC 8007A5CC 4C002282 */  lb         $v0, 0x4C($s1)
    /* 6A5D0 8007A5D0 1280013C */  lui        $at, %hi(options_pad)
    /* 6A5D4 8007A5D4 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 6A5D8 8007A5D8 8AD0010C */  jal        CheckStoreBtn__Fv
    /* 6A5DC 8007A5DC 00000000 */   nop
    /* 6A5E0 8007A5E0 06EB0108 */  j          .L8007AC18
    /* 6A5E4 8007A5E4 00000000 */   nop
  .L8007A5E8:
    /* 6A5E8 8007A5E8 0000228E */  lw         $v0, 0x0($s1)
    /* 6A5EC 8007A5EC 00000000 */  nop
    /* 6A5F0 8007A5F0 1D004290 */  lbu        $v0, 0x1D($v0)
    /* 6A5F4 8007A5F4 00000000 */  nop
    /* 6A5F8 8007A5F8 10004010 */  beqz       $v0, .L8007A63C
    /* 6A5FC 8007A5FC 00000000 */   nop
    /* 6A600 8007A600 9291020C */  jal        IsGameLoading__Fv
    /* 6A604 8007A604 00000000 */   nop
    /* 6A608 8007A608 0C004014 */  bnez       $v0, .L8007A63C
    /* 6A60C 8007A60C 08000224 */   addiu     $v0, $zero, 0x8
    /* 6A610 8007A610 0000248E */  lw         $a0, 0x0($s1)
    /* 6A614 8007A614 00000000 */  nop
    /* 6A618 8007A618 0000838C */  lw         $v1, 0x0($a0)
    /* 6A61C 8007A61C 00000000 */  nop
    /* 6A620 8007A620 06006210 */  beq        $v1, $v0, .L8007A63C
    /* 6A624 8007A624 00000000 */   nop
    /* 6A628 8007A628 1C01828C */  lw         $v0, 0x11C($a0)
    /* 6A62C 8007A62C 00000000 */  nop
    /* 6A630 8007A630 83110200 */  sra        $v0, $v0, 6
    /* 6A634 8007A634 0600401C */  bgtz       $v0, .L8007A650
    /* 6A638 8007A638 00000000 */   nop
  .L8007A63C:
    /* 6A63C 8007A63C 4C002482 */  lb         $a0, 0x4C($s1)
    /* 6A640 8007A640 E4DF010C */  jal        ClrCursor__Fi
    /* 6A644 8007A644 00000000 */   nop
    /* 6A648 8007A648 06EB0108 */  j          .L8007AC18
    /* 6A64C 8007A64C 00000000 */   nop
  .L8007A650:
    /* 6A650 8007A650 36EC010C */  jal        Active__11SpellTarget_8007b0d8
    /* 6A654 8007A654 04002426 */   addiu     $a0, $s1, 0x4
    /* 6A658 8007A658 01004238 */  xori       $v0, $v0, 0x1
    /* 6A65C 8007A65C 09004010 */  beqz       $v0, .L8007A684
    /* 6A660 8007A660 00000000 */   nop
    /* 6A664 8007A664 1280023C */  lui        $v0, %hi(invflag)
    /* 6A668 8007A668 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 6A66C 8007A66C 1280033C */  lui        $v1, %hi(chrflag)
    /* 6A670 8007A670 C0B66390 */  lbu        $v1, %lo(chrflag)($v1)
    /* 6A674 8007A674 00000000 */  nop
    /* 6A678 8007A678 25104300 */  or         $v0, $v0, $v1
    /* 6A67C 8007A67C 0F004010 */  beqz       $v0, .L8007A6BC
    /* 6A680 8007A680 00000000 */   nop
  .L8007A684:
    /* 6A684 8007A684 4C002282 */  lb         $v0, 0x4C($s1)
    /* 6A688 8007A688 00000000 */  nop
    /* 6A68C 8007A68C 80100200 */  sll        $v0, $v0, 2
    /* 6A690 8007A690 1280013C */  lui        $at, %hi(_spselflag)
    /* 6A694 8007A694 21082200 */  addu       $at, $at, $v0
    /* 6A698 8007A698 50B6228C */  lw         $v0, %lo(_spselflag)($at)
    /* 6A69C 8007A69C 00000000 */  nop
    /* 6A6A0 8007A6A0 10004010 */  beqz       $v0, .L8007A6E4
    /* 6A6A4 8007A6A4 00000000 */   nop
    /* 6A6A8 8007A6A8 1280023C */  lui        $v0, %hi(sbookflag)
    /* 6A6AC 8007A6AC C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 6A6B0 8007A6B0 00000000 */  nop
    /* 6A6B4 8007A6B4 0B004010 */  beqz       $v0, .L8007A6E4
    /* 6A6B8 8007A6B8 00000000 */   nop
  .L8007A6BC:
    /* 6A6BC 8007A6BC 5DE1000C */  jal        TryIconCurs__Fv
    /* 6A6C0 8007A6C0 00000000 */   nop
    /* 6A6C4 8007A6C4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 6A6C8 8007A6C8 06004010 */  beqz       $v0, .L8007A6E4
    /* 6A6CC 8007A6CC FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 6A6D0 8007A6D0 1280033C */  lui        $v1, %hi(sel_data)
    /* 6A6D4 8007A6D4 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 6A6D8 8007A6D8 1280013C */  lui        $at, %hi(_pcursplr)
    /* 6A6DC 8007A6DC 21082300 */  addu       $at, $at, $v1
    /* 6A6E0 8007A6E0 6CB722A0 */  sb         $v0, %lo(_pcursplr)($at)
  .L8007A6E4:
    /* 6A6E4 8007A6E4 C8C7000C */  jal        ClearPanel__Fv
    /* 6A6E8 8007A6E8 00000000 */   nop
    /* 6A6EC 8007A6EC 0000228E */  lw         $v0, 0x0($s1)
    /* 6A6F0 8007A6F0 00000000 */  nop
    /* 6A6F4 8007A6F4 D50040A0 */  sb         $zero, 0xD5($v0)
    /* 6A6F8 8007A6F8 1280033C */  lui        $v1, %hi(options_pad)
    /* 6A6FC 8007A6FC 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 6A700 8007A700 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6A704 8007A704 05006210 */  beq        $v1, $v0, .L8007A71C
    /* 6A708 8007A708 00000000 */   nop
    /* 6A70C 8007A70C 4C002282 */  lb         $v0, 0x4C($s1)
    /* 6A710 8007A710 00000000 */  nop
    /* 6A714 8007A714 40014314 */  bne        $v0, $v1, .L8007AC18
    /* 6A718 8007A718 00000000 */   nop
  .L8007A71C:
    /* 6A71C 8007A71C 4D002282 */  lb         $v0, 0x4D($s1)
    /* 6A720 8007A720 00000000 */  nop
    /* 6A724 8007A724 0C00401C */  bgtz       $v0, .L8007A758
    /* 6A728 8007A728 00000000 */   nop
    /* 6A72C 8007A72C 0000238E */  lw         $v1, 0x0($s1)
    /* 6A730 8007A730 00000000 */  nop
    /* 6A734 8007A734 0000628C */  lw         $v0, 0x0($v1)
    /* 6A738 8007A738 00000000 */  nop
    /* 6A73C 8007A73C 02004228 */  slti       $v0, $v0, 0x2
    /* 6A740 8007A740 05004010 */  beqz       $v0, .L8007A758
    /* 6A744 8007A744 00000000 */   nop
    /* 6A748 8007A748 4C002482 */  lb         $a0, 0x4C($s1)
    /* 6A74C 8007A74C 42006580 */  lb         $a1, 0x42($v1)
    /* 6A750 8007A750 299B010C */  jal        StartStand__Fii
    /* 6A754 8007A754 00000000 */   nop
  .L8007A758:
    /* 6A758 8007A758 0000248E */  lw         $a0, 0x0($s1)
    /* 6A75C 8007A75C 00000000 */  nop
    /* 6A760 8007A760 0000838C */  lw         $v1, 0x0($a0)
    /* 6A764 8007A764 0A000224 */  addiu      $v0, $zero, 0xA
    /* 6A768 8007A768 02006214 */  bne        $v1, $v0, .L8007A774
    /* 6A76C 8007A76C 00000000 */   nop
    /* 6A770 8007A770 000080AC */  sw         $zero, 0x0($a0)
  .L8007A774:
    /* 6A774 8007A774 5800248E */  lw         $a0, 0x58($s1)
    /* 6A778 8007A778 52EC010C */  jal        GetCur__C4CPad
    /* 6A77C 8007A77C D00020A2 */   sb        $zero, 0xD0($s1)
    /* 6A780 8007A780 4C002382 */  lb         $v1, 0x4C($s1)
    /* 6A784 8007A784 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 6A788 8007A788 21082300 */  addu       $at, $at, $v1
    /* 6A78C 8007A78C C4BB2390 */  lbu        $v1, %lo(_SpdBeltSelFlag)($at)
    /* 6A790 8007A790 00000000 */  nop
    /* 6A794 8007A794 0A006014 */  bnez       $v1, .L8007A7C0
    /* 6A798 8007A798 FFFF5230 */   andi      $s2, $v0, 0xFFFF
    /* 6A79C 8007A79C 5400238E */  lw         $v1, 0x54($s1)
    /* 6A7A0 8007A7A0 0A80023C */  lui        $v0, %hi(select_belt_item__Fi)
    /* 6A7A4 8007A7A4 600A4224 */  addiu      $v0, $v0, %lo(select_belt_item__Fi)
    /* 6A7A8 8007A7A8 02006214 */  bne        $v1, $v0, .L8007A7B4
    /* 6A7AC 8007A7AC 01000224 */   addiu     $v0, $zero, 0x1
    /* 6A7B0 8007A7B0 4D0022A2 */  sb         $v0, 0x4D($s1)
  .L8007A7B4:
    /* 6A7B4 8007A7B4 540020AE */  sw         $zero, 0x54($s1)
    /* 6A7B8 8007A7B8 F1E90108 */  j          .L8007A7C4
    /* 6A7BC 8007A7BC 500020AE */   sw        $zero, 0x50($s1)
  .L8007A7C0:
    /* 6A7C0 8007A7C0 4D0020A2 */  sb         $zero, 0x4D($s1)
  .L8007A7C4:
    /* 6A7C4 8007A7C4 9A82020C */  jal        any_belt_items__Fv
    /* 6A7C8 8007A7C8 00000000 */   nop
    /* 6A7CC 8007A7CC FF004230 */  andi       $v0, $v0, 0xFF
    /* 6A7D0 8007A7D0 14004014 */  bnez       $v0, .L8007A824
    /* 6A7D4 8007A7D4 FFFF0324 */   addiu     $v1, $zero, -0x1
    /* 6A7D8 8007A7D8 1280023C */  lui        $v0, %hi(sel_data)
    /* 6A7DC 8007A7DC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A7E0 8007A7E0 00000000 */  nop
    /* 6A7E4 8007A7E4 80100200 */  sll        $v0, $v0, 2
    /* 6A7E8 8007A7E8 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 6A7EC 8007A7EC 21082200 */  addu       $at, $at, $v0
    /* 6A7F0 8007A7F0 D4BB23AC */  sw         $v1, %lo(_pcurr_inv)($at)
    /* 6A7F4 8007A7F4 4C002282 */  lb         $v0, 0x4C($s1)
    /* 6A7F8 8007A7F8 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 6A7FC 8007A7FC 21082200 */  addu       $at, $at, $v0
    /* 6A800 8007A800 C4BB2290 */  lbu        $v0, %lo(_SpdBeltSelFlag)($at)
    /* 6A804 8007A804 00000000 */  nop
    /* 6A808 8007A808 02004010 */  beqz       $v0, .L8007A814
    /* 6A80C 8007A80C 01000224 */   addiu     $v0, $zero, 0x1
    /* 6A810 8007A810 4D0022A2 */  sb         $v0, 0x4D($s1)
  .L8007A814:
    /* 6A814 8007A814 4C002282 */  lb         $v0, 0x4C($s1)
    /* 6A818 8007A818 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 6A81C 8007A81C 21082200 */  addu       $at, $at, $v0
    /* 6A820 8007A820 C4BB20A0 */  sb         $zero, %lo(_SpdBeltSelFlag)($at)
  .L8007A824:
    /* 6A824 8007A824 1280023C */  lui        $v0, %hi(qtextflag)
    /* 6A828 8007A828 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 6A82C 8007A82C 00000000 */  nop
    /* 6A830 8007A830 06004014 */  bnez       $v0, .L8007A84C
    /* 6A834 8007A834 00000000 */   nop
    /* 6A838 8007A838 1280023C */  lui        $v0, %hi(stextflag)
    /* 6A83C 8007A83C E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 6A840 8007A840 00000000 */  nop
    /* 6A844 8007A844 05004010 */  beqz       $v0, .L8007A85C
    /* 6A848 8007A848 00000000 */   nop
  .L8007A84C:
    /* 6A84C 8007A84C 8AD0010C */  jal        CheckStoreBtn__Fv
    /* 6A850 8007A850 00000000 */   nop
    /* 6A854 8007A854 D6EA0108 */  j          .L8007AB58
    /* 6A858 8007A858 00000000 */   nop
  .L8007A85C:
    /* 6A85C 8007A85C 1280023C */  lui        $v0, %hi(PauseMode)
    /* 6A860 8007A860 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 6A864 8007A864 00000000 */  nop
    /* 6A868 8007A868 90004014 */  bnez       $v0, .L8007AAAC
    /* 6A86C 8007A86C 00000000 */   nop
    /* 6A870 8007A870 1280023C */  lui        $v0, %hi(gbRunGame)
    /* 6A874 8007A874 02B84290 */  lbu        $v0, %lo(gbRunGame)($v0)
    /* 6A878 8007A878 00000000 */  nop
    /* 6A87C 8007A87C 8B004010 */  beqz       $v0, .L8007AAAC
    /* 6A880 8007A880 00000000 */   nop
    /* 6A884 8007A884 ECE7010C */  jal        check_around_player__7GamePad
    /* 6A888 8007A888 21202002 */   addu      $a0, $s1, $zero
    /* 6A88C 8007A88C 5C00228E */  lw         $v0, 0x5C($s1)
    /* 6A890 8007A890 00000000 */  nop
    /* 6A894 8007A894 24104202 */  and        $v0, $s2, $v0
    /* 6A898 8007A898 0D004010 */  beqz       $v0, .L8007A8D0
    /* 6A89C 8007A89C 00000000 */   nop
    /* 6A8A0 8007A8A0 1280023C */  lui        $v0, %hi(questlog)
    /* 6A8A4 8007A8A4 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 6A8A8 8007A8A8 1280043C */  lui        $a0, %hi(chrflag)
    /* 6A8AC 8007A8AC C0B68490 */  lbu        $a0, %lo(chrflag)($a0)
    /* 6A8B0 8007A8B0 1280033C */  lui        $v1, %hi(invflag)
    /* 6A8B4 8007A8B4 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 6A8B8 8007A8B8 25104400 */  or         $v0, $v0, $a0
    /* 6A8BC 8007A8BC 25186200 */  or         $v1, $v1, $v0
    /* 6A8C0 8007A8C0 0A006014 */  bnez       $v1, .L8007A8EC
    /* 6A8C4 8007A8C4 01000224 */   addiu     $v0, $zero, 0x1
    /* 6A8C8 8007A8C8 3BEA0108 */  j          .L8007A8EC
    /* 6A8CC 8007A8CC D00022A2 */   sb        $v0, 0xD0($s1)
  .L8007A8D0:
    /* 6A8D0 8007A8D0 D00020A2 */  sb         $zero, 0xD0($s1)
    /* 6A8D4 8007A8D4 4C148383 */  lb         $v1, %gp_rel(D_8011BBCC)($gp)
    /* 6A8D8 8007A8D8 4C002282 */  lb         $v0, 0x4C($s1)
    /* 6A8DC 8007A8DC 00000000 */  nop
    /* 6A8E0 8007A8E0 02006214 */  bne        $v1, $v0, .L8007A8EC
    /* 6A8E4 8007A8E4 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 6A8E8 8007A8E8 4C1482A3 */  sb         $v0, %gp_rel(D_8011BBCC)($gp)
  .L8007A8EC:
    /* 6A8EC 8007A8EC 4D002282 */  lb         $v0, 0x4D($s1)
    /* 6A8F0 8007A8F0 00000000 */  nop
    /* 6A8F4 8007A8F4 6D004018 */  blez       $v0, .L8007AAAC
    /* 6A8F8 8007A8F8 00000000 */   nop
    /* 6A8FC 8007A8FC 1280023C */  lui        $v0, %hi(automapflag)
    /* 6A900 8007A900 7BC34290 */  lbu        $v0, %lo(automapflag)($v0)
    /* 6A904 8007A904 00000000 */  nop
    /* 6A908 8007A908 37004010 */  beqz       $v0, .L8007A9E8
    /* 6A90C 8007A90C 00000000 */   nop
    /* 6A910 8007A910 0000228E */  lw         $v0, 0x0($s1)
    /* 6A914 8007A914 00000000 */  nop
    /* 6A918 8007A918 0000428C */  lw         $v0, 0x0($v0)
    /* 6A91C 8007A91C 00000000 */  nop
    /* 6A920 8007A920 31004014 */  bnez       $v0, .L8007A9E8
    /* 6A924 8007A924 21202002 */   addu      $a0, $s1, $zero
    /* 6A928 8007A928 0A80103C */  lui        $s0, %hi(pad_func_AutoMap__Fi)
    /* 6A92C 8007A92C 5C251026 */  addiu      $s0, $s0, %lo(pad_func_AutoMap__Fi)
    /* 6A930 8007A930 B8E2010C */  jal        GetActionButton__7GamePadPFi_v
    /* 6A934 8007A934 21280002 */   addu      $a1, $s0, $zero
    /* 6A938 8007A938 09004014 */  bnez       $v0, .L8007A960
    /* 6A93C 8007A93C 24104202 */   and       $v0, $s2, $v0
    /* 6A940 8007A940 21202002 */  addu       $a0, $s1, $zero
    /* 6A944 8007A944 21280002 */  addu       $a1, $s0, $zero
    /* 6A948 8007A948 D0003092 */  lbu        $s0, 0xD0($s1)
    /* 6A94C 8007A94C 01000224 */  addiu      $v0, $zero, 0x1
    /* 6A950 8007A950 B8E2010C */  jal        GetActionButton__7GamePadPFi_v
    /* 6A954 8007A954 D00022A2 */   sb        $v0, 0xD0($s1)
    /* 6A958 8007A958 D00030A2 */  sb         $s0, 0xD0($s1)
    /* 6A95C 8007A95C 24104202 */  and        $v0, $s2, $v0
  .L8007A960:
    /* 6A960 8007A960 20004010 */  beqz       $v0, .L8007A9E4
    /* 6A964 8007A964 0F004232 */   andi      $v0, $s2, 0xF
    /* 6A968 8007A968 1E004010 */  beqz       $v0, .L8007A9E4
    /* 6A96C 8007A96C 00000000 */   nop
    /* 6A970 8007A970 0000228E */  lw         $v0, 0x0($s1)
    /* 6A974 8007A974 00000000 */  nop
    /* 6A978 8007A978 0000428C */  lw         $v0, 0x0($v0)
    /* 6A97C 8007A97C 00000000 */  nop
    /* 6A980 8007A980 18004014 */  bnez       $v0, .L8007A9E4
    /* 6A984 8007A984 01000224 */   addiu     $v0, $zero, 0x1
    /* 6A988 8007A988 5E1482A3 */  sb         $v0, %gp_rel(automapmoved)($gp)
    /* 6A98C 8007A98C 01004232 */  andi       $v0, $s2, 0x1
    /* 6A990 8007A990 04004010 */  beqz       $v0, .L8007A9A4
    /* 6A994 8007A994 02004232 */   andi      $v0, $s2, 0x2
    /* 6A998 8007A998 DA87050C */  jal        func_80161F68
    /* 6A99C 8007A99C 00000000 */   nop
    /* 6A9A0 8007A9A0 02004232 */  andi       $v0, $s2, 0x2
  .L8007A9A4:
    /* 6A9A4 8007A9A4 04004010 */  beqz       $v0, .L8007A9B8
    /* 6A9A8 8007A9A8 04004232 */   andi      $v0, $s2, 0x4
    /* 6A9AC 8007A9AC E287050C */  jal        func_80161F88
    /* 6A9B0 8007A9B0 00000000 */   nop
    /* 6A9B4 8007A9B4 04004232 */  andi       $v0, $s2, 0x4
  .L8007A9B8:
    /* 6A9B8 8007A9B8 04004010 */  beqz       $v0, .L8007A9CC
    /* 6A9BC 8007A9BC 08004232 */   andi      $v0, $s2, 0x8
    /* 6A9C0 8007A9C0 EA87050C */  jal        func_80161FA8
    /* 6A9C4 8007A9C4 00000000 */   nop
    /* 6A9C8 8007A9C8 08004232 */  andi       $v0, $s2, 0x8
  .L8007A9CC:
    /* 6A9CC 8007A9CC 92004010 */  beqz       $v0, .L8007AC18
    /* 6A9D0 8007A9D0 00000000 */   nop
    /* 6A9D4 8007A9D4 F287050C */  jal        func_80161FC8
    /* 6A9D8 8007A9D8 00000000 */   nop
    /* 6A9DC 8007A9DC 06EB0108 */  j          .L8007AC18
    /* 6A9E0 8007A9E0 00000000 */   nop
  .L8007A9E4:
    /* 6A9E4 8007A9E4 5E1480A3 */  sb         $zero, %gp_rel(automapmoved)($gp)
  .L8007A9E8:
    /* 6A9E8 8007A9E8 BBE8010C */  jal        show_combos__7GamePad
    /* 6A9EC 8007A9EC 21202002 */   addu      $a0, $s1, $zero
    /* 6A9F0 8007A9F0 04003026 */  addiu      $s0, $s1, 0x4
    /* 6A9F4 8007A9F4 FEBD020C */  jal        Show__11SpellTarget
    /* 6A9F8 8007A9F8 21200002 */   addu      $a0, $s0, $zero
    /* 6A9FC 8007A9FC 41148293 */  lbu        $v0, %gp_rel(flyflag)($gp)
    /* 6AA00 8007AA00 00000000 */  nop
    /* 6AA04 8007AA04 0A004010 */  beqz       $v0, .L8007AA30
    /* 6AA08 8007AA08 00000000 */   nop
    /* 6AA0C 8007AA0C 36EC010C */  jal        Active__11SpellTarget_8007b0d8
    /* 6AA10 8007AA10 21200002 */   addu      $a0, $s0, $zero
    /* 6AA14 8007AA14 01004238 */  xori       $v0, $v0, 0x1
    /* 6AA18 8007AA18 24004010 */  beqz       $v0, .L8007AAAC
    /* 6AA1C 8007AA1C 00000000 */   nop
    /* 6AA20 8007AA20 FFDF010C */  jal        flyabout__7GamePad
    /* 6AA24 8007AA24 21202002 */   addu      $a0, $s1, $zero
    /* 6AA28 8007AA28 ABEA0108 */  j          .L8007AAAC
    /* 6AA2C 8007AA2C 00000000 */   nop
  .L8007AA30:
    /* 6AA30 8007AA30 5800248E */  lw         $a0, 0x58($s1)
    /* 6AA34 8007AA34 52EC010C */  jal        GetCur__C4CPad
    /* 6AA38 8007AA38 00000000 */   nop
    /* 6AA3C 8007AA3C 4E002582 */  lb         $a1, 0x4E($s1)
    /* 6AA40 8007AA40 30E1010C */  jal        pad_UpIsUpRight__Fic
    /* 6AA44 8007AA44 0F004430 */   andi      $a0, $v0, 0xF
    /* 6AA48 8007AA48 00160200 */  sll        $v0, $v0, 24
    /* 6AA4C 8007AA4C 032E0200 */  sra        $a1, $v0, 24
    /* 6AA50 8007AA50 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6AA54 8007AA54 0500A210 */  beq        $a1, $v0, .L8007AA6C
    /* 6AA58 8007AA58 00000000 */   nop
    /* 6AA5C 8007AA5C 1AE7010C */  jal        walk__7GamePadi
    /* 6AA60 8007AA60 21202002 */   addu      $a0, $s1, $zero
    /* 6AA64 8007AA64 ABEA0108 */  j          .L8007AAAC
    /* 6AA68 8007AA68 00000000 */   nop
  .L8007AA6C:
    /* 6AA6C 8007AA6C 0000238E */  lw         $v1, 0x0($s1)
    /* 6AA70 8007AA70 00000000 */  nop
    /* 6AA74 8007AA74 0000628C */  lw         $v0, 0x0($v1)
    /* 6AA78 8007AA78 00000000 */  nop
    /* 6AA7C 8007AA7C 0B004010 */  beqz       $v0, .L8007AAAC
    /* 6AA80 8007AA80 04004228 */   slti      $v0, $v0, 0x4
    /* 6AA84 8007AA84 09004010 */  beqz       $v0, .L8007AAAC
    /* 6AA88 8007AA88 00000000 */   nop
    /* 6AA8C 8007AA8C 5E148293 */  lbu        $v0, %gp_rel(automapmoved)($gp)
    /* 6AA90 8007AA90 00000000 */  nop
    /* 6AA94 8007AA94 05004014 */  bnez       $v0, .L8007AAAC
    /* 6AA98 8007AA98 00000000 */   nop
    /* 6AA9C 8007AA9C 4C002482 */  lb         $a0, 0x4C($s1)
    /* 6AAA0 8007AAA0 42006580 */  lb         $a1, 0x42($v1)
    /* 6AAA4 8007AAA4 299B010C */  jal        StartStand__Fii
    /* 6AAA8 8007AAA8 00000000 */   nop
  .L8007AAAC:
    /* 6AAAC 8007AAAC 1280023C */  lui        $v0, %hi(invflag)
    /* 6AAB0 8007AAB0 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 6AAB4 8007AAB4 00000000 */  nop
    /* 6AAB8 8007AAB8 1A004014 */  bnez       $v0, .L8007AB24
    /* 6AABC 8007AABC 00000000 */   nop
    /* 6AAC0 8007AAC0 0000228E */  lw         $v0, 0x0($s1)
    /* 6AAC4 8007AAC4 00000000 */  nop
    /* 6AAC8 8007AAC8 0000438C */  lw         $v1, 0x0($v0)
    /* 6AACC 8007AACC 09000224 */  addiu      $v0, $zero, 0x9
    /* 6AAD0 8007AAD0 0B006210 */  beq        $v1, $v0, .L8007AB00
    /* 6AAD4 8007AAD4 00000000 */   nop
    /* 6AAD8 8007AAD8 1280023C */  lui        $v0, %hi(select_flag)
    /* 6AADC 8007AADC 1DB14290 */  lbu        $v0, %lo(select_flag)($v0)
    /* 6AAE0 8007AAE0 00000000 */  nop
    /* 6AAE4 8007AAE4 06004014 */  bnez       $v0, .L8007AB00
    /* 6AAE8 8007AAE8 00000000 */   nop
    /* 6AAEC 8007AAEC 1280023C */  lui        $v0, %hi(PauseMode)
    /* 6AAF0 8007AAF0 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 6AAF4 8007AAF4 00000000 */  nop
    /* 6AAF8 8007AAF8 06004010 */  beqz       $v0, .L8007AB14
    /* 6AAFC 8007AAFC 00000000 */   nop
  .L8007AB00:
    /* 6AB00 8007AB00 1280023C */  lui        $v0, %hi(sbookflag)
    /* 6AB04 8007AB04 C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 6AB08 8007AB08 00000000 */  nop
    /* 6AB0C 8007AB0C 12004010 */  beqz       $v0, .L8007AB58
    /* 6AB10 8007AB10 00000000 */   nop
  .L8007AB14:
    /* 6AB14 8007AB14 1FE4010C */  jal        TestButtons__7GamePad
    /* 6AB18 8007AB18 21202002 */   addu      $a0, $s1, $zero
    /* 6AB1C 8007AB1C D6EA0108 */  j          .L8007AB58
    /* 6AB20 8007AB20 00000000 */   nop
  .L8007AB24:
    /* 6AB24 8007AB24 5800248E */  lw         $a0, 0x58($s1)
    /* 6AB28 8007AB28 3EEC010C */  jal        GetDown__C4CPad_8007b0f8
    /* 6AB2C 8007AB2C 00000000 */   nop
    /* 6AB30 8007AB30 00014230 */  andi       $v0, $v0, 0x100
    /* 6AB34 8007AB34 08004010 */  beqz       $v0, .L8007AB58
    /* 6AB38 8007AB38 00000000 */   nop
    /* 6AB3C 8007AB3C FEE0010C */  jal        CloseInvChr__Fv
    /* 6AB40 8007AB40 00000000 */   nop
    /* 6AB44 8007AB44 0000228E */  lw         $v0, 0x0($s1)
    /* 6AB48 8007AB48 4C002482 */  lb         $a0, 0x4C($s1)
    /* 6AB4C 8007AB4C 42004580 */  lb         $a1, 0x42($v0)
    /* 6AB50 8007AB50 299B010C */  jal        StartStand__Fii
    /* 6AB54 8007AB54 00000000 */   nop
  .L8007AB58:
    /* 6AB58 8007AB58 1280023C */  lui        $v0, %hi(goldcheat)
    /* 6AB5C 8007AB5C 24B2428C */  lw         $v0, %lo(goldcheat)($v0)
    /* 6AB60 8007AB60 00000000 */  nop
    /* 6AB64 8007AB64 2C004010 */  beqz       $v0, .L8007AC18
    /* 6AB68 8007AB68 00000000 */   nop
    /* 6AB6C 8007AB6C 1280023C */  lui        $v0, %hi(invflag)
    /* 6AB70 8007AB70 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 6AB74 8007AB74 00000000 */  nop
    /* 6AB78 8007AB78 27004010 */  beqz       $v0, .L8007AC18
    /* 6AB7C 8007AB7C 00000000 */   nop
    /* 6AB80 8007AB80 1280023C */  lui        $v0, %hi(sel_data)
    /* 6AB84 8007AB84 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6AB88 8007AB88 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 6AB8C 8007AB8C 21082200 */  addu       $at, $at, $v0
    /* 6AB90 8007AB90 68B72280 */  lb         $v0, %lo(_pcursinvitem)($at)
    /* 6AB94 8007AB94 1280103C */  lui        $s0, %hi(_pcursinvitem)
    /* 6AB98 8007AB98 68B71026 */  addiu      $s0, $s0, %lo(_pcursinvitem)
    /* 6AB9C 8007AB9C 1E004010 */  beqz       $v0, .L8007AC18
    /* 6ABA0 8007ABA0 00000000 */   nop
    /* 6ABA4 8007ABA4 5800248E */  lw         $a0, 0x58($s1)
    /* 6ABA8 8007ABA8 52EC010C */  jal        GetCur__C4CPad
    /* 6ABAC 8007ABAC 00000000 */   nop
    /* 6ABB0 8007ABB0 20244230 */  andi       $v0, $v0, 0x2420
    /* 6ABB4 8007ABB4 20240324 */  addiu      $v1, $zero, 0x2420
    /* 6ABB8 8007ABB8 17004314 */  bne        $v0, $v1, .L8007AC18
    /* 6ABBC 8007ABBC 00000000 */   nop
    /* 6ABC0 8007ABC0 1280023C */  lui        $v0, %hi(sel_data)
    /* 6ABC4 8007ABC4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6ABC8 8007ABC8 00000000 */  nop
    /* 6ABCC 8007ABCC 21105000 */  addu       $v0, $v0, $s0
    /* 6ABD0 8007ABD0 00004380 */  lb         $v1, 0x0($v0)
    /* 6ABD4 8007ABD4 00000000 */  nop
    /* 6ABD8 8007ABD8 F9FF6324 */  addiu      $v1, $v1, -0x7
    /* 6ABDC 8007ABDC C0100300 */  sll        $v0, $v1, 3
    /* 6ABE0 8007ABE0 23104300 */  subu       $v0, $v0, $v1
    /* 6ABE4 8007ABE4 80100200 */  sll        $v0, $v0, 2
    /* 6ABE8 8007ABE8 23104300 */  subu       $v0, $v0, $v1
    /* 6ABEC 8007ABEC 0000238E */  lw         $v1, 0x0($s1)
    /* 6ABF0 8007ABF0 80100200 */  sll        $v0, $v0, 2
    /* 6ABF4 8007ABF4 21206200 */  addu       $a0, $v1, $v0
    /* 6ABF8 8007ABF8 D0048384 */  lh         $v1, 0x4D0($a0)
    /* 6ABFC 8007ABFC 0B000224 */  addiu      $v0, $zero, 0xB
    /* 6AC00 8007AC00 05006214 */  bne        $v1, $v0, .L8007AC18
    /* 6AC04 8007AC04 00000000 */   nop
    /* 6AC08 8007AC08 B804828C */  lw         $v0, 0x4B8($a0)
    /* 6AC0C 8007AC0C 00000000 */  nop
    /* 6AC10 8007AC10 F4014224 */  addiu      $v0, $v0, 0x1F4
    /* 6AC14 8007AC14 B80482AC */  sw         $v0, 0x4B8($a0)
  .L8007AC18:
    /* 6AC18 8007AC18 2400BF8F */  lw         $ra, 0x24($sp)
    /* 6AC1C 8007AC1C 2000B28F */  lw         $s2, 0x20($sp)
    /* 6AC20 8007AC20 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 6AC24 8007AC24 1800B08F */  lw         $s0, 0x18($sp)
    /* 6AC28 8007AC28 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6AC2C 8007AC2C 0800E003 */  jr         $ra
    /* 6AC30 8007AC30 00000000 */   nop
endlabel Handle__7GamePad
