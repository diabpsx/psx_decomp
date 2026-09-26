.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_8013B3B0, 0x33C

glabel func_8013B3B0
    /* 17B8 8013B3B0 1480083C */  lui        $t0, %hi(func_8013B37C)
    /* 17BC 8013B3B4 7CB30825 */  addiu      $t0, $t0, %lo(func_8013B37C)
    /* 17C0 8013B3B8 0008C620 */  addi       $a2, $a2, 0x800 /* handwritten instruction */
    /* 17C4 8013B3BC 0100013C */  lui        $at, (0x10000 >> 16)
    /* 17C8 8013B3C0 2038C100 */  add        $a3, $a2, $at /* handwritten instruction */
    /* 17CC 8013B3C4 0F008014 */  bnez       $a0, .L8013B404
    /* 17D0 8013B3C8 0000098D */   lw        $t1, 0x0($t0)
    /* 17D4 8013B3CC 1480083C */  lui        $t0, %hi(D_80139DFC)
    /* 17D8 8013B3D0 FC9D0825 */  addiu      $t0, $t0, %lo(D_80139DFC)
    /* 17DC 8013B3D4 0000048D */  lw         $a0, 0x0($t0)
    /* 17E0 8013B3D8 0400058D */  lw         $a1, 0x4($t0)
    /* 17E4 8013B3DC 0800028D */  lw         $v0, 0x8($t0)
    /* 17E8 8013B3E0 0C00038D */  lw         $v1, 0xC($t0)
    /* 17EC 8013B3E4 10000C8D */  lw         $t4, 0x10($t0)
    /* 17F0 8013B3E8 14000D8D */  lw         $t5, 0x14($t0)
    /* 17F4 8013B3EC 18000F8D */  lw         $t7, 0x18($t0)
    /* 17F8 8013B3F0 1C00188D */  lw         $t8, 0x1C($t0)
    /* 17FC 8013B3F4 2000198D */  lw         $t9, 0x20($t0)
    /* 1800 8013B3F8 20482901 */  add        $t1, $t1, $t1 /* handwritten instruction */
    /* 1804 8013B3FC 5F000010 */  b          .L8013B57C
    /* 1808 8013B400 2070A900 */   add       $t6, $a1, $t1 /* handwritten instruction */
  .L8013B404:
    /* 180C 8013B404 20680000 */  add        $t5, $zero, $zero /* handwritten instruction */
    /* 1810 8013B408 20780000 */  add        $t7, $zero, $zero /* handwritten instruction */
    /* 1814 8013B40C 20C00000 */  add        $t8, $zero, $zero /* handwritten instruction */
    /* 1818 8013B410 20C80000 */  add        $t9, $zero, $zero /* handwritten instruction */
    /* 181C 8013B414 20482901 */  add        $t1, $t1, $t1 /* handwritten instruction */
    /* 1820 8013B418 2070A900 */  add        $t6, $a1, $t1 /* handwritten instruction */
    /* 1824 8013B41C 00008894 */  lhu        $t0, 0x0($a0)
    /* 1828 8013B420 02008994 */  lhu        $t1, 0x2($a0)
    /* 182C 8013B424 04008C94 */  lhu        $t4, 0x4($a0)
    /* 1830 8013B428 06008A94 */  lhu        $t2, 0x6($a0)
    /* 1834 8013B42C 08008294 */  lhu        $v0, 0x8($a0)
    /* 1838 8013B430 0A008394 */  lhu        $v1, 0xA($a0)
    /* 183C 8013B434 FDFF4A21 */  addi       $t2, $t2, -0x3 /* handwritten instruction */
    /* 1840 8013B438 02004005 */  bltz       $t2, .L8013B444
    /* 1844 8013B43C 80620C00 */   sll       $t4, $t4, 10
    /* 1848 8013B440 01000D20 */  addi       $t5, $zero, 0x1 /* handwritten instruction */
  .L8013B444:
    /* 184C 8013B444 0C008420 */  addi       $a0, $a0, 0xC /* handwritten instruction */
    /* 1850 8013B448 00140200 */  sll        $v0, $v0, 16
    /* 1854 8013B44C 25104300 */  or         $v0, $v0, $v1
    /* 1858 8013B450 25180000 */  or         $v1, $zero, $zero
    /* 185C 8013B454 0000A8A4 */  sh         $t0, 0x0($a1)
    /* 1860 8013B458 0200A9A4 */  sh         $t1, 0x2($a1)
    /* 1864 8013B45C 0200A520 */  addi       $a1, $a1, 0x2 /* handwritten instruction */
  .L8013B460:
    /* 1868 8013B460 3500A011 */  beqz       $t5, .L8013B538
    /* 186C 8013B464 82450200 */   srl       $t0, $v0, 22
    /* 1870 8013B468 FF030139 */  xori       $at, $t0, 0x3FF
    /* 1874 8013B46C 85002010 */  beqz       $at, .L8013B684
    /* 1878 8013B470 0200A520 */   addi      $a1, $a1, 0x2 /* handwritten instruction */
    /* 187C 8013B474 FDFFA121 */  addi       $at, $t5, -0x3 /* handwritten instruction */
    /* 1880 8013B478 02002004 */  bltz       $at, .L8013B484
    /* 1884 8013B47C 00FCC120 */   addi      $at, $a2, -0x400 /* handwritten instruction */
    /* 1888 8013B480 00FC2120 */  addi       $at, $at, -0x400 /* handwritten instruction */
  .L8013B484:
    /* 188C 8013B484 02460200 */  srl        $t0, $v0, 24
    /* 1890 8013B488 80400800 */  sll        $t0, $t0, 2
    /* 1894 8013B48C 20400101 */  add        $t0, $t0, $at /* handwritten instruction */
    /* 1898 8013B490 00000995 */  lhu        $t1, 0x0($t0)
    /* 189C 8013B494 02000A95 */  lhu        $t2, 0x2($t0)
    /* 18A0 8013B498 24400000 */  and        $t0, $zero, $zero
    /* 18A4 8013B49C 0A004011 */  beqz       $t2, .L8013B4C8
    /* 18A8 8013B4A0 04102201 */   sllv      $v0, $v0, $t1
    /* 18AC 8013B4A4 20000120 */  addi       $at, $zero, 0x20 /* handwritten instruction */
    /* 18B0 8013B4A8 22082A00 */  sub        $at, $at, $t2 /* handwritten instruction */
    /* 18B4 8013B4AC 06402200 */  srlv       $t0, $v0, $at
    /* 18B8 8013B4B0 04004004 */  bltz       $v0, .L8013B4C4
    /* 18BC 8013B4B4 04104201 */   sllv      $v0, $v0, $t2
    /* 18C0 8013B4B8 FFFF0B20 */  addi       $t3, $zero, -0x1 /* handwritten instruction */
    /* 18C4 8013B4BC 06582B00 */  srlv       $t3, $t3, $at
    /* 18C8 8013B4C0 22400B01 */  sub        $t0, $t0, $t3 /* handwritten instruction */
  .L8013B4C4:
    /* 18CC 8013B4C4 20186A00 */  add        $v1, $v1, $t2 /* handwritten instruction */
  .L8013B4C8:
    /* 18D0 8013B4C8 20186900 */  add        $v1, $v1, $t1 /* handwritten instruction */
    /* 18D4 8013B4CC 10006130 */  andi       $at, $v1, 0x10
    /* 18D8 8013B4D0 05002010 */  beqz       $at, .L8013B4E8
    /* 18DC 8013B4D4 0F006330 */   andi      $v1, $v1, 0xF
    /* 18E0 8013B4D8 00008994 */  lhu        $t1, 0x0($a0)
    /* 18E4 8013B4DC 02008420 */  addi       $a0, $a0, 0x2 /* handwritten instruction */
    /* 18E8 8013B4E0 04486900 */  sllv       $t1, $t1, $v1
    /* 18EC 8013B4E4 25104900 */  or         $v0, $v0, $t1
  .L8013B4E8:
    /* 18F0 8013B4E8 FEFFA121 */  addi       $at, $t5, -0x2 /* handwritten instruction */
    /* 18F4 8013B4EC 0800201C */  bgtz       $at, .L8013B510
    /* 18F8 8013B4F0 20482803 */   add       $t1, $t9, $t0 /* handwritten instruction */
    /* 18FC 8013B4F4 04002010 */  beqz       $at, .L8013B508
    /* 1900 8013B4F8 20480803 */   add       $t1, $t8, $t0 /* handwritten instruction */
    /* 1904 8013B4FC 2048E801 */  add        $t1, $t7, $t0 /* handwritten instruction */
    /* 1908 8013B500 04000010 */  b          .L8013B514
    /* 190C 8013B504 2078E801 */   add       $t7, $t7, $t0 /* handwritten instruction */
  .L8013B508:
    /* 1910 8013B508 02000010 */  b          .L8013B514
    /* 1914 8013B50C 20C00803 */   add       $t8, $t8, $t0 /* handwritten instruction */
  .L8013B510:
    /* 1918 8013B510 20C82803 */  add        $t9, $t9, $t0 /* handwritten instruction */
  .L8013B514:
    /* 191C 8013B514 80480900 */  sll        $t1, $t1, 2
    /* 1920 8013B518 FF032931 */  andi       $t1, $t1, 0x3FF
    /* 1924 8013B51C 25488901 */  or         $t1, $t4, $t1
    /* 1928 8013B520 0100AD21 */  addi       $t5, $t5, 0x1 /* handwritten instruction */
    /* 192C 8013B524 F9FFA121 */  addi       $at, $t5, -0x7 /* handwritten instruction */
    /* 1930 8013B528 11002014 */  bnez       $at, .L8013B570
    /* 1934 8013B52C 0000A9A4 */   sh        $t1, 0x0($a1)
    /* 1938 8013B530 0F000010 */  b          .L8013B570
    /* 193C 8013B534 FAFFAD21 */   addi      $t5, $t5, -0x6 /* handwritten instruction */
  .L8013B538:
    /* 1940 8013B538 FF010139 */  xori       $at, $t0, 0x1FF
    /* 1944 8013B53C 51002010 */  beqz       $at, .L8013B684
    /* 1948 8013B540 0200A520 */   addi      $a1, $a1, 0x2 /* handwritten instruction */
    /* 194C 8013B544 80120200 */  sll        $v0, $v0, 10
    /* 1950 8013B548 0A006320 */  addi       $v1, $v1, 0xA /* handwritten instruction */
    /* 1954 8013B54C 10006130 */  andi       $at, $v1, 0x10
    /* 1958 8013B550 05002010 */  beqz       $at, .L8013B568
    /* 195C 8013B554 0F006330 */   andi      $v1, $v1, 0xF
    /* 1960 8013B558 00008994 */  lhu        $t1, 0x0($a0)
    /* 1964 8013B55C 02008420 */  addi       $a0, $a0, 0x2 /* handwritten instruction */
    /* 1968 8013B560 04486900 */  sllv       $t1, $t1, $v1
    /* 196C 8013B564 25104900 */  or         $v0, $v0, $t1
  .L8013B568:
    /* 1970 8013B568 25408801 */  or         $t0, $t4, $t0
    /* 1974 8013B56C 0000A8A4 */  sh         $t0, 0x0($a1)
  .L8013B570:
    /* 1978 8013B570 2308AE00 */  subu       $at, $a1, $t6
    /* 197C 8013B574 50002104 */  bgez       $at, .L8013B6B8
    /* 1980 8013B578 0200A520 */   addi      $a1, $a1, 0x2 /* handwritten instruction */
  .L8013B57C:
    /* 1984 8013B57C C2440200 */  srl        $t0, $v0, 19
    /* 1988 8013B580 C0400800 */  sll        $t0, $t0, 3
    /* 198C 8013B584 20400601 */  add        $t0, $t0, $a2 /* handwritten instruction */
    /* 1990 8013B588 0000098D */  lw         $t1, 0x0($t0)
    /* 1994 8013B58C 00000000 */  nop
    /* 1998 8013B590 11002015 */  bnez       $t1, .L8013B5D8
    /* 199C 8013B594 FF002131 */   andi      $at, $t1, 0xFF
    /* 19A0 8013B598 00120200 */  sll        $v0, $v0, 8
    /* 19A4 8013B59C 08006320 */  addi       $v1, $v1, 0x8 /* handwritten instruction */
    /* 19A8 8013B5A0 10006130 */  andi       $at, $v1, 0x10
    /* 19AC 8013B5A4 05002010 */  beqz       $at, .L8013B5BC
    /* 19B0 8013B5A8 0F006330 */   andi      $v1, $v1, 0xF
    /* 19B4 8013B5AC 00008894 */  lhu        $t0, 0x0($a0)
    /* 19B8 8013B5B0 02008420 */  addi       $a0, $a0, 0x2 /* handwritten instruction */
    /* 19BC 8013B5B4 04406800 */  sllv       $t0, $t0, $v1
    /* 19C0 8013B5B8 25104800 */  or         $v0, $v0, $t0
  .L8013B5BC:
    /* 19C4 8013B5BC C2450200 */  srl        $t0, $v0, 23
    /* 19C8 8013B5C0 80400800 */  sll        $t0, $t0, 2
    /* 19CC 8013B5C4 20400701 */  add        $t0, $t0, $a3 /* handwritten instruction */
    /* 19D0 8013B5C8 0000098D */  lw         $t1, 0x0($t0)
    /* 19D4 8013B5CC 20580000 */  add        $t3, $zero, $zero /* handwritten instruction */
    /* 19D8 8013B5D0 02000010 */  b          .L8013B5DC
    /* 19DC 8013B5D4 FF002131 */   andi      $at, $t1, 0xFF
  .L8013B5D8:
    /* 19E0 8013B5D8 04000B8D */  lw         $t3, 0x4($t0)
  .L8013B5DC:
    /* 19E4 8013B5DC 04102200 */  sllv       $v0, $v0, $at
    /* 19E8 8013B5E0 20186100 */  add        $v1, $v1, $at /* handwritten instruction */
    /* 19EC 8013B5E4 10006130 */  andi       $at, $v1, 0x10
    /* 19F0 8013B5E8 05002010 */  beqz       $at, .L8013B600
    /* 19F4 8013B5EC 0F006330 */   andi      $v1, $v1, 0xF
    /* 19F8 8013B5F0 00008894 */  lhu        $t0, 0x0($a0)
    /* 19FC 8013B5F4 02008420 */  addi       $a0, $a0, 0x2 /* handwritten instruction */
    /* 1A00 8013B5F8 04406800 */  sllv       $t0, $t0, $v1
    /* 1A04 8013B5FC 25104800 */  or         $v0, $v0, $t0
  .L8013B600:
    /* 1A08 8013B600 024C0900 */  srl        $t1, $t1, 16
    /* 1A0C 8013B604 1F7C2139 */  xori       $at, $t1, 0x7C1F
    /* 1A10 8013B608 15002010 */  beqz       $at, .L8013B660
    /* 1A14 8013B60C 00FE2139 */   xori      $at, $t1, 0xFE00
    /* 1A18 8013B610 93FF2010 */  beqz       $at, .L8013B460
    /* 1A1C 8013B614 0000A9A4 */   sh        $t1, 0x0($a1)
    /* 1A20 8013B618 D8FF6011 */  beqz       $t3, .L8013B57C
    /* 1A24 8013B61C 0200A520 */   addi      $a1, $a1, 0x2 /* handwritten instruction */
    /* 1A28 8013B620 FFFF6A31 */  andi       $t2, $t3, 0xFFFF
    /* 1A2C 8013B624 1F7C4139 */  xori       $at, $t2, 0x7C1F
    /* 1A30 8013B628 0D002010 */  beqz       $at, .L8013B660
    /* 1A34 8013B62C 00FE4139 */   xori      $at, $t2, 0xFE00
    /* 1A38 8013B630 8BFF2010 */  beqz       $at, .L8013B460
    /* 1A3C 8013B634 0000AAA4 */   sh        $t2, 0x0($a1)
    /* 1A40 8013B638 02540B00 */  srl        $t2, $t3, 16
    /* 1A44 8013B63C CFFF4011 */  beqz       $t2, .L8013B57C
    /* 1A48 8013B640 0200A520 */   addi      $a1, $a1, 0x2 /* handwritten instruction */
    /* 1A4C 8013B644 1F7C4139 */  xori       $at, $t2, 0x7C1F
    /* 1A50 8013B648 05002010 */  beqz       $at, .L8013B660
    /* 1A54 8013B64C 00FE4139 */   xori      $at, $t2, 0xFE00
    /* 1A58 8013B650 83FF2010 */  beqz       $at, .L8013B460
    /* 1A5C 8013B654 0000AAA4 */   sh        $t2, 0x0($a1)
    /* 1A60 8013B658 C8FF0010 */  b          .L8013B57C
    /* 1A64 8013B65C 0200A520 */   addi      $a1, $a1, 0x2 /* handwritten instruction */
  .L8013B660:
    /* 1A68 8013B660 02440200 */  srl        $t0, $v0, 16
    /* 1A6C 8013B664 0000A8A4 */  sh         $t0, 0x0($a1)
    /* 1A70 8013B668 0200A520 */  addi       $a1, $a1, 0x2 /* handwritten instruction */
    /* 1A74 8013B66C 00008894 */  lhu        $t0, 0x0($a0)
    /* 1A78 8013B670 02008420 */  addi       $a0, $a0, 0x2 /* handwritten instruction */
    /* 1A7C 8013B674 00140200 */  sll        $v0, $v0, 16
    /* 1A80 8013B678 04406800 */  sllv       $t0, $t0, $v1
    /* 1A84 8013B67C BFFF0010 */  b          .L8013B57C
    /* 1A88 8013B680 25104800 */   or        $v0, $v0, $t0
  .L8013B684:
    /* 1A8C 8013B684 00FE0834 */  ori        $t0, $zero, 0xFE00
    /* 1A90 8013B688 40000220 */  addi       $v0, $zero, 0x40 /* handwritten instruction */
  .L8013B68C:
    /* 1A94 8013B68C 0000A8A4 */  sh         $t0, 0x0($a1)
    /* 1A98 8013B690 0200A520 */  addi       $a1, $a1, 0x2 /* handwritten instruction */
    /* 1A9C 8013B694 FDFF4014 */  bnez       $v0, .L8013B68C
    /* 1AA0 8013B698 FFFF4220 */   addi      $v0, $v0, -0x1 /* handwritten instruction */
    /* 1AA4 8013B69C 00600940 */  mfc0       $t1, $12 /* handwritten instruction */
    /* 1AA8 8013B6A0 00000000 */  nop
    /* 1AAC 8013B6A4 0200013C */  lui        $at, (0x20000 >> 16)
    /* 1AB0 8013B6A8 25482101 */  or         $t1, $t1, $at
    /* 1AB4 8013B6AC 00608940 */  mtc0       $t1, $12 /* handwritten instruction */
    /* 1AB8 8013B6B0 0800E003 */  jr         $ra
    /* 1ABC 8013B6B4 20100000 */   add       $v0, $zero, $zero /* handwritten instruction */
  .L8013B6B8:
    /* 1AC0 8013B6B8 1480083C */  lui        $t0, %hi(D_80139DFC)
    /* 1AC4 8013B6BC FC9D0825 */  addiu      $t0, $t0, %lo(D_80139DFC)
    /* 1AC8 8013B6C0 000004AD */  sw         $a0, 0x0($t0)
    /* 1ACC 8013B6C4 040005AD */  sw         $a1, 0x4($t0)
    /* 1AD0 8013B6C8 080002AD */  sw         $v0, 0x8($t0)
    /* 1AD4 8013B6CC 0C0003AD */  sw         $v1, 0xC($t0)
    /* 1AD8 8013B6D0 10000CAD */  sw         $t4, 0x10($t0)
    /* 1ADC 8013B6D4 14000DAD */  sw         $t5, 0x14($t0)
    /* 1AE0 8013B6D8 18000FAD */  sw         $t7, 0x18($t0)
    /* 1AE4 8013B6DC 1C0018AD */  sw         $t8, 0x1C($t0)
    /* 1AE8 8013B6E0 200019AD */  sw         $t9, 0x20($t0)
    /* 1AEC 8013B6E4 0800E003 */  jr         $ra
    /* 1AF0 8013B6E8 01000220 */   addi      $v0, $zero, 0x1 /* handwritten instruction */
endlabel func_8013B3B0
