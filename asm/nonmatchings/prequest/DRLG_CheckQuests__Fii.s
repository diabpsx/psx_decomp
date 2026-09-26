.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_CheckQuests__Fii, 0x13C

glabel DRLG_CheckQuests__Fii
    /* 2573C 8015F334 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 25740 8015F338 1000B0AF */  sw         $s0, 0x10($sp)
    /* 25744 8015F33C 21808000 */  addu       $s0, $a0, $zero
    /* 25748 8015F340 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2574C 8015F344 2188A000 */  addu       $s1, $a1, $zero
    /* 25750 8015F348 1800B2AF */  sw         $s2, 0x18($sp)
    /* 25754 8015F34C 21900000 */  addu       $s2, $zero, $zero
    /* 25758 8015F350 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2575C 8015F354 1280143C */  lui        $s4, %hi(jtbl_80119B80)
    /* 25760 8015F358 809B9426 */  addiu      $s4, $s4, %lo(jtbl_80119B80)
    /* 25764 8015F35C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 25768 8015F360 21980000 */  addu       $s3, $zero, $zero
    /* 2576C 8015F364 2400BFAF */  sw         $ra, 0x24($sp)
  .L8015F368:
    /* 25770 8015F368 DC9E010C */  jal        QuestStatus__Fi
    /* 25774 8015F36C 21204002 */   addu      $a0, $s2, $zero
    /* 25778 8015F370 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2577C 8015F374 30004010 */  beqz       $v0, .L8015F438
    /* 25780 8015F378 00000000 */   nop
    /* 25784 8015F37C 0E80013C */  lui        $at, %hi(quests + 0x1)
    /* 25788 8015F380 21083300 */  addu       $at, $at, $s3
    /* 2578C 8015F384 41DA2290 */  lbu        $v0, %lo(quests + 0x1)($at)
    /* 25790 8015F388 00000000 */  nop
    /* 25794 8015F38C FAFF4324 */  addiu      $v1, $v0, -0x6
    /* 25798 8015F390 0900622C */  sltiu      $v0, $v1, 0x9
    /* 2579C 8015F394 28004010 */  beqz       $v0, .L8015F438
    /* 257A0 8015F398 80100300 */   sll       $v0, $v1, 2
    /* 257A4 8015F39C 21105400 */  addu       $v0, $v0, $s4
    /* 257A8 8015F3A0 0000428C */  lw         $v0, 0x0($v0)
    /* 257AC 8015F3A4 00000000 */  nop
    /* 257B0 8015F3A8 08004000 */  jr         $v0
    /* 257B4 8015F3AC 00000000 */   nop
    /* 257B8 8015F3B0 637B050C */  jal        DrawButcher__Fv
    /* 257BC 8015F3B4 14007326 */   addiu     $s3, $s3, 0x14
    /* 257C0 8015F3B8 107D0508 */  j          .L8015F440
    /* 257C4 8015F3BC 01005226 */   addiu     $s2, $s2, 0x1
    /* 257C8 8015F3C0 21204002 */  addu       $a0, $s2, $zero
    /* 257CC 8015F3C4 21280002 */  addu       $a1, $s0, $zero
    /* 257D0 8015F3C8 747B050C */  jal        DrawSkelKing__Fiii
    /* 257D4 8015F3CC 21302002 */   addu      $a2, $s1, $zero
    /* 257D8 8015F3D0 0F7D0508 */  j          .L8015F43C
    /* 257DC 8015F3D4 14007326 */   addiu     $s3, $s3, 0x14
    /* 257E0 8015F3D8 21204002 */  addu       $a0, $s2, $zero
    /* 257E4 8015F3DC 21280002 */  addu       $a1, $s0, $zero
    /* 257E8 8015F3E0 D87B050C */  jal        DrawSChamber__Fiii
    /* 257EC 8015F3E4 21302002 */   addu      $a2, $s1, $zero
    /* 257F0 8015F3E8 0F7D0508 */  j          .L8015F43C
    /* 257F4 8015F3EC 14007326 */   addiu     $s3, $s3, 0x14
    /* 257F8 8015F3F0 21200002 */  addu       $a0, $s0, $zero
    /* 257FC 8015F3F4 5E7C050C */  jal        DrawBlind__Fii
    /* 25800 8015F3F8 21282002 */   addu      $a1, $s1, $zero
    /* 25804 8015F3FC 0F7D0508 */  j          .L8015F43C
    /* 25808 8015F400 14007326 */   addiu     $s3, $s3, 0x14
    /* 2580C 8015F404 21200002 */  addu       $a0, $s0, $zero
    /* 25810 8015F408 957C050C */  jal        DrawBlood__Fii
    /* 25814 8015F40C 21282002 */   addu      $a1, $s1, $zero
    /* 25818 8015F410 0F7D0508 */  j          .L8015F43C
    /* 2581C 8015F414 14007326 */   addiu     $s3, $s3, 0x14
    /* 25820 8015F418 21200002 */  addu       $a0, $s0, $zero
    /* 25824 8015F41C 277C050C */  jal        DrawLTBanner__Fii
    /* 25828 8015F420 21282002 */   addu      $a1, $s1, $zero
    /* 2582C 8015F424 0F7D0508 */  j          .L8015F43C
    /* 25830 8015F428 14007326 */   addiu     $s3, $s3, 0x14
    /* 25834 8015F42C 21200002 */  addu       $a0, $s0, $zero
    /* 25838 8015F430 997B050C */  jal        DrawWarLord__Fii
    /* 2583C 8015F434 21282002 */   addu      $a1, $s1, $zero
  .L8015F438:
    /* 25840 8015F438 14007326 */  addiu      $s3, $s3, 0x14
  .L8015F43C:
    /* 25844 8015F43C 01005226 */  addiu      $s2, $s2, 0x1
  .L8015F440:
    /* 25848 8015F440 1000422A */  slti       $v0, $s2, 0x10
    /* 2584C 8015F444 C8FF4014 */  bnez       $v0, .L8015F368
    /* 25850 8015F448 00000000 */   nop
    /* 25854 8015F44C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 25858 8015F450 2000B48F */  lw         $s4, 0x20($sp)
    /* 2585C 8015F454 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 25860 8015F458 1800B28F */  lw         $s2, 0x18($sp)
    /* 25864 8015F45C 1400B18F */  lw         $s1, 0x14($sp)
    /* 25868 8015F460 1000B08F */  lw         $s0, 0x10($sp)
    /* 2586C 8015F464 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 25870 8015F468 0800E003 */  jr         $ra
    /* 25874 8015F46C 00000000 */   nop
endlabel DRLG_CheckQuests__Fii
