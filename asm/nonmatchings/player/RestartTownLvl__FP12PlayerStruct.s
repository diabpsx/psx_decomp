.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RestartTownLvl__FP12PlayerStruct, 0xA8

glabel RestartTownLvl__FP12PlayerStruct
    /* 523A0 800623A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 523A4 800623A4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 523A8 800623A8 21888000 */  addu       $s1, $a0, $zero
    /* 523AC 800623AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 523B0 800623B0 0E80103C */  lui        $s0, %hi(plr)
    /* 523B4 800623B4 38A51026 */  addiu      $s0, $s0, %lo(plr)
    /* 523B8 800623B8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 523BC 800623BC 3A88010C */  jal        InitLevelChange__FP12PlayerStruct
    /* 523C0 800623C0 21200002 */   addu      $a0, $s0, $zero
    /* 523C4 800623C4 3A88010C */  jal        InitLevelChange__FP12PlayerStruct
    /* 523C8 800623C8 E8190426 */   addiu     $a0, $s0, 0x19E8
    /* 523CC 800623CC 21202002 */  addu       $a0, $s1, $zero
    /* 523D0 800623D0 40000524 */  addiu      $a1, $zero, 0x40
    /* 523D4 800623D4 5A98010C */  jal        SetPlayerHitPoints__FP12PlayerStructi
    /* 523D8 800623D8 240020AE */   sw        $zero, 0x24($s1)
    /* 523DC 800623DC 21202002 */  addu       $a0, $s1, $zero
    /* 523E0 800623E0 3401238E */  lw         $v1, 0x134($s1)
    /* 523E4 800623E4 2C01228E */  lw         $v0, 0x12C($s1)
    /* 523E8 800623E8 21280000 */  addu       $a1, $zero, $zero
    /* 523EC 800623EC 300120AE */  sw         $zero, 0x130($s1)
    /* 523F0 800623F0 23104300 */  subu       $v0, $v0, $v1
    /* 523F4 800623F4 209A010C */  jal        CalcPlrInv__FP12PlayerStructUc
    /* 523F8 800623F8 280122AE */   sw        $v0, 0x128($s1)
    /* 523FC 800623FC 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 52400 80062400 21202002 */   addu      $a0, $s1, $zero
    /* 52404 80062404 0A004010 */  beqz       $v0, .L80062430
    /* 52408 80062408 49000524 */   addiu     $a1, $zero, 0x49
    /* 5240C 8006240C 01000224 */  addiu      $v0, $zero, 0x1
    /* 52410 80062410 D30022A2 */  sb         $v0, 0xD3($s1)
    /* 52414 80062414 0A000224 */  addiu      $v0, $zero, 0xA
    /* 52418 80062418 21300000 */  addu       $a2, $zero, $zero
    /* 5241C 8006241C 1280043C */  lui        $a0, %hi(ghMainWnd)
    /* 52420 80062420 88B7848C */  lw         $a0, %lo(ghMainWnd)($a0)
    /* 52424 80062424 21380000 */  addu       $a3, $zero, $zero
    /* 52428 80062428 95EC010C */  jal        GRL_PostMessage__FUlUilUl
    /* 5242C 8006242C 000022AE */   sw        $v0, 0x0($s1)
  .L80062430:
    /* 52430 80062430 1800BF8F */  lw         $ra, 0x18($sp)
    /* 52434 80062434 1400B18F */  lw         $s1, 0x14($sp)
    /* 52438 80062438 1000B08F */  lw         $s0, 0x10($sp)
    /* 5243C 8006243C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 52440 80062440 0800E003 */  jr         $ra
    /* 52444 80062444 00000000 */   nop
endlabel RestartTownLvl__FP12PlayerStruct
