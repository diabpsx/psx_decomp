.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitTargetCursor__Fi, 0x34

glabel InitTargetCursor__Fi
    /* 91758 800A1758 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9175C 800A175C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 91760 800A1760 1400BFAF */  sw         $ra, 0x14($sp)
    /* 91764 800A1764 4BEB010C */  jal        GetGamePad__Fi
    /* 91768 800A1768 21808000 */   addu      $s0, $a0, $zero
    /* 9176C 800A176C 04004424 */  addiu      $a0, $v0, 0x4
    /* 91770 800A1770 ADBC020C */  jal        Init__11SpellTargeti
    /* 91774 800A1774 21280002 */   addu      $a1, $s0, $zero
    /* 91778 800A1778 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9177C 800A177C 1000B08F */  lw         $s0, 0x10($sp)
    /* 91780 800A1780 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 91784 800A1784 0800E003 */  jr         $ra
    /* 91788 800A1788 00000000 */   nop
endlabel InitTargetCursor__Fi
