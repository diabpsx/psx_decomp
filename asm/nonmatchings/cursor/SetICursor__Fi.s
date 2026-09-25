.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetICursor__Fi, 0x5C

glabel SetICursor__Fi
    /* 27744 80037744 1180013C */  lui        $at, %hi(InvItemWidth)
    /* 27748 80037748 21082400 */  addu       $at, $at, $a0
    /* 2774C 8003774C 18D52290 */  lbu        $v0, %lo(InvItemWidth)($at)
    /* 27750 80037750 00000000 */  nop
    /* 27754 80037754 C00F82AF */  sw         $v0, %gp_rel(icursW)($gp)
    /* 27758 80037758 1180013C */  lui        $at, %hi(InvItemHeight)
    /* 2775C 8003775C 21082400 */  addu       $at, $at, $a0
    /* 27760 80037760 CCD52390 */  lbu        $v1, %lo(InvItemHeight)($at)
    /* 27764 80037764 00000000 */  nop
    /* 27768 80037768 C40F83AF */  sw         $v1, %gp_rel(icursH)($gp)
    /* 2776C 8003776C 02004104 */  bgez       $v0, .L80037778
    /* 27770 80037770 00000000 */   nop
    /* 27774 80037774 0F004224 */  addiu      $v0, $v0, 0xF
  .L80037778:
    /* 27778 80037778 03110200 */  sra        $v0, $v0, 4
    /* 2777C 8003777C C80F82AF */  sw         $v0, %gp_rel(icursW28)($gp)
    /* 27780 80037780 21106000 */  addu       $v0, $v1, $zero
    /* 27784 80037784 02004104 */  bgez       $v0, .L80037790
    /* 27788 80037788 00000000 */   nop
    /* 2778C 8003778C 0F004224 */  addiu      $v0, $v0, 0xF
  .L80037790:
    /* 27790 80037790 03110200 */  sra        $v0, $v0, 4
    /* 27794 80037794 CC0F82AF */  sw         $v0, %gp_rel(icursH28)($gp)
    /* 27798 80037798 0800E003 */  jr         $ra
    /* 2779C 8003779C 00000000 */   nop
endlabel SetICursor__Fi
