.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_SplBook__Fi, 0x14C

glabel pad_func_SplBook__Fi
    /* 92244 800A2244 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 92248 800A2248 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9224C 800A224C 1280103C */  lui        $s0, %hi(chrflag)
    /* 92250 800A2250 C0B61092 */  lbu        $s0, %lo(chrflag)($s0)
    /* 92254 800A2254 1280023C */  lui        $v0, %hi(invflag)
    /* 92258 800A2258 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 9225C 800A225C 1280033C */  lui        $v1, %hi(qtextflag)
    /* 92260 800A2260 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 92264 800A2264 1400B1AF */  sw         $s1, 0x14($sp)
    /* 92268 800A2268 25800202 */  or         $s0, $s0, $v0
    /* 9226C 800A226C 1280023C */  lui        $v0, %hi(stextflag)
    /* 92270 800A2270 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 92274 800A2274 21888000 */  addu       $s1, $a0, $zero
    /* 92278 800A2278 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9227C 800A227C 25800202 */  or         $s0, $s0, $v0
    /* 92280 800A2280 25800302 */  or         $s0, $s0, $v1
    /* 92284 800A2284 1280023C */  lui        $v0, %hi(_spselflag)
    /* 92288 800A2288 50B6428C */  lw         $v0, %lo(_spselflag)($v0)
    /* 9228C 800A228C 1280033C */  lui        $v1, %hi(_spselflag + 0x4)
    /* 92290 800A2290 54B6638C */  lw         $v1, %lo(_spselflag + 0x4)($v1)
    /* 92294 800A2294 25800202 */  or         $s0, $s0, $v0
    /* 92298 800A2298 25800302 */  or         $s0, $s0, $v1
    /* 9229C 800A229C 1280023C */  lui        $v0, %hi(questlog)
    /* 922A0 800A22A0 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 922A4 800A22A4 1280033C */  lui        $v1, %hi(optionsflag)
    /* 922A8 800A22A8 48B2638C */  lw         $v1, %lo(optionsflag)($v1)
    /* 922AC 800A22AC 25800202 */  or         $s0, $s0, $v0
    /* 922B0 800A22B0 DB8C020C */  jal        SelectorActive__Fv
    /* 922B4 800A22B4 25800302 */   or        $s0, $s0, $v1
    /* 922B8 800A22B8 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 922BC 800A22BC 21083100 */  addu       $at, $at, $s1
    /* 922C0 800A22C0 C4BB2390 */  lbu        $v1, %lo(_SpdBeltSelFlag)($at)
    /* 922C4 800A22C4 25800202 */  or         $s0, $s0, $v0
    /* 922C8 800A22C8 25800302 */  or         $s0, $s0, $v1
    /* 922CC 800A22CC 2A000016 */  bnez       $s0, .L800A2378
    /* 922D0 800A22D0 00000000 */   nop
    /* 922D4 800A22D4 1280023C */  lui        $v0, %hi(sbookflag)
    /* 922D8 800A22D8 C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 922DC 800A22DC 00000000 */  nop
    /* 922E0 800A22E0 01004238 */  xori       $v0, $v0, 0x1
    /* 922E4 800A22E4 1280013C */  lui        $at, %hi(sbookflag)
    /* 922E8 800A22E8 C6B622A0 */  sb         $v0, %lo(sbookflag)($at)
    /* 922EC 800A22EC 17004010 */  beqz       $v0, .L800A234C
    /* 922F0 800A22F0 05000424 */   addiu     $a0, $zero, 0x5
    /* 922F4 800A22F4 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 922F8 800A22F8 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 922FC 800A22FC 00000000 */  nop
    /* 92300 800A2300 03004014 */  bnez       $v0, .L800A2310
    /* 92304 800A2304 00000000 */   nop
    /* 92308 800A2308 C6F5000C */  jal        PlaySFX__Fi
    /* 9230C 800A230C 33000424 */   addiu     $a0, $zero, 0x33
  .L800A2310:
    /* 92310 800A2310 1280013C */  lui        $at, %hi(options_pad)
    /* 92314 800A2314 50B231AC */  sw         $s1, %lo(options_pad)($at)
    /* 92318 800A2318 02000424 */  addiu      $a0, $zero, 0x2
    /* 9231C 800A231C 21280000 */  addu       $a1, $zero, $zero
    /* 92320 800A2320 21300000 */  addu       $a2, $zero, $zero
    /* 92324 800A2324 53EB010C */  jal        PostGamePad__Fiiii
    /* 92328 800A2328 21380000 */   addu      $a3, $zero, $zero
    /* 9232C 800A232C 21200000 */  addu       $a0, $zero, $zero
    /* 92330 800A2330 0380053C */  lui        $a1, %hi(DrawSpellBookTSK__FP4TASK)
    /* 92334 800A2334 440DA524 */  addiu      $a1, $a1, %lo(DrawSpellBookTSK__FP4TASK)
    /* 92338 800A2338 00080624 */  addiu      $a2, $zero, 0x800
    /* 9233C 800A233C 0480000C */  jal        TSK_AddTask
    /* 92340 800A2340 21380000 */   addu      $a3, $zero, $zero
    /* 92344 800A2344 DE880208 */  j          .L800A2378
    /* 92348 800A2348 00000000 */   nop
  .L800A234C:
    /* 9234C 800A234C 21280000 */  addu       $a1, $zero, $zero
    /* 92350 800A2350 21300000 */  addu       $a2, $zero, $zero
    /* 92354 800A2354 53EB010C */  jal        PostGamePad__Fiiii
    /* 92358 800A2358 21380000 */   addu      $a3, $zero, $zero
    /* 9235C 800A235C 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 92360 800A2360 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 92364 800A2364 00000000 */  nop
    /* 92368 800A2368 03004014 */  bnez       $v0, .L800A2378
    /* 9236C 800A236C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 92370 800A2370 1280013C */  lui        $at, %hi(options_pad)
    /* 92374 800A2374 50B222AC */  sw         $v0, %lo(options_pad)($at)
  .L800A2378:
    /* 92378 800A2378 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9237C 800A237C 1400B18F */  lw         $s1, 0x14($sp)
    /* 92380 800A2380 1000B08F */  lw         $s0, 0x10($sp)
    /* 92384 800A2384 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 92388 800A2388 0800E003 */  jr         $ra
    /* 9238C 800A238C 00000000 */   nop
endlabel pad_func_SplBook__Fi
