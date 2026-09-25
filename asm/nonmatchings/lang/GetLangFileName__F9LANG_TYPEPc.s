.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLangFileName__F9LANG_TYPEPc, 0xE0

glabel GetLangFileName__F9LANG_TYPEPc
    /* 6B764 8007B764 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6B768 8007B768 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6B76C 8007B76C 2180A000 */  addu       $s0, $a1, $zero
    /* 6B770 8007B770 1800BFAF */  sw         $ra, 0x18($sp)
    /* 6B774 8007B774 11EE010C */  jal        GetLangFileNameExt__F9LANG_TYPE
    /* 6B778 8007B778 1400B1AF */   sw        $s1, 0x14($sp)
    /* 6B77C 8007B77C 21884000 */  addu       $s1, $v0, $zero
    /* 6B780 8007B780 05002016 */  bnez       $s1, .L8007B798
    /* 6B784 8007B784 21200000 */   addu      $a0, $zero, $zero
    /* 6B788 8007B788 1280053C */  lui        $a1, %hi(D_80118C40)
    /* 6B78C 8007B78C 408CA524 */  addiu      $a1, $a1, %lo(D_80118C40)
    /* 6B790 8007B790 A583000C */  jal        DBG_Error
    /* 6B794 8007B794 36010624 */   addiu     $a2, $zero, 0x136
  .L8007B798:
    /* 6B798 8007B798 000000A2 */  sb         $zero, 0x0($s0)
    /* 6B79C 8007B79C 7814838F */  lw         $v1, %gp_rel(LangDbNo)($gp)
    /* 6B7A0 8007B7A0 01000224 */  addiu      $v0, $zero, 0x1
    /* 6B7A4 8007B7A4 12006210 */  beq        $v1, $v0, .L8007B7F0
    /* 6B7A8 8007B7A8 02006228 */   slti      $v0, $v1, 0x2
    /* 6B7AC 8007B7AC 05004010 */  beqz       $v0, .L8007B7C4
    /* 6B7B0 8007B7B0 00000000 */   nop
    /* 6B7B4 8007B7B4 0A006010 */  beqz       $v1, .L8007B7E0
    /* 6B7B8 8007B7B8 21200002 */   addu      $a0, $s0, $zero
    /* 6B7BC 8007B7BC 09EE0108 */  j          .L8007B824
    /* 6B7C0 8007B7C0 00000000 */   nop
  .L8007B7C4:
    /* 6B7C4 8007B7C4 02000224 */  addiu      $v0, $zero, 0x2
    /* 6B7C8 8007B7C8 0D006210 */  beq        $v1, $v0, .L8007B800
    /* 6B7CC 8007B7CC 03000224 */   addiu     $v0, $zero, 0x3
    /* 6B7D0 8007B7D0 0F006210 */  beq        $v1, $v0, .L8007B810
    /* 6B7D4 8007B7D4 21200002 */   addu      $a0, $s0, $zero
    /* 6B7D8 8007B7D8 08EE0108 */  j          .L8007B820
    /* 6B7DC 8007B7DC 00000000 */   nop
  .L8007B7E0:
    /* 6B7E0 8007B7E0 1280053C */  lui        $a1, %hi(D_80118C50)
    /* 6B7E4 8007B7E4 508CA524 */  addiu      $a1, $a1, %lo(D_80118C50)
    /* 6B7E8 8007B7E8 06EE0108 */  j          .L8007B818
    /* 6B7EC 8007B7EC 00000000 */   nop
  .L8007B7F0:
    /* 6B7F0 8007B7F0 1280053C */  lui        $a1, %hi(D_80118C5C)
    /* 6B7F4 8007B7F4 5C8CA524 */  addiu      $a1, $a1, %lo(D_80118C5C)
    /* 6B7F8 8007B7F8 06EE0108 */  j          .L8007B818
    /* 6B7FC 8007B7FC 21200002 */   addu      $a0, $s0, $zero
  .L8007B800:
    /* 6B800 8007B800 1280053C */  lui        $a1, %hi(D_80118C68)
    /* 6B804 8007B804 688CA524 */  addiu      $a1, $a1, %lo(D_80118C68)
    /* 6B808 8007B808 06EE0108 */  j          .L8007B818
    /* 6B80C 8007B80C 21200002 */   addu      $a0, $s0, $zero
  .L8007B810:
    /* 6B810 8007B810 1280053C */  lui        $a1, %hi(D_80118C74)
    /* 6B814 8007B814 748CA524 */  addiu      $a1, $a1, %lo(D_80118C74)
  .L8007B818:
    /* 6B818 8007B818 FC40000C */  jal        strcat
    /* 6B81C 8007B81C 00000000 */   nop
  .L8007B820:
    /* 6B820 8007B820 21200002 */  addu       $a0, $s0, $zero
  .L8007B824:
    /* 6B824 8007B824 FC40000C */  jal        strcat
    /* 6B828 8007B828 21282002 */   addu      $a1, $s1, $zero
    /* 6B82C 8007B82C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6B830 8007B830 1400B18F */  lw         $s1, 0x14($sp)
    /* 6B834 8007B834 1000B08F */  lw         $s0, 0x10($sp)
    /* 6B838 8007B838 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6B83C 8007B83C 0800E003 */  jr         $ra
    /* 6B840 8007B840 00000000 */   nop
endlabel GetLangFileName__F9LANG_TYPEPc
