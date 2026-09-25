.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndPL__Fii, 0x34

glabel RndPL__Fii
    /* 3180C 8004180C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 31810 80041810 1000B0AF */  sw         $s0, 0x10($sp)
    /* 31814 80041814 21808000 */  addu       $s0, $a0, $zero
    /* 31818 80041818 2320B000 */  subu       $a0, $a1, $s0
    /* 3181C 8004181C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 31820 80041820 C9F6000C */  jal        ENG_random__Fl
    /* 31824 80041824 01008424 */   addiu     $a0, $a0, 0x1
    /* 31828 80041828 21105000 */  addu       $v0, $v0, $s0
    /* 3182C 8004182C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 31830 80041830 1000B08F */  lw         $s0, 0x10($sp)
    /* 31834 80041834 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 31838 80041838 0800E003 */  jr         $ra
    /* 3183C 8004183C 00000000 */   nop
endlabel RndPL__Fii
