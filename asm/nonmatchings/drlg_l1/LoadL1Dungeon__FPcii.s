.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadL1Dungeon__FPcii, 0x1D4

glabel LoadL1Dungeon__FPcii
    /* 336C 8013CF64 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3370 8013CF68 2000B0AF */  sw         $s0, 0x20($sp)
    /* 3374 8013CF6C 21808000 */  addu       $s0, $a0, $zero
    /* 3378 8013CF70 2400B1AF */  sw         $s1, 0x24($sp)
    /* 337C 8013CF74 2188A000 */  addu       $s1, $a1, $zero
    /* 3380 8013CF78 2800B2AF */  sw         $s2, 0x28($sp)
    /* 3384 8013CF7C 10000224 */  addiu      $v0, $zero, 0x10
    /* 3388 8013CF80 1280013C */  lui        $at, %hi(dminx)
    /* 338C 8013CF84 F8C022AC */  sw         $v0, %lo(dminx)($at)
    /* 3390 8013CF88 1280013C */  lui        $at, %hi(dminy)
    /* 3394 8013CF8C FCC022AC */  sw         $v0, %lo(dminy)($at)
    /* 3398 8013CF90 50000224 */  addiu      $v0, $zero, 0x50
    /* 339C 8013CF94 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 33A0 8013CF98 1280013C */  lui        $at, %hi(dmaxx)
    /* 33A4 8013CF9C 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* 33A8 8013CFA0 1280013C */  lui        $at, %hi(dmaxy)
    /* 33AC 8013CFA4 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* 33B0 8013CFA8 1C68050C */  jal        DRLG_InitTrans__Fv
    /* 33B4 8013CFAC 2190C000 */   addu      $s2, $a2, $zero
    /* 33B8 8013CFB0 21200002 */  addu       $a0, $s0, $zero
    /* 33BC 8013CFB4 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 33C0 8013CFB8 21280000 */   addu      $a1, $zero, $zero
    /* 33C4 8013CFBC 21804000 */  addu       $s0, $v0, $zero
    /* 33C8 8013CFC0 21400002 */  addu       $t0, $s0, $zero
    /* 33CC 8013CFC4 21380000 */  addu       $a3, $zero, $zero
    /* 33D0 8013CFC8 0E800D3C */  lui        $t5, %hi(dungeon)
    /* 33D4 8013CFCC C440AD25 */  addiu      $t5, $t5, %lo(dungeon)
    /* 33D8 8013CFD0 16000C24 */  addiu      $t4, $zero, 0x16
    /* 33DC 8013CFD4 21580000 */  addu       $t3, $zero, $zero
  .L8013CFD8:
    /* 33E0 8013CFD8 21280000 */  addu       $a1, $zero, $zero
    /* 33E4 8013CFDC 40500700 */  sll        $t2, $a3, 1
    /* 33E8 8013CFE0 21486001 */  addu       $t1, $t3, $zero
    /* 33EC 8013CFE4 2130A001 */  addu       $a2, $t5, $zero
  .L8013CFE8:
    /* 33F0 8013CFE8 21204601 */  addu       $a0, $t2, $a2
    /* 33F4 8013CFEC 21182501 */  addu       $v1, $t1, $a1
    /* 33F8 8013CFF0 1280023C */  lui        $v0, %hi(mydflags)
    /* 33FC 8013CFF4 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 3400 8013CFF8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3404 8013CFFC 00008CA4 */  sh         $t4, 0x0($a0)
    /* 3408 8013D000 21104300 */  addu       $v0, $v0, $v1
    /* 340C 8013D004 000040A0 */  sb         $zero, 0x0($v0)
    /* 3410 8013D008 2800A228 */  slti       $v0, $a1, 0x28
    /* 3414 8013D00C F6FF4014 */  bnez       $v0, .L8013CFE8
    /* 3418 8013D010 6000C624 */   addiu     $a2, $a2, 0x60
    /* 341C 8013D014 0100E724 */  addiu      $a3, $a3, 0x1
    /* 3420 8013D018 2800E228 */  slti       $v0, $a3, 0x28
    /* 3424 8013D01C EEFF4014 */  bnez       $v0, .L8013CFD8
    /* 3428 8013D020 28006B25 */   addiu     $t3, $t3, 0x28
    /* 342C 8013D024 00000B91 */  lbu        $t3, 0x0($t0)
    /* 3430 8013D028 21380000 */  addu       $a3, $zero, $zero
    /* 3434 8013D02C 02000825 */  addiu      $t0, $t0, 0x2
    /* 3438 8013D030 00000C91 */  lbu        $t4, 0x0($t0)
    /* 343C 8013D034 00000000 */  nop
    /* 3440 8013D038 22008011 */  beqz       $t4, .L8013D0C4
    /* 3444 8013D03C 02000825 */   addiu     $t0, $t0, 0x2
    /* 3448 8013D040 0E800E3C */  lui        $t6, %hi(dungeon)
    /* 344C 8013D044 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* 3450 8013D048 0D000D24 */  addiu      $t5, $zero, 0xD
    /* 3454 8013D04C 21500000 */  addu       $t2, $zero, $zero
  .L8013D050:
    /* 3458 8013D050 18006011 */  beqz       $t3, .L8013D0B4
    /* 345C 8013D054 21280000 */   addu      $a1, $zero, $zero
    /* 3460 8013D058 40300700 */  sll        $a2, $a3, 1
    /* 3464 8013D05C 21484001 */  addu       $t1, $t2, $zero
    /* 3468 8013D060 2120C001 */  addu       $a0, $t6, $zero
  .L8013D064:
    /* 346C 8013D064 00000391 */  lbu        $v1, 0x0($t0)
    /* 3470 8013D068 00000000 */  nop
    /* 3474 8013D06C 0B006010 */  beqz       $v1, .L8013D09C
    /* 3478 8013D070 2110C400 */   addu      $v0, $a2, $a0
    /* 347C 8013D074 000043A4 */  sh         $v1, 0x0($v0)
    /* 3480 8013D078 1280033C */  lui        $v1, %hi(mydflags)
    /* 3484 8013D07C D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 3488 8013D080 21102501 */  addu       $v0, $t1, $a1
    /* 348C 8013D084 21186200 */  addu       $v1, $v1, $v0
    /* 3490 8013D088 00006290 */  lbu        $v0, 0x0($v1)
    /* 3494 8013D08C 00000000 */  nop
    /* 3498 8013D090 80004234 */  ori        $v0, $v0, 0x80
    /* 349C 8013D094 28F40408 */  j          .L8013D0A0
    /* 34A0 8013D098 000062A0 */   sb        $v0, 0x0($v1)
  .L8013D09C:
    /* 34A4 8013D09C 00004DA4 */  sh         $t5, 0x0($v0)
  .L8013D0A0:
    /* 34A8 8013D0A0 02000825 */  addiu      $t0, $t0, 0x2
    /* 34AC 8013D0A4 0100A524 */  addiu      $a1, $a1, 0x1
    /* 34B0 8013D0A8 2A10AB00 */  slt        $v0, $a1, $t3
    /* 34B4 8013D0AC EDFF4014 */  bnez       $v0, .L8013D064
    /* 34B8 8013D0B0 60008424 */   addiu     $a0, $a0, 0x60
  .L8013D0B4:
    /* 34BC 8013D0B4 0100E724 */  addiu      $a3, $a3, 0x1
    /* 34C0 8013D0B8 2A10EC00 */  slt        $v0, $a3, $t4
    /* 34C4 8013D0BC E4FF4014 */  bnez       $v0, .L8013D050
    /* 34C8 8013D0C0 28004A25 */   addiu     $t2, $t2, 0x28
  .L8013D0C4:
    /* 34CC 8013D0C4 B1F2040C */  jal        DRLG_L1Floor__Fv
    /* 34D0 8013D0C8 00000000 */   nop
    /* 34D4 8013D0CC 1280013C */  lui        $at, %hi(ViewX)
    /* 34D8 8013D0D0 14C131AC */  sw         $s1, %lo(ViewX)($at)
    /* 34DC 8013D0D4 1280013C */  lui        $at, %hi(ViewY)
    /* 34E0 8013D0D8 18C132AC */  sw         $s2, %lo(ViewY)($at)
    /* 34E4 8013D0DC EAF2040C */  jal        DRLG_L1Pass3__Fv
    /* 34E8 8013D0E0 00000000 */   nop
    /* 34EC 8013D0E4 ABF3040C */  jal        DRLG_Init_Globals__Fv
    /* 34F0 8013D0E8 00000000 */   nop
    /* 34F4 8013D0EC D7F3040C */  jal        DRLG_InitL1Vals__Fv
    /* 34F8 8013D0F0 00000000 */   nop
    /* 34FC 8013D0F4 21200002 */  addu       $a0, $s0, $zero
    /* 3500 8013D0F8 21280000 */  addu       $a1, $zero, $zero
    /* 3504 8013D0FC 2883050C */  jal        SetMapMonsters__FPUcii
    /* 3508 8013D100 21300000 */   addu      $a2, $zero, $zero
    /* 350C 8013D104 21200002 */  addu       $a0, $s0, $zero
    /* 3510 8013D108 21280000 */  addu       $a1, $zero, $zero
    /* 3514 8013D10C A25E050C */  jal        SetMapObjects__FPUcii
    /* 3518 8013D110 21300000 */   addu      $a2, $zero, $zero
    /* 351C 8013D114 F7F6000C */  jal        mem_free_dbg__FPv
    /* 3520 8013D118 21200002 */   addu      $a0, $s0, $zero
    /* 3524 8013D11C 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 3528 8013D120 2800B28F */  lw         $s2, 0x28($sp)
    /* 352C 8013D124 2400B18F */  lw         $s1, 0x24($sp)
    /* 3530 8013D128 2000B08F */  lw         $s0, 0x20($sp)
    /* 3534 8013D12C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3538 8013D130 0800E003 */  jr         $ra
    /* 353C 8013D134 00000000 */   nop
endlabel LoadL1Dungeon__FPcii
