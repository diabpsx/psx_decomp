.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateL5Dungeon__FUii, 0x90

glabel CreateL5Dungeon__FUii
    /* 726C 80140E64 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7270 80140E68 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7274 80140E6C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 7278 80140E70 B3F6000C */  jal        SetRndSeed__Fl
    /* 727C 80140E74 2180A000 */   addu      $s0, $a1, $zero
    /* 7280 80140E78 10000224 */  addiu      $v0, $zero, 0x10
    /* 7284 80140E7C 1280013C */  lui        $at, %hi(dminx)
    /* 7288 80140E80 F8C022AC */  sw         $v0, %lo(dminx)($at)
    /* 728C 80140E84 1280013C */  lui        $at, %hi(dminy)
    /* 7290 80140E88 FCC022AC */  sw         $v0, %lo(dminy)($at)
    /* 7294 80140E8C 50000224 */  addiu      $v0, $zero, 0x50
    /* 7298 80140E90 1280013C */  lui        $at, %hi(dmaxx)
    /* 729C 80140E94 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* 72A0 80140E98 1280013C */  lui        $at, %hi(dmaxy)
    /* 72A4 80140E9C 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* 72A8 80140EA0 1C68050C */  jal        DRLG_InitTrans__Fv
    /* 72AC 80140EA4 00000000 */   nop
    /* 72B0 80140EA8 A968050C */  jal        DRLG_InitSetPC__Fv
    /* 72B4 80140EAC 00000000 */   nop
    /* 72B8 80140EB0 68F3040C */  jal        DRLG_LoadL1SP__Fv
    /* 72BC 80140EB4 00000000 */   nop
    /* 72C0 80140EB8 4C02050C */  jal        DRLG_L5__Fi
    /* 72C4 80140EBC 21200002 */   addu      $a0, $s0, $zero
    /* 72C8 80140EC0 EAF2040C */  jal        DRLG_L1Pass3__Fv
    /* 72CC 80140EC4 00000000 */   nop
    /* 72D0 80140EC8 9FF3040C */  jal        DRLG_FreeL1SP__Fv
    /* 72D4 80140ECC 00000000 */   nop
    /* 72D8 80140ED0 D7F3040C */  jal        DRLG_InitL1Vals__Fv
    /* 72DC 80140ED4 00000000 */   nop
    /* 72E0 80140ED8 AF68050C */  jal        DRLG_SetPC__Fv
    /* 72E4 80140EDC 00000000 */   nop
    /* 72E8 80140EE0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 72EC 80140EE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 72F0 80140EE8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 72F4 80140EEC 0800E003 */  jr         $ra
    /* 72F8 80140EF0 00000000 */   nop
endlabel CreateL5Dungeon__FUii
