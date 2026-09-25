.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HasFile__C13CTextFileInfoPc, 0x94

glabel HasFile__C13CTextFileInfoPc
    /* 846F4 800946F4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 846F8 800946F8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 846FC 800946FC 21808000 */  addu       $s0, $a0, $zero
    /* 84700 80094700 2400B1AF */  sw         $s1, 0x24($sp)
    /* 84704 80094704 2800BFAF */  sw         $ra, 0x28($sp)
    /* 84708 80094708 1D11020C */  jal        SYSI_GetFs__Fv
    /* 8470C 8009470C 2188A000 */   addu      $s1, $a1, $zero
    /* 84710 80094710 1000A427 */  addiu      $a0, $sp, 0x10
    /* 84714 80094714 0000058E */  lw         $a1, 0x0($s0)
    /* 84718 80094718 F240000C */  jal        strcpy
    /* 8471C 8009471C 21804000 */   addu      $s0, $v0, $zero
    /* 84720 80094720 1000A427 */  addiu      $a0, $sp, 0x10
    /* 84724 80094724 FC40000C */  jal        strcat
    /* 84728 80094728 21282002 */   addu      $a1, $s1, $zero
    /* 8472C 8009472C 1280033C */  lui        $v1, %hi(FileSYS)
    /* 84730 80094730 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 84734 80094734 02000224 */  addiu      $v0, $zero, 0x2
    /* 84738 80094738 08006214 */  bne        $v1, $v0, .L8009475C
    /* 8473C 8009473C 21200002 */   addu      $a0, $s0, $zero
    /* 84740 80094740 1000A427 */  addiu      $a0, $sp, 0x10
    /* 84744 80094744 FE1E020C */  jal        BL_FileExists__FPcc
    /* 84748 80094748 01000524 */   addiu     $a1, $zero, 0x1
    /* 8474C 8009474C 01004238 */  xori       $v0, $v0, 0x1
    /* 84750 80094750 07004014 */  bnez       $v0, .L80094770
    /* 84754 80094754 21100000 */   addu      $v0, $zero, $zero
    /* 84758 80094758 21200002 */  addu       $a0, $s0, $zero
  .L8009475C:
    /* 8475C 8009475C A416020C */  jal        FileLen__6FileIOPCc
    /* 84760 80094760 1000A527 */   addiu     $a1, $sp, 0x10
    /* 84764 80094764 01004224 */  addiu      $v0, $v0, 0x1
    /* 84768 80094768 0200422C */  sltiu      $v0, $v0, 0x2
    /* 8476C 8009476C 01004238 */  xori       $v0, $v0, 0x1
  .L80094770:
    /* 84770 80094770 2800BF8F */  lw         $ra, 0x28($sp)
    /* 84774 80094774 2400B18F */  lw         $s1, 0x24($sp)
    /* 84778 80094778 2000B08F */  lw         $s0, 0x20($sp)
    /* 8477C 8009477C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 84780 80094780 0800E003 */  jr         $ra
    /* 84784 80094784 00000000 */   nop
endlabel HasFile__C13CTextFileInfoPc
