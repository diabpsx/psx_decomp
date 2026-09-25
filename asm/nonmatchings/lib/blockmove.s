.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching blockmove, 0x320

glabel blockmove
    /* 1C7C4 8002C7C4 2A088500 */  slt        $at, $a0, $a1
    /* 1C7C8 8002C7C8 7B002014 */  bnez       $at, .L8002C9B8
  .L8002C7CC:
    /* 1C7CC 8002C7CC 25108500 */   or        $v0, $a0, $a1
    /* 1C7D0 8002C7D0 03004230 */  andi       $v0, $v0, 0x3
    /* 1C7D4 8002C7D4 4B004014 */  bnez       $v0, .L8002C904
    /* 1C7D8 8002C7D8 00000000 */   nop
    /* 1C7DC 8002C7DC C0FFC624 */  addiu      $a2, $a2, -0x40
    /* 1C7E0 8002C7E0 2500C004 */  bltz       $a2, .L8002C878
    /* 1C7E4 8002C7E4 00000000 */   nop
  .L8002C7E8:
    /* 1C7E8 8002C7E8 0000888C */  lw         $t0, 0x0($a0)
    /* 1C7EC 8002C7EC 0400898C */  lw         $t1, 0x4($a0)
    /* 1C7F0 8002C7F0 08008A8C */  lw         $t2, 0x8($a0)
    /* 1C7F4 8002C7F4 0C008B8C */  lw         $t3, 0xC($a0)
    /* 1C7F8 8002C7F8 10008C8C */  lw         $t4, 0x10($a0)
    /* 1C7FC 8002C7FC 14008D8C */  lw         $t5, 0x14($a0)
    /* 1C800 8002C800 18008E8C */  lw         $t6, 0x18($a0)
    /* 1C804 8002C804 1C008F8C */  lw         $t7, 0x1C($a0)
    /* 1C808 8002C808 0000A8AC */  sw         $t0, 0x0($a1)
    /* 1C80C 8002C80C 0400A9AC */  sw         $t1, 0x4($a1)
    /* 1C810 8002C810 0800AAAC */  sw         $t2, 0x8($a1)
    /* 1C814 8002C814 0C00ABAC */  sw         $t3, 0xC($a1)
    /* 1C818 8002C818 1000ACAC */  sw         $t4, 0x10($a1)
    /* 1C81C 8002C81C 1400ADAC */  sw         $t5, 0x14($a1)
    /* 1C820 8002C820 1800AEAC */  sw         $t6, 0x18($a1)
    /* 1C824 8002C824 1C00AFAC */  sw         $t7, 0x1C($a1)
    /* 1C828 8002C828 2000888C */  lw         $t0, 0x20($a0)
    /* 1C82C 8002C82C 2400898C */  lw         $t1, 0x24($a0)
    /* 1C830 8002C830 28008A8C */  lw         $t2, 0x28($a0)
    /* 1C834 8002C834 2C008B8C */  lw         $t3, 0x2C($a0)
    /* 1C838 8002C838 30008C8C */  lw         $t4, 0x30($a0)
    /* 1C83C 8002C83C 34008D8C */  lw         $t5, 0x34($a0)
    /* 1C840 8002C840 38008E8C */  lw         $t6, 0x38($a0)
    /* 1C844 8002C844 3C008F8C */  lw         $t7, 0x3C($a0)
    /* 1C848 8002C848 2000A8AC */  sw         $t0, 0x20($a1)
    /* 1C84C 8002C84C 2400A9AC */  sw         $t1, 0x24($a1)
    /* 1C850 8002C850 2800AAAC */  sw         $t2, 0x28($a1)
    /* 1C854 8002C854 2C00ABAC */  sw         $t3, 0x2C($a1)
    /* 1C858 8002C858 3000ACAC */  sw         $t4, 0x30($a1)
    /* 1C85C 8002C85C 3400ADAC */  sw         $t5, 0x34($a1)
    /* 1C860 8002C860 3800AEAC */  sw         $t6, 0x38($a1)
    /* 1C864 8002C864 3C00AFAC */  sw         $t7, 0x3C($a1)
    /* 1C868 8002C868 C0FFC624 */  addiu      $a2, $a2, -0x40
    /* 1C86C 8002C86C 40008424 */  addiu      $a0, $a0, 0x40
    /* 1C870 8002C870 DDFFC104 */  bgez       $a2, .L8002C7E8
    /* 1C874 8002C874 4000A524 */   addiu     $a1, $a1, 0x40
  .L8002C878:
    /* 1C878 8002C878 3000C624 */  addiu      $a2, $a2, 0x30
    /* 1C87C 8002C87C 0D00C004 */  bltz       $a2, .L8002C8B4
    /* 1C880 8002C880 00000000 */   nop
  .L8002C884:
    /* 1C884 8002C884 0000888C */  lw         $t0, 0x0($a0)
    /* 1C888 8002C888 0400898C */  lw         $t1, 0x4($a0)
    /* 1C88C 8002C88C 08008A8C */  lw         $t2, 0x8($a0)
    /* 1C890 8002C890 0C008B8C */  lw         $t3, 0xC($a0)
    /* 1C894 8002C894 0000A8AC */  sw         $t0, 0x0($a1)
    /* 1C898 8002C898 0400A9AC */  sw         $t1, 0x4($a1)
    /* 1C89C 8002C89C 0800AAAC */  sw         $t2, 0x8($a1)
    /* 1C8A0 8002C8A0 0C00ABAC */  sw         $t3, 0xC($a1)
    /* 1C8A4 8002C8A4 F0FFC624 */  addiu      $a2, $a2, -0x10
    /* 1C8A8 8002C8A8 10008424 */  addiu      $a0, $a0, 0x10
    /* 1C8AC 8002C8AC F5FFC104 */  bgez       $a2, .L8002C884
    /* 1C8B0 8002C8B0 1000A524 */   addiu     $a1, $a1, 0x10
  .L8002C8B4:
    /* 1C8B4 8002C8B4 0C00C624 */  addiu      $a2, $a2, 0xC
    /* 1C8B8 8002C8B8 0700C004 */  bltz       $a2, .L8002C8D8
    /* 1C8BC 8002C8BC 00000000 */   nop
  .L8002C8C0:
    /* 1C8C0 8002C8C0 0000888C */  lw         $t0, 0x0($a0)
    /* 1C8C4 8002C8C4 FCFFC624 */  addiu      $a2, $a2, -0x4
    /* 1C8C8 8002C8C8 0000A8AC */  sw         $t0, 0x0($a1)
    /* 1C8CC 8002C8CC 04008424 */  addiu      $a0, $a0, 0x4
    /* 1C8D0 8002C8D0 FBFFC104 */  bgez       $a2, .L8002C8C0
    /* 1C8D4 8002C8D4 0400A524 */   addiu     $a1, $a1, 0x4
  .L8002C8D8:
    /* 1C8D8 8002C8D8 0300C624 */  addiu      $a2, $a2, 0x3
    /* 1C8DC 8002C8DC 0700C004 */  bltz       $a2, .L8002C8FC
    /* 1C8E0 8002C8E0 00000000 */   nop
  .L8002C8E4:
    /* 1C8E4 8002C8E4 00008880 */  lb         $t0, 0x0($a0)
    /* 1C8E8 8002C8E8 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 1C8EC 8002C8EC 0000A8A0 */  sb         $t0, 0x0($a1)
    /* 1C8F0 8002C8F0 01008424 */  addiu      $a0, $a0, 0x1
    /* 1C8F4 8002C8F4 FBFFC104 */  bgez       $a2, .L8002C8E4
    /* 1C8F8 8002C8F8 0100A524 */   addiu     $a1, $a1, 0x1
  .L8002C8FC:
    /* 1C8FC 8002C8FC 0800E003 */  jr         $ra
    /* 1C900 8002C900 00000000 */   nop
  .L8002C904:
    /* 1C904 8002C904 F0FFC624 */  addiu      $a2, $a2, -0x10
    /* 1C908 8002C908 1500C004 */  bltz       $a2, .L8002C960
    /* 1C90C 8002C90C 00000000 */   nop
  .L8002C910:
    /* 1C910 8002C910 03008888 */  lwl        $t0, 0x3($a0)
    /* 1C914 8002C914 00008898 */  lwr        $t0, 0x0($a0)
    /* 1C918 8002C918 07008988 */  lwl        $t1, 0x7($a0)
    /* 1C91C 8002C91C 04008998 */  lwr        $t1, 0x4($a0)
    /* 1C920 8002C920 0B008A88 */  lwl        $t2, 0xB($a0)
    /* 1C924 8002C924 08008A98 */  lwr        $t2, 0x8($a0)
    /* 1C928 8002C928 0F008B88 */  lwl        $t3, 0xF($a0)
    /* 1C92C 8002C92C 0C008B98 */  lwr        $t3, 0xC($a0)
    /* 1C930 8002C930 0300A8A8 */  swl        $t0, 0x3($a1)
    /* 1C934 8002C934 0000A8B8 */  swr        $t0, 0x0($a1)
    /* 1C938 8002C938 0700A9A8 */  swl        $t1, 0x7($a1)
    /* 1C93C 8002C93C 0400A9B8 */  swr        $t1, 0x4($a1)
    /* 1C940 8002C940 0B00AAA8 */  swl        $t2, 0xB($a1)
    /* 1C944 8002C944 0800AAB8 */  swr        $t2, 0x8($a1)
    /* 1C948 8002C948 0F00ABA8 */  swl        $t3, 0xF($a1)
    /* 1C94C 8002C94C 0C00ABB8 */  swr        $t3, 0xC($a1)
    /* 1C950 8002C950 F0FFC624 */  addiu      $a2, $a2, -0x10
    /* 1C954 8002C954 10008424 */  addiu      $a0, $a0, 0x10
    /* 1C958 8002C958 EDFFC104 */  bgez       $a2, .L8002C910
    /* 1C95C 8002C95C 1000A524 */   addiu     $a1, $a1, 0x10
  .L8002C960:
    /* 1C960 8002C960 0C00C624 */  addiu      $a2, $a2, 0xC
    /* 1C964 8002C964 0900C004 */  bltz       $a2, .L8002C98C
    /* 1C968 8002C968 00000000 */   nop
  .L8002C96C:
    /* 1C96C 8002C96C 03008888 */  lwl        $t0, 0x3($a0)
    /* 1C970 8002C970 00008898 */  lwr        $t0, 0x0($a0)
    /* 1C974 8002C974 FCFFC624 */  addiu      $a2, $a2, -0x4
    /* 1C978 8002C978 0300A8A8 */  swl        $t0, 0x3($a1)
    /* 1C97C 8002C97C 0000A8B8 */  swr        $t0, 0x0($a1)
    /* 1C980 8002C980 04008424 */  addiu      $a0, $a0, 0x4
    /* 1C984 8002C984 F9FFC104 */  bgez       $a2, .L8002C96C
    /* 1C988 8002C988 0400A524 */   addiu     $a1, $a1, 0x4
  .L8002C98C:
    /* 1C98C 8002C98C 0300C624 */  addiu      $a2, $a2, 0x3
    /* 1C990 8002C990 0700C004 */  bltz       $a2, .L8002C9B0
    /* 1C994 8002C994 00000000 */   nop
  .L8002C998:
    /* 1C998 8002C998 00008880 */  lb         $t0, 0x0($a0)
    /* 1C99C 8002C99C FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 1C9A0 8002C9A0 0000A8A0 */  sb         $t0, 0x0($a1)
    /* 1C9A4 8002C9A4 01008424 */  addiu      $a0, $a0, 0x1
    /* 1C9A8 8002C9A8 FBFFC104 */  bgez       $a2, .L8002C998
    /* 1C9AC 8002C9AC 0100A524 */   addiu     $a1, $a1, 0x1
  .L8002C9B0:
    /* 1C9B0 8002C9B0 0800E003 */  jr         $ra
    /* 1C9B4 8002C9B4 00000000 */   nop
  .L8002C9B8:
    /* 1C9B8 8002C9B8 20388600 */  add        $a3, $a0, $a2 /* handwritten instruction */
    /* 1C9BC 8002C9BC 2A08A700 */  slt        $at, $a1, $a3
    /* 1C9C0 8002C9C0 82FF2010 */  beqz       $at, .L8002C7CC
    /* 1C9C4 8002C9C4 00000000 */   nop
    /* 1C9C8 8002C9C8 20208600 */  add        $a0, $a0, $a2 /* handwritten instruction */
    /* 1C9CC 8002C9CC 2028A600 */  add        $a1, $a1, $a2 /* handwritten instruction */
    /* 1C9D0 8002C9D0 25108500 */  or         $v0, $a0, $a1
    /* 1C9D4 8002C9D4 03004230 */  andi       $v0, $v0, 0x3
    /* 1C9D8 8002C9D8 15004014 */  bnez       $v0, .L8002CA30
    /* 1C9DC 8002C9DC 00000000 */   nop
    /* 1C9E0 8002C9E0 F0FFC624 */  addiu      $a2, $a2, -0x10
    /* 1C9E4 8002C9E4 0D00C004 */  bltz       $a2, .L8002CA1C
    /* 1C9E8 8002C9E8 00000000 */   nop
  .L8002C9EC:
    /* 1C9EC 8002C9EC F0FF888C */  lw         $t0, -0x10($a0)
    /* 1C9F0 8002C9F0 F4FF898C */  lw         $t1, -0xC($a0)
    /* 1C9F4 8002C9F4 F8FF8A8C */  lw         $t2, -0x8($a0)
    /* 1C9F8 8002C9F8 FCFF8B8C */  lw         $t3, -0x4($a0)
    /* 1C9FC 8002C9FC F0FFA8AC */  sw         $t0, -0x10($a1)
    /* 1CA00 8002CA00 F4FFA9AC */  sw         $t1, -0xC($a1)
    /* 1CA04 8002CA04 F8FFAAAC */  sw         $t2, -0x8($a1)
    /* 1CA08 8002CA08 FCFFABAC */  sw         $t3, -0x4($a1)
    /* 1CA0C 8002CA0C F0FF8424 */  addiu      $a0, $a0, -0x10
    /* 1CA10 8002CA10 F0FFC624 */  addiu      $a2, $a2, -0x10
    /* 1CA14 8002CA14 F5FFC104 */  bgez       $a2, .L8002C9EC
    /* 1CA18 8002CA18 F0FFA524 */   addiu     $a1, $a1, -0x10
  .L8002CA1C:
    /* 1CA1C 8002CA1C 0C00C624 */  addiu      $a2, $a2, 0xC
    /* 1CA20 8002CA20 2500C004 */  bltz       $a2, .L8002CAB8
    /* 1CA24 8002CA24 00000000 */   nop
    /* 1CA28 8002CA28 A6B20008 */  j          .L8002CA98
    /* 1CA2C 8002CA2C 00000000 */   nop
  .L8002CA30:
    /* 1CA30 8002CA30 F0FFC624 */  addiu      $a2, $a2, -0x10
    /* 1CA34 8002CA34 1500C004 */  bltz       $a2, .L8002CA8C
    /* 1CA38 8002CA38 00000000 */   nop
  .L8002CA3C:
    /* 1CA3C 8002CA3C F3FF8888 */  lwl        $t0, -0xD($a0)
    /* 1CA40 8002CA40 F0FF8898 */  lwr        $t0, -0x10($a0)
    /* 1CA44 8002CA44 F7FF8988 */  lwl        $t1, -0x9($a0)
    /* 1CA48 8002CA48 F4FF8998 */  lwr        $t1, -0xC($a0)
    /* 1CA4C 8002CA4C FBFF8A88 */  lwl        $t2, -0x5($a0)
    /* 1CA50 8002CA50 F8FF8A98 */  lwr        $t2, -0x8($a0)
    /* 1CA54 8002CA54 FFFF8B88 */  lwl        $t3, -0x1($a0)
    /* 1CA58 8002CA58 FCFF8B98 */  lwr        $t3, -0x4($a0)
    /* 1CA5C 8002CA5C F3FFA8A8 */  swl        $t0, -0xD($a1)
    /* 1CA60 8002CA60 F0FFA8B8 */  swr        $t0, -0x10($a1)
    /* 1CA64 8002CA64 F7FFA9A8 */  swl        $t1, -0x9($a1)
    /* 1CA68 8002CA68 F4FFA9B8 */  swr        $t1, -0xC($a1)
    /* 1CA6C 8002CA6C FBFFAAA8 */  swl        $t2, -0x5($a1)
    /* 1CA70 8002CA70 F8FFAAB8 */  swr        $t2, -0x8($a1)
    /* 1CA74 8002CA74 FFFFABA8 */  swl        $t3, -0x1($a1)
    /* 1CA78 8002CA78 FCFFABB8 */  swr        $t3, -0x4($a1)
    /* 1CA7C 8002CA7C F0FFC624 */  addiu      $a2, $a2, -0x10
    /* 1CA80 8002CA80 F0FF8424 */  addiu      $a0, $a0, -0x10
    /* 1CA84 8002CA84 EDFFC104 */  bgez       $a2, .L8002CA3C
    /* 1CA88 8002CA88 F0FFA524 */   addiu     $a1, $a1, -0x10
  .L8002CA8C:
    /* 1CA8C 8002CA8C 0C00C624 */  addiu      $a2, $a2, 0xC
    /* 1CA90 8002CA90 0900C004 */  bltz       $a2, .L8002CAB8
    /* 1CA94 8002CA94 00000000 */   nop
  .L8002CA98:
    /* 1CA98 8002CA98 FFFF8888 */  lwl        $t0, -0x1($a0)
    /* 1CA9C 8002CA9C FCFF8898 */  lwr        $t0, -0x4($a0)
    /* 1CAA0 8002CAA0 FCFFC624 */  addiu      $a2, $a2, -0x4
    /* 1CAA4 8002CAA4 FFFFA8A8 */  swl        $t0, -0x1($a1)
    /* 1CAA8 8002CAA8 FCFFA8B8 */  swr        $t0, -0x4($a1)
    /* 1CAAC 8002CAAC FCFF8424 */  addiu      $a0, $a0, -0x4
    /* 1CAB0 8002CAB0 F9FFC104 */  bgez       $a2, .L8002CA98
    /* 1CAB4 8002CAB4 FCFFA524 */   addiu     $a1, $a1, -0x4
  .L8002CAB8:
    /* 1CAB8 8002CAB8 0300C624 */  addiu      $a2, $a2, 0x3
    /* 1CABC 8002CABC 0700C004 */  bltz       $a2, .L8002CADC
    /* 1CAC0 8002CAC0 00000000 */   nop
  .L8002CAC4:
    /* 1CAC4 8002CAC4 FFFF8880 */  lb         $t0, -0x1($a0)
    /* 1CAC8 8002CAC8 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 1CACC 8002CACC FFFFA8A0 */  sb         $t0, -0x1($a1)
    /* 1CAD0 8002CAD0 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 1CAD4 8002CAD4 FBFFC104 */  bgez       $a2, .L8002CAC4
    /* 1CAD8 8002CAD8 FFFFA524 */   addiu     $a1, $a1, -0x1
  .L8002CADC:
    /* 1CADC 8002CADC 0800E003 */  jr         $ra
    /* 1CAE0 8002CAE0 00000000 */   nop
endlabel blockmove
