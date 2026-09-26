.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4Pass3__Fv, 0x218

glabel DRLG_L4Pass3__Fv
    /* 1B3E8 80154FE0 0D80023C */  lui        $v0, %hi(pMegaTiles + 0xE8)
    /* 1B3EC 80154FE4 94ED4284 */  lh         $v0, %lo(pMegaTiles + 0xE8)($v0)
    /* 1B3F0 80154FE8 0D80033C */  lui        $v1, %hi(pMegaTiles + 0xEA)
    /* 1B3F4 80154FEC 96ED6384 */  lh         $v1, %lo(pMegaTiles + 0xEA)($v1)
    /* 1B3F8 80154FF0 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1B3FC 80154FF4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1B400 80154FF8 21900000 */  addu       $s2, $zero, $zero
    /* 1B404 80154FFC 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 1B408 80155000 3800BEAF */  sw         $fp, 0x38($sp)
    /* 1B40C 80155004 3400B7AF */  sw         $s7, 0x34($sp)
    /* 1B410 80155008 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1B414 8015500C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1B418 80155010 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1B41C 80155014 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1B420 80155018 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1B424 8015501C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1B428 80155020 01004624 */  addiu      $a2, $v0, 0x1
    /* 1B42C 80155024 01007624 */  addiu      $s6, $v1, 0x1
    /* 1B430 80155028 00BC0600 */  sll        $s7, $a2, 16
    /* 1B434 8015502C 0D80023C */  lui        $v0, %hi(pMegaTiles + 0xEC)
    /* 1B438 80155030 98ED4284 */  lh         $v0, %lo(pMegaTiles + 0xEC)($v0)
    /* 1B43C 80155034 0D80033C */  lui        $v1, %hi(pMegaTiles + 0xEE)
    /* 1B440 80155038 9AED6384 */  lh         $v1, %lo(pMegaTiles + 0xEE)($v1)
    /* 1B444 8015503C 01005424 */  addiu      $s4, $v0, 0x1
    /* 1B448 80155040 01007524 */  addiu      $s5, $v1, 0x1
    /* 1B44C 80155044 21880000 */  addu       $s1, $zero, $zero
  .L80155048:
    /* 1B450 80155048 01005326 */  addiu      $s3, $s2, 0x1
    /* 1B454 8015504C 21202002 */  addu       $a0, $s1, $zero
  .L80155050:
    /* 1B458 80155050 21284002 */  addu       $a1, $s2, $zero
    /* 1B45C 80155054 B30A020C */  jal        SetDPiece__Fiis
    /* 1B460 80155058 03341700 */   sra       $a2, $s7, 16
    /* 1B464 8015505C 01003026 */  addiu      $s0, $s1, 0x1
    /* 1B468 80155060 21200002 */  addu       $a0, $s0, $zero
    /* 1B46C 80155064 21284002 */  addu       $a1, $s2, $zero
    /* 1B470 80155068 00341600 */  sll        $a2, $s6, 16
    /* 1B474 8015506C B30A020C */  jal        SetDPiece__Fiis
    /* 1B478 80155070 03340600 */   sra       $a2, $a2, 16
    /* 1B47C 80155074 21202002 */  addu       $a0, $s1, $zero
    /* 1B480 80155078 21286002 */  addu       $a1, $s3, $zero
    /* 1B484 8015507C 00341400 */  sll        $a2, $s4, 16
    /* 1B488 80155080 B30A020C */  jal        SetDPiece__Fiis
    /* 1B48C 80155084 03340600 */   sra       $a2, $a2, 16
    /* 1B490 80155088 21200002 */  addu       $a0, $s0, $zero
    /* 1B494 8015508C 21286002 */  addu       $a1, $s3, $zero
    /* 1B498 80155090 00341500 */  sll        $a2, $s5, 16
    /* 1B49C 80155094 B30A020C */  jal        SetDPiece__Fiis
    /* 1B4A0 80155098 03340600 */   sra       $a2, $a2, 16
    /* 1B4A4 8015509C 02003126 */  addiu      $s1, $s1, 0x2
    /* 1B4A8 801550A0 6000222A */  slti       $v0, $s1, 0x60
    /* 1B4AC 801550A4 EAFF4014 */  bnez       $v0, .L80155050
    /* 1B4B0 801550A8 21202002 */   addu      $a0, $s1, $zero
    /* 1B4B4 801550AC 02005226 */  addiu      $s2, $s2, 0x2
    /* 1B4B8 801550B0 6000422A */  slti       $v0, $s2, 0x60
    /* 1B4BC 801550B4 E4FF4014 */  bnez       $v0, .L80155048
    /* 1B4C0 801550B8 21880000 */   addu      $s1, $zero, $zero
    /* 1B4C4 801550BC 10001224 */  addiu      $s2, $zero, 0x10
    /* 1B4C8 801550C0 21F00000 */  addu       $fp, $zero, $zero
  .L801550C4:
    /* 1B4CC 801550C4 10001124 */  addiu      $s1, $zero, 0x10
    /* 1B4D0 801550C8 21B80000 */  addu       $s7, $zero, $zero
    /* 1B4D4 801550CC 01004726 */  addiu      $a3, $s2, 0x1
    /* 1B4D8 801550D0 1000A7AF */  sw         $a3, 0x10($sp)
    /* 1B4DC 801550D4 0E80133C */  lui        $s3, %hi(dungeon)
    /* 1B4E0 801550D8 C4407326 */  addiu      $s3, $s3, %lo(dungeon)
  .L801550DC:
    /* 1B4E4 801550DC 40101E00 */  sll        $v0, $fp, 1
    /* 1B4E8 801550E0 21105300 */  addu       $v0, $v0, $s3
    /* 1B4EC 801550E4 00004294 */  lhu        $v0, 0x0($v0)
    /* 1B4F0 801550E8 00000000 */  nop
    /* 1B4F4 801550EC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1B4F8 801550F0 12004004 */  bltz       $v0, .L8015513C
    /* 1B4FC 801550F4 C0100200 */   sll       $v0, $v0, 3
    /* 1B500 801550F8 0D80073C */  lui        $a3, %hi(pMegaTiles)
    /* 1B504 801550FC ACECE724 */  addiu      $a3, $a3, %lo(pMegaTiles)
    /* 1B508 80155100 21184700 */  addu       $v1, $v0, $a3
    /* 1B50C 80155104 2120E200 */  addu       $a0, $a3, $v0
    /* 1B510 80155108 00006384 */  lh         $v1, 0x0($v1)
    /* 1B514 8015510C 02008484 */  lh         $a0, 0x2($a0)
    /* 1B518 80155110 01006624 */  addiu      $a2, $v1, 0x1
    /* 1B51C 80155114 01009624 */  addiu      $s6, $a0, 0x1
    /* 1B520 80155118 2118E200 */  addu       $v1, $a3, $v0
    /* 1B524 8015511C 0D80073C */  lui        $a3, %hi(pMegaTiles + 0x6)
    /* 1B528 80155120 B2ECE724 */  addiu      $a3, $a3, %lo(pMegaTiles + 0x6)
    /* 1B52C 80155124 21104700 */  addu       $v0, $v0, $a3
    /* 1B530 80155128 04006384 */  lh         $v1, 0x4($v1)
    /* 1B534 8015512C 00004284 */  lh         $v0, 0x0($v0)
    /* 1B538 80155130 01007424 */  addiu      $s4, $v1, 0x1
    /* 1B53C 80155134 53540508 */  j          .L8015514C
    /* 1B540 80155138 01005524 */   addiu     $s5, $v0, 0x1
  .L8015513C:
    /* 1B544 8015513C 21300000 */  addu       $a2, $zero, $zero
    /* 1B548 80155140 21B00000 */  addu       $s6, $zero, $zero
    /* 1B54C 80155144 21A00000 */  addu       $s4, $zero, $zero
    /* 1B550 80155148 21A80000 */  addu       $s5, $zero, $zero
  .L8015514C:
    /* 1B554 8015514C 21202002 */  addu       $a0, $s1, $zero
    /* 1B558 80155150 21284002 */  addu       $a1, $s2, $zero
    /* 1B55C 80155154 00340600 */  sll        $a2, $a2, 16
    /* 1B560 80155158 B30A020C */  jal        SetDPiece__Fiis
    /* 1B564 8015515C 03340600 */   sra       $a2, $a2, 16
    /* 1B568 80155160 01003026 */  addiu      $s0, $s1, 0x1
    /* 1B56C 80155164 21200002 */  addu       $a0, $s0, $zero
    /* 1B570 80155168 21284002 */  addu       $a1, $s2, $zero
    /* 1B574 8015516C 00341600 */  sll        $a2, $s6, 16
    /* 1B578 80155170 B30A020C */  jal        SetDPiece__Fiis
    /* 1B57C 80155174 03340600 */   sra       $a2, $a2, 16
    /* 1B580 80155178 21202002 */  addu       $a0, $s1, $zero
    /* 1B584 8015517C 00341400 */  sll        $a2, $s4, 16
    /* 1B588 80155180 1000A58F */  lw         $a1, 0x10($sp)
    /* 1B58C 80155184 B30A020C */  jal        SetDPiece__Fiis
    /* 1B590 80155188 03340600 */   sra       $a2, $a2, 16
    /* 1B594 8015518C 21200002 */  addu       $a0, $s0, $zero
    /* 1B598 80155190 00341500 */  sll        $a2, $s5, 16
    /* 1B59C 80155194 1000A58F */  lw         $a1, 0x10($sp)
    /* 1B5A0 80155198 B30A020C */  jal        SetDPiece__Fiis
    /* 1B5A4 8015519C 03340600 */   sra       $a2, $a2, 16
    /* 1B5A8 801551A0 02003126 */  addiu      $s1, $s1, 0x2
    /* 1B5AC 801551A4 0100F726 */  addiu      $s7, $s7, 0x1
    /* 1B5B0 801551A8 2800E22A */  slti       $v0, $s7, 0x28
    /* 1B5B4 801551AC CBFF4014 */  bnez       $v0, .L801550DC
    /* 1B5B8 801551B0 60007326 */   addiu     $s3, $s3, 0x60
    /* 1B5BC 801551B4 0100DE27 */  addiu      $fp, $fp, 0x1
    /* 1B5C0 801551B8 2800C22B */  slti       $v0, $fp, 0x28
    /* 1B5C4 801551BC C1FF4014 */  bnez       $v0, .L801550C4
    /* 1B5C8 801551C0 02005226 */   addiu     $s2, $s2, 0x2
    /* 1B5CC 801551C4 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 1B5D0 801551C8 3800BE8F */  lw         $fp, 0x38($sp)
    /* 1B5D4 801551CC 3400B78F */  lw         $s7, 0x34($sp)
    /* 1B5D8 801551D0 3000B68F */  lw         $s6, 0x30($sp)
    /* 1B5DC 801551D4 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1B5E0 801551D8 2800B48F */  lw         $s4, 0x28($sp)
    /* 1B5E4 801551DC 2400B38F */  lw         $s3, 0x24($sp)
    /* 1B5E8 801551E0 2000B28F */  lw         $s2, 0x20($sp)
    /* 1B5EC 801551E4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1B5F0 801551E8 1800B08F */  lw         $s0, 0x18($sp)
    /* 1B5F4 801551EC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1B5F8 801551F0 0800E003 */  jr         $ra
    /* 1B5FC 801551F4 00000000 */   nop
endlabel DRLG_L4Pass3__Fv
