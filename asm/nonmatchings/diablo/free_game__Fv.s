.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching free_game__Fv, 0x74

glabel free_game__Fv
    /* 280D4 800380D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 280D8 800380D8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 280DC 800380DC 52CA000C */  jal        FreeControlPan__Fv
    /* 280E0 800380E0 1000B0AF */   sw        $s0, 0x10($sp)
    /* 280E4 800380E4 9D5C050C */  jal        func_80157274
    /* 280E8 800380E8 21800000 */   addu      $s0, $zero, $zero
    /* 280EC 800380EC 5736010C */  jal        FreeQuestText__Fv
    /* 280F0 800380F0 00000000 */   nop
    /* 280F4 800380F4 69A5010C */  jal        FreeStoreMem__Fv
    /* 280F8 800380F8 00000000 */   nop
  .L800380FC:
    /* 280FC 800380FC 369C010C */  jal        FreePlayerGFX__Fi
    /* 28100 80038100 21200002 */   addu      $a0, $s0, $zero
    /* 28104 80038104 01001026 */  addiu      $s0, $s0, 0x1
    /* 28108 80038108 0200022A */  slti       $v0, $s0, 0x2
    /* 2810C 8003810C FBFF4014 */  bnez       $v0, .L800380FC
    /* 28110 80038110 00000000 */   nop
    /* 28114 80038114 DC16010C */  jal        FreeItemGFX__Fv
    /* 28118 80038118 00000000 */   nop
    /* 2811C 8003811C CFDD000C */  jal        FreeCursor__Fv
    /* 28120 80038120 00000000 */   nop
    /* 28124 80038124 9A34010C */  jal        FreeLightTable__Fv
    /* 28128 80038128 00000000 */   nop
    /* 2812C 8003812C EBDF000C */  jal        FreeGameMem__Fv
    /* 28130 80038130 00000000 */   nop
    /* 28134 80038134 1400BF8F */  lw         $ra, 0x14($sp)
    /* 28138 80038138 1000B08F */  lw         $s0, 0x10($sp)
    /* 2813C 8003813C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 28140 80038140 0800E003 */  jr         $ra
    /* 28144 80038144 00000000 */   nop
endlabel free_game__Fv
