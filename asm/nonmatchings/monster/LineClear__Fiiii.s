.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LineClear__Fiiii, 0x40

glabel LineClear__Fiiii
    /* 1B880 80155478 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B884 8015547C 21108000 */  addu       $v0, $a0, $zero
    /* 1B888 80155480 2118A000 */  addu       $v1, $a1, $zero
    /* 1B88C 80155484 2140C000 */  addu       $t0, $a2, $zero
    /* 1B890 80155488 1580043C */  lui        $a0, %hi(PosOkMissile__Fii)
    /* 1B894 8015548C 58518424 */  addiu      $a0, $a0, %lo(PosOkMissile__Fii)
    /* 1B898 80155490 21284000 */  addu       $a1, $v0, $zero
    /* 1B89C 80155494 21306000 */  addu       $a2, $v1, $zero
    /* 1B8A0 80155498 1000A7AF */  sw         $a3, 0x10($sp)
    /* 1B8A4 8015549C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1B8A8 801554A0 7C54050C */  jal        LineClearF__FPFii_Uciiii
    /* 1B8AC 801554A4 21380001 */   addu      $a3, $t0, $zero
    /* 1B8B0 801554A8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1B8B4 801554AC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1B8B8 801554B0 0800E003 */  jr         $ra
    /* 1B8BC 801554B4 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel LineClear__Fiiii
