.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearPbOnDrawSync, 0x3C

glabel ClearPbOnDrawSync
    /* 73D98 80083D98 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 73D9C 80083D9C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 73DA0 80083DA0 21808000 */  addu       $s0, $a0, $zero
    /* 73DA4 80083DA4 1400BFAF */  sw         $ra, 0x14($sp)
  .L80083DA8:
    /* 73DA8 80083DA8 750F020C */  jal        ClearedYet__Fv
    /* 73DAC 80083DAC 00000000 */   nop
    /* 73DB0 80083DB0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 73DB4 80083DB4 FCFF4010 */  beqz       $v0, .L80083DA8
    /* 73DB8 80083DB8 00000000 */   nop
    /* 73DBC 80083DBC 981E90AF */  sw         $s0, %gp_rel(D_8011C618)($gp)
    /* 73DC0 80083DC0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 73DC4 80083DC4 1000B08F */  lw         $s0, 0x10($sp)
    /* 73DC8 80083DC8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 73DCC 80083DCC 0800E003 */  jr         $ra
    /* 73DD0 80083DD0 00000000 */   nop
endlabel ClearPbOnDrawSync
