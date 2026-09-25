.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaySfxLoc__Fiii, 0xAC

glabel PlaySfxLoc__Fiii
    /* 2D784 8003D784 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2D788 8003D788 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2D78C 8003D78C 2180A000 */  addu       $s0, $a1, $zero
    /* 2D790 8003D790 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2D794 8003D794 1800BFAF */  sw         $ra, 0x18($sp)
    /* 2D798 8003D798 9CF5000C */  jal        RndSFX__Fi
    /* 2D79C 8003D79C 2188C000 */   addu      $s1, $a2, $zero
    /* 2D7A0 8003D7A0 21204000 */  addu       $a0, $v0, $zero
    /* 2D7A4 8003D7A4 0400822C */  sltiu      $v0, $a0, 0x4
    /* 2D7A8 8003D7A8 12004010 */  beqz       $v0, .L8003D7F4
    /* 2D7AC 8003D7AC 21188000 */   addu      $v1, $a0, $zero
    /* 2D7B0 8003D7B0 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 2D7B4 8003D7B4 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 2D7B8 8003D7B8 00000000 */  nop
    /* 2D7BC 8003D7BC 06004010 */  beqz       $v0, .L8003D7D8
    /* 2D7C0 8003D7C0 80100400 */   sll       $v0, $a0, 2
    /* 2D7C4 8003D7C4 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 2D7C8 8003D7C8 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 2D7CC 8003D7CC 00000000 */  nop
    /* 2D7D0 8003D7D0 11004014 */  bnez       $v0, .L8003D818
    /* 2D7D4 8003D7D4 80100400 */   sll       $v0, $a0, 2
  .L8003D7D8:
    /* 2D7D8 8003D7D8 0D80043C */  lui        $a0, %hi(sgSFX)
    /* 2D7DC 8003D7DC C00A8424 */  addiu      $a0, $a0, %lo(sgSFX)
    /* 2D7E0 8003D7E0 21204400 */  addu       $a0, $v0, $a0
    /* 2D7E4 8003D7E4 21280000 */  addu       $a1, $zero, $zero
    /* 2D7E8 8003D7E8 21300000 */  addu       $a2, $zero, $zero
    /* 2D7EC 8003D7EC 04F60008 */  j          .L8003D810
    /* 2D7F0 8003D7F0 21380000 */   addu      $a3, $zero, $zero
  .L8003D7F4:
    /* 2D7F4 8003D7F4 80100300 */  sll        $v0, $v1, 2
    /* 2D7F8 8003D7F8 0D80043C */  lui        $a0, %hi(sgSFX)
    /* 2D7FC 8003D7FC C00A8424 */  addiu      $a0, $a0, %lo(sgSFX)
    /* 2D800 8003D800 21204400 */  addu       $a0, $v0, $a0
    /* 2D804 8003D804 01000524 */  addiu      $a1, $zero, 0x1
    /* 2D808 8003D808 21300002 */  addu       $a2, $s0, $zero
    /* 2D80C 8003D80C 21382002 */  addu       $a3, $s1, $zero
  .L8003D810:
    /* 2D810 8003D810 F1F4000C */  jal        PlaySFX_priv__FP4TSFXUcii
    /* 2D814 8003D814 00000000 */   nop
  .L8003D818:
    /* 2D818 8003D818 1800BF8F */  lw         $ra, 0x18($sp)
    /* 2D81C 8003D81C 1400B18F */  lw         $s1, 0x14($sp)
    /* 2D820 8003D820 1000B08F */  lw         $s0, 0x10($sp)
    /* 2D824 8003D824 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2D828 8003D828 0800E003 */  jr         $ra
    /* 2D82C 8003D82C 00000000 */   nop
endlabel PlaySfxLoc__Fiii
