.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetWrap__5CFontPcP4RECT, 0x270

glabel GetWrap__5CFontPcP4RECT
    /* 7A6C8 8008A6C8 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 7A6CC 8008A6CC 2800B2AF */  sw         $s2, 0x28($sp)
    /* 7A6D0 8008A6D0 21908000 */  addu       $s2, $a0, $zero
    /* 7A6D4 8008A6D4 4400BFAF */  sw         $ra, 0x44($sp)
    /* 7A6D8 8008A6D8 4000BEAF */  sw         $fp, 0x40($sp)
    /* 7A6DC 8008A6DC 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 7A6E0 8008A6E0 3800B6AF */  sw         $s6, 0x38($sp)
    /* 7A6E4 8008A6E4 3400B5AF */  sw         $s5, 0x34($sp)
    /* 7A6E8 8008A6E8 3000B4AF */  sw         $s4, 0x30($sp)
    /* 7A6EC 8008A6EC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 7A6F0 8008A6F0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 7A6F4 8008A6F4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 7A6F8 8008A6F8 0200C010 */  beqz       $a2, .L8008A704
    /* 7A6FC 8008A6FC 40011424 */   addiu     $s4, $zero, 0x140
    /* 7A700 8008A700 0400D484 */  lh         $s4, 0x4($a2)
  .L8008A704:
    /* 7A704 8008A704 00000000 */  nop
    /* 7A708 8008A708 21F08002 */  addu       $fp, $s4, $zero
    /* 7A70C 8008A70C 21B00000 */  addu       $s6, $zero, $zero
    /* 7A710 8008A710 20001524 */  addiu      $s5, $zero, 0x20
  .L8008A714:
    /* 7A714 8008A714 0000A280 */  lb         $v0, 0x0($a1)
  .L8008A718:
    /* 7A718 8008A718 00000000 */  nop
    /* 7A71C 8008A71C 78004010 */  beqz       $v0, .L8008A900
    /* 7A720 8008A720 21A0C003 */   addu      $s4, $fp, $zero
    /* 7A724 8008A724 2180A000 */  addu       $s0, $a1, $zero
    /* 7A728 8008A728 21980000 */  addu       $s3, $zero, $zero
    /* 7A72C 8008A72C 21B80000 */  addu       $s7, $zero, $zero
    /* 7A730 8008A730 0100D626 */  addiu      $s6, $s6, 0x1
    /* 7A734 8008A734 100240AE */  sw         $zero, 0x210($s2)
    /* 7A738 8008A738 21880000 */  addu       $s1, $zero, $zero
  .L8008A73C:
    /* 7A73C 8008A73C 1002428E */  lw         $v0, 0x210($s2)
    /* 7A740 8008A740 00000000 */  nop
    /* 7A744 8008A744 2A105400 */  slt        $v0, $v0, $s4
    /* 7A748 8008A748 20004010 */  beqz       $v0, .L8008A7CC
    /* 7A74C 8008A74C 00000000 */   nop
    /* 7A750 8008A750 00000382 */  lb         $v1, 0x0($s0)
    /* 7A754 8008A754 00000000 */  nop
    /* 7A758 8008A758 1D006010 */  beqz       $v1, .L8008A7D0
    /* 7A75C 8008A75C 21286000 */   addu      $a1, $v1, $zero
    /* 7A760 8008A760 0A000224 */  addiu      $v0, $zero, 0xA
    /* 7A764 8008A764 19006210 */  beq        $v1, $v0, .L8008A7CC
    /* 7A768 8008A768 FF00A330 */   andi      $v1, $a1, 0xFF
    /* 7A76C 8008A76C 05007510 */  beq        $v1, $s5, .L8008A784
    /* 7A770 8008A770 2D000224 */   addiu     $v0, $zero, 0x2D
    /* 7A774 8008A774 03006210 */  beq        $v1, $v0, .L8008A784
    /* 7A778 8008A778 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 7A77C 8008A77C 04006214 */  bne        $v1, $v0, .L8008A790
    /* 7A780 8008A780 8000A230 */   andi      $v0, $a1, 0x80
  .L8008A784:
    /* 7A784 8008A784 21980002 */  addu       $s3, $s0, $zero
    /* 7A788 8008A788 1002518E */  lw         $s1, 0x210($s2)
    /* 7A78C 8008A78C 8000A230 */  andi       $v0, $a1, 0x80
  .L8008A790:
    /* 7A790 8008A790 05004010 */  beqz       $v0, .L8008A7A8
    /* 7A794 8008A794 0C000324 */   addiu     $v1, $zero, 0xC
    /* 7A798 8008A798 21980002 */  addu       $s3, $s0, $zero
    /* 7A79C 8008A79C 1002518E */  lw         $s1, 0x210($s2)
    /* 7A7A0 8008A7A0 EE290208 */  j          .L8008A7B8
    /* 7A7A4 8008A7A4 01001026 */   addiu     $s0, $s0, 0x1
  .L8008A7A8:
    /* 7A7A8 8008A7A8 21204002 */  addu       $a0, $s2, $zero
    /* 7A7AC 8008A7AC EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 7A7B0 8008A7B0 FF00A530 */   andi      $a1, $a1, 0xFF
    /* 7A7B4 8008A7B4 21184000 */  addu       $v1, $v0, $zero
  .L8008A7B8:
    /* 7A7B8 8008A7B8 1002428E */  lw         $v0, 0x210($s2)
    /* 7A7BC 8008A7BC 01001026 */  addiu      $s0, $s0, 0x1
    /* 7A7C0 8008A7C0 21104300 */  addu       $v0, $v0, $v1
    /* 7A7C4 8008A7C4 CF290208 */  j          .L8008A73C
    /* 7A7C8 8008A7C8 100242AE */   sw        $v0, 0x210($s2)
  .L8008A7CC:
    /* 7A7CC 8008A7CC 00000382 */  lb         $v1, 0x0($s0)
  .L8008A7D0:
    /* 7A7D0 8008A7D0 00000000 */  nop
    /* 7A7D4 8008A7D4 0C007510 */  beq        $v1, $s5, .L8008A808
    /* 7A7D8 8008A7D8 21006228 */   slti      $v0, $v1, 0x21
    /* 7A7DC 8008A7DC 07004010 */  beqz       $v0, .L8008A7FC
    /* 7A7E0 8008A7E0 00000000 */   nop
    /* 7A7E4 8008A7E4 08006010 */  beqz       $v1, .L8008A808
    /* 7A7E8 8008A7E8 0A000224 */   addiu     $v0, $zero, 0xA
    /* 7A7EC 8008A7EC 04006214 */  bne        $v1, $v0, .L8008A800
    /* 7A7F0 8008A7F0 01008226 */   addiu     $v0, $s4, 0x1
    /* 7A7F4 8008A7F4 022A0208 */  j          .L8008A808
    /* 7A7F8 8008A7F8 01001026 */   addiu     $s0, $s0, 0x1
  .L8008A7FC:
    /* 7A7FC 8008A7FC 01008226 */  addiu      $v0, $s4, 0x1
  .L8008A800:
    /* 7A800 8008A800 100242AE */  sw         $v0, 0x210($s2)
    /* 7A804 8008A804 01003126 */  addiu      $s1, $s1, 0x1
  .L8008A808:
    /* 7A808 8008A808 1002428E */  lw         $v0, 0x210($s2)
    /* 7A80C 8008A80C 00000000 */  nop
    /* 7A810 8008A810 2A108202 */  slt        $v0, $s4, $v0
    /* 7A814 8008A814 2F004010 */  beqz       $v0, .L8008A8D4
    /* 7A818 8008A818 21280002 */   addu      $a1, $s0, $zero
    /* 7A81C 8008A81C 22006016 */  bnez       $s3, .L8008A8A8
    /* 7A820 8008A820 00000000 */   nop
    /* 7A824 8008A824 00000282 */  lb         $v0, 0x0($s0)
    /* 7A828 8008A828 00000000 */  nop
    /* 7A82C 8008A82C 29004010 */  beqz       $v0, .L8008A8D4
    /* 7A830 8008A830 00000000 */   nop
    /* 7A834 8008A834 27005510 */  beq        $v0, $s5, .L8008A8D4
    /* 7A838 8008A838 20001324 */   addiu     $s3, $zero, 0x20
  .L8008A83C:
    /* 7A83C 8008A83C 00000382 */  lb         $v1, 0x0($s0)
    /* 7A840 8008A840 00000000 */  nop
    /* 7A844 8008A844 22006010 */  beqz       $v1, .L8008A8D0
    /* 7A848 8008A848 21106000 */   addu      $v0, $v1, $zero
    /* 7A84C 8008A84C 21884000 */  addu       $s1, $v0, $zero
    /* 7A850 8008A850 80006230 */  andi       $v0, $v1, 0x80
    /* 7A854 8008A854 06004010 */  beqz       $v0, .L8008A870
    /* 7A858 8008A858 21204002 */   addu      $a0, $s2, $zero
    /* 7A85C 8008A85C 1002428E */  lw         $v0, 0x210($s2)
    /* 7A860 8008A860 01001026 */  addiu      $s0, $s0, 0x1
    /* 7A864 8008A864 0C004224 */  addiu      $v0, $v0, 0xC
    /* 7A868 8008A868 222A0208 */  j          .L8008A888
    /* 7A86C 8008A86C 100242AE */   sw        $v0, 0x210($s2)
  .L8008A870:
    /* 7A870 8008A870 EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 7A874 8008A874 FF002532 */   andi      $a1, $s1, 0xFF
    /* 7A878 8008A878 1002438E */  lw         $v1, 0x210($s2)
    /* 7A87C 8008A87C 00000000 */  nop
    /* 7A880 8008A880 21186200 */  addu       $v1, $v1, $v0
    /* 7A884 8008A884 100243AE */  sw         $v1, 0x210($s2)
  .L8008A888:
    /* 7A888 8008A888 00161100 */  sll        $v0, $s1, 24
    /* 7A88C 8008A88C 03160200 */  sra        $v0, $v0, 24
    /* 7A890 8008A890 0F004010 */  beqz       $v0, .L8008A8D0
    /* 7A894 8008A894 01001026 */   addiu     $s0, $s0, 0x1
    /* 7A898 8008A898 E8FF5314 */  bne        $v0, $s3, .L8008A83C
    /* 7A89C 8008A89C 00000000 */   nop
    /* 7A8A0 8008A8A0 352A0208 */  j          .L8008A8D4
    /* 7A8A4 8008A8A4 21280002 */   addu      $a1, $s0, $zero
  .L8008A8A8:
    /* 7A8A8 8008A8A8 0700F316 */  bne        $s7, $s3, .L8008A8C8
    /* 7A8AC 8008A8AC 21200000 */   addu      $a0, $zero, $zero
    /* 7A8B0 8008A8B0 1180053C */  lui        $a1, %hi(D_801104C8)
    /* 7A8B4 8008A8B4 C804A524 */  addiu      $a1, $a1, %lo(D_801104C8)
    /* 7A8B8 8008A8B8 A583000C */  jal        DBG_Error
    /* 7A8BC 8008A8BC 3D040624 */   addiu     $a2, $zero, 0x43D
    /* 7A8C0 8008A8C0 352A0208 */  j          .L8008A8D4
    /* 7A8C4 8008A8C4 21280002 */   addu      $a1, $s0, $zero
  .L8008A8C8:
    /* 7A8C8 8008A8C8 21806002 */  addu       $s0, $s3, $zero
    /* 7A8CC 8008A8CC 100251AE */  sw         $s1, 0x210($s2)
  .L8008A8D0:
    /* 7A8D0 8008A8D0 21280002 */  addu       $a1, $s0, $zero
  .L8008A8D4:
    /* 7A8D4 8008A8D4 0000A280 */  lb         $v0, 0x0($a1)
    /* 7A8D8 8008A8D8 00000000 */  nop
    /* 7A8DC 8008A8DC 8EFF5514 */  bne        $v0, $s5, .L8008A718
    /* 7A8E0 8008A8E0 20000324 */   addiu     $v1, $zero, 0x20
    /* 7A8E4 8008A8E4 0100A524 */  addiu      $a1, $a1, 0x1
  .L8008A8E8:
    /* 7A8E8 8008A8E8 0000A280 */  lb         $v0, 0x0($a1)
    /* 7A8EC 8008A8EC 00000000 */  nop
    /* 7A8F0 8008A8F0 FDFF4310 */  beq        $v0, $v1, .L8008A8E8
    /* 7A8F4 8008A8F4 0100A524 */   addiu     $a1, $a1, 0x1
    /* 7A8F8 8008A8F8 C5290208 */  j          .L8008A714
    /* 7A8FC 8008A8FC FFFFA524 */   addiu     $a1, $a1, -0x1
  .L8008A900:
    /* 7A900 8008A900 2110C002 */  addu       $v0, $s6, $zero
    /* 7A904 8008A904 4400BF8F */  lw         $ra, 0x44($sp)
    /* 7A908 8008A908 4000BE8F */  lw         $fp, 0x40($sp)
    /* 7A90C 8008A90C 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 7A910 8008A910 3800B68F */  lw         $s6, 0x38($sp)
    /* 7A914 8008A914 3400B58F */  lw         $s5, 0x34($sp)
    /* 7A918 8008A918 3000B48F */  lw         $s4, 0x30($sp)
    /* 7A91C 8008A91C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 7A920 8008A920 2800B28F */  lw         $s2, 0x28($sp)
    /* 7A924 8008A924 2400B18F */  lw         $s1, 0x24($sp)
    /* 7A928 8008A928 2000B08F */  lw         $s0, 0x20($sp)
    /* 7A92C 8008A92C 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 7A930 8008A930 0800E003 */  jr         $ra
    /* 7A934 8008A934 00000000 */   nop
endlabel GetWrap__5CFontPcP4RECT
