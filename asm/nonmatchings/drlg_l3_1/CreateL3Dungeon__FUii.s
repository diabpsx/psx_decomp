.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateL3Dungeon__FUii, 0x78

glabel CreateL3Dungeon__FUii
    /* 13858 8014D450 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1385C 8014D454 1000B0AF */  sw         $s0, 0x10($sp)
    /* 13860 8014D458 1400BFAF */  sw         $ra, 0x14($sp)
    /* 13864 8014D45C B3F6000C */  jal        SetRndSeed__Fl
    /* 13868 8014D460 2180A000 */   addu      $s0, $a1, $zero
    /* 1386C 8014D464 10000224 */  addiu      $v0, $zero, 0x10
    /* 13870 8014D468 1280013C */  lui        $at, %hi(dminx)
    /* 13874 8014D46C F8C022AC */  sw         $v0, %lo(dminx)($at)
    /* 13878 8014D470 1280013C */  lui        $at, %hi(dminy)
    /* 1387C 8014D474 FCC022AC */  sw         $v0, %lo(dminy)($at)
    /* 13880 8014D478 50000224 */  addiu      $v0, $zero, 0x50
    /* 13884 8014D47C 1280013C */  lui        $at, %hi(dmaxx)
    /* 13888 8014D480 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* 1388C 8014D484 1280013C */  lui        $at, %hi(dmaxy)
    /* 13890 8014D488 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* 13894 8014D48C 1C68050C */  jal        DRLG_InitTrans__Fv
    /* 13898 8014D490 00000000 */   nop
    /* 1389C 8014D494 A968050C */  jal        DRLG_InitSetPC__Fv
    /* 138A0 8014D498 00000000 */   nop
    /* 138A4 8014D49C C732050C */  jal        DRLG_L3__Fi
    /* 138A8 8014D4A0 21200002 */   addu      $a0, $s0, $zero
    /* 138AC 8014D4A4 8E34050C */  jal        DRLG_L3Pass3__Fv
    /* 138B0 8014D4A8 00000000 */   nop
    /* 138B4 8014D4AC AF68050C */  jal        DRLG_SetPC__Fv
    /* 138B8 8014D4B0 00000000 */   nop
    /* 138BC 8014D4B4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 138C0 8014D4B8 1000B08F */  lw         $s0, 0x10($sp)
    /* 138C4 8014D4BC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 138C8 8014D4C0 0800E003 */  jr         $ra
    /* 138CC 8014D4C4 00000000 */   nop
endlabel CreateL3Dungeon__FUii
