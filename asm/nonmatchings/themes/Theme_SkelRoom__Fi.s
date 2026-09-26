.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_SkelRoom__Fi, 0x33C

glabel Theme_SkelRoom__Fi
    /* 236C4 8015D2BC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 236C8 8015D2C0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 236CC 8015D2C4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 236D0 8015D2C8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 236D4 8015D2CC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 236D8 8015D2D0 1280063C */  lui        $a2, %hi(D_8011C16C)
    /* 236DC 8015D2D4 6CC1C624 */  addiu      $a2, $a2, %lo(D_8011C16C)
    /* 236E0 8015D2D8 0300C288 */  lwl        $v0, 0x3($a2)
    /* 236E4 8015D2DC 0000C298 */  lwr        $v0, 0x0($a2)
    /* 236E8 8015D2E0 00000000 */  nop
    /* 236EC 8015D2E4 1300A2AB */  swl        $v0, 0x13($sp)
    /* 236F0 8015D2E8 1000A2BB */  swr        $v0, 0x10($sp)
    /* 236F4 8015D2EC 3070050C */  jal        TFit_SkelRoom__Fi
    /* 236F8 8015D2F0 00000000 */   nop
    /* 236FC 8015D2F4 03000424 */  addiu      $a0, $zero, 0x3
    /* 23700 8015D2F8 181A908F */  lw         $s0, %gp_rel(themex)($gp)
    /* 23704 8015D2FC 1C1A928F */  lw         $s2, %gp_rel(themey)($gp)
    /* 23708 8015D300 21280002 */  addu       $a1, $s0, $zero
    /* 2370C 8015D304 BE4E010C */  jal        AddObject__Fiii
    /* 23710 8015D308 21304002 */   addu      $a2, $s2, $zero
    /* 23714 8015D30C 1280023C */  lui        $v0, %hi(leveltype)
    /* 23718 8015D310 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 2371C 8015D314 00000000 */  nop
    /* 23720 8015D318 2110A203 */  addu       $v0, $sp, $v0
    /* 23724 8015D31C 0F004480 */  lb         $a0, 0xF($v0)
    /* 23728 8015D320 C9F6000C */  jal        ENG_random__Fl
    /* 2372C 8015D324 00000000 */   nop
    /* 23730 8015D328 09004010 */  beqz       $v0, .L8015D350
    /* 23734 8015D32C 0B000424 */   addiu     $a0, $zero, 0xB
    /* 23738 8015D330 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 2373C 8015D334 00000000 */   nop
    /* 23740 8015D338 21204000 */  addu       $a0, $v0, $zero
    /* 23744 8015D33C FFFF0526 */  addiu      $a1, $s0, -0x1
    /* 23748 8015D340 6100020C */  jal        SpawnSkeleton__Fiii
    /* 2374C 8015D344 FFFF4626 */   addiu     $a2, $s2, -0x1
    /* 23750 8015D348 D7740508 */  j          .L8015D35C
    /* 23754 8015D34C 00000000 */   nop
  .L8015D350:
    /* 23758 8015D350 FFFF0526 */  addiu      $a1, $s0, -0x1
    /* 2375C 8015D354 BE4E010C */  jal        AddObject__Fiii
    /* 23760 8015D358 FFFF4626 */   addiu     $a2, $s2, -0x1
  .L8015D35C:
    /* 23764 8015D35C 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 23768 8015D360 FFFF5126 */   addiu     $s1, $s2, -0x1
    /* 2376C 8015D364 21204000 */  addu       $a0, $v0, $zero
    /* 23770 8015D368 21280002 */  addu       $a1, $s0, $zero
    /* 23774 8015D36C 6100020C */  jal        SpawnSkeleton__Fiii
    /* 23778 8015D370 21302002 */   addu      $a2, $s1, $zero
    /* 2377C 8015D374 1280023C */  lui        $v0, %hi(leveltype)
    /* 23780 8015D378 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23784 8015D37C 00000000 */  nop
    /* 23788 8015D380 2110A203 */  addu       $v0, $sp, $v0
    /* 2378C 8015D384 0F004480 */  lb         $a0, 0xF($v0)
    /* 23790 8015D388 C9F6000C */  jal        ENG_random__Fl
    /* 23794 8015D38C 00000000 */   nop
    /* 23798 8015D390 09004010 */  beqz       $v0, .L8015D3B8
    /* 2379C 8015D394 0D000424 */   addiu     $a0, $zero, 0xD
    /* 237A0 8015D398 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 237A4 8015D39C 00000000 */   nop
    /* 237A8 8015D3A0 21204000 */  addu       $a0, $v0, $zero
    /* 237AC 8015D3A4 01000526 */  addiu      $a1, $s0, 0x1
    /* 237B0 8015D3A8 6100020C */  jal        SpawnSkeleton__Fiii
    /* 237B4 8015D3AC 21302002 */   addu      $a2, $s1, $zero
    /* 237B8 8015D3B0 F1740508 */  j          .L8015D3C4
    /* 237BC 8015D3B4 00000000 */   nop
  .L8015D3B8:
    /* 237C0 8015D3B8 01000526 */  addiu      $a1, $s0, 0x1
    /* 237C4 8015D3BC BE4E010C */  jal        AddObject__Fiii
    /* 237C8 8015D3C0 21302002 */   addu      $a2, $s1, $zero
  .L8015D3C4:
    /* 237CC 8015D3C4 1280023C */  lui        $v0, %hi(leveltype)
    /* 237D0 8015D3C8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 237D4 8015D3CC 00000000 */  nop
    /* 237D8 8015D3D0 2110A203 */  addu       $v0, $sp, $v0
    /* 237DC 8015D3D4 0F004480 */  lb         $a0, 0xF($v0)
    /* 237E0 8015D3D8 C9F6000C */  jal        ENG_random__Fl
    /* 237E4 8015D3DC 00000000 */   nop
    /* 237E8 8015D3E0 09004010 */  beqz       $v0, .L8015D408
    /* 237EC 8015D3E4 0C000424 */   addiu     $a0, $zero, 0xC
    /* 237F0 8015D3E8 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 237F4 8015D3EC 00000000 */   nop
    /* 237F8 8015D3F0 21204000 */  addu       $a0, $v0, $zero
    /* 237FC 8015D3F4 FFFF0526 */  addiu      $a1, $s0, -0x1
    /* 23800 8015D3F8 6100020C */  jal        SpawnSkeleton__Fiii
    /* 23804 8015D3FC 21304002 */   addu      $a2, $s2, $zero
    /* 23808 8015D400 05750508 */  j          .L8015D414
    /* 2380C 8015D404 00000000 */   nop
  .L8015D408:
    /* 23810 8015D408 FFFF0526 */  addiu      $a1, $s0, -0x1
    /* 23814 8015D40C BE4E010C */  jal        AddObject__Fiii
    /* 23818 8015D410 21304002 */   addu      $a2, $s2, $zero
  .L8015D414:
    /* 2381C 8015D414 1280023C */  lui        $v0, %hi(leveltype)
    /* 23820 8015D418 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23824 8015D41C 00000000 */  nop
    /* 23828 8015D420 2110A203 */  addu       $v0, $sp, $v0
    /* 2382C 8015D424 0F004480 */  lb         $a0, 0xF($v0)
    /* 23830 8015D428 C9F6000C */  jal        ENG_random__Fl
    /* 23834 8015D42C 00000000 */   nop
    /* 23838 8015D430 09004010 */  beqz       $v0, .L8015D458
    /* 2383C 8015D434 0C000424 */   addiu     $a0, $zero, 0xC
    /* 23840 8015D438 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 23844 8015D43C 00000000 */   nop
    /* 23848 8015D440 21204000 */  addu       $a0, $v0, $zero
    /* 2384C 8015D444 01000526 */  addiu      $a1, $s0, 0x1
    /* 23850 8015D448 6100020C */  jal        SpawnSkeleton__Fiii
    /* 23854 8015D44C 21304002 */   addu      $a2, $s2, $zero
    /* 23858 8015D450 19750508 */  j          .L8015D464
    /* 2385C 8015D454 00000000 */   nop
  .L8015D458:
    /* 23860 8015D458 01000526 */  addiu      $a1, $s0, 0x1
    /* 23864 8015D45C BE4E010C */  jal        AddObject__Fiii
    /* 23868 8015D460 21304002 */   addu      $a2, $s2, $zero
  .L8015D464:
    /* 2386C 8015D464 1280023C */  lui        $v0, %hi(leveltype)
    /* 23870 8015D468 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23874 8015D46C 00000000 */  nop
    /* 23878 8015D470 2110A203 */  addu       $v0, $sp, $v0
    /* 2387C 8015D474 0F004480 */  lb         $a0, 0xF($v0)
    /* 23880 8015D478 C9F6000C */  jal        ENG_random__Fl
    /* 23884 8015D47C 00000000 */   nop
    /* 23888 8015D480 09004010 */  beqz       $v0, .L8015D4A8
    /* 2388C 8015D484 0D000424 */   addiu     $a0, $zero, 0xD
    /* 23890 8015D488 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 23894 8015D48C 00000000 */   nop
    /* 23898 8015D490 21204000 */  addu       $a0, $v0, $zero
    /* 2389C 8015D494 FFFF0526 */  addiu      $a1, $s0, -0x1
    /* 238A0 8015D498 6100020C */  jal        SpawnSkeleton__Fiii
    /* 238A4 8015D49C 01004626 */   addiu     $a2, $s2, 0x1
    /* 238A8 8015D4A0 2D750508 */  j          .L8015D4B4
    /* 238AC 8015D4A4 00000000 */   nop
  .L8015D4A8:
    /* 238B0 8015D4A8 FFFF0526 */  addiu      $a1, $s0, -0x1
    /* 238B4 8015D4AC BE4E010C */  jal        AddObject__Fiii
    /* 238B8 8015D4B0 01004626 */   addiu     $a2, $s2, 0x1
  .L8015D4B4:
    /* 238BC 8015D4B4 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 238C0 8015D4B8 01005126 */   addiu     $s1, $s2, 0x1
    /* 238C4 8015D4BC 21204000 */  addu       $a0, $v0, $zero
    /* 238C8 8015D4C0 21280002 */  addu       $a1, $s0, $zero
    /* 238CC 8015D4C4 6100020C */  jal        SpawnSkeleton__Fiii
    /* 238D0 8015D4C8 21302002 */   addu      $a2, $s1, $zero
    /* 238D4 8015D4CC 1280023C */  lui        $v0, %hi(leveltype)
    /* 238D8 8015D4D0 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 238DC 8015D4D4 00000000 */  nop
    /* 238E0 8015D4D8 2110A203 */  addu       $v0, $sp, $v0
    /* 238E4 8015D4DC 0F004480 */  lb         $a0, 0xF($v0)
    /* 238E8 8015D4E0 C9F6000C */  jal        ENG_random__Fl
    /* 238EC 8015D4E4 00000000 */   nop
    /* 238F0 8015D4E8 09004010 */  beqz       $v0, .L8015D510
    /* 238F4 8015D4EC 0B000424 */   addiu     $a0, $zero, 0xB
    /* 238F8 8015D4F0 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 238FC 8015D4F4 00000000 */   nop
    /* 23900 8015D4F8 21204000 */  addu       $a0, $v0, $zero
    /* 23904 8015D4FC 01000526 */  addiu      $a1, $s0, 0x1
    /* 23908 8015D500 6100020C */  jal        SpawnSkeleton__Fiii
    /* 2390C 8015D504 21302002 */   addu      $a2, $s1, $zero
    /* 23910 8015D508 48750508 */  j          .L8015D520
    /* 23914 8015D50C FDFF4526 */   addiu     $a1, $s2, -0x3
  .L8015D510:
    /* 23918 8015D510 01000526 */  addiu      $a1, $s0, 0x1
    /* 2391C 8015D514 BE4E010C */  jal        AddObject__Fiii
    /* 23920 8015D518 21302002 */   addu      $a2, $s1, $zero
    /* 23924 8015D51C FDFF4526 */  addiu      $a1, $s2, -0x3
  .L8015D520:
    /* 23928 8015D520 C0100500 */  sll        $v0, $a1, 3
    /* 2392C 8015D524 C0181000 */  sll        $v1, $s0, 3
    /* 23930 8015D528 23187000 */  subu       $v1, $v1, $s0
    /* 23934 8015D52C C0190300 */  sll        $v1, $v1, 7
    /* 23938 8015D530 21104300 */  addu       $v0, $v0, $v1
    /* 2393C 8015D534 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 23940 8015D538 21082200 */  addu       $at, $at, $v0
    /* 23944 8015D53C 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 23948 8015D540 00000000 */  nop
    /* 2394C 8015D544 0D004014 */  bnez       $v0, .L8015D57C
    /* 23950 8015D548 00000000 */   nop
    /* 23954 8015D54C 380B020C */  jal        GetSOLID__Fii
    /* 23958 8015D550 21200002 */   addu      $a0, $s0, $zero
    /* 2395C 8015D554 01004238 */  xori       $v0, $v0, 0x1
    /* 23960 8015D558 04004010 */  beqz       $v0, .L8015D56C
    /* 23964 8015D55C 3D000424 */   addiu     $a0, $zero, 0x3D
    /* 23968 8015D560 21280002 */  addu       $a1, $s0, $zero
    /* 2396C 8015D564 5D750508 */  j          .L8015D574
    /* 23970 8015D568 FEFF4626 */   addiu     $a2, $s2, -0x2
  .L8015D56C:
    /* 23974 8015D56C 21280002 */  addu       $a1, $s0, $zero
    /* 23978 8015D570 FFFF4626 */  addiu      $a2, $s2, -0x1
  .L8015D574:
    /* 2397C 8015D574 BE4E010C */  jal        AddObject__Fiii
    /* 23980 8015D578 00000000 */   nop
  .L8015D57C:
    /* 23984 8015D57C 03004526 */  addiu      $a1, $s2, 0x3
    /* 23988 8015D580 C0100500 */  sll        $v0, $a1, 3
    /* 2398C 8015D584 C0181000 */  sll        $v1, $s0, 3
    /* 23990 8015D588 23187000 */  subu       $v1, $v1, $s0
    /* 23994 8015D58C C0190300 */  sll        $v1, $v1, 7
    /* 23998 8015D590 21104300 */  addu       $v0, $v0, $v1
    /* 2399C 8015D594 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 239A0 8015D598 21082200 */  addu       $at, $at, $v0
    /* 239A4 8015D59C 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 239A8 8015D5A0 00000000 */  nop
    /* 239AC 8015D5A4 0D004014 */  bnez       $v0, .L8015D5DC
    /* 239B0 8015D5A8 00000000 */   nop
    /* 239B4 8015D5AC 380B020C */  jal        GetSOLID__Fii
    /* 239B8 8015D5B0 21200002 */   addu      $a0, $s0, $zero
    /* 239BC 8015D5B4 01004238 */  xori       $v0, $v0, 0x1
    /* 239C0 8015D5B8 04004010 */  beqz       $v0, .L8015D5CC
    /* 239C4 8015D5BC 3D000424 */   addiu     $a0, $zero, 0x3D
    /* 239C8 8015D5C0 21280002 */  addu       $a1, $s0, $zero
    /* 239CC 8015D5C4 75750508 */  j          .L8015D5D4
    /* 239D0 8015D5C8 02004626 */   addiu     $a2, $s2, 0x2
  .L8015D5CC:
    /* 239D4 8015D5CC 21280002 */  addu       $a1, $s0, $zero
    /* 239D8 8015D5D0 01004626 */  addiu      $a2, $s2, 0x1
  .L8015D5D4:
    /* 239DC 8015D5D4 BE4E010C */  jal        AddObject__Fiii
    /* 239E0 8015D5D8 00000000 */   nop
  .L8015D5DC:
    /* 239E4 8015D5DC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 239E8 8015D5E0 2000B28F */  lw         $s2, 0x20($sp)
    /* 239EC 8015D5E4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 239F0 8015D5E8 1800B08F */  lw         $s0, 0x18($sp)
    /* 239F4 8015D5EC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 239F8 8015D5F0 0800E003 */  jr         $ra
    /* 239FC 8015D5F4 00000000 */   nop
endlabel Theme_SkelRoom__Fi
