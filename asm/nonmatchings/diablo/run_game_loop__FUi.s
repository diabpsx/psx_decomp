.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching run_game_loop__FUi, 0x168

glabel run_game_loop__FUi
    /* 2840C 8003840C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 28410 80038410 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 28414 80038414 3800B2AF */  sw         $s2, 0x38($sp)
    /* 28418 80038418 3400B1AF */  sw         $s1, 0x34($sp)
    /* 2841C 8003841C F9DF000C */  jal        start_game__FUi
    /* 28420 80038420 3000B0AF */   sw        $s0, 0x30($sp)
    /* 28424 80038424 0480043C */  lui        $a0, %hi(GM_Game__FUlUilUl)
    /* 28428 80038428 9C888424 */  addiu      $a0, $a0, %lo(GM_Game__FUlUilUl)
    /* 2842C 8003842C 87EC010C */  jal        GRL_SetWindowProc__FPFUlUilUl_Ul
    /* 28430 80038430 01001024 */   addiu     $s0, $zero, 0x1
    /* 28434 80038434 FF001124 */  addiu      $s1, $zero, 0xFF
    /* 28438 80038438 821090A3 */  sb         $s0, %gp_rel(gbRunGame)($gp)
    /* 2843C 8003843C 801090A3 */  sb         $s0, %gp_rel(gbProcessPlayers)($gp)
    /* 28440 80038440 831090A3 */  sb         $s0, %gp_rel(gbRunGameResult)($gp)
    /* 28444 80038444 101091AF */  sw         $s1, %gp_rel(force_redraw)($gp)
    /* 28448 80038448 36F7000C */  jal        ClrDiabloMsg__Fv
    /* 2844C 8003844C 21904000 */   addu      $s2, $v0, $zero
    /* 28450 80038450 101091AF */  sw         $s1, %gp_rel(force_redraw)($gp)
    /* 28454 80038454 841090A3 */  sb         $s0, %gp_rel(gbGameLoopStartup)($gp)
    /* 28458 80038458 B0E7000C */  jal        plr_encrypt__FUc
    /* 2845C 8003845C 01000424 */   addiu     $a0, $zero, 0x1
    /* 28460 80038460 1280023C */  lui        $v0, %hi(DoLoadedGame)
    /* 28464 80038464 84B1428C */  lw         $v0, %lo(DoLoadedGame)($v0)
    /* 28468 80038468 00000000 */  nop
    /* 2846C 8003846C 03004014 */  bnez       $v0, .L8003847C
    /* 28470 80038470 00000000 */   nop
    /* 28474 80038474 7EF5010C */  jal        ML_Init__Fv
    /* 28478 80038478 00000000 */   nop
  .L8003847C:
    /* 2847C 8003847C 82108293 */  lbu        $v0, %gp_rel(gbRunGame)($gp)
    /* 28480 80038480 1280013C */  lui        $at, %hi(DoLoadedGame)
    /* 28484 80038484 84B120AC */  sw         $zero, %lo(DoLoadedGame)($at)
    /* 28488 80038488 1280013C */  lui        $at, %hi(DiabloDieFlag)
    /* 2848C 8003848C 5CB220AC */  sw         $zero, %lo(DiabloDieFlag)($at)
    /* 28490 80038490 17004010 */  beqz       $v0, .L800384F0
    /* 28494 80038494 00000000 */   nop
    /* 28498 80038498 01001024 */  addiu      $s0, $zero, 0x1
  .L8003849C:
    /* 2849C 8003849C 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 284A0 800384A0 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 284A4 800384A4 00000000 */  nop
    /* 284A8 800384A8 03004014 */  bnez       $v0, .L800384B8
    /* 284AC 800384AC 00000000 */   nop
    /* 284B0 800384B0 1280013C */  lui        $at, %hi(myplr)
    /* 284B4 800384B4 08BA30AC */  sw         $s0, %lo(myplr)($at)
  .L800384B8:
    /* 284B8 800384B8 B0E7000C */  jal        plr_encrypt__FUc
    /* 284BC 800384BC 21200000 */   addu      $a0, $zero, $zero
    /* 284C0 800384C0 84108493 */  lbu        $a0, %gp_rel(gbGameLoopStartup)($gp)
    /* 284C4 800384C4 96E7000C */  jal        game_loop__FUc
    /* 284C8 800384C8 00000000 */   nop
    /* 284CC 800384CC 841080A3 */  sb         $zero, %gp_rel(gbGameLoopStartup)($gp)
    /* 284D0 800384D0 B0E7000C */  jal        plr_encrypt__FUc
    /* 284D4 800384D4 01000424 */   addiu     $a0, $zero, 0x1
    /* 284D8 800384D8 EE80000C */  jal        TSK_Sleep
    /* 284DC 800384DC 01000424 */   addiu     $a0, $zero, 0x1
    /* 284E0 800384E0 82108293 */  lbu        $v0, %gp_rel(gbRunGame)($gp)
    /* 284E4 800384E4 00000000 */  nop
    /* 284E8 800384E8 ECFF4014 */  bnez       $v0, .L8003849C
    /* 284EC 800384EC 00000000 */   nop
  .L800384F0:
    /* 284F0 800384F0 B0E7000C */  jal        plr_encrypt__FUc
    /* 284F4 800384F4 21200000 */   addu      $a0, $zero, $zero
    /* 284F8 800384F8 E8DD000C */  jal        SetCursor__Fi
    /* 284FC 800384FC 21200000 */   addu      $a0, $zero, $zero
    /* 28500 80038500 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 28504 80038504 101082AF */  sw         $v0, %gp_rel(force_redraw)($gp)
    /* 28508 80038508 87EC010C */  jal        GRL_SetWindowProc__FPFUlUilUl_Ul
    /* 2850C 8003850C 21204002 */   addu      $a0, $s2, $zero
    /* 28510 80038510 35E0000C */  jal        free_game__Fv
    /* 28514 80038514 00000000 */   nop
    /* 28518 80038518 A4DF010C */  jal        music_fade__Fv
    /* 2851C 8003851C 00000000 */   nop
    /* 28520 80038520 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 28524 80038524 08000424 */   addiu     $a0, $zero, 0x8
    /* 28528 80038528 09004010 */  beqz       $v0, .L80038550
    /* 2852C 8003852C 00000000 */   nop
  .L80038530:
    /* 28530 80038530 ABFB010C */  jal        GetFadeState__Fv
    /* 28534 80038534 00000000 */   nop
    /* 28538 80038538 05004010 */  beqz       $v0, .L80038550
    /* 2853C 8003853C 00000000 */   nop
    /* 28540 80038540 EE80000C */  jal        TSK_Sleep
    /* 28544 80038544 01000424 */   addiu     $a0, $zero, 0x1
    /* 28548 80038548 4CE10008 */  j          .L80038530
    /* 2854C 8003854C 00000000 */   nop
  .L80038550:
    /* 28550 80038550 94DF010C */  jal        music_stop__Fv
    /* 28554 80038554 00000000 */   nop
    /* 28558 80038558 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 2855C 8003855C 3800B28F */  lw         $s2, 0x38($sp)
    /* 28560 80038560 3400B18F */  lw         $s1, 0x34($sp)
    /* 28564 80038564 3000B08F */  lw         $s0, 0x30($sp)
    /* 28568 80038568 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 2856C 8003856C 0800E003 */  jr         $ra
    /* 28570 80038570 00000000 */   nop
endlabel run_game_loop__FUi
