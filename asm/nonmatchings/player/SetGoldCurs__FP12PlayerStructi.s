.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetGoldCurs__FP12PlayerStructi, 0x34

glabel SetGoldCurs__FP12PlayerStructi
    /* 56920 80066920 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56924 80066924 1000B0AF */  sw         $s0, 0x10($sp)
    /* 56928 80066928 1400BFAF */  sw         $ra, 0x14($sp)
    /* 5692C 8006692C 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56930 80066930 2180A000 */   addu      $s0, $a1, $zero
    /* 56934 80066934 21204000 */  addu       $a0, $v0, $zero
    /* 56938 80066938 92C1010C */  jal        SetGoldCurs__Fii
    /* 5693C 8006693C 21280002 */   addu      $a1, $s0, $zero
    /* 56940 80066940 1400BF8F */  lw         $ra, 0x14($sp)
    /* 56944 80066944 1000B08F */  lw         $s0, 0x10($sp)
    /* 56948 80066948 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5694C 8006694C 0800E003 */  jr         $ra
    /* 56950 80066950 00000000 */   nop
endlabel SetGoldCurs__FP12PlayerStructi
