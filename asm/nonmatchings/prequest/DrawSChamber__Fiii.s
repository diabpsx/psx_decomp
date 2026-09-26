.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSChamber__Fiii, 0x13C

glabel DrawSChamber__Fiii
    /* 25368 8015EF60 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2536C 8015EF64 1800B2AF */  sw         $s2, 0x18($sp)
    /* 25370 8015EF68 21908000 */  addu       $s2, $a0, $zero
    /* 25374 8015EF6C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 25378 8015EF70 2180A000 */  addu       $s0, $a1, $zero
    /* 2537C 8015EF74 1400B1AF */  sw         $s1, 0x14($sp)
    /* 25380 8015EF78 2188C000 */  addu       $s1, $a2, $zero
    /* 25384 8015EF7C 1280043C */  lui        $a0, %hi(D_80119B4C)
    /* 25388 8015EF80 4C9B8424 */  addiu      $a0, $a0, %lo(D_80119B4C)
    /* 2538C 8015EF84 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 25390 8015EF88 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 25394 8015EF8C 21280000 */   addu      $a1, $zero, $zero
    /* 25398 8015EF90 21204000 */  addu       $a0, $v0, $zero
    /* 2539C 8015EF94 04008824 */  addiu      $t0, $a0, 0x4
    /* 253A0 8015EF98 00008D90 */  lbu        $t5, 0x0($a0)
    /* 253A4 8015EF9C 02008C90 */  lbu        $t4, 0x2($a0)
    /* 253A8 8015EFA0 1280013C */  lui        $at, %hi(setpc_x)
    /* 253AC 8015EFA4 E4C030AC */  sw         $s0, %lo(setpc_x)($at)
    /* 253B0 8015EFA8 1280013C */  lui        $at, %hi(setpc_y)
    /* 253B4 8015EFAC E8C031AC */  sw         $s1, %lo(setpc_y)($at)
    /* 253B8 8015EFB0 21109101 */  addu       $v0, $t4, $s1
    /* 253BC 8015EFB4 2A102202 */  slt        $v0, $s1, $v0
    /* 253C0 8015EFB8 1280013C */  lui        $at, %hi(setpc_w)
    /* 253C4 8015EFBC ECC02DAC */  sw         $t5, %lo(setpc_w)($at)
    /* 253C8 8015EFC0 1280013C */  lui        $at, %hi(setpc_h)
    /* 253CC 8015EFC4 F0C02CAC */  sw         $t4, %lo(setpc_h)($at)
    /* 253D0 8015EFC8 1E004010 */  beqz       $v0, .L8015F044
    /* 253D4 8015EFCC 21482002 */   addu      $t1, $s1, $zero
    /* 253D8 8015EFD0 2110B001 */  addu       $v0, $t5, $s0
    /* 253DC 8015EFD4 2A700202 */  slt        $t6, $s0, $v0
    /* 253E0 8015EFD8 0E800F3C */  lui        $t7, %hi(dungeon)
    /* 253E4 8015EFDC C440EF25 */  addiu      $t7, $t7, %lo(dungeon)
  .L8015EFE0:
    /* 253E8 8015EFE0 1300C011 */  beqz       $t6, .L8015F030
    /* 253EC 8015EFE4 21380002 */   addu      $a3, $s0, $zero
    /* 253F0 8015EFE8 40580900 */  sll        $t3, $t1, 1
    /* 253F4 8015EFEC 2150B001 */  addu       $t2, $t5, $s0
    /* 253F8 8015EFF0 40101000 */  sll        $v0, $s0, 1
    /* 253FC 8015EFF4 21105000 */  addu       $v0, $v0, $s0
    /* 25400 8015EFF8 40110200 */  sll        $v0, $v0, 5
    /* 25404 8015EFFC 21304F00 */  addu       $a2, $v0, $t7
  .L8015F000:
    /* 25408 8015F000 03000324 */  addiu      $v1, $zero, 0x3
    /* 2540C 8015F004 00000291 */  lbu        $v0, 0x0($t0)
    /* 25410 8015F008 00000000 */  nop
    /* 25414 8015F00C 02004010 */  beqz       $v0, .L8015F018
    /* 25418 8015F010 21286601 */   addu      $a1, $t3, $a2
    /* 2541C 8015F014 FF004330 */  andi       $v1, $v0, 0xFF
  .L8015F018:
    /* 25420 8015F018 0000A3A4 */  sh         $v1, 0x0($a1)
    /* 25424 8015F01C 02000825 */  addiu      $t0, $t0, 0x2
    /* 25428 8015F020 0100E724 */  addiu      $a3, $a3, 0x1
    /* 2542C 8015F024 2A10EA00 */  slt        $v0, $a3, $t2
    /* 25430 8015F028 F5FF4014 */  bnez       $v0, .L8015F000
    /* 25434 8015F02C 6000C624 */   addiu     $a2, $a2, 0x60
  .L8015F030:
    /* 25438 8015F030 01002925 */  addiu      $t1, $t1, 0x1
    /* 2543C 8015F034 21109101 */  addu       $v0, $t4, $s1
    /* 25440 8015F038 2A102201 */  slt        $v0, $t1, $v0
    /* 25444 8015F03C E8FF4014 */  bnez       $v0, .L8015EFE0
    /* 25448 8015F040 00000000 */   nop
  .L8015F044:
    /* 2544C 8015F044 40101000 */  sll        $v0, $s0, 1
    /* 25450 8015F048 16004224 */  addiu      $v0, $v0, 0x16
    /* 25454 8015F04C 80181200 */  sll        $v1, $s2, 2
    /* 25458 8015F050 21187200 */  addu       $v1, $v1, $s2
    /* 2545C 8015F054 80180300 */  sll        $v1, $v1, 2
    /* 25460 8015F058 0E80013C */  lui        $at, %hi(quests + 0x4)
    /* 25464 8015F05C 21082300 */  addu       $at, $at, $v1
    /* 25468 8015F060 44DA22AC */  sw         $v0, %lo(quests + 0x4)($at)
    /* 2546C 8015F064 40101100 */  sll        $v0, $s1, 1
    /* 25470 8015F068 17004224 */  addiu      $v0, $v0, 0x17
    /* 25474 8015F06C 0E80013C */  lui        $at, %hi(quests + 0x8)
    /* 25478 8015F070 21082300 */  addu       $at, $at, $v1
    /* 2547C 8015F074 48DA22AC */  sw         $v0, %lo(quests + 0x8)($at)
    /* 25480 8015F078 F7F6000C */  jal        mem_free_dbg__FPv
    /* 25484 8015F07C 00000000 */   nop
    /* 25488 8015F080 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 2548C 8015F084 1800B28F */  lw         $s2, 0x18($sp)
    /* 25490 8015F088 1400B18F */  lw         $s1, 0x14($sp)
    /* 25494 8015F08C 1000B08F */  lw         $s0, 0x10($sp)
    /* 25498 8015F090 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2549C 8015F094 0800E003 */  jr         $ra
    /* 254A0 8015F098 00000000 */   nop
endlabel DrawSChamber__Fiii
