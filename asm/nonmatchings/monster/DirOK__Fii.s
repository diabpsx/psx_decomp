.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DirOK__Fii, 0x1AC

glabel DirOK__Fii
    /* 1B3B4 80154FAC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B3B8 80154FB0 21308000 */  addu       $a2, $a0, $zero
    /* 1B3BC 80154FB4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1B3C0 80154FB8 2190A000 */  addu       $s2, $a1, $zero
    /* 1B3C4 80154FBC 40100600 */  sll        $v0, $a2, 1
    /* 1B3C8 80154FC0 21104600 */  addu       $v0, $v0, $a2
    /* 1B3CC 80154FC4 80100200 */  sll        $v0, $v0, 2
    /* 1B3D0 80154FC8 21104600 */  addu       $v0, $v0, $a2
    /* 1B3D4 80154FCC C0100200 */  sll        $v0, $v0, 3
    /* 1B3D8 80154FD0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1B3DC 80154FD4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1B3E0 80154FD8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B3E4 80154FDC 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1B3E8 80154FE0 21082200 */  addu       $at, $at, $v0
    /* 1B3EC 80154FE4 C8532580 */  lb         $a1, %lo(monster + 0x34)($at)
    /* 1B3F0 80154FE8 1280013C */  lui        $at, %hi(offset_x)
    /* 1B3F4 80154FEC 21083200 */  addu       $at, $at, $s2
    /* 1B3F8 80154FF0 A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 1B3FC 80154FF4 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1B400 80154FF8 21082200 */  addu       $at, $at, $v0
    /* 1B404 80154FFC C9532480 */  lb         $a0, %lo(monster + 0x35)($at)
    /* 1B408 80155000 1280013C */  lui        $at, %hi(offset_y)
    /* 1B40C 80155004 21083200 */  addu       $at, $at, $s2
    /* 1B410 80155008 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 1B414 8015500C 00000000 */  nop
    /* 1B418 80155010 21888200 */  addu       $s1, $a0, $v0
    /* 1B41C 80155014 6200222E */  sltiu      $v0, $s1, 0x62
    /* 1B420 80155018 47004010 */  beqz       $v0, .L80155138
    /* 1B424 8015501C 2180A300 */   addu      $s0, $a1, $v1
    /* 1B428 80155020 6200022E */  sltiu      $v0, $s0, 0x62
    /* 1B42C 80155024 44004010 */  beqz       $v0, .L80155138
    /* 1B430 80155028 2120C000 */   addu      $a0, $a2, $zero
    /* 1B434 8015502C 21280002 */  addu       $a1, $s0, $zero
    /* 1B438 80155030 1701020C */  jal        PosOkMonst__Fiii
    /* 1B43C 80155034 21302002 */   addu      $a2, $s1, $zero
    /* 1B440 80155038 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1B444 8015503C 3E004010 */  beqz       $v0, .L80155138
    /* 1B448 80155040 06000224 */   addiu     $v0, $zero, 0x6
    /* 1B44C 80155044 11004216 */  bne        $s2, $v0, .L8015508C
    /* 1B450 80155048 02000224 */   addiu     $v0, $zero, 0x2
    /* 1B454 8015504C 21200002 */  addu       $a0, $s0, $zero
    /* 1B458 80155050 01003126 */  addiu      $s1, $s1, 0x1
    /* 1B45C 80155054 1383010C */  jal        SolidLoc__Fii
    /* 1B460 80155058 21282002 */   addu      $a1, $s1, $zero
    /* 1B464 8015505C FF004230 */  andi       $v0, $v0, 0xFF
    /* 1B468 80155060 35004014 */  bnez       $v0, .L80155138
    /* 1B46C 80155064 C0101100 */   sll       $v0, $s1, 3
    /* 1B470 80155068 C0181000 */  sll        $v1, $s0, 3
    /* 1B474 8015506C 23187000 */  subu       $v1, $v1, $s0
    /* 1B478 80155070 C0190300 */  sll        $v1, $v1, 7
    /* 1B47C 80155074 21104300 */  addu       $v0, $v0, $v1
    /* 1B480 80155078 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1B484 8015507C 21082200 */  addu       $at, $at, $v0
    /* 1B488 80155080 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1B48C 80155084 4C540508 */  j          .L80155130
    /* 1B490 80155088 10004230 */   andi      $v0, $v0, 0x10
  .L8015508C:
    /* 1B494 8015508C 11004216 */  bne        $s2, $v0, .L801550D4
    /* 1B498 80155090 04000224 */   addiu     $v0, $zero, 0x4
    /* 1B49C 80155094 01001026 */  addiu      $s0, $s0, 0x1
    /* 1B4A0 80155098 21200002 */  addu       $a0, $s0, $zero
    /* 1B4A4 8015509C 1383010C */  jal        SolidLoc__Fii
    /* 1B4A8 801550A0 21282002 */   addu      $a1, $s1, $zero
    /* 1B4AC 801550A4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1B4B0 801550A8 23004014 */  bnez       $v0, .L80155138
    /* 1B4B4 801550AC C0101100 */   sll       $v0, $s1, 3
    /* 1B4B8 801550B0 C0181000 */  sll        $v1, $s0, 3
    /* 1B4BC 801550B4 23187000 */  subu       $v1, $v1, $s0
    /* 1B4C0 801550B8 C0190300 */  sll        $v1, $v1, 7
    /* 1B4C4 801550BC 21104300 */  addu       $v0, $v0, $v1
    /* 1B4C8 801550C0 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1B4CC 801550C4 21082200 */  addu       $at, $at, $v0
    /* 1B4D0 801550C8 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1B4D4 801550CC 4C540508 */  j          .L80155130
    /* 1B4D8 801550D0 10004230 */   andi      $v0, $v0, 0x10
  .L801550D4:
    /* 1B4DC 801550D4 09004216 */  bne        $s2, $v0, .L801550FC
    /* 1B4E0 801550D8 01000426 */   addiu     $a0, $s0, 0x1
    /* 1B4E4 801550DC 1383010C */  jal        SolidLoc__Fii
    /* 1B4E8 801550E0 21282002 */   addu      $a1, $s1, $zero
    /* 1B4EC 801550E4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1B4F0 801550E8 14004014 */  bnez       $v0, .L8015513C
    /* 1B4F4 801550EC 21100000 */   addu      $v0, $zero, $zero
    /* 1B4F8 801550F0 21200002 */  addu       $a0, $s0, $zero
    /* 1B4FC 801550F4 49540508 */  j          .L80155124
    /* 1B500 801550F8 01002526 */   addiu     $a1, $s1, 0x1
  .L801550FC:
    /* 1B504 801550FC 0F004016 */  bnez       $s2, .L8015513C
    /* 1B508 80155100 01000224 */   addiu     $v0, $zero, 0x1
    /* 1B50C 80155104 FFFF0426 */  addiu      $a0, $s0, -0x1
    /* 1B510 80155108 1383010C */  jal        SolidLoc__Fii
    /* 1B514 8015510C 21282002 */   addu      $a1, $s1, $zero
    /* 1B518 80155110 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1B51C 80155114 09004014 */  bnez       $v0, .L8015513C
    /* 1B520 80155118 21100000 */   addu      $v0, $zero, $zero
    /* 1B524 8015511C 21200002 */  addu       $a0, $s0, $zero
    /* 1B528 80155120 FFFF2526 */  addiu      $a1, $s1, -0x1
  .L80155124:
    /* 1B52C 80155124 1383010C */  jal        SolidLoc__Fii
    /* 1B530 80155128 00000000 */   nop
    /* 1B534 8015512C FF004230 */  andi       $v0, $v0, 0xFF
  .L80155130:
    /* 1B538 80155130 02004010 */  beqz       $v0, .L8015513C
    /* 1B53C 80155134 01000224 */   addiu     $v0, $zero, 0x1
  .L80155138:
    /* 1B540 80155138 21100000 */  addu       $v0, $zero, $zero
  .L8015513C:
    /* 1B544 8015513C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1B548 80155140 1800B28F */  lw         $s2, 0x18($sp)
    /* 1B54C 80155144 1400B18F */  lw         $s1, 0x14($sp)
    /* 1B550 80155148 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B554 8015514C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1B558 80155150 0800E003 */  jr         $ra
    /* 1B55C 80155154 00000000 */   nop
endlabel DirOK__Fii
