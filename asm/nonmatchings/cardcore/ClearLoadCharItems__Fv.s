.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearLoadCharItems__Fv, 0x88

glabel ClearLoadCharItems__Fv
    /* 9672C 800A672C 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 96730 800A6730 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 96734 800A6734 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 96738 800A6738 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9673C 800A673C 05004014 */  bnez       $v0, .L800A6754
    /* 96740 800A6740 1000B0AF */   sw        $s0, 0x10($sp)
    /* 96744 800A6744 4615020C */  jal        KeefDaFeef__Fi
    /* 96748 800A6748 21200000 */   addu      $a0, $zero, $zero
    /* 9674C 800A674C E8990208 */  j          .L800A67A0
    /* 96750 800A6750 00000000 */   nop
  .L800A6754:
    /* 96754 800A6754 21800000 */  addu       $s0, $zero, $zero
  .L800A6758:
    /* 96758 800A6758 4615020C */  jal        KeefDaFeef__Fi
    /* 9675C 800A675C 21200002 */   addu      $a0, $s0, $zero
    /* 96760 800A6760 1280023C */  lui        $v0, %hi(LoadedChar)
    /* 96764 800A6764 28B3428C */  lw         $v0, %lo(LoadedChar)($v0)
    /* 96768 800A6768 00000000 */  nop
    /* 9676C 800A676C 08004010 */  beqz       $v0, .L800A6790
    /* 96770 800A6770 00000000 */   nop
    /* 96774 800A6774 1280023C */  lui        $v0, %hi(LoadedChar + 0x4)
    /* 96778 800A6778 2CB3428C */  lw         $v0, %lo(LoadedChar + 0x4)($v0)
    /* 9677C 800A677C 00000000 */  nop
    /* 96780 800A6780 03004010 */  beqz       $v0, .L800A6790
    /* 96784 800A6784 00000000 */   nop
    /* 96788 800A6788 7014020C */  jal        WinterSales__Fi
    /* 9678C 800A678C 21200002 */   addu      $a0, $s0, $zero
  .L800A6790:
    /* 96790 800A6790 01001026 */  addiu      $s0, $s0, 0x1
    /* 96794 800A6794 0200022A */  slti       $v0, $s0, 0x2
    /* 96798 800A6798 EFFF4014 */  bnez       $v0, .L800A6758
    /* 9679C 800A679C 00000000 */   nop
  .L800A67A0:
    /* 967A0 800A67A0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 967A4 800A67A4 1000B08F */  lw         $s0, 0x10($sp)
    /* 967A8 800A67A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 967AC 800A67AC 0800E003 */  jr         $ra
    /* 967B0 800A67B0 00000000 */   nop
endlabel ClearLoadCharItems__Fv
