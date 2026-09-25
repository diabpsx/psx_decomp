.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_RemapSnd__Fi, 0x74

glabel SND_RemapSnd__Fi
    /* 8A728 8009A728 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8A72C 8009A72C 8406828F */  lw         $v0, %gp_rel(D_8011AE04)($gp)
    /* 8A730 8009A730 21180000 */  addu       $v1, $zero, $zero
    /* 8A734 8009A734 14004018 */  blez       $v0, .L8009A788
    /* 8A738 8009A738 1800BFAF */   sw        $ra, 0x18($sp)
    /* 8A73C 8009A73C 1180023C */  lui        $v0, %hi(D_801109C8)
    /* 8A740 8009A740 C8094224 */  addiu      $v0, $v0, %lo(D_801109C8)
    /* 8A744 8009A744 02004624 */  addiu      $a2, $v0, 0x2
    /* 8A748 8009A748 21284000 */  addu       $a1, $v0, $zero
  .L8009A74C:
    /* 8A74C 8009A74C 0000A294 */  lhu        $v0, 0x0($a1)
    /* 8A750 8009A750 00000000 */  nop
    /* 8A754 8009A754 06004414 */  bne        $v0, $a0, .L8009A770
    /* 8A758 8009A758 01006324 */   addiu     $v1, $v1, 0x1
    /* 8A75C 8009A75C 0000C494 */  lhu        $a0, 0x0($a2)
    /* 8A760 8009A760 7769020C */  jal        SND_FindSFX__FUs
    /* 8A764 8009A764 00000000 */   nop
    /* 8A768 8009A768 E3690208 */  j          .L8009A78C
    /* 8A76C 8009A76C 00000000 */   nop
  .L8009A770:
    /* 8A770 8009A770 0400C624 */  addiu      $a2, $a2, 0x4
    /* 8A774 8009A774 8406828F */  lw         $v0, %gp_rel(D_8011AE04)($gp)
    /* 8A778 8009A778 00000000 */  nop
    /* 8A77C 8009A77C 2A106200 */  slt        $v0, $v1, $v0
    /* 8A780 8009A780 F2FF4014 */  bnez       $v0, .L8009A74C
    /* 8A784 8009A784 0400A524 */   addiu     $a1, $a1, 0x4
  .L8009A788:
    /* 8A788 8009A788 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8009A78C:
    /* 8A78C 8009A78C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8A790 8009A790 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8A794 8009A794 0800E003 */  jr         $ra
    /* 8A798 8009A798 00000000 */   nop
endlabel SND_RemapSnd__Fi
