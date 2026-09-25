.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Remove__11SpellTarget, 0x64

glabel Remove__11SpellTarget
    /* 9F518 800AF518 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9F51C 800AF51C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9F520 800AF520 21808000 */  addu       $s0, $a0, $zero
    /* 9F524 800AF524 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9F528 800AF528 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9F52C 800AF52C 1C00028E */  lw         $v0, 0x1C($s0)
    /* 9F530 800AF530 01000324 */  addiu      $v1, $zero, 0x1
    /* 9F534 800AF534 040000AE */  sw         $zero, 0x4($s0)
    /* 9F538 800AF538 80100200 */  sll        $v0, $v0, 2
    /* 9F53C 800AF53C 1280013C */  lui        $at, %hi(_pcurs)
    /* 9F540 800AF540 21082200 */  addu       $at, $at, $v0
    /* 9F544 800AF544 30B723AC */  sw         $v1, %lo(_pcurs)($at)
    /* 9F548 800AF548 2400048E */  lw         $a0, 0x24($s0)
    /* 9F54C 800AF54C FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 9F550 800AF550 04009110 */  beq        $a0, $s1, .L800AF564
    /* 9F554 800AF554 00000000 */   nop
    /* 9F558 800AF558 D034010C */  jal        AddUnLight__Fi
    /* 9F55C 800AF55C 00000000 */   nop
    /* 9F560 800AF560 240011AE */  sw         $s1, 0x24($s0)
  .L800AF564:
    /* 9F564 800AF564 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9F568 800AF568 1400B18F */  lw         $s1, 0x14($sp)
    /* 9F56C 800AF56C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9F570 800AF570 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9F574 800AF574 0800E003 */  jr         $ra
    /* 9F578 800AF578 00000000 */   nop
endlabel Remove__11SpellTarget
