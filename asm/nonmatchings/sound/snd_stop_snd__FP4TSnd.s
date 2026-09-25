.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching snd_stop_snd__FP4TSnd, 0x3C

glabel snd_stop_snd__FP4TSnd
    /* 67D1C 80077D1C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 67D20 80077D20 1000B0AF */  sw         $s0, 0x10($sp)
    /* 67D24 80077D24 21800000 */  addu       $s0, $zero, $zero
    /* 67D28 80077D28 1400BFAF */  sw         $ra, 0x14($sp)
  .L80077D2C:
    /* 67D2C 80077D2C AE69020C */  jal        SND_StopSnd__Fi
    /* 67D30 80077D30 21200002 */   addu      $a0, $s0, $zero
    /* 67D34 80077D34 01001026 */  addiu      $s0, $s0, 0x1
    /* 67D38 80077D38 1800022A */  slti       $v0, $s0, 0x18
    /* 67D3C 80077D3C FBFF4014 */  bnez       $v0, .L80077D2C
    /* 67D40 80077D40 00000000 */   nop
    /* 67D44 80077D44 1400BF8F */  lw         $ra, 0x14($sp)
    /* 67D48 80077D48 1000B08F */  lw         $s0, 0x10($sp)
    /* 67D4C 80077D4C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 67D50 80077D50 0800E003 */  jr         $ra
    /* 67D54 80077D54 00000000 */   nop
endlabel snd_stop_snd__FP4TSnd
