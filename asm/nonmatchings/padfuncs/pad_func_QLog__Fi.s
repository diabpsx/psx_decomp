.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_QLog__Fi, 0xF4

glabel pad_func_QLog__Fi
    /* 92390 800A2390 1280023C */  lui        $v0, %hi(chrflag)
    /* 92394 800A2394 C0B64290 */  lbu        $v0, %lo(chrflag)($v0)
    /* 92398 800A2398 1280033C */  lui        $v1, %hi(questlog)
    /* 9239C 800A239C 29BA6390 */  lbu        $v1, %lo(questlog)($v1)
    /* 923A0 800A23A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 923A4 800A23A4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 923A8 800A23A8 1280103C */  lui        $s0, %hi(invflag)
    /* 923AC 800A23AC 2CC31092 */  lbu        $s0, %lo(invflag)($s0)
    /* 923B0 800A23B0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 923B4 800A23B4 21888000 */  addu       $s1, $a0, $zero
    /* 923B8 800A23B8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 923BC 800A23BC 25104300 */  or         $v0, $v0, $v1
    /* 923C0 800A23C0 25800202 */  or         $s0, $s0, $v0
    /* 923C4 800A23C4 1280023C */  lui        $v0, %hi(stextflag)
    /* 923C8 800A23C8 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 923CC 800A23CC 1280033C */  lui        $v1, %hi(qtextflag)
    /* 923D0 800A23D0 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 923D4 800A23D4 25800202 */  or         $s0, $s0, $v0
    /* 923D8 800A23D8 25800302 */  or         $s0, $s0, $v1
    /* 923DC 800A23DC 1280023C */  lui        $v0, %hi(_spselflag)
    /* 923E0 800A23E0 50B6428C */  lw         $v0, %lo(_spselflag)($v0)
    /* 923E4 800A23E4 1280033C */  lui        $v1, %hi(_spselflag + 0x4)
    /* 923E8 800A23E8 54B6638C */  lw         $v1, %lo(_spselflag + 0x4)($v1)
    /* 923EC 800A23EC 25800202 */  or         $s0, $s0, $v0
    /* 923F0 800A23F0 25800302 */  or         $s0, $s0, $v1
    /* 923F4 800A23F4 1280023C */  lui        $v0, %hi(sbookflag)
    /* 923F8 800A23F8 C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 923FC 800A23FC 1280033C */  lui        $v1, %hi(optionsflag)
    /* 92400 800A2400 48B2638C */  lw         $v1, %lo(optionsflag)($v1)
    /* 92404 800A2404 25800202 */  or         $s0, $s0, $v0
    /* 92408 800A2408 DB8C020C */  jal        SelectorActive__Fv
    /* 9240C 800A240C 25800302 */   or        $s0, $s0, $v1
    /* 92410 800A2410 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 92414 800A2414 21083100 */  addu       $at, $at, $s1
    /* 92418 800A2418 C4BB2390 */  lbu        $v1, %lo(_SpdBeltSelFlag)($at)
    /* 9241C 800A241C 25800202 */  or         $s0, $s0, $v0
    /* 92420 800A2420 25800302 */  or         $s0, $s0, $v1
    /* 92424 800A2424 11000016 */  bnez       $s0, .L800A246C
    /* 92428 800A2428 00000000 */   nop
    /* 9242C 800A242C 1280013C */  lui        $at, %hi(options_pad)
    /* 92430 800A2430 50B231AC */  sw         $s1, %lo(options_pad)($at)
    /* 92434 800A2434 50A3010C */  jal        StartQuestlog__Fv
    /* 92438 800A2438 00000000 */   nop
    /* 9243C 800A243C 1280023C */  lui        $v0, %hi(questlog)
    /* 92440 800A2440 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 92444 800A2444 00000000 */  nop
    /* 92448 800A2448 08004010 */  beqz       $v0, .L800A246C
    /* 9244C 800A244C 00000000 */   nop
    /* 92450 800A2450 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 92454 800A2454 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 92458 800A2458 00000000 */  nop
    /* 9245C 800A245C 03004014 */  bnez       $v0, .L800A246C
    /* 92460 800A2460 00000000 */   nop
    /* 92464 800A2464 C6F5000C */  jal        PlaySFX__Fi
    /* 92468 800A2468 33000424 */   addiu     $a0, $zero, 0x33
  .L800A246C:
    /* 9246C 800A246C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 92470 800A2470 1400B18F */  lw         $s1, 0x14($sp)
    /* 92474 800A2474 1000B08F */  lw         $s0, 0x10($sp)
    /* 92478 800A2478 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9247C 800A247C 0800E003 */  jr         $ra
    /* 92480 800A2480 00000000 */   nop
endlabel pad_func_QLog__Fi
