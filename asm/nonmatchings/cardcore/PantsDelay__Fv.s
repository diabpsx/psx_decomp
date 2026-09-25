.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PantsDelay__Fv, 0x3C

glabel PantsDelay__Fv
    /* 967B4 800A67B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 967B8 800A67B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 967BC 800A67BC 21800000 */  addu       $s0, $zero, $zero
    /* 967C0 800A67C0 1400BFAF */  sw         $ra, 0x14($sp)
  .L800A67C4:
    /* 967C4 800A67C4 1748000C */  jal        VSync
    /* 967C8 800A67C8 21200000 */   addu      $a0, $zero, $zero
    /* 967CC 800A67CC 01001026 */  addiu      $s0, $s0, 0x1
    /* 967D0 800A67D0 B400022A */  slti       $v0, $s0, 0xB4
    /* 967D4 800A67D4 FBFF4014 */  bnez       $v0, .L800A67C4
    /* 967D8 800A67D8 00000000 */   nop
    /* 967DC 800A67DC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 967E0 800A67E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 967E4 800A67E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 967E8 800A67E8 0800E003 */  jr         $ra
    /* 967EC 800A67EC 00000000 */   nop
endlabel PantsDelay__Fv
