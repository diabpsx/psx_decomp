.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Weapexp__Fi, 0x35C

glabel MI_Weapexp__Fi
    /* D150 80146D48 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* D154 80146D4C 5000B2AF */  sw         $s2, 0x50($sp)
    /* D158 80146D50 21908000 */  addu       $s2, $a0, $zero
    /* D15C 80146D54 2000A727 */  addiu      $a3, $sp, 0x20
    /* D160 80146D58 1280063C */  lui        $a2, %hi(D_8011A19C)
    /* D164 80146D5C 9CA1C624 */  addiu      $a2, $a2, %lo(D_8011A19C)
    /* D168 80146D60 2000C824 */  addiu      $t0, $a2, 0x20
    /* D16C 80146D64 5400BFAF */  sw         $ra, 0x54($sp)
    /* D170 80146D68 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* D174 80146D6C 4800B0AF */  sw         $s0, 0x48($sp)
  .L80146D70:
    /* D178 80146D70 0000C28C */  lw         $v0, 0x0($a2)
    /* D17C 80146D74 0400C38C */  lw         $v1, 0x4($a2)
    /* D180 80146D78 0800C48C */  lw         $a0, 0x8($a2)
    /* D184 80146D7C 0C00C58C */  lw         $a1, 0xC($a2)
    /* D188 80146D80 0000E2AC */  sw         $v0, 0x0($a3)
    /* D18C 80146D84 0400E3AC */  sw         $v1, 0x4($a3)
    /* D190 80146D88 0800E4AC */  sw         $a0, 0x8($a3)
    /* D194 80146D8C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* D198 80146D90 1000C624 */  addiu      $a2, $a2, 0x10
    /* D19C 80146D94 F6FFC814 */  bne        $a2, $t0, .L80146D70
    /* D1A0 80146D98 1000E724 */   addiu     $a3, $a3, 0x10
    /* D1A4 80146D9C 0000C28C */  lw         $v0, 0x0($a2)
    /* D1A8 80146DA0 0400C38C */  lw         $v1, 0x4($a2)
    /* D1AC 80146DA4 0000E2AC */  sw         $v0, 0x0($a3)
    /* D1B0 80146DA8 0400E3AC */  sw         $v1, 0x4($a3)
    /* D1B4 80146DAC 80101200 */  sll        $v0, $s2, 2
    /* D1B8 80146DB0 21105200 */  addu       $v0, $v0, $s2
    /* D1BC 80146DB4 80100200 */  sll        $v0, $v0, 2
    /* D1C0 80146DB8 23105200 */  subu       $v0, $v0, $s2
    /* D1C4 80146DBC 80280200 */  sll        $a1, $v0, 2
    /* D1C8 80146DC0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D1CC 80146DC4 21082500 */  addu       $at, $at, $a1
    /* D1D0 80146DC8 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* D1D4 80146DCC 01000324 */  addiu      $v1, $zero, 0x1
    /* D1D8 80146DD0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* D1DC 80146DD4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D1E0 80146DD8 21082500 */  addu       $at, $at, $a1
    /* D1E4 80146DDC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* D1E8 80146DE0 1080013C */  lui        $at, %hi(missile + 0x20)
    /* D1EC 80146DE4 21082500 */  addu       $at, $at, $a1
    /* D1F0 80146DE8 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* D1F4 80146DEC 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* D1F8 80146DF0 21082500 */  addu       $at, $at, $a1
    /* D1FC 80146DF4 862C2484 */  lh         $a0, %lo(missile + 0x2E)($at)
    /* D200 80146DF8 17004314 */  bne        $v0, $v1, .L80146E58
    /* D204 80146DFC 40100400 */   sll       $v0, $a0, 1
    /* D208 80146E00 21104400 */  addu       $v0, $v0, $a0
    /* D20C 80146E04 80100200 */  sll        $v0, $v0, 2
    /* D210 80146E08 21104400 */  addu       $v0, $v0, $a0
    /* D214 80146E0C 00110200 */  sll        $v0, $v0, 4
    /* D218 80146E10 23104400 */  subu       $v0, $v0, $a0
    /* D21C 80146E14 80100200 */  sll        $v0, $v0, 2
    /* D220 80146E18 21104400 */  addu       $v0, $v0, $a0
    /* D224 80146E1C C0100200 */  sll        $v0, $v0, 3
    /* D228 80146E20 0E80013C */  lui        $at, %hi(plr + 0x19CC)
    /* D22C 80146E24 21082200 */  addu       $at, $at, $v0
    /* D230 80146E28 04BF278C */  lw         $a3, %lo(plr + 0x19CC)($at)
    /* D234 80146E2C 1080013C */  lui        $at, %hi(missile + 0x30)
    /* D238 80146E30 21082500 */  addu       $at, $at, $a1
    /* D23C 80146E34 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* D240 80146E38 0E80013C */  lui        $at, %hi(plr + 0x19D0)
    /* D244 80146E3C 21082200 */  addu       $at, $at, $v0
    /* D248 80146E40 08BF268C */  lw         $a2, %lo(plr + 0x19D0)($at)
    /* D24C 80146E44 40100300 */  sll        $v0, $v1, 1
    /* D250 80146E48 21104300 */  addu       $v0, $v0, $v1
    /* D254 80146E4C C0100200 */  sll        $v0, $v0, 3
    /* D258 80146E50 AB1B0508 */  j          .L80146EAC
    /* D25C 80146E54 01000324 */   addiu     $v1, $zero, 0x1
  .L80146E58:
    /* D260 80146E58 21104400 */  addu       $v0, $v0, $a0
    /* D264 80146E5C 80100200 */  sll        $v0, $v0, 2
    /* D268 80146E60 21104400 */  addu       $v0, $v0, $a0
    /* D26C 80146E64 00110200 */  sll        $v0, $v0, 4
    /* D270 80146E68 23104400 */  subu       $v0, $v0, $a0
    /* D274 80146E6C 80100200 */  sll        $v0, $v0, 2
    /* D278 80146E70 21104400 */  addu       $v0, $v0, $a0
    /* D27C 80146E74 C0100200 */  sll        $v0, $v0, 3
    /* D280 80146E78 0E80013C */  lui        $at, %hi(plr + 0x19D4)
    /* D284 80146E7C 21082200 */  addu       $at, $at, $v0
    /* D288 80146E80 0CBF278C */  lw         $a3, %lo(plr + 0x19D4)($at)
    /* D28C 80146E84 1080013C */  lui        $at, %hi(missile + 0x30)
    /* D290 80146E88 21082500 */  addu       $at, $at, $a1
    /* D294 80146E8C 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* D298 80146E90 0E80013C */  lui        $at, %hi(plr + 0x19D8)
    /* D29C 80146E94 21082200 */  addu       $at, $at, $v0
    /* D2A0 80146E98 10BF268C */  lw         $a2, %lo(plr + 0x19D8)($at)
    /* D2A4 80146E9C 40100300 */  sll        $v0, $v1, 1
    /* D2A8 80146EA0 21104300 */  addu       $v0, $v0, $v1
    /* D2AC 80146EA4 C0100200 */  sll        $v0, $v0, 3
    /* D2B0 80146EA8 02000324 */  addiu      $v1, $zero, 0x2
  .L80146EAC:
    /* D2B4 80146EAC 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* D2B8 80146EB0 21082200 */  addu       $at, $at, $v0
    /* D2BC 80146EB4 FE6723A0 */  sb         $v1, %lo(missiledata + 0xE)($at)
    /* D2C0 80146EB8 21204002 */  addu       $a0, $s2, $zero
    /* D2C4 80146EBC 2128E000 */  addu       $a1, $a3, $zero
    /* D2C8 80146EC0 80101200 */  sll        $v0, $s2, 2
    /* D2CC 80146EC4 21105200 */  addu       $v0, $v0, $s2
    /* D2D0 80146EC8 80100200 */  sll        $v0, $v0, 2
    /* D2D4 80146ECC 23105200 */  subu       $v0, $v0, $s2
    /* D2D8 80146ED0 80800200 */  sll        $s0, $v0, 2
    /* D2DC 80146ED4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D2E0 80146ED8 21083000 */  addu       $at, $at, $s0
    /* D2E4 80146EDC 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* D2E8 80146EE0 21380000 */  addu       $a3, $zero, $zero
    /* D2EC 80146EE4 1000A2AF */  sw         $v0, 0x10($sp)
    /* D2F0 80146EE8 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D2F4 80146EEC 21083000 */  addu       $at, $at, $s0
    /* D2F8 80146EF0 8A2C2280 */  lb         $v0, %lo(missile + 0x32)($at)
    /* D2FC 80146EF4 01001124 */  addiu      $s1, $zero, 0x1
    /* D300 80146EF8 1800A0AF */  sw         $zero, 0x18($sp)
    /* D304 80146EFC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* D308 80146F00 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* D30C 80146F04 1400A2AF */   sw        $v0, 0x14($sp)
    /* D310 80146F08 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* D314 80146F0C 21083000 */  addu       $at, $at, $s0
    /* D318 80146F10 762C2284 */  lh         $v0, %lo(missile + 0x1E)($at)
    /* D31C 80146F14 00000000 */  nop
    /* D320 80146F18 1C004014 */  bnez       $v0, .L80146F8C
    /* D324 80146F1C 00000000 */   nop
    /* D328 80146F20 1080013C */  lui        $at, %hi(missile + 0x20)
    /* D32C 80146F24 21083000 */  addu       $at, $at, $s0
    /* D330 80146F28 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* D334 80146F2C 00000000 */  nop
    /* D338 80146F30 09005114 */  bne        $v0, $s1, .L80146F58
    /* D33C 80146F34 44020624 */   addiu     $a2, $zero, 0x244
    /* D340 80146F38 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D344 80146F3C 21083000 */  addu       $at, $at, $s0
    /* D348 80146F40 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* D34C 80146F44 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D350 80146F48 21083000 */  addu       $at, $at, $s0
    /* D354 80146F4C 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* D358 80146F50 DC1B0508 */  j          .L80146F70
    /* D35C 80146F54 94000624 */   addiu     $a2, $zero, 0x94
  .L80146F58:
    /* D360 80146F58 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D364 80146F5C 21083000 */  addu       $at, $at, $s0
    /* D368 80146F60 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* D36C 80146F64 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D370 80146F68 21083000 */  addu       $at, $at, $s0
    /* D374 80146F6C 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
  .L80146F70:
    /* D378 80146F70 BA34010C */  jal        AddLight__Fiii
    /* D37C 80146F74 00000000 */   nop
    /* D380 80146F78 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D384 80146F7C 21083000 */  addu       $at, $at, $s0
    /* D388 80146F80 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* D38C 80146F84 061C0508 */  j          .L80147018
    /* D390 80146F88 80101200 */   sll       $v0, $s2, 2
  .L80146F8C:
    /* D394 80146F8C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D398 80146F90 21083000 */  addu       $at, $at, $s0
    /* D39C 80146F94 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* D3A0 80146F98 00000000 */  nop
    /* D3A4 80146F9C 1E004010 */  beqz       $v0, .L80147018
    /* D3A8 80146FA0 80101200 */   sll       $v0, $s2, 2
    /* D3AC 80146FA4 1080013C */  lui        $at, %hi(missile + 0x20)
    /* D3B0 80146FA8 21083000 */  addu       $at, $at, $s0
    /* D3B4 80146FAC 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* D3B8 80146FB0 00000000 */  nop
    /* D3BC 80146FB4 0C005114 */  bne        $v0, $s1, .L80146FE8
    /* D3C0 80146FB8 44020724 */   addiu     $a3, $zero, 0x244
    /* D3C4 80146FBC 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D3C8 80146FC0 21083000 */  addu       $at, $at, $s0
    /* D3CC 80146FC4 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* D3D0 80146FC8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D3D4 80146FCC 21083000 */  addu       $at, $at, $s0
    /* D3D8 80146FD0 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* D3DC 80146FD4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D3E0 80146FD8 21083000 */  addu       $at, $at, $s0
    /* D3E4 80146FDC 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* D3E8 80146FE0 031C0508 */  j          .L8014700C
    /* D3EC 80146FE4 94000724 */   addiu     $a3, $zero, 0x94
  .L80146FE8:
    /* D3F0 80146FE8 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D3F4 80146FEC 21083000 */  addu       $at, $at, $s0
    /* D3F8 80146FF0 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* D3FC 80146FF4 1080013C */  lui        $at, %hi(missile + 0x31)
    /* D400 80146FF8 21083000 */  addu       $at, $at, $s0
    /* D404 80146FFC 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* D408 80147000 1080013C */  lui        $at, %hi(missile + 0x32)
    /* D40C 80147004 21083000 */  addu       $at, $at, $s0
    /* D410 80147008 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
  .L8014700C:
    /* D414 8014700C F834010C */  jal        ChangeLight__Fiiii
    /* D418 80147010 00000000 */   nop
    /* D41C 80147014 80101200 */  sll        $v0, $s2, 2
  .L80147018:
    /* D420 80147018 21105200 */  addu       $v0, $v0, $s2
    /* D424 8014701C 80100200 */  sll        $v0, $v0, 2
    /* D428 80147020 23105200 */  subu       $v0, $v0, $s2
    /* D42C 80147024 80280200 */  sll        $a1, $v0, 2
    /* D430 80147028 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* D434 8014702C 21082500 */  addu       $at, $at, $a1
    /* D438 80147030 762C2294 */  lhu        $v0, %lo(missile + 0x1E)($at)
    /* D43C 80147034 1080013C */  lui        $at, %hi(missile + 0x18)
    /* D440 80147038 21082500 */  addu       $at, $at, $a1
    /* D444 8014703C 702C2394 */  lhu        $v1, %lo(missile + 0x18)($at)
    /* D448 80147040 01004224 */  addiu      $v0, $v0, 0x1
    /* D44C 80147044 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* D450 80147048 21082500 */  addu       $at, $at, $a1
    /* D454 8014704C 762C22A4 */  sh         $v0, %lo(missile + 0x1E)($at)
    /* D458 80147050 0B006014 */  bnez       $v1, .L80147080
    /* D45C 80147054 01000224 */   addiu     $v0, $zero, 0x1
    /* D460 80147058 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* D464 8014705C 21082500 */  addu       $at, $at, $a1
    /* D468 80147060 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* D46C 80147064 1080013C */  lui        $at, %hi(missile + 0x38)
    /* D470 80147068 21082500 */  addu       $at, $at, $a1
    /* D474 8014706C 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* D478 80147070 D034010C */  jal        AddUnLight__Fi
    /* D47C 80147074 00000000 */   nop
    /* D480 80147078 221C0508 */  j          .L80147088
    /* D484 8014707C 00000000 */   nop
  .L80147080:
    /* D488 80147080 D1EA040C */  jal        PutMissile__Fi
    /* D48C 80147084 21204002 */   addu      $a0, $s2, $zero
  .L80147088:
    /* D490 80147088 5400BF8F */  lw         $ra, 0x54($sp)
    /* D494 8014708C 5000B28F */  lw         $s2, 0x50($sp)
    /* D498 80147090 4C00B18F */  lw         $s1, 0x4C($sp)
    /* D49C 80147094 4800B08F */  lw         $s0, 0x48($sp)
    /* D4A0 80147098 5800BD27 */  addiu      $sp, $sp, 0x58
    /* D4A4 8014709C 0800E003 */  jr         $ra
    /* D4A8 801470A0 00000000 */   nop
endlabel MI_Weapexp__Fi
