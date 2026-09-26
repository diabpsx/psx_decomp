.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MonsterTrapHit__FiiiiiUc, 0x384

glabel MonsterTrapHit__FiiiiiUc
    /* 1454 8013B04C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1458 8013B050 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 145C 8013B054 21888000 */  addu       $s1, $a0, $zero
    /* 1460 8013B058 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1464 8013B05C 21A8A000 */  addu       $s5, $a1, $zero
    /* 1468 8013B060 3400B7AF */  sw         $s7, 0x34($sp)
    /* 146C 8013B064 21B8C000 */  addu       $s7, $a2, $zero
    /* 1470 8013B068 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1474 8013B06C 2180E000 */  addu       $s0, $a3, $zero
    /* 1478 8013B070 2800B4AF */  sw         $s4, 0x28($sp)
    /* 147C 8013B074 40101100 */  sll        $v0, $s1, 1
    /* 1480 8013B078 21105100 */  addu       $v0, $v0, $s1
    /* 1484 8013B07C 80100200 */  sll        $v0, $v0, 2
    /* 1488 8013B080 21105100 */  addu       $v0, $v0, $s1
    /* 148C 8013B084 5000A58F */  lw         $a1, 0x50($sp)
    /* 1490 8013B088 C0200200 */  sll        $a0, $v0, 3
    /* 1494 8013B08C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 1498 8013B090 3000B6AF */  sw         $s6, 0x30($sp)
    /* 149C 8013B094 2400B3AF */  sw         $s3, 0x24($sp)
    /* 14A0 8013B098 2000B2AF */  sw         $s2, 0x20($sp)
    /* 14A4 8013B09C 1080013C */  lui        $at, %hi(monster)
    /* 14A8 8013B0A0 21082400 */  addu       $at, $at, $a0
    /* 14AC 8013B0A4 9453228C */  lw         $v0, %lo(monster)($at)
    /* 14B0 8013B0A8 5400B693 */  lbu        $s6, 0x54($sp)
    /* 14B4 8013B0AC 20004014 */  bnez       $v0, .L8013B130
    /* 14B8 8013B0B0 21A00000 */   addu      $s4, $zero, $zero
    /* 14BC 8013B0B4 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 14C0 8013B0B8 21082400 */  addu       $at, $at, $a0
    /* 14C4 8013B0BC A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 14C8 8013B0C0 00000000 */  nop
    /* 14CC 8013B0C4 83110200 */  sra        $v0, $v0, 6
    /* 14D0 8013B0C8 B5004018 */  blez       $v0, .L8013B3A0
    /* 14D4 8013B0CC 21100000 */   addu      $v0, $zero, $zero
    /* 14D8 8013B0D0 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 14DC 8013B0D4 21082400 */  addu       $at, $at, $a0
    /* 14E0 8013B0D8 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 14E4 8013B0DC 00000000 */  nop
    /* 14E8 8013B0E0 12004390 */  lbu        $v1, 0x12($v0)
    /* 14EC 8013B0E4 20000224 */  addiu      $v0, $zero, 0x20
    /* 14F0 8013B0E8 07006214 */  bne        $v1, $v0, .L8013B108
    /* 14F4 8013B0EC 40101100 */   sll       $v0, $s1, 1
    /* 14F8 8013B0F0 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 14FC 8013B0F4 21082400 */  addu       $at, $at, $a0
    /* 1500 8013B0F8 DD532390 */  lbu        $v1, %lo(monster + 0x49)($at)
    /* 1504 8013B0FC 02000224 */  addiu      $v0, $zero, 0x2
    /* 1508 8013B100 0B006210 */  beq        $v1, $v0, .L8013B130
    /* 150C 8013B104 40101100 */   sll       $v0, $s1, 1
  .L8013B108:
    /* 1510 8013B108 21105100 */  addu       $v0, $v0, $s1
    /* 1514 8013B10C 80100200 */  sll        $v0, $v0, 2
    /* 1518 8013B110 21105100 */  addu       $v0, $v0, $s1
    /* 151C 8013B114 C0200200 */  sll        $a0, $v0, 3
    /* 1520 8013B118 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1524 8013B11C 21082400 */  addu       $at, $at, $a0
    /* 1528 8013B120 C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 152C 8013B124 0E000224 */  addiu      $v0, $zero, 0xE
    /* 1530 8013B128 03006214 */  bne        $v1, $v0, .L8013B138
    /* 1534 8013B12C 40100500 */   sll       $v0, $a1, 1
  .L8013B130:
    /* 1538 8013B130 E8EC0408 */  j          .L8013B3A0
    /* 153C 8013B134 21100000 */   addu      $v0, $zero, $zero
  .L8013B138:
    /* 1540 8013B138 21104500 */  addu       $v0, $v0, $a1
    /* 1544 8013B13C C0100200 */  sll        $v0, $v0, 3
    /* 1548 8013B140 1080013C */  lui        $at, %hi(monster + 0x30)
    /* 154C 8013B144 21082400 */  addu       $at, $at, $a0
    /* 1550 8013B148 C4532494 */  lhu        $a0, %lo(monster + 0x30)($at)
    /* 1554 8013B14C 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* 1558 8013B150 21082200 */  addu       $at, $at, $v0
    /* 155C 8013B154 FE672590 */  lbu        $a1, %lo(missiledata + 0xE)($at)
    /* 1560 8013B158 08008330 */  andi       $v1, $a0, 0x8
    /* 1564 8013B15C 03006010 */  beqz       $v1, .L8013B16C
    /* 1568 8013B160 03000224 */   addiu     $v0, $zero, 0x3
    /* 156C 8013B164 8E00A210 */  beq        $a1, $v0, .L8013B3A0
    /* 1570 8013B168 01000224 */   addiu     $v0, $zero, 0x1
  .L8013B16C:
    /* 1574 8013B16C 10008230 */  andi       $v0, $a0, 0x10
    /* 1578 8013B170 03004010 */  beqz       $v0, .L8013B180
    /* 157C 8013B174 01000224 */   addiu     $v0, $zero, 0x1
    /* 1580 8013B178 8900A210 */  beq        $a1, $v0, .L8013B3A0
    /* 1584 8013B17C 00000000 */   nop
  .L8013B180:
    /* 1588 8013B180 20008230 */  andi       $v0, $a0, 0x20
    /* 158C 8013B184 03004010 */  beqz       $v0, .L8013B194
    /* 1590 8013B188 02000224 */   addiu     $v0, $zero, 0x2
    /* 1594 8013B18C 8400A210 */  beq        $a1, $v0, .L8013B3A0
    /* 1598 8013B190 01000224 */   addiu     $v0, $zero, 0x1
  .L8013B194:
    /* 159C 8013B194 01008230 */  andi       $v0, $a0, 0x1
    /* 15A0 8013B198 03004010 */  beqz       $v0, .L8013B1A8
    /* 15A4 8013B19C 03000224 */   addiu     $v0, $zero, 0x3
    /* 15A8 8013B1A0 0B00A210 */  beq        $a1, $v0, .L8013B1D0
    /* 15AC 8013B1A4 00000000 */   nop
  .L8013B1A8:
    /* 15B0 8013B1A8 02008230 */  andi       $v0, $a0, 0x2
    /* 15B4 8013B1AC 03004010 */  beqz       $v0, .L8013B1BC
    /* 15B8 8013B1B0 01000224 */   addiu     $v0, $zero, 0x1
    /* 15BC 8013B1B4 0600A210 */  beq        $a1, $v0, .L8013B1D0
    /* 15C0 8013B1B8 00000000 */   nop
  .L8013B1BC:
    /* 15C4 8013B1BC 04008230 */  andi       $v0, $a0, 0x4
    /* 15C8 8013B1C0 04004010 */  beqz       $v0, .L8013B1D4
    /* 15CC 8013B1C4 02000224 */   addiu     $v0, $zero, 0x2
    /* 15D0 8013B1C8 0200A214 */  bne        $a1, $v0, .L8013B1D4
    /* 15D4 8013B1CC 00000000 */   nop
  .L8013B1D0:
    /* 15D8 8013B1D0 01001424 */  addiu      $s4, $zero, 0x1
  .L8013B1D4:
    /* 15DC 8013B1D4 C9F6000C */  jal        ENG_random__Fl
    /* 15E0 8013B1D8 64000424 */   addiu     $a0, $zero, 0x64
    /* 15E4 8013B1DC 5A000424 */  addiu      $a0, $zero, 0x5A
    /* 15E8 8013B1E0 40181100 */  sll        $v1, $s1, 1
    /* 15EC 8013B1E4 21187100 */  addu       $v1, $v1, $s1
    /* 15F0 8013B1E8 80180300 */  sll        $v1, $v1, 2
    /* 15F4 8013B1EC 21187100 */  addu       $v1, $v1, $s1
    /* 15F8 8013B1F0 C0900300 */  sll        $s2, $v1, 3
    /* 15FC 8013B1F4 1080013C */  lui        $at, %hi(monster + 0x48)
    /* 1600 8013B1F8 21083200 */  addu       $at, $at, $s2
    /* 1604 8013B1FC DC532380 */  lb         $v1, %lo(monster + 0x48)($at)
    /* 1608 8013B200 23209000 */  subu       $a0, $a0, $s0
    /* 160C 8013B204 21984000 */  addu       $s3, $v0, $zero
    /* 1610 8013B208 23808300 */  subu       $s0, $a0, $v1
    /* 1614 8013B20C 0500022A */  slti       $v0, $s0, 0x5
    /* 1618 8013B210 03004010 */  beqz       $v0, .L8013B220
    /* 161C 8013B214 6000022A */   slti      $v0, $s0, 0x60
    /* 1620 8013B218 05001024 */  addiu      $s0, $zero, 0x5
    /* 1624 8013B21C 6000022A */  slti       $v0, $s0, 0x60
  .L8013B220:
    /* 1628 8013B220 02004014 */  bnez       $v0, .L8013B22C
    /* 162C 8013B224 21202002 */   addu      $a0, $s1, $zero
    /* 1630 8013B228 5F001024 */  addiu      $s0, $zero, 0x5F
  .L8013B22C:
    /* 1634 8013B22C 635A050C */  jal        CheckMonsterHit__FiRUc
    /* 1638 8013B230 1000A527 */   addiu     $a1, $sp, 0x10
    /* 163C 8013B234 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1640 8013B238 04004010 */  beqz       $v0, .L8013B24C
    /* 1644 8013B23C 2A107002 */   slt       $v0, $s3, $s0
    /* 1648 8013B240 1000A293 */  lbu        $v0, 0x10($sp)
    /* 164C 8013B244 E8EC0408 */  j          .L8013B3A0
    /* 1650 8013B248 00000000 */   nop
  .L8013B24C:
    /* 1654 8013B24C 08004014 */  bnez       $v0, .L8013B270
    /* 1658 8013B250 2320F502 */   subu      $a0, $s7, $s5
    /* 165C 8013B254 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1660 8013B258 21083200 */  addu       $at, $at, $s2
    /* 1664 8013B25C C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 1668 8013B260 0F000224 */  addiu      $v0, $zero, 0xF
    /* 166C 8013B264 4E006214 */  bne        $v1, $v0, .L8013B3A0
    /* 1670 8013B268 01000224 */   addiu     $v0, $zero, 0x1
    /* 1674 8013B26C 2320F502 */  subu       $a0, $s7, $s5
  .L8013B270:
    /* 1678 8013B270 C9F6000C */  jal        ENG_random__Fl
    /* 167C 8013B274 01008424 */   addiu     $a0, $a0, 0x1
    /* 1680 8013B278 0200C016 */  bnez       $s6, .L8013B284
    /* 1684 8013B27C 21305500 */   addu      $a2, $v0, $s5
    /* 1688 8013B280 80310600 */  sll        $a2, $a2, 6
  .L8013B284:
    /* 168C 8013B284 FF008232 */  andi       $v0, $s4, 0xFF
    /* 1690 8013B288 06004010 */  beqz       $v0, .L8013B2A4
    /* 1694 8013B28C 83180600 */   sra       $v1, $a2, 2
    /* 1698 8013B290 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 169C 8013B294 21083200 */  addu       $at, $at, $s2
    /* 16A0 8013B298 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 16A4 8013B29C AEEC0408 */  j          .L8013B2B8
    /* 16A8 8013B2A0 23104300 */   subu      $v0, $v0, $v1
  .L8013B2A4:
    /* 16AC 8013B2A4 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 16B0 8013B2A8 21083200 */  addu       $at, $at, $s2
    /* 16B4 8013B2AC A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 16B8 8013B2B0 00000000 */  nop
    /* 16BC 8013B2B4 23104600 */  subu       $v0, $v0, $a2
  .L8013B2B8:
    /* 16C0 8013B2B8 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 16C4 8013B2BC 21083200 */  addu       $at, $at, $s2
    /* 16C8 8013B2C0 A45322AC */  sw         $v0, %lo(monster + 0x10)($at)
    /* 16CC 8013B2C4 40101100 */  sll        $v0, $s1, 1
    /* 16D0 8013B2C8 21105100 */  addu       $v0, $v0, $s1
    /* 16D4 8013B2CC 80100200 */  sll        $v0, $v0, 2
    /* 16D8 8013B2D0 21105100 */  addu       $v0, $v0, $s1
    /* 16DC 8013B2D4 C0800200 */  sll        $s0, $v0, 3
    /* 16E0 8013B2D8 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 16E4 8013B2DC 21083000 */  addu       $at, $at, $s0
    /* 16E8 8013B2E0 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 16EC 8013B2E4 00000000 */  nop
    /* 16F0 8013B2E8 83110200 */  sra        $v0, $v0, 6
    /* 16F4 8013B2EC 0F00401C */  bgtz       $v0, .L8013B32C
    /* 16F8 8013B2F0 FF008232 */   andi      $v0, $s4, 0xFF
    /* 16FC 8013B2F4 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1700 8013B2F8 21083000 */  addu       $at, $at, $s0
    /* 1704 8013B2FC C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 1708 8013B300 0F000224 */  addiu      $v0, $zero, 0xF
    /* 170C 8013B304 05006214 */  bne        $v1, $v0, .L8013B31C
    /* 1710 8013B308 21202002 */   addu      $a0, $s1, $zero
    /* 1714 8013B30C F630050C */  jal        M_StartKill__Fii
    /* 1718 8013B310 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 171C 8013B314 DDEC0408 */  j          .L8013B374
    /* 1720 8013B318 0F000224 */   addiu     $v0, $zero, 0xF
  .L8013B31C:
    /* 1724 8013B31C F630050C */  jal        M_StartKill__Fii
    /* 1728 8013B320 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 172C 8013B324 E8EC0408 */  j          .L8013B3A0
    /* 1730 8013B328 01000224 */   addiu     $v0, $zero, 0x1
  .L8013B32C:
    /* 1734 8013B32C 05004010 */  beqz       $v0, .L8013B344
    /* 1738 8013B330 21202002 */   addu      $a0, $s1, $zero
    /* 173C 8013B334 4AF5000C */  jal        PlayEffect__Fii
    /* 1740 8013B338 01000524 */   addiu     $a1, $zero, 0x1
    /* 1744 8013B33C E8EC0408 */  j          .L8013B3A0
    /* 1748 8013B340 01000224 */   addiu     $v0, $zero, 0x1
  .L8013B344:
    /* 174C 8013B344 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1750 8013B348 21083000 */  addu       $at, $at, $s0
    /* 1754 8013B34C C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 1758 8013B350 0F000224 */  addiu      $v0, $zero, 0xF
    /* 175C 8013B354 0C006214 */  bne        $v1, $v0, .L8013B388
    /* 1760 8013B358 0400222A */   slti      $v0, $s1, 0x4
    /* 1764 8013B35C 05004014 */  bnez       $v0, .L8013B374
    /* 1768 8013B360 0F000224 */   addiu     $v0, $zero, 0xF
    /* 176C 8013B364 21202002 */  addu       $a0, $s1, $zero
    /* 1770 8013B368 B62C050C */  jal        M_StartHit__Fiii
    /* 1774 8013B36C FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 1778 8013B370 0F000224 */  addiu      $v0, $zero, 0xF
  .L8013B374:
    /* 177C 8013B374 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1780 8013B378 21083000 */  addu       $at, $at, $s0
    /* 1784 8013B37C C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 1788 8013B380 E8EC0408 */  j          .L8013B3A0
    /* 178C 8013B384 01000224 */   addiu     $v0, $zero, 0x1
  .L8013B388:
    /* 1790 8013B388 05004014 */  bnez       $v0, .L8013B3A0
    /* 1794 8013B38C 01000224 */   addiu     $v0, $zero, 0x1
    /* 1798 8013B390 21202002 */  addu       $a0, $s1, $zero
    /* 179C 8013B394 B62C050C */  jal        M_StartHit__Fiii
    /* 17A0 8013B398 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 17A4 8013B39C 01000224 */  addiu      $v0, $zero, 0x1
  .L8013B3A0:
    /* 17A8 8013B3A0 3800BF8F */  lw         $ra, 0x38($sp)
    /* 17AC 8013B3A4 3400B78F */  lw         $s7, 0x34($sp)
    /* 17B0 8013B3A8 3000B68F */  lw         $s6, 0x30($sp)
    /* 17B4 8013B3AC 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 17B8 8013B3B0 2800B48F */  lw         $s4, 0x28($sp)
    /* 17BC 8013B3B4 2400B38F */  lw         $s3, 0x24($sp)
    /* 17C0 8013B3B8 2000B28F */  lw         $s2, 0x20($sp)
    /* 17C4 8013B3BC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 17C8 8013B3C0 1800B08F */  lw         $s0, 0x18($sp)
    /* 17CC 8013B3C4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 17D0 8013B3C8 0800E003 */  jr         $ra
    /* 17D4 8013B3CC 00000000 */   nop
endlabel MonsterTrapHit__FiiiiiUc
