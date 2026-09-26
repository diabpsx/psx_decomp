.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSaveStatusMessage__FiPc, 0x120

glabel GetSaveStatusMessage__FiPc
    /* 20A84 8015A67C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 20A88 8015A680 1400B1AF */  sw         $s1, 0x14($sp)
    /* 20A8C 8015A684 21888000 */  addu       $s1, $a0, $zero
    /* 20A90 8015A688 E00C888F */  lw         $t0, %gp_rel(current_card)($gp)
    /* 20A94 8015A68C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 20A98 8015A690 1000B0AF */  sw         $s0, 0x10($sp)
    /* 20A9C 8015A694 80200800 */  sll        $a0, $t0, 2
    /* 20AA0 8015A698 1280013C */  lui        $at, %hi(card_status)
    /* 20AA4 8015A69C 21082400 */  addu       $at, $at, $a0
    /* 20AA8 8015A6A0 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 20AAC 8015A6A4 02000224 */  addiu      $v0, $zero, 0x2
    /* 20AB0 8015A6A8 08006214 */  bne        $v1, $v0, .L8015A6CC
    /* 20AB4 8015A6AC 21380000 */   addu      $a3, $zero, $zero
    /* 20AB8 8015A6B0 1280013C */  lui        $at, %hi(card_side_empty)
    /* 20ABC 8015A6B4 21082400 */  addu       $at, $at, $a0
    /* 20AC0 8015A6B8 88B1238C */  lw         $v1, %lo(card_side_empty)($at)
    /* 20AC4 8015A6BC 00000000 */  nop
    /* 20AC8 8015A6C0 D80C83AF */  sw         $v1, %gp_rel(AlertTxt)($gp)
    /* 20ACC 8015A6C4 E1690508 */  j          .L8015A784
    /* 20AD0 8015A6C8 21100000 */   addu      $v0, $zero, $zero
  .L8015A6CC:
    /* 20AD4 8015A6CC 1280013C */  lui        $at, %hi(card_usable)
    /* 20AD8 8015A6D0 21082400 */  addu       $at, $at, $a0
    /* 20ADC 8015A6D4 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 20AE0 8015A6D8 00000000 */  nop
    /* 20AE4 8015A6DC 29004010 */  beqz       $v0, .L8015A784
    /* 20AE8 8015A6E0 01000224 */   addiu     $v0, $zero, 0x1
    /* 20AEC 8015A6E4 1280013C */  lui        $at, %hi(card_files)
    /* 20AF0 8015A6E8 21082400 */  addu       $at, $at, $a0
    /* 20AF4 8015A6EC ECB3238C */  lw         $v1, %lo(card_files)($at)
    /* 20AF8 8015A6F0 00000000 */  nop
    /* 20AFC 8015A6F4 2A10E300 */  slt        $v0, $a3, $v1
    /* 20B00 8015A6F8 0B004010 */  beqz       $v0, .L8015A728
    /* 20B04 8015A6FC 21200000 */   addu      $a0, $zero, $zero
    /* 20B08 8015A700 21306000 */  addu       $a2, $v1, $zero
    /* 20B0C 8015A704 401B0800 */  sll        $v1, $t0, 13
  .L8015A708:
    /* 20B10 8015A708 1480013C */  lui        $at, %hi(card_header + 0x3)
    /* 20B14 8015A70C 21082300 */  addu       $at, $at, $v1
    /* 20B18 8015A710 FBE62280 */  lb         $v0, %lo(card_header + 0x3)($at)
    /* 20B1C 8015A714 01008424 */  addiu      $a0, $a0, 0x1
    /* 20B20 8015A718 2138E200 */  addu       $a3, $a3, $v0
    /* 20B24 8015A71C 2A108600 */  slt        $v0, $a0, $a2
    /* 20B28 8015A720 F9FF4014 */  bnez       $v0, .L8015A708
    /* 20B2C 8015A724 00026324 */   addiu     $v1, $v1, 0x200
  .L8015A728:
    /* 20B30 8015A728 0F000224 */  addiu      $v0, $zero, 0xF
    /* 20B34 8015A72C 23804700 */  subu       $s0, $v0, $a3
    /* 20B38 8015A730 2A101102 */  slt        $v0, $s0, $s1
    /* 20B3C 8015A734 13004010 */  beqz       $v0, .L8015A784
    /* 20B40 8015A738 01000224 */   addiu     $v0, $zero, 0x1
    /* 20B44 8015A73C E00C848F */  lw         $a0, %gp_rel(current_card)($gp)
    /* 20B48 8015A740 6465050C */  jal        GetFileNumber__FiPc
    /* 20B4C 8015A744 00000000 */   nop
    /* 20B50 8015A748 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 20B54 8015A74C 0C004314 */  bne        $v0, $v1, .L8015A780
    /* 20B58 8015A750 0C050224 */   addiu     $v0, $zero, 0x50C
    /* 20B5C 8015A754 D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
    /* 20B60 8015A758 4AED010C */  jal        GetStr__Fi
    /* 20B64 8015A75C 0C050424 */   addiu     $a0, $zero, 0x50C
    /* 20B68 8015A760 1680043C */  lui        $a0, %hi(AlertStr)
    /* 20B6C 8015A764 10958424 */  addiu      $a0, $a0, %lo(AlertStr)
    /* 20B70 8015A768 21284000 */  addu       $a1, $v0, $zero
    /* 20B74 8015A76C 21302002 */  addu       $a2, $s1, $zero
    /* 20B78 8015A770 9767000C */  jal        sprintf
    /* 20B7C 8015A774 21380002 */   addu      $a3, $s0, $zero
    /* 20B80 8015A778 E1690508 */  j          .L8015A784
    /* 20B84 8015A77C 21100000 */   addu      $v0, $zero, $zero
  .L8015A780:
    /* 20B88 8015A780 01000224 */  addiu      $v0, $zero, 0x1
  .L8015A784:
    /* 20B8C 8015A784 1800BF8F */  lw         $ra, 0x18($sp)
    /* 20B90 8015A788 1400B18F */  lw         $s1, 0x14($sp)
    /* 20B94 8015A78C 1000B08F */  lw         $s0, 0x10($sp)
    /* 20B98 8015A790 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 20B9C 8015A794 0800E003 */  jr         $ra
    /* 20BA0 8015A798 00000000 */   nop
endlabel GetSaveStatusMessage__FiPc
