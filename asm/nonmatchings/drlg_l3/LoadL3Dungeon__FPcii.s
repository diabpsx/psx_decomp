.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadL3Dungeon__FPcii, 0x184

glabel LoadL3Dungeon__FPcii
    /* 138D0 8014D4C8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 138D4 8014D4CC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 138D8 8014D4D0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 138DC 8014D4D4 E623050C */  jal        InitL3Dungeon__Fv
    /* 138E0 8014D4D8 21808000 */   addu      $s0, $a0, $zero
    /* 138E4 8014D4DC 10000224 */  addiu      $v0, $zero, 0x10
    /* 138E8 8014D4E0 1280013C */  lui        $at, %hi(dminx)
    /* 138EC 8014D4E4 F8C022AC */  sw         $v0, %lo(dminx)($at)
    /* 138F0 8014D4E8 1280013C */  lui        $at, %hi(dminy)
    /* 138F4 8014D4EC FCC022AC */  sw         $v0, %lo(dminy)($at)
    /* 138F8 8014D4F0 50000224 */  addiu      $v0, $zero, 0x50
    /* 138FC 8014D4F4 1280013C */  lui        $at, %hi(dmaxx)
    /* 13900 8014D4F8 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* 13904 8014D4FC 1280013C */  lui        $at, %hi(dmaxy)
    /* 13908 8014D500 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* 1390C 8014D504 1C68050C */  jal        DRLG_InitTrans__Fv
    /* 13910 8014D508 00000000 */   nop
    /* 13914 8014D50C 21200002 */  addu       $a0, $s0, $zero
    /* 13918 8014D510 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 1391C 8014D514 21280000 */   addu      $a1, $zero, $zero
    /* 13920 8014D518 21804000 */  addu       $s0, $v0, $zero
    /* 13924 8014D51C 04000826 */  addiu      $t0, $s0, 0x4
    /* 13928 8014D520 02000A92 */  lbu        $t2, 0x2($s0)
    /* 1392C 8014D524 00000992 */  lbu        $t1, 0x0($s0)
    /* 13930 8014D528 18004011 */  beqz       $t2, .L8014D58C
    /* 13934 8014D52C 21300000 */   addu      $a2, $zero, $zero
    /* 13938 8014D530 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 1393C 8014D534 C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
    /* 13940 8014D538 07000B24 */  addiu      $t3, $zero, 0x7
  .L8014D53C:
    /* 13944 8014D53C 0F002011 */  beqz       $t1, .L8014D57C
    /* 13948 8014D540 21280000 */   addu      $a1, $zero, $zero
    /* 1394C 8014D544 40380600 */  sll        $a3, $a2, 1
    /* 13950 8014D548 21208001 */  addu       $a0, $t4, $zero
  .L8014D54C:
    /* 13954 8014D54C 00000391 */  lbu        $v1, 0x0($t0)
    /* 13958 8014D550 00000000 */  nop
    /* 1395C 8014D554 03006010 */  beqz       $v1, .L8014D564
    /* 13960 8014D558 2110E400 */   addu      $v0, $a3, $a0
    /* 13964 8014D55C 5A350508 */  j          .L8014D568
    /* 13968 8014D560 000043A4 */   sh        $v1, 0x0($v0)
  .L8014D564:
    /* 1396C 8014D564 00004BA4 */  sh         $t3, 0x0($v0)
  .L8014D568:
    /* 13970 8014D568 02000825 */  addiu      $t0, $t0, 0x2
    /* 13974 8014D56C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 13978 8014D570 2A10A900 */  slt        $v0, $a1, $t1
    /* 1397C 8014D574 F5FF4014 */  bnez       $v0, .L8014D54C
    /* 13980 8014D578 60008424 */   addiu     $a0, $a0, 0x60
  .L8014D57C:
    /* 13984 8014D57C 0100C624 */  addiu      $a2, $a2, 0x1
    /* 13988 8014D580 2A10CA00 */  slt        $v0, $a2, $t2
    /* 1398C 8014D584 EDFF4014 */  bnez       $v0, .L8014D53C
    /* 13990 8014D588 00000000 */   nop
  .L8014D58C:
    /* 13994 8014D58C 21300000 */  addu       $a2, $zero, $zero
    /* 13998 8014D590 0E80093C */  lui        $t1, %hi(dungeon)
    /* 1399C 8014D594 C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* 139A0 8014D598 08000824 */  addiu      $t0, $zero, 0x8
    /* 139A4 8014D59C 21280000 */  addu       $a1, $zero, $zero
  .L8014D5A0:
    /* 139A8 8014D5A0 40380600 */  sll        $a3, $a2, 1
    /* 139AC 8014D5A4 21202001 */  addu       $a0, $t1, $zero
  .L8014D5A8:
    /* 139B0 8014D5A8 2118E400 */  addu       $v1, $a3, $a0
    /* 139B4 8014D5AC 00006294 */  lhu        $v0, 0x0($v1)
    /* 139B8 8014D5B0 00000000 */  nop
    /* 139BC 8014D5B4 02004014 */  bnez       $v0, .L8014D5C0
    /* 139C0 8014D5B8 00000000 */   nop
    /* 139C4 8014D5BC 000068A4 */  sh         $t0, 0x0($v1)
  .L8014D5C0:
    /* 139C8 8014D5C0 0100A524 */  addiu      $a1, $a1, 0x1
    /* 139CC 8014D5C4 2F00A228 */  slti       $v0, $a1, 0x2F
    /* 139D0 8014D5C8 F7FF4014 */  bnez       $v0, .L8014D5A8
    /* 139D4 8014D5CC 60008424 */   addiu     $a0, $a0, 0x60
    /* 139D8 8014D5D0 0100C624 */  addiu      $a2, $a2, 0x1
    /* 139DC 8014D5D4 2F00C228 */  slti       $v0, $a2, 0x2F
    /* 139E0 8014D5D8 F1FF4014 */  bnez       $v0, .L8014D5A0
    /* 139E4 8014D5DC 21280000 */   addu      $a1, $zero, $zero
    /* 139E8 8014D5E0 60000224 */  addiu      $v0, $zero, 0x60
    /* 139EC 8014D5E4 602182AF */  sw         $v0, %gp_rel(D_8011C8E0)($gp)
    /* 139F0 8014D5E8 8E34050C */  jal        DRLG_L3Pass3__Fv
    /* 139F4 8014D5EC 00000000 */   nop
    /* 139F8 8014D5F0 ABF3040C */  jal        DRLG_Init_Globals__Fv
    /* 139FC 8014D5F4 00000000 */   nop
    /* 13A00 8014D5F8 21200002 */  addu       $a0, $s0, $zero
    /* 13A04 8014D5FC 21280000 */  addu       $a1, $zero, $zero
    /* 13A08 8014D600 1F000224 */  addiu      $v0, $zero, 0x1F
    /* 13A0C 8014D604 1280013C */  lui        $at, %hi(ViewX)
    /* 13A10 8014D608 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 13A14 8014D60C 53000224 */  addiu      $v0, $zero, 0x53
    /* 13A18 8014D610 1280013C */  lui        $at, %hi(ViewY)
    /* 13A1C 8014D614 18C122AC */  sw         $v0, %lo(ViewY)($at)
    /* 13A20 8014D618 2883050C */  jal        SetMapMonsters__FPUcii
    /* 13A24 8014D61C 21300000 */   addu      $a2, $zero, $zero
    /* 13A28 8014D620 21200002 */  addu       $a0, $s0, $zero
    /* 13A2C 8014D624 21280000 */  addu       $a1, $zero, $zero
    /* 13A30 8014D628 A25E050C */  jal        SetMapObjects__FPUcii
    /* 13A34 8014D62C 21300000 */   addu      $a2, $zero, $zero
    /* 13A38 8014D630 F7F6000C */  jal        mem_free_dbg__FPv
    /* 13A3C 8014D634 21200002 */   addu      $a0, $s0, $zero
    /* 13A40 8014D638 2400BF8F */  lw         $ra, 0x24($sp)
    /* 13A44 8014D63C 2000B08F */  lw         $s0, 0x20($sp)
    /* 13A48 8014D640 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 13A4C 8014D644 0800E003 */  jr         $ra
    /* 13A50 8014D648 00000000 */   nop
endlabel LoadL3Dungeon__FPcii
