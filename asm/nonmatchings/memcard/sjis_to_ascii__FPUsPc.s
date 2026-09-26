.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching sjis_to_ascii__FPUsPc, 0x88

glabel sjis_to_ascii__FPUsPc
    /* 8D18 80142910 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8D1C 80142914 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8D20 80142918 21808000 */  addu       $s0, $a0, $zero
    /* 8D24 8014291C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8D28 80142920 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8D2C 80142924 480C80AF */  sw         $zero, %gp_rel(to_ascii_invalid_char)($gp)
    /* 8D30 80142928 00000496 */  lhu        $a0, 0x0($s0)
    /* 8D34 8014292C 00000000 */  nop
    /* 8D38 80142930 00808230 */  andi       $v0, $a0, 0x8000
    /* 8D3C 80142934 0C004010 */  beqz       $v0, .L80142968
    /* 8D40 80142938 2188A000 */   addu      $s1, $a1, $zero
    /* 8D44 8014293C 08008010 */  beqz       $a0, .L80142960
    /* 8D48 80142940 00000000 */   nop
  .L80142944:
    /* 8D4C 80142944 FD09050C */  jal        to_ascii__FUs
    /* 8D50 80142948 02001026 */   addiu     $s0, $s0, 0x2
    /* 8D54 8014294C 000022A2 */  sb         $v0, 0x0($s1)
    /* 8D58 80142950 00000496 */  lhu        $a0, 0x0($s0)
    /* 8D5C 80142954 00000000 */  nop
    /* 8D60 80142958 FAFF8014 */  bnez       $a0, .L80142944
    /* 8D64 8014295C 01003126 */   addiu     $s1, $s1, 0x1
  .L80142960:
    /* 8D68 80142960 5D0A0508 */  j          .L80142974
    /* 8D6C 80142964 000020A2 */   sb        $zero, 0x0($s1)
  .L80142968:
    /* 8D70 80142968 21202002 */  addu       $a0, $s1, $zero
    /* 8D74 8014296C F240000C */  jal        strcpy
    /* 8D78 80142970 21280002 */   addu      $a1, $s0, $zero
  .L80142974:
    /* 8D7C 80142974 480C828F */  lw         $v0, %gp_rel(to_ascii_invalid_char)($gp)
    /* 8D80 80142978 00000000 */  nop
    /* 8D84 8014297C 0100422C */  sltiu      $v0, $v0, 0x1
    /* 8D88 80142980 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8D8C 80142984 1400B18F */  lw         $s1, 0x14($sp)
    /* 8D90 80142988 1000B08F */  lw         $s0, 0x10($sp)
    /* 8D94 8014298C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8D98 80142990 0800E003 */  jr         $ra
    /* 8D9C 80142994 00000000 */   nop
endlabel sjis_to_ascii__FPUsPc
