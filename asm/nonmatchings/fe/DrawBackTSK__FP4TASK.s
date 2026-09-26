.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawBackTSK__FP4TASK, 0x188

glabel DrawBackTSK__FP4TASK
    /* 26E0 8013C2D8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 26E4 8013C2DC 01000224 */  addiu      $v0, $zero, 0x1
    /* 26E8 8013C2E0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 26EC 8013C2E4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 26F0 8013C2E8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 26F4 8013C2EC C80B82AF */  sw         $v0, %gp_rel(D_8011B348)($gp)
    /* 26F8 8013C2F0 2A93020C */  jal        TakeDownCutScreen__Fv
    /* 26FC 8013C2F4 00000000 */   nop
    /* 2700 8013C2F8 B4DF010C */  jal        music_start__Fi
    /* 2704 8013C2FC 05000424 */   addiu     $a0, $zero, 0x5
    /* 2708 8013C300 C80B828F */  lw         $v0, %gp_rel(D_8011B348)($gp)
    /* 270C 8013C304 1280013C */  lui        $at, %hi(flamecol)
    /* 2710 8013C308 C8B020AC */  sw         $zero, %lo(flamecol)($at)
    /* 2714 8013C30C 42004010 */  beqz       $v0, .L8013C418
    /* 2718 8013C310 00000000 */   nop
    /* 271C 8013C314 0D80113C */  lui        $s1, %hi(CutScr)
    /* 2720 8013C318 6CC73126 */  addiu      $s1, $s1, %lo(CutScr)
  .L8013C31C:
    /* 2724 8013C31C 1280033C */  lui        $v1, %hi(flamecol)
    /* 2728 8013C320 C8B0638C */  lw         $v1, %lo(flamecol)($v1)
    /* 272C 8013C324 00000000 */  nop
    /* 2730 8013C328 40006228 */  slti       $v0, $v1, 0x40
    /* 2734 8013C32C 03004010 */  beqz       $v0, .L8013C33C
    /* 2738 8013C330 02006224 */   addiu     $v0, $v1, 0x2
    /* 273C 8013C334 1280013C */  lui        $at, %hi(flamecol)
    /* 2740 8013C338 C8B022AC */  sw         $v0, %lo(flamecol)($at)
  .L8013C33C:
    /* 2744 8013C33C 1280023C */  lui        $v0, %hi(InCredits)
    /* 2748 8013C340 BCB3428C */  lw         $v0, %lo(InCredits)($v0)
    /* 274C 8013C344 00000000 */  nop
    /* 2750 8013C348 0F004014 */  bnez       $v0, .L8013C388
    /* 2754 8013C34C 00000000 */   nop
    /* 2758 8013C350 E00B828F */  lw         $v0, %gp_rel(D_8011B360)($gp)
    /* 275C 8013C354 00000000 */  nop
    /* 2760 8013C358 03004014 */  bnez       $v0, .L8013C368
    /* 2764 8013C35C 00000000 */   nop
    /* 2768 8013C360 7C78020C */  jal        DrawFlameLogo__Fv
    /* 276C 8013C364 00000000 */   nop
  .L8013C368:
    /* 2770 8013C368 0D80043C */  lui        $a0, %hi(CutScr)
    /* 2774 8013C36C 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 2778 8013C370 12000524 */  addiu      $a1, $zero, 0x12
    /* 277C 8013C374 0B000624 */  addiu      $a2, $zero, 0xB
    /* 2780 8013C378 BC0B828F */  lw         $v0, %gp_rel(D_8011B33C)($gp)
    /* 2784 8013C37C 21380000 */  addu       $a3, $zero, $zero
    /* 2788 8013C380 F252020C */  jal        Display__7CScreeniiii
    /* 278C 8013C384 1000A2AF */   sw        $v0, 0x10($sp)
  .L8013C388:
    /* 2790 8013C388 E00B828F */  lw         $v0, %gp_rel(D_8011B360)($gp)
    /* 2794 8013C38C 00000000 */  nop
    /* 2798 8013C390 07004010 */  beqz       $v0, .L8013C3B0
    /* 279C 8013C394 00000000 */   nop
    /* 27A0 8013C398 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 27A4 8013C39C ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 27A8 8013C3A0 00000000 */  nop
    /* 27AC 8013C3A4 02004014 */  bnez       $v0, .L8013C3B0
    /* 27B0 8013C3A8 00000000 */   nop
    /* 27B4 8013C3AC E00B80AF */  sw         $zero, %gp_rel(D_8011B360)($gp)
  .L8013C3B0:
    /* 27B8 8013C3B0 1280103C */  lui        $s0, %hi(InCredits)
    /* 27BC 8013C3B4 BCB3108E */  lw         $s0, %lo(InCredits)($s0)
    /* 27C0 8013C3B8 01000224 */  addiu      $v0, $zero, 0x1
    /* 27C4 8013C3BC 0F000216 */  bne        $s0, $v0, .L8013C3FC
    /* 27C8 8013C3C0 00000000 */   nop
    /* 27CC 8013C3C4 E00B90AF */  sw         $s0, %gp_rel(D_8011B360)($gp)
    /* 27D0 8013C3C8 1280013C */  lui        $at, %hi(InCredits)
    /* 27D4 8013C3CC BCB320AC */  sw         $zero, %lo(InCredits)($at)
    /* 27D8 8013C3D0 E952020C */  jal        Unload__7CScreen
    /* 27DC 8013C3D4 21202002 */   addu      $a0, $s1, $zero
    /* 27E0 8013C3D8 21202002 */  addu       $a0, $s1, $zero
    /* 27E4 8013C3DC 12000524 */  addiu      $a1, $zero, 0x12
    /* 27E8 8013C3E0 0B000624 */  addiu      $a2, $zero, 0xB
    /* 27EC 8013C3E4 1280013C */  lui        $at, %hi(CDWAIT)
    /* 27F0 8013C3E8 ECAD30AC */  sw         $s0, %lo(CDWAIT)($at)
    /* 27F4 8013C3EC 2452020C */  jal        Load__7CScreeniii
    /* 27F8 8013C3F0 21380000 */   addu      $a3, $zero, $zero
    /* 27FC 8013C3F4 1280013C */  lui        $at, %hi(CDWAIT)
    /* 2800 8013C3F8 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
  .L8013C3FC:
    /* 2804 8013C3FC EE80000C */  jal        TSK_Sleep
    /* 2808 8013C400 01000424 */   addiu     $a0, $zero, 0x1
    /* 280C 8013C404 C80B828F */  lw         $v0, %gp_rel(D_8011B348)($gp)
    /* 2810 8013C408 1280013C */  lui        $at, %hi(TitleFlag)
    /* 2814 8013C40C 40B120AC */  sw         $zero, %lo(TitleFlag)($at)
    /* 2818 8013C410 C2FF4014 */  bnez       $v0, .L8013C31C
    /* 281C 8013C414 00000000 */   nop
  .L8013C418:
    /* 2820 8013C418 A00B848F */  lw         $a0, %gp_rel(FeTData)($gp)
    /* 2824 8013C41C 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 2828 8013C420 00000000 */   nop
    /* 282C 8013C424 A40B848F */  lw         $a0, %gp_rel(FlameTData)($gp)
    /* 2830 8013C428 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 2834 8013C42C 00000000 */   nop
    /* 2838 8013C430 0D80043C */  lui        $a0, %hi(CutScr)
    /* 283C 8013C434 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 2840 8013C438 A00B80AF */  sw         $zero, %gp_rel(FeTData)($gp)
    /* 2844 8013C43C A40B80AF */  sw         $zero, %gp_rel(FlameTData)($gp)
    /* 2848 8013C440 E952020C */  jal        Unload__7CScreen
    /* 284C 8013C444 00000000 */   nop
    /* 2850 8013C448 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2854 8013C44C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2858 8013C450 1800B08F */  lw         $s0, 0x18($sp)
    /* 285C 8013C454 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2860 8013C458 0800E003 */  jr         $ra
    /* 2864 8013C45C 00000000 */   nop
endlabel DrawBackTSK__FP4TASK
