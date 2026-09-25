.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSpdbarGoldCurs__FP12PlayerStructi, 0x34

glabel SetSpdbarGoldCurs__FP12PlayerStructi
    /* 567E4 800667E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 567E8 800667E8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 567EC 800667EC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 567F0 800667F0 787F010C */  jal        plrind__FP12PlayerStruct
    /* 567F4 800667F4 2180A000 */   addu      $s0, $a1, $zero
    /* 567F8 800667F8 21204000 */  addu       $a0, $v0, $zero
    /* 567FC 800667FC B2C1010C */  jal        SetSpdbarGoldCurs__Fii
    /* 56800 80066800 21280002 */   addu      $a1, $s0, $zero
    /* 56804 80066804 1400BF8F */  lw         $ra, 0x14($sp)
    /* 56808 80066808 1000B08F */  lw         $s0, 0x10($sp)
    /* 5680C 8006680C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56810 80066810 0800E003 */  jr         $ra
    /* 56814 80066814 00000000 */   nop
endlabel SetSpdbarGoldCurs__FP12PlayerStructi
