.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TalkToTowner__FP12PlayerStructi, 0x34

glabel TalkToTowner__FP12PlayerStructi
    /* 56B38 80066B38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56B3C 80066B3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 56B40 80066B40 1400BFAF */  sw         $ra, 0x14($sp)
    /* 56B44 80066B44 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56B48 80066B48 2180A000 */   addu      $s0, $a1, $zero
    /* 56B4C 80066B4C 21204000 */  addu       $a0, $v0, $zero
    /* 56B50 80066B50 66EE000C */  jal        TalkToTowner__Fii
    /* 56B54 80066B54 21280002 */   addu      $a1, $s0, $zero
    /* 56B58 80066B58 1400BF8F */  lw         $ra, 0x14($sp)
    /* 56B5C 80066B5C 1000B08F */  lw         $s0, 0x10($sp)
    /* 56B60 80066B60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56B64 80066B64 0800E003 */  jr         $ra
    /* 56B68 80066B68 00000000 */   nop
endlabel TalkToTowner__FP12PlayerStructi
