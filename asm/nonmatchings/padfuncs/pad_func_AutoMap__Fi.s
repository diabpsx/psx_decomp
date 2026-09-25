.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_AutoMap__Fi, 0xBC

glabel pad_func_AutoMap__Fi
    /* 9255C 800A255C 1280023C */  lui        $v0, %hi(stextflag)
    /* 92560 800A2560 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 92564 800A2564 1280033C */  lui        $v1, %hi(questlog)
    /* 92568 800A2568 29BA6390 */  lbu        $v1, %lo(questlog)($v1)
    /* 9256C 800A256C 1280043C */  lui        $a0, %hi(PauseMode)
    /* 92570 800A2570 A4B78490 */  lbu        $a0, %lo(PauseMode)($a0)
    /* 92574 800A2574 25104300 */  or         $v0, $v0, $v1
    /* 92578 800A2578 1280033C */  lui        $v1, %hi(qtextflag)
    /* 9257C 800A257C 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 92580 800A2580 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 92584 800A2584 1000BFAF */  sw         $ra, 0x10($sp)
    /* 92588 800A2588 25104300 */  or         $v0, $v0, $v1
    /* 9258C 800A258C 25104400 */  or         $v0, $v0, $a0
    /* 92590 800A2590 1280033C */  lui        $v1, %hi(sbookflag)
    /* 92594 800A2594 C6B66390 */  lbu        $v1, %lo(sbookflag)($v1)
    /* 92598 800A2598 1280043C */  lui        $a0, %hi(invflag)
    /* 9259C 800A259C 2CC38490 */  lbu        $a0, %lo(invflag)($a0)
    /* 925A0 800A25A0 25104300 */  or         $v0, $v0, $v1
    /* 925A4 800A25A4 25104400 */  or         $v0, $v0, $a0
    /* 925A8 800A25A8 1280033C */  lui        $v1, %hi(chrflag)
    /* 925AC 800A25AC C0B66390 */  lbu        $v1, %lo(chrflag)($v1)
    /* 925B0 800A25B0 1280043C */  lui        $a0, %hi(optionsflag)
    /* 925B4 800A25B4 48B2848C */  lw         $a0, %lo(optionsflag)($a0)
    /* 925B8 800A25B8 25104300 */  or         $v0, $v0, $v1
    /* 925BC 800A25BC 25104400 */  or         $v0, $v0, $a0
    /* 925C0 800A25C0 11004014 */  bnez       $v0, .L800A2608
    /* 925C4 800A25C4 00000000 */   nop
    /* 925C8 800A25C8 1280023C */  lui        $v0, %hi(automapflag)
    /* 925CC 800A25CC 7BC34290 */  lbu        $v0, %lo(automapflag)($v0)
    /* 925D0 800A25D0 00000000 */  nop
    /* 925D4 800A25D4 08004010 */  beqz       $v0, .L800A25F8
    /* 925D8 800A25D8 00000000 */   nop
    /* 925DC 800A25DC 1280023C */  lui        $v0, %hi(automapmoved)
    /* 925E0 800A25E0 DEBB4290 */  lbu        $v0, %lo(automapmoved)($v0)
    /* 925E4 800A25E4 00000000 */  nop
    /* 925E8 800A25E8 05004010 */  beqz       $v0, .L800A2600
    /* 925EC 800A25EC 00000000 */   nop
    /* 925F0 800A25F0 82890208 */  j          .L800A2608
    /* 925F4 800A25F4 00000000 */   nop
  .L800A25F8:
    /* 925F8 800A25F8 1280013C */  lui        $at, %hi(automapmoved)
    /* 925FC 800A25FC DEBB20A0 */  sb         $zero, %lo(automapmoved)($at)
  .L800A2600:
    /* 92600 800A2600 72C8000C */  jal        DoAutoMap__Fv
    /* 92604 800A2604 00000000 */   nop
  .L800A2608:
    /* 92608 800A2608 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9260C 800A260C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 92610 800A2610 0800E003 */  jr         $ra
    /* 92614 800A2614 00000000 */   nop
endlabel pad_func_AutoMap__Fi
