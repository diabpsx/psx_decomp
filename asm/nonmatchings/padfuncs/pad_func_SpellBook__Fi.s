.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_SpellBook__Fi, 0xD8

glabel pad_func_SpellBook__Fi
    /* 92484 800A2484 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 92488 800A2488 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9248C 800A248C 21888000 */  addu       $s1, $a0, $zero
    /* 92490 800A2490 1800BFAF */  sw         $ra, 0x18($sp)
    /* 92494 800A2494 A4BF020C */  jal        GetSpellTarget__Fi
    /* 92498 800A2498 1000B0AF */   sw        $s0, 0x10($sp)
    /* 9249C 800A249C C890020C */  jal        Active__11SpellTarget_800a4320
    /* 924A0 800A24A0 21204000 */   addu      $a0, $v0, $zero
    /* 924A4 800A24A4 DB8C020C */  jal        SelectorActive__Fv
    /* 924A8 800A24A8 21804000 */   addu      $s0, $v0, $zero
    /* 924AC 800A24AC 1280033C */  lui        $v1, %hi(stextflag)
    /* 924B0 800A24B0 E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 924B4 800A24B4 1280043C */  lui        $a0, %hi(qtextflag)
    /* 924B8 800A24B8 60B98490 */  lbu        $a0, %lo(qtextflag)($a0)
    /* 924BC 800A24BC 00000000 */  nop
    /* 924C0 800A24C0 25186400 */  or         $v1, $v1, $a0
    /* 924C4 800A24C4 1280043C */  lui        $a0, %hi(PauseMode)
    /* 924C8 800A24C8 A4B78490 */  lbu        $a0, %lo(PauseMode)($a0)
    /* 924CC 800A24CC 1280053C */  lui        $a1, %hi(chrflag)
    /* 924D0 800A24D0 C0B6A590 */  lbu        $a1, %lo(chrflag)($a1)
    /* 924D4 800A24D4 25186400 */  or         $v1, $v1, $a0
    /* 924D8 800A24D8 25186500 */  or         $v1, $v1, $a1
    /* 924DC 800A24DC 1280043C */  lui        $a0, %hi(invflag)
    /* 924E0 800A24E0 2CC38490 */  lbu        $a0, %lo(invflag)($a0)
    /* 924E4 800A24E4 1280053C */  lui        $a1, %hi(questlog)
    /* 924E8 800A24E8 29BAA590 */  lbu        $a1, %lo(questlog)($a1)
    /* 924EC 800A24EC 25186400 */  or         $v1, $v1, $a0
    /* 924F0 800A24F0 25186500 */  or         $v1, $v1, $a1
    /* 924F4 800A24F4 1280043C */  lui        $a0, %hi(optionsflag)
    /* 924F8 800A24F8 48B2848C */  lw         $a0, %lo(optionsflag)($a0)
    /* 924FC 800A24FC 1280053C */  lui        $a1, %hi(sbookflag)
    /* 92500 800A2500 C6B6A590 */  lbu        $a1, %lo(sbookflag)($a1)
    /* 92504 800A2504 25186400 */  or         $v1, $v1, $a0
    /* 92508 800A2508 25186500 */  or         $v1, $v1, $a1
    /* 9250C 800A250C 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 92510 800A2510 21083100 */  addu       $at, $at, $s1
    /* 92514 800A2514 C4BB2490 */  lbu        $a0, %lo(_SpdBeltSelFlag)($at)
    /* 92518 800A2518 25187000 */  or         $v1, $v1, $s0
    /* 9251C 800A251C 25186400 */  or         $v1, $v1, $a0
    /* 92520 800A2520 25186200 */  or         $v1, $v1, $v0
    /* 92524 800A2524 07006014 */  bnez       $v1, .L800A2544
    /* 92528 800A2528 00000000 */   nop
    /* 9252C 800A252C 01C4000C */  jal        ToggleSpell__Fi
    /* 92530 800A2530 21202002 */   addu      $a0, $s1, $zero
    /* 92534 800A2534 C6F5000C */  jal        PlaySFX__Fi
    /* 92538 800A2538 33000424 */   addiu     $a0, $zero, 0x33
    /* 9253C 800A253C E385020C */  jal        RemoveTargetCursor__Fi
    /* 92540 800A2540 21202002 */   addu      $a0, $s1, $zero
  .L800A2544:
    /* 92544 800A2544 1800BF8F */  lw         $ra, 0x18($sp)
    /* 92548 800A2548 1400B18F */  lw         $s1, 0x14($sp)
    /* 9254C 800A254C 1000B08F */  lw         $s0, 0x10($sp)
    /* 92550 800A2550 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 92554 800A2554 0800E003 */  jr         $ra
    /* 92558 800A2558 00000000 */   nop
endlabel pad_func_SpellBook__Fi
