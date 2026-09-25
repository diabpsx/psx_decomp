.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartWarpLvl__FP12PlayerStructi, 0x118

glabel StartWarpLvl__FP12PlayerStructi
    /* 52448 80062448 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 5244C 8006244C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 52450 80062450 21888000 */  addu       $s1, $a0, $zero
    /* 52454 80062454 2000BFAF */  sw         $ra, 0x20($sp)
    /* 52458 80062458 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 5245C 8006245C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 52460 80062460 1000B0AF */  sw         $s0, 0x10($sp)
    /* 52464 80062464 1D002292 */  lbu        $v0, 0x1D($s1)
    /* 52468 80062468 00000000 */  nop
    /* 5246C 8006246C 34004010 */  beqz       $v0, .L80062540
    /* 52470 80062470 2190A000 */   addu      $s2, $a1, $zero
    /* 52474 80062474 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 52478 80062478 21200000 */   addu      $a0, $zero, $zero
    /* 5247C 8006247C 21200000 */  addu       $a0, $zero, $zero
    /* 52480 80062480 6688010C */  jal        CheckPlrDead__Fi
    /* 52484 80062484 21984000 */   addu      $s3, $v0, $zero
    /* 52488 80062488 6688010C */  jal        CheckPlrDead__Fi
    /* 5248C 8006248C 01000424 */   addiu     $a0, $zero, 0x1
    /* 52490 80062490 0E80103C */  lui        $s0, %hi(plr)
    /* 52494 80062494 38A51026 */  addiu      $s0, $s0, %lo(plr)
    /* 52498 80062498 3A88010C */  jal        InitLevelChange__FP12PlayerStruct
    /* 5249C 8006249C 21200002 */   addu      $a0, $s0, $zero
    /* 524A0 800624A0 3A88010C */  jal        InitLevelChange__FP12PlayerStruct
    /* 524A4 800624A4 E8190426 */   addiu     $a0, $s0, 0x19E8
    /* 524A8 800624A8 A0EB010C */  jal        InitGamePadVars__Fv
    /* 524AC 800624AC 00000000 */   nop
    /* 524B0 800624B0 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 524B4 800624B4 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 524B8 800624B8 01000224 */  addiu      $v0, $zero, 0x1
    /* 524BC 800624BC 0E006210 */  beq        $v1, $v0, .L800624F8
    /* 524C0 800624C0 00000000 */   nop
    /* 524C4 800624C4 2400228E */  lw         $v0, 0x24($s1)
    /* 524C8 800624C8 00000000 */  nop
    /* 524CC 800624CC 03004010 */  beqz       $v0, .L800624DC
    /* 524D0 800624D0 40101200 */   sll       $v0, $s2, 1
    /* 524D4 800624D4 3E890108 */  j          .L800624F8
    /* 524D8 800624D8 240020AE */   sw        $zero, 0x24($s1)
  .L800624DC:
    /* 524DC 800624DC 21105200 */  addu       $v0, $v0, $s2
    /* 524E0 800624E0 80100200 */  sll        $v0, $v0, 2
    /* 524E4 800624E4 0E80013C */  lui        $at, %hi(portal + 0x6)
    /* 524E8 800624E8 21082200 */  addu       $at, $at, $v0
    /* 524EC 800624EC F23B2280 */  lb         $v0, %lo(portal + 0x6)($at)
    /* 524F0 800624F0 00000000 */  nop
    /* 524F4 800624F4 240022AE */  sw         $v0, 0x24($s1)
  .L800624F8:
    /* 524F8 800624F8 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 524FC 800624FC 21202002 */   addu      $a0, $s1, $zero
    /* 52500 80062500 0D004010 */  beqz       $v0, .L80062538
    /* 52504 80062504 00000000 */   nop
    /* 52508 80062508 F904020C */  jal        SetCurrentPortal__Fi
    /* 5250C 8006250C 21204002 */   addu      $a0, $s2, $zero
    /* 52510 80062510 01000224 */  addiu      $v0, $zero, 0x1
    /* 52514 80062514 D30022A2 */  sb         $v0, 0xD3($s1)
    /* 52518 80062518 0A000224 */  addiu      $v0, $zero, 0xA
    /* 5251C 8006251C 46000524 */  addiu      $a1, $zero, 0x46
    /* 52520 80062520 21300000 */  addu       $a2, $zero, $zero
    /* 52524 80062524 1280043C */  lui        $a0, %hi(ghMainWnd)
    /* 52528 80062528 88B7848C */  lw         $a0, %lo(ghMainWnd)($a0)
    /* 5252C 8006252C 21380000 */  addu       $a3, $zero, $zero
    /* 52530 80062530 95EC010C */  jal        GRL_PostMessage__FUlUilUl
    /* 52534 80062534 000022AE */   sw        $v0, 0x0($s1)
  .L80062538:
    /* 52538 80062538 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 5253C 8006253C 21206002 */   addu      $a0, $s3, $zero
  .L80062540:
    /* 52540 80062540 2000BF8F */  lw         $ra, 0x20($sp)
    /* 52544 80062544 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 52548 80062548 1800B28F */  lw         $s2, 0x18($sp)
    /* 5254C 8006254C 1400B18F */  lw         $s1, 0x14($sp)
    /* 52550 80062550 1000B08F */  lw         $s0, 0x10($sp)
    /* 52554 80062554 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 52558 80062558 0800E003 */  jr         $ra
    /* 5255C 8006255C 00000000 */   nop
endlabel StartWarpLvl__FP12PlayerStructi
