.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TryDisarm__FP12PlayerStructi, 0x34

glabel TryDisarm__FP12PlayerStructi
    /* 56B04 80066B04 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56B08 80066B08 1000B0AF */  sw         $s0, 0x10($sp)
    /* 56B0C 80066B0C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 56B10 80066B10 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56B14 80066B14 2180A000 */   addu      $s0, $a1, $zero
    /* 56B18 80066B18 21204000 */  addu       $a0, $v0, $zero
    /* 56B1C 80066B1C 9668010C */  jal        TryDisarm__Fii
    /* 56B20 80066B20 21280002 */   addu      $a1, $s0, $zero
    /* 56B24 80066B24 1400BF8F */  lw         $ra, 0x14($sp)
    /* 56B28 80066B28 1000B08F */  lw         $s0, 0x10($sp)
    /* 56B2C 80066B2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56B30 80066B30 0800E003 */  jr         $ra
    /* 56B34 80066B34 00000000 */   nop
endlabel TryDisarm__FP12PlayerStructi
