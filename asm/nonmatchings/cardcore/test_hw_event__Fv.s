.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching test_hw_event__Fv, 0x80

glabel test_hw_event__Fv
    /* 95710 800A5710 580A848F */  lw         $a0, %gp_rel(card_ev10)($gp)
    /* 95714 800A5714 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 95718 800A5718 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9571C 800A571C 5B46000C */  jal        TestEvent
    /* 95720 800A5720 1000B0AF */   sw        $s0, 0x10($sp)
    /* 95724 800A5724 01001024 */  addiu      $s0, $zero, 0x1
    /* 95728 800A5728 14005010 */  beq        $v0, $s0, .L800A577C
    /* 9572C 800A572C 21100000 */   addu      $v0, $zero, $zero
    /* 95730 800A5730 5C0A848F */  lw         $a0, %gp_rel(card_ev11)($gp)
    /* 95734 800A5734 5B46000C */  jal        TestEvent
    /* 95738 800A5738 00000000 */   nop
    /* 9573C 800A573C 0F005010 */  beq        $v0, $s0, .L800A577C
    /* 95740 800A5740 03000224 */   addiu     $v0, $zero, 0x3
    /* 95744 800A5744 600A848F */  lw         $a0, %gp_rel(card_ev12)($gp)
    /* 95748 800A5748 5B46000C */  jal        TestEvent
    /* 9574C 800A574C 00000000 */   nop
    /* 95750 800A5750 03005014 */  bne        $v0, $s0, .L800A5760
    /* 95754 800A5754 00000000 */   nop
    /* 95758 800A5758 DF950208 */  j          .L800A577C
    /* 9575C 800A575C 01000224 */   addiu     $v0, $zero, 0x1
  .L800A5760:
    /* 95760 800A5760 640A848F */  lw         $a0, %gp_rel(card_ev13)($gp)
    /* 95764 800A5764 5B46000C */  jal        TestEvent
    /* 95768 800A5768 00000000 */   nop
    /* 9576C 800A576C 21184000 */  addu       $v1, $v0, $zero
    /* 95770 800A5770 02007010 */  beq        $v1, $s0, .L800A577C
    /* 95774 800A5774 02000224 */   addiu     $v0, $zero, 0x2
    /* 95778 800A5778 04000224 */  addiu      $v0, $zero, 0x4
  .L800A577C:
    /* 9577C 800A577C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 95780 800A5780 1000B08F */  lw         $s0, 0x10($sp)
    /* 95784 800A5784 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 95788 800A5788 0800E003 */  jr         $ra
    /* 9578C 800A578C 00000000 */   nop
endlabel test_hw_event__Fv
