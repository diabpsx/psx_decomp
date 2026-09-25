.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Inv__Fi, 0x130

glabel pad_func_Inv__Fi
    /* 92114 800A2114 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 92118 800A2118 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9211C 800A211C 1280103C */  lui        $s0, %hi(chrflag)
    /* 92120 800A2120 C0B61092 */  lbu        $s0, %lo(chrflag)($s0)
    /* 92124 800A2124 1280023C */  lui        $v0, %hi(stextflag)
    /* 92128 800A2128 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 9212C 800A212C 1280033C */  lui        $v1, %hi(_spselflag)
    /* 92130 800A2130 50B6638C */  lw         $v1, %lo(_spselflag)($v1)
    /* 92134 800A2134 1400B1AF */  sw         $s1, 0x14($sp)
    /* 92138 800A2138 25800202 */  or         $s0, $s0, $v0
    /* 9213C 800A213C 1280023C */  lui        $v0, %hi(qtextflag)
    /* 92140 800A2140 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 92144 800A2144 21888000 */  addu       $s1, $a0, $zero
    /* 92148 800A2148 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9214C 800A214C 25800202 */  or         $s0, $s0, $v0
    /* 92150 800A2150 25800302 */  or         $s0, $s0, $v1
    /* 92154 800A2154 1280023C */  lui        $v0, %hi(_spselflag + 0x4)
    /* 92158 800A2158 54B6428C */  lw         $v0, %lo(_spselflag + 0x4)($v0)
    /* 9215C 800A215C 1280033C */  lui        $v1, %hi(sbookflag)
    /* 92160 800A2160 C6B66390 */  lbu        $v1, %lo(sbookflag)($v1)
    /* 92164 800A2164 25800202 */  or         $s0, $s0, $v0
    /* 92168 800A2168 25800302 */  or         $s0, $s0, $v1
    /* 9216C 800A216C 1280023C */  lui        $v0, %hi(questlog)
    /* 92170 800A2170 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 92174 800A2174 1280033C */  lui        $v1, %hi(optionsflag)
    /* 92178 800A2178 48B2638C */  lw         $v1, %lo(optionsflag)($v1)
    /* 9217C 800A217C 25800202 */  or         $s0, $s0, $v0
    /* 92180 800A2180 DB8C020C */  jal        SelectorActive__Fv
    /* 92184 800A2184 25800302 */   or        $s0, $s0, $v1
    /* 92188 800A2188 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 9218C 800A218C 21083100 */  addu       $at, $at, $s1
    /* 92190 800A2190 C4BB2390 */  lbu        $v1, %lo(_SpdBeltSelFlag)($at)
    /* 92194 800A2194 25800202 */  or         $s0, $s0, $v0
    /* 92198 800A2198 25800302 */  or         $s0, $s0, $v1
    /* 9219C 800A219C 23000016 */  bnez       $s0, .L800A222C
    /* 921A0 800A21A0 00000000 */   nop
    /* 921A4 800A21A4 1280023C */  lui        $v0, %hi(invflag)
    /* 921A8 800A21A8 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 921AC 800A21AC 00000000 */  nop
    /* 921B0 800A21B0 0D004010 */  beqz       $v0, .L800A21E8
    /* 921B4 800A21B4 01000224 */   addiu     $v0, $zero, 0x1
    /* 921B8 800A21B8 C6F5000C */  jal        PlaySFX__Fi
    /* 921BC 800A21BC 33000424 */   addiu     $a0, $zero, 0x33
    /* 921C0 800A21C0 05000424 */  addiu      $a0, $zero, 0x5
    /* 921C4 800A21C4 21280000 */  addu       $a1, $zero, $zero
    /* 921C8 800A21C8 21300000 */  addu       $a2, $zero, $zero
    /* 921CC 800A21CC 53EB010C */  jal        PostGamePad__Fiiii
    /* 921D0 800A21D0 21380000 */   addu      $a3, $zero, $zero
    /* 921D4 800A21D4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 921D8 800A21D8 1280013C */  lui        $at, %hi(options_pad)
    /* 921DC 800A21DC 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 921E0 800A21E0 8B880208 */  j          .L800A222C
    /* 921E4 800A21E4 00000000 */   nop
  .L800A21E8:
    /* 921E8 800A21E8 1280013C */  lui        $at, %hi(invflag)
    /* 921EC 800A21EC 2CC322A0 */  sb         $v0, %lo(invflag)($at)
    /* 921F0 800A21F0 C6F5000C */  jal        PlaySFX__Fi
    /* 921F4 800A21F4 33000424 */   addiu     $a0, $zero, 0x33
    /* 921F8 800A21F8 E385020C */  jal        RemoveTargetCursor__Fi
    /* 921FC 800A21FC 21202002 */   addu      $a0, $s1, $zero
    /* 92200 800A2200 02000424 */  addiu      $a0, $zero, 0x2
    /* 92204 800A2204 21280000 */  addu       $a1, $zero, $zero
    /* 92208 800A2208 21300000 */  addu       $a2, $zero, $zero
    /* 9220C 800A220C 1280013C */  lui        $at, %hi(options_pad)
    /* 92210 800A2210 50B231AC */  sw         $s1, %lo(options_pad)($at)
    /* 92214 800A2214 53EB010C */  jal        PostGamePad__Fiiii
    /* 92218 800A2218 21380000 */   addu      $a3, $zero, $zero
    /* 9221C 800A221C EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 92220 800A2220 21200000 */   addu      $a0, $zero, $zero
    /* 92224 800A2224 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 92228 800A2228 00000000 */   nop
  .L800A222C:
    /* 9222C 800A222C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 92230 800A2230 1400B18F */  lw         $s1, 0x14($sp)
    /* 92234 800A2234 1000B08F */  lw         $s0, 0x10($sp)
    /* 92238 800A2238 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9223C 800A223C 0800E003 */  jr         $ra
    /* 92240 800A2240 00000000 */   nop
endlabel pad_func_Inv__Fi
