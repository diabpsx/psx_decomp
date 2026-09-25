.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BreakObject__FP12PlayerStructi, 0x34

glabel BreakObject__FP12PlayerStructi
    /* 5684C 8006684C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56850 80066850 1000B0AF */  sw         $s0, 0x10($sp)
    /* 56854 80066854 1400BFAF */  sw         $ra, 0x14($sp)
    /* 56858 80066858 787F010C */  jal        plrind__FP12PlayerStruct
    /* 5685C 8006685C 2180A000 */   addu      $s0, $a1, $zero
    /* 56860 80066860 21204000 */  addu       $a0, $v0, $zero
    /* 56864 80066864 D07A010C */  jal        BreakObject__Fii
    /* 56868 80066868 21280002 */   addu      $a1, $s0, $zero
    /* 5686C 8006686C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 56870 80066870 1000B08F */  lw         $s0, 0x10($sp)
    /* 56874 80066874 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56878 80066878 0800E003 */  jr         $ra
    /* 5687C 8006687C 00000000 */   nop
endlabel BreakObject__FP12PlayerStructi
