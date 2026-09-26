.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoDelay__Fi, 0x114

glabel M_DoDelay__Fi
    /* 15384 8014EF7C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 15388 8014EF80 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1538C 8014EF84 21808000 */  addu       $s0, $a0, $zero
    /* 15390 8014EF88 1800BFAF */  sw         $ra, 0x18($sp)
    /* 15394 8014EF8C EB2A050C */  jal        M_GetDir__Fi
    /* 15398 8014EF90 1400B1AF */   sw        $s1, 0x14($sp)
    /* 1539C 8014EF94 40101000 */  sll        $v0, $s0, 1
    /* 153A0 8014EF98 21105000 */  addu       $v0, $v0, $s0
    /* 153A4 8014EF9C 80100200 */  sll        $v0, $v0, 2
    /* 153A8 8014EFA0 21105000 */  addu       $v0, $v0, $s0
    /* 153AC 8014EFA4 C0880200 */  sll        $s1, $v0, 3
    /* 153B0 8014EFA8 1080013C */  lui        $at, %hi(monster + 0x5A)
    /* 153B4 8014EFAC 21083100 */  addu       $at, $at, $s1
    /* 153B8 8014EFB0 EE5320A0 */  sb         $zero, %lo(monster + 0x5A)($at)
    /* 153BC 8014EFB4 6EFD010C */  jal        M_Enemy__Fi
    /* 153C0 8014EFB8 21200002 */   addu      $a0, $s0, $zero
    /* 153C4 8014EFBC 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 153C8 8014EFC0 21083100 */  addu       $at, $at, $s1
    /* 153CC 8014EFC4 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 153D0 8014EFC8 1C000224 */  addiu      $v0, $zero, 0x1C
    /* 153D4 8014EFCC 0D006214 */  bne        $v1, $v0, .L8014F004
    /* 153D8 8014EFD0 40101000 */   sll       $v0, $s0, 1
    /* 153DC 8014EFD4 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 153E0 8014EFD8 21083100 */  addu       $at, $at, $s1
    /* 153E4 8014EFDC AE532294 */  lhu        $v0, %lo(monster + 0x1A)($at)
    /* 153E8 8014EFE0 00000000 */  nop
    /* 153EC 8014EFE4 0900422C */  sltiu      $v0, $v0, 0x9
    /* 153F0 8014EFE8 06004014 */  bnez       $v0, .L8014F004
    /* 153F4 8014EFEC 40101000 */   sll       $v0, $s0, 1
    /* 153F8 8014EFF0 08000224 */  addiu      $v0, $zero, 0x8
    /* 153FC 8014EFF4 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 15400 8014EFF8 21083100 */  addu       $at, $at, $s1
    /* 15404 8014EFFC AE5322A4 */  sh         $v0, %lo(monster + 0x1A)($at)
    /* 15408 8014F000 40101000 */  sll        $v0, $s0, 1
  .L8014F004:
    /* 1540C 8014F004 21105000 */  addu       $v0, $v0, $s0
    /* 15410 8014F008 80100200 */  sll        $v0, $v0, 2
    /* 15414 8014F00C 21105000 */  addu       $v0, $v0, $s0
    /* 15418 8014F010 C0880200 */  sll        $s1, $v0, 3
    /* 1541C 8014F014 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 15420 8014F018 21083100 */  addu       $at, $at, $s1
    /* 15424 8014F01C AE532294 */  lhu        $v0, %lo(monster + 0x1A)($at)
    /* 15428 8014F020 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 1542C 8014F024 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 15430 8014F028 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 15434 8014F02C 21083100 */  addu       $at, $at, $s1
    /* 15438 8014F030 AE5322A4 */  sh         $v0, %lo(monster + 0x1A)($at)
    /* 1543C 8014F034 00140200 */  sll        $v0, $v0, 16
    /* 15440 8014F038 03140200 */  sra        $v0, $v0, 16
    /* 15444 8014F03C 0E004314 */  bne        $v0, $v1, .L8014F078
    /* 15448 8014F040 21100000 */   addu      $v0, $zero, $zero
    /* 1544C 8014F044 21200002 */  addu       $a0, $s0, $zero
    /* 15450 8014F048 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 15454 8014F04C 21083100 */  addu       $at, $at, $s1
    /* 15458 8014F050 D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 1545C 8014F054 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 15460 8014F058 21083100 */  addu       $at, $at, $s1
    /* 15464 8014F05C D5533080 */  lb         $s0, %lo(monster + 0x41)($at)
    /* 15468 8014F060 9CFF010C */  jal        M_StartStand__Fii
    /* 1546C 8014F064 00000000 */   nop
    /* 15470 8014F068 01000224 */  addiu      $v0, $zero, 0x1
    /* 15474 8014F06C 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 15478 8014F070 21083100 */  addu       $at, $at, $s1
    /* 1547C 8014F074 D55330A0 */  sb         $s0, %lo(monster + 0x41)($at)
  .L8014F078:
    /* 15480 8014F078 1800BF8F */  lw         $ra, 0x18($sp)
    /* 15484 8014F07C 1400B18F */  lw         $s1, 0x14($sp)
    /* 15488 8014F080 1000B08F */  lw         $s0, 0x10($sp)
    /* 1548C 8014F084 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 15490 8014F088 0800E003 */  jr         $ra
    /* 15494 8014F08C 00000000 */   nop
endlabel M_DoDelay__Fi
