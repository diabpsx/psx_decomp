.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveInvItem__FP12PlayerStructi, 0x34

glabel RemoveInvItem__FP12PlayerStructi
    /* 56A64 80066A64 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56A68 80066A68 1000B0AF */  sw         $s0, 0x10($sp)
    /* 56A6C 80066A6C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 56A70 80066A70 787F010C */  jal        plrind__FP12PlayerStruct
    /* 56A74 80066A74 2180A000 */   addu      $s0, $a1, $zero
    /* 56A78 80066A78 21204000 */  addu       $a0, $v0, $zero
    /* 56A7C 80066A7C BF75050C */  jal        func_8015D6FC
    /* 56A80 80066A80 21280002 */   addu      $a1, $s0, $zero
    /* 56A84 80066A84 1400BF8F */  lw         $ra, 0x14($sp)
    /* 56A88 80066A88 1000B08F */  lw         $s0, 0x10($sp)
    /* 56A8C 80066A8C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56A90 80066A90 0800E003 */  jr         $ra
    /* 56A94 80066A94 00000000 */   nop
endlabel RemoveInvItem__FP12PlayerStructi
