.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ActivateMemcard__Fii, 0x3C

glabel ActivateMemcard__Fii
    /* 95790 800A5790 E009828F */  lw         $v0, %gp_rel(MemCardActive)($gp)
    /* 95794 800A5794 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 95798 800A5798 1000BFAF */  sw         $ra, 0x10($sp)
    /* 9579C 800A579C 800A84AF */  sw         $a0, %gp_rel(card_active)($gp)
    /* 957A0 800A57A0 840A85AF */  sw         $a1, %gp_rel(card_active + 0x4)($gp)
    /* 957A4 800A57A4 05004014 */  bnez       $v0, .L800A57BC
    /* 957A8 800A57A8 00000000 */   nop
    /* 957AC 800A57AC 3B95020C */  jal        MemcardON__Fv
    /* 957B0 800A57B0 00000000 */   nop
    /* 957B4 800A57B4 01000224 */  addiu      $v0, $zero, 0x1
    /* 957B8 800A57B8 E40982AF */  sw         $v0, %gp_rel(MemcardOverlay)($gp)
  .L800A57BC:
    /* 957BC 800A57BC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 957C0 800A57C0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 957C4 800A57C4 0800E003 */  jr         $ra
    /* 957C8 800A57C8 00000000 */   nop
endlabel ActivateMemcard__Fii
