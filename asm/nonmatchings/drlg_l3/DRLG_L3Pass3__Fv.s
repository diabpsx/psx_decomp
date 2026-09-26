.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3Pass3__Fv, 0x218

glabel DRLG_L3Pass3__Fv
    /* 13640 8014D238 0D80023C */  lui        $v0, %hi(pMegaTiles + 0x38)
    /* 13644 8014D23C E4EC4284 */  lh         $v0, %lo(pMegaTiles + 0x38)($v0)
    /* 13648 8014D240 0D80033C */  lui        $v1, %hi(pMegaTiles + 0x3A)
    /* 1364C 8014D244 E6EC6384 */  lh         $v1, %lo(pMegaTiles + 0x3A)($v1)
    /* 13650 8014D248 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 13654 8014D24C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 13658 8014D250 21900000 */  addu       $s2, $zero, $zero
    /* 1365C 8014D254 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 13660 8014D258 3800BEAF */  sw         $fp, 0x38($sp)
    /* 13664 8014D25C 3400B7AF */  sw         $s7, 0x34($sp)
    /* 13668 8014D260 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1366C 8014D264 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 13670 8014D268 2800B4AF */  sw         $s4, 0x28($sp)
    /* 13674 8014D26C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 13678 8014D270 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1367C 8014D274 1800B0AF */  sw         $s0, 0x18($sp)
    /* 13680 8014D278 01004624 */  addiu      $a2, $v0, 0x1
    /* 13684 8014D27C 01007624 */  addiu      $s6, $v1, 0x1
    /* 13688 8014D280 00BC0600 */  sll        $s7, $a2, 16
    /* 1368C 8014D284 0D80023C */  lui        $v0, %hi(pMegaTiles + 0x3C)
    /* 13690 8014D288 E8EC4284 */  lh         $v0, %lo(pMegaTiles + 0x3C)($v0)
    /* 13694 8014D28C 0D80033C */  lui        $v1, %hi(pMegaTiles + 0x3E)
    /* 13698 8014D290 EAEC6384 */  lh         $v1, %lo(pMegaTiles + 0x3E)($v1)
    /* 1369C 8014D294 01005424 */  addiu      $s4, $v0, 0x1
    /* 136A0 8014D298 01007524 */  addiu      $s5, $v1, 0x1
    /* 136A4 8014D29C 21880000 */  addu       $s1, $zero, $zero
  .L8014D2A0:
    /* 136A8 8014D2A0 01005326 */  addiu      $s3, $s2, 0x1
    /* 136AC 8014D2A4 21202002 */  addu       $a0, $s1, $zero
  .L8014D2A8:
    /* 136B0 8014D2A8 21284002 */  addu       $a1, $s2, $zero
    /* 136B4 8014D2AC B30A020C */  jal        SetDPiece__Fiis
    /* 136B8 8014D2B0 03341700 */   sra       $a2, $s7, 16
    /* 136BC 8014D2B4 01003026 */  addiu      $s0, $s1, 0x1
    /* 136C0 8014D2B8 21200002 */  addu       $a0, $s0, $zero
    /* 136C4 8014D2BC 21284002 */  addu       $a1, $s2, $zero
    /* 136C8 8014D2C0 00341600 */  sll        $a2, $s6, 16
    /* 136CC 8014D2C4 B30A020C */  jal        SetDPiece__Fiis
    /* 136D0 8014D2C8 03340600 */   sra       $a2, $a2, 16
    /* 136D4 8014D2CC 21202002 */  addu       $a0, $s1, $zero
    /* 136D8 8014D2D0 21286002 */  addu       $a1, $s3, $zero
    /* 136DC 8014D2D4 00341400 */  sll        $a2, $s4, 16
    /* 136E0 8014D2D8 B30A020C */  jal        SetDPiece__Fiis
    /* 136E4 8014D2DC 03340600 */   sra       $a2, $a2, 16
    /* 136E8 8014D2E0 21200002 */  addu       $a0, $s0, $zero
    /* 136EC 8014D2E4 21286002 */  addu       $a1, $s3, $zero
    /* 136F0 8014D2E8 00341500 */  sll        $a2, $s5, 16
    /* 136F4 8014D2EC B30A020C */  jal        SetDPiece__Fiis
    /* 136F8 8014D2F0 03340600 */   sra       $a2, $a2, 16
    /* 136FC 8014D2F4 02003126 */  addiu      $s1, $s1, 0x2
    /* 13700 8014D2F8 6000222A */  slti       $v0, $s1, 0x60
    /* 13704 8014D2FC EAFF4014 */  bnez       $v0, .L8014D2A8
    /* 13708 8014D300 21202002 */   addu      $a0, $s1, $zero
    /* 1370C 8014D304 02005226 */  addiu      $s2, $s2, 0x2
    /* 13710 8014D308 6000422A */  slti       $v0, $s2, 0x60
    /* 13714 8014D30C E4FF4014 */  bnez       $v0, .L8014D2A0
    /* 13718 8014D310 21880000 */   addu      $s1, $zero, $zero
    /* 1371C 8014D314 10001224 */  addiu      $s2, $zero, 0x10
    /* 13720 8014D318 21F00000 */  addu       $fp, $zero, $zero
  .L8014D31C:
    /* 13724 8014D31C 10001124 */  addiu      $s1, $zero, 0x10
    /* 13728 8014D320 21B80000 */  addu       $s7, $zero, $zero
    /* 1372C 8014D324 01004726 */  addiu      $a3, $s2, 0x1
    /* 13730 8014D328 1000A7AF */  sw         $a3, 0x10($sp)
    /* 13734 8014D32C 0E80133C */  lui        $s3, %hi(dungeon)
    /* 13738 8014D330 C4407326 */  addiu      $s3, $s3, %lo(dungeon)
  .L8014D334:
    /* 1373C 8014D334 40101E00 */  sll        $v0, $fp, 1
    /* 13740 8014D338 21105300 */  addu       $v0, $v0, $s3
    /* 13744 8014D33C 00004294 */  lhu        $v0, 0x0($v0)
    /* 13748 8014D340 00000000 */  nop
    /* 1374C 8014D344 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 13750 8014D348 12004004 */  bltz       $v0, .L8014D394
    /* 13754 8014D34C C0100200 */   sll       $v0, $v0, 3
    /* 13758 8014D350 0D80073C */  lui        $a3, %hi(pMegaTiles)
    /* 1375C 8014D354 ACECE724 */  addiu      $a3, $a3, %lo(pMegaTiles)
    /* 13760 8014D358 21184700 */  addu       $v1, $v0, $a3
    /* 13764 8014D35C 2120E200 */  addu       $a0, $a3, $v0
    /* 13768 8014D360 00006384 */  lh         $v1, 0x0($v1)
    /* 1376C 8014D364 02008484 */  lh         $a0, 0x2($a0)
    /* 13770 8014D368 01006624 */  addiu      $a2, $v1, 0x1
    /* 13774 8014D36C 01009624 */  addiu      $s6, $a0, 0x1
    /* 13778 8014D370 2118E200 */  addu       $v1, $a3, $v0
    /* 1377C 8014D374 0D80073C */  lui        $a3, %hi(pMegaTiles + 0x6)
    /* 13780 8014D378 B2ECE724 */  addiu      $a3, $a3, %lo(pMegaTiles + 0x6)
    /* 13784 8014D37C 21104700 */  addu       $v0, $v0, $a3
    /* 13788 8014D380 04006384 */  lh         $v1, 0x4($v1)
    /* 1378C 8014D384 00004284 */  lh         $v0, 0x0($v0)
    /* 13790 8014D388 01007424 */  addiu      $s4, $v1, 0x1
    /* 13794 8014D38C E9340508 */  j          .L8014D3A4
    /* 13798 8014D390 01005524 */   addiu     $s5, $v0, 0x1
  .L8014D394:
    /* 1379C 8014D394 21300000 */  addu       $a2, $zero, $zero
    /* 137A0 8014D398 21B00000 */  addu       $s6, $zero, $zero
    /* 137A4 8014D39C 21A00000 */  addu       $s4, $zero, $zero
    /* 137A8 8014D3A0 21A80000 */  addu       $s5, $zero, $zero
  .L8014D3A4:
    /* 137AC 8014D3A4 21202002 */  addu       $a0, $s1, $zero
    /* 137B0 8014D3A8 21284002 */  addu       $a1, $s2, $zero
    /* 137B4 8014D3AC 00340600 */  sll        $a2, $a2, 16
    /* 137B8 8014D3B0 B30A020C */  jal        SetDPiece__Fiis
    /* 137BC 8014D3B4 03340600 */   sra       $a2, $a2, 16
    /* 137C0 8014D3B8 01003026 */  addiu      $s0, $s1, 0x1
    /* 137C4 8014D3BC 21200002 */  addu       $a0, $s0, $zero
    /* 137C8 8014D3C0 21284002 */  addu       $a1, $s2, $zero
    /* 137CC 8014D3C4 00341600 */  sll        $a2, $s6, 16
    /* 137D0 8014D3C8 B30A020C */  jal        SetDPiece__Fiis
    /* 137D4 8014D3CC 03340600 */   sra       $a2, $a2, 16
    /* 137D8 8014D3D0 21202002 */  addu       $a0, $s1, $zero
    /* 137DC 8014D3D4 00341400 */  sll        $a2, $s4, 16
    /* 137E0 8014D3D8 1000A58F */  lw         $a1, 0x10($sp)
    /* 137E4 8014D3DC B30A020C */  jal        SetDPiece__Fiis
    /* 137E8 8014D3E0 03340600 */   sra       $a2, $a2, 16
    /* 137EC 8014D3E4 21200002 */  addu       $a0, $s0, $zero
    /* 137F0 8014D3E8 00341500 */  sll        $a2, $s5, 16
    /* 137F4 8014D3EC 1000A58F */  lw         $a1, 0x10($sp)
    /* 137F8 8014D3F0 B30A020C */  jal        SetDPiece__Fiis
    /* 137FC 8014D3F4 03340600 */   sra       $a2, $a2, 16
    /* 13800 8014D3F8 02003126 */  addiu      $s1, $s1, 0x2
    /* 13804 8014D3FC 0100F726 */  addiu      $s7, $s7, 0x1
    /* 13808 8014D400 2800E22A */  slti       $v0, $s7, 0x28
    /* 1380C 8014D404 CBFF4014 */  bnez       $v0, .L8014D334
    /* 13810 8014D408 60007326 */   addiu     $s3, $s3, 0x60
    /* 13814 8014D40C 0100DE27 */  addiu      $fp, $fp, 0x1
    /* 13818 8014D410 2800C22B */  slti       $v0, $fp, 0x28
    /* 1381C 8014D414 C1FF4014 */  bnez       $v0, .L8014D31C
    /* 13820 8014D418 02005226 */   addiu     $s2, $s2, 0x2
    /* 13824 8014D41C 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 13828 8014D420 3800BE8F */  lw         $fp, 0x38($sp)
    /* 1382C 8014D424 3400B78F */  lw         $s7, 0x34($sp)
    /* 13830 8014D428 3000B68F */  lw         $s6, 0x30($sp)
    /* 13834 8014D42C 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 13838 8014D430 2800B48F */  lw         $s4, 0x28($sp)
    /* 1383C 8014D434 2400B38F */  lw         $s3, 0x24($sp)
    /* 13840 8014D438 2000B28F */  lw         $s2, 0x20($sp)
    /* 13844 8014D43C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 13848 8014D440 1800B08F */  lw         $s0, 0x18($sp)
    /* 1384C 8014D444 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 13850 8014D448 0800E003 */  jr         $ra
    /* 13854 8014D44C 00000000 */   nop
endlabel DRLG_L3Pass3__Fv
