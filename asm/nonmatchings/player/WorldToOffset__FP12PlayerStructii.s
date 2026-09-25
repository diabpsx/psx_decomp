.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WorldToOffset__FP12PlayerStructii, 0x44

glabel WorldToOffset__FP12PlayerStructii
    /* 567A0 800667A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 567A4 800667A4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 567A8 800667A8 2180A000 */  addu       $s0, $a1, $zero
    /* 567AC 800667AC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 567B0 800667B0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 567B4 800667B4 787F010C */  jal        plrind__FP12PlayerStruct
    /* 567B8 800667B8 2188C000 */   addu      $s1, $a2, $zero
    /* 567BC 800667BC 21204000 */  addu       $a0, $v0, $zero
    /* 567C0 800667C0 21280002 */  addu       $a1, $s0, $zero
    /* 567C4 800667C4 10E1010C */  jal        WorldToOffset__Fiii
    /* 567C8 800667C8 21302002 */   addu      $a2, $s1, $zero
    /* 567CC 800667CC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 567D0 800667D0 1400B18F */  lw         $s1, 0x14($sp)
    /* 567D4 800667D4 1000B08F */  lw         $s0, 0x10($sp)
    /* 567D8 800667D8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 567DC 800667DC 0800E003 */  jr         $ra
    /* 567E0 800667E0 00000000 */   nop
endlabel WorldToOffset__FP12PlayerStructii
