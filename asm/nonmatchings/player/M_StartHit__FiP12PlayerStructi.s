.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartHit__FiP12PlayerStructi, 0x48

glabel M_StartHit__FiP12PlayerStructi
    /* 569CC 800669CC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 569D0 800669D0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 569D4 800669D4 21808000 */  addu       $s0, $a0, $zero
    /* 569D8 800669D8 2120A000 */  addu       $a0, $a1, $zero
    /* 569DC 800669DC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 569E0 800669E0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 569E4 800669E4 787F010C */  jal        plrind__FP12PlayerStruct
    /* 569E8 800669E8 2188C000 */   addu      $s1, $a2, $zero
    /* 569EC 800669EC 21200002 */  addu       $a0, $s0, $zero
    /* 569F0 800669F0 21284000 */  addu       $a1, $v0, $zero
    /* 569F4 800669F4 B62C050C */  jal        func_8014B2D8
    /* 569F8 800669F8 21302002 */   addu      $a2, $s1, $zero
    /* 569FC 800669FC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 56A00 80066A00 1400B18F */  lw         $s1, 0x14($sp)
    /* 56A04 80066A04 1000B08F */  lw         $s0, 0x10($sp)
    /* 56A08 80066A08 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 56A0C 80066A0C 0800E003 */  jr         $ra
    /* 56A10 80066A10 00000000 */   nop
endlabel M_StartHit__FiP12PlayerStructi
