.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MonsterMHit__FiiiiiiUc, 0x31C

glabel MonsterMHit__FiiiiiiUc
    /* 17D8 8013B3D0 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 17DC 8013B3D4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 17E0 8013B3D8 21988000 */  addu       $s3, $a0, $zero
    /* 17E4 8013B3DC 2800B2AF */  sw         $s2, 0x28($sp)
    /* 17E8 8013B3E0 2190A000 */  addu       $s2, $a1, $zero
    /* 17EC 8013B3E4 3800B6AF */  sw         $s6, 0x38($sp)
    /* 17F0 8013B3E8 21B0C000 */  addu       $s6, $a2, $zero
    /* 17F4 8013B3EC 4000BEAF */  sw         $fp, 0x40($sp)
    /* 17F8 8013B3F0 21F0E000 */  addu       $fp, $a3, $zero
    /* 17FC 8013B3F4 40101200 */  sll        $v0, $s2, 1
    /* 1800 8013B3F8 21105200 */  addu       $v0, $v0, $s2
    /* 1804 8013B3FC 80100200 */  sll        $v0, $v0, 2
    /* 1808 8013B400 2000B0AF */  sw         $s0, 0x20($sp)
    /* 180C 8013B404 5800B08F */  lw         $s0, 0x58($sp)
    /* 1810 8013B408 21105200 */  addu       $v0, $v0, $s2
    /* 1814 8013B40C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 1818 8013B410 5C00B48F */  lw         $s4, 0x5C($sp)
    /* 181C 8013B414 C0200200 */  sll        $a0, $v0, 3
    /* 1820 8013B418 4400BFAF */  sw         $ra, 0x44($sp)
    /* 1824 8013B41C 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 1828 8013B420 3400B5AF */  sw         $s5, 0x34($sp)
    /* 182C 8013B424 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1830 8013B428 1080013C */  lui        $at, %hi(monster)
    /* 1834 8013B42C 21082400 */  addu       $at, $at, $a0
    /* 1838 8013B430 9453228C */  lw         $v0, %lo(monster)($at)
    /* 183C 8013B434 6000A893 */  lbu        $t0, 0x60($sp)
    /* 1840 8013B438 21B80000 */  addu       $s7, $zero, $zero
    /* 1844 8013B43C 53004014 */  bnez       $v0, .L8013B58C
    /* 1848 8013B440 1800A8A3 */   sb        $t0, 0x18($sp)
    /* 184C 8013B444 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1850 8013B448 21082400 */  addu       $at, $at, $a0
    /* 1854 8013B44C A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 1858 8013B450 00000000 */  nop
    /* 185C 8013B454 83110200 */  sra        $v0, $v0, 6
    /* 1860 8013B458 4C004018 */  blez       $v0, .L8013B58C
    /* 1864 8013B45C 35000224 */   addiu     $v0, $zero, 0x35
    /* 1868 8013B460 12008216 */  bne        $s4, $v0, .L8013B4AC
    /* 186C 8013B464 40101200 */   sll       $v0, $s2, 1
    /* 1870 8013B468 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1874 8013B46C 21082400 */  addu       $at, $at, $a0
    /* 1878 8013B470 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 187C 8013B474 00000000 */  nop
    /* 1880 8013B478 12004390 */  lbu        $v1, 0x12($v0)
    /* 1884 8013B47C 6E000224 */  addiu      $v0, $zero, 0x6E
    /* 1888 8013B480 0A006210 */  beq        $v1, $v0, .L8013B4AC
    /* 188C 8013B484 40101200 */   sll       $v0, $s2, 1
    /* 1890 8013B488 1080013C */  lui        $at, %hi(monster + 0x64)
    /* 1894 8013B48C 21082400 */  addu       $at, $at, $a0
    /* 1898 8013B490 F853228C */  lw         $v0, %lo(monster + 0x64)($at)
    /* 189C 8013B494 00000000 */  nop
    /* 18A0 8013B498 2E004280 */  lb         $v0, 0x2E($v0)
    /* 18A4 8013B49C 00000000 */  nop
    /* 18A8 8013B4A0 AE014014 */  bnez       $v0, D_8013BB5C
    /* 18AC 8013B4A4 21100000 */   addu      $v0, $zero, $zero
    /* 18B0 8013B4A8 40101200 */  sll        $v0, $s2, 1
  .L8013B4AC:
    /* 18B4 8013B4AC 21105200 */  addu       $v0, $v0, $s2
    /* 18B8 8013B4B0 80100200 */  sll        $v0, $v0, 2
    /* 18BC 8013B4B4 21105200 */  addu       $v0, $v0, $s2
    /* 18C0 8013B4B8 C0200200 */  sll        $a0, $v0, 3
    /* 18C4 8013B4BC 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 18C8 8013B4C0 21082400 */  addu       $at, $at, $a0
    /* 18CC 8013B4C4 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 18D0 8013B4C8 00000000 */  nop
    /* 18D4 8013B4CC 12004390 */  lbu        $v1, 0x12($v0)
    /* 18D8 8013B4D0 20000224 */  addiu      $v0, $zero, 0x20
    /* 18DC 8013B4D4 07006214 */  bne        $v1, $v0, .L8013B4F4
    /* 18E0 8013B4D8 40101200 */   sll       $v0, $s2, 1
    /* 18E4 8013B4DC 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 18E8 8013B4E0 21082400 */  addu       $at, $at, $a0
    /* 18EC 8013B4E4 DD532390 */  lbu        $v1, %lo(monster + 0x49)($at)
    /* 18F0 8013B4E8 02000224 */  addiu      $v0, $zero, 0x2
    /* 18F4 8013B4EC 27006210 */  beq        $v1, $v0, .L8013B58C
    /* 18F8 8013B4F0 40101200 */   sll       $v0, $s2, 1
  .L8013B4F4:
    /* 18FC 8013B4F4 21105200 */  addu       $v0, $v0, $s2
    /* 1900 8013B4F8 80100200 */  sll        $v0, $v0, 2
    /* 1904 8013B4FC 21105200 */  addu       $v0, $v0, $s2
    /* 1908 8013B500 C0200200 */  sll        $a0, $v0, 3
    /* 190C 8013B504 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1910 8013B508 21082400 */  addu       $at, $at, $a0
    /* 1914 8013B50C C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 1918 8013B510 0E000224 */  addiu      $v0, $zero, 0xE
    /* 191C 8013B514 1D006210 */  beq        $v1, $v0, .L8013B58C
    /* 1920 8013B518 40101400 */   sll       $v0, $s4, 1
    /* 1924 8013B51C 21105400 */  addu       $v0, $v0, $s4
    /* 1928 8013B520 C0100200 */  sll        $v0, $v0, 3
    /* 192C 8013B524 1080013C */  lui        $at, %hi(monster + 0x30)
    /* 1930 8013B528 21082400 */  addu       $at, $at, $a0
    /* 1934 8013B52C C4532494 */  lhu        $a0, %lo(monster + 0x30)($at)
    /* 1938 8013B530 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* 193C 8013B534 21082200 */  addu       $at, $at, $v0
    /* 1940 8013B538 FE672590 */  lbu        $a1, %lo(missiledata + 0xE)($at)
    /* 1944 8013B53C 08008330 */  andi       $v1, $a0, 0x8
    /* 1948 8013B540 03006010 */  beqz       $v1, .L8013B550
    /* 194C 8013B544 03000224 */   addiu     $v0, $zero, 0x3
    /* 1950 8013B548 8401A210 */  beq        $a1, $v0, D_8013BB5C
    /* 1954 8013B54C 21100000 */   addu      $v0, $zero, $zero
  .L8013B550:
    /* 1958 8013B550 10008230 */  andi       $v0, $a0, 0x10
    /* 195C 8013B554 03004010 */  beqz       $v0, .L8013B564
    /* 1960 8013B558 01000224 */   addiu     $v0, $zero, 0x1
    /* 1964 8013B55C 7F01A210 */  beq        $a1, $v0, D_8013BB5C
    /* 1968 8013B560 21100000 */   addu      $v0, $zero, $zero
  .L8013B564:
    /* 196C 8013B564 20008230 */  andi       $v0, $a0, 0x20
    /* 1970 8013B568 03004010 */  beqz       $v0, .L8013B578
    /* 1974 8013B56C 02000224 */   addiu     $v0, $zero, 0x2
    /* 1978 8013B570 7A01A210 */  beq        $a1, $v0, D_8013BB5C
    /* 197C 8013B574 21100000 */   addu      $v0, $zero, $zero
  .L8013B578:
    /* 1980 8013B578 80008230 */  andi       $v0, $a0, 0x80
    /* 1984 8013B57C 05004010 */  beqz       $v0, .L8013B594
    /* 1988 8013B580 04000224 */   addiu     $v0, $zero, 0x4
    /* 198C 8013B584 0400A214 */  bne        $a1, $v0, .L8013B598
    /* 1990 8013B588 01008230 */   andi      $v0, $a0, 0x1
  .L8013B58C:
    /* 1994 8013B58C D7EE0408 */  j          D_8013BB5C
    /* 1998 8013B590 21100000 */   addu      $v0, $zero, $zero
  .L8013B594:
    /* 199C 8013B594 01008230 */  andi       $v0, $a0, 0x1
  .L8013B598:
    /* 19A0 8013B598 03004010 */  beqz       $v0, .L8013B5A8
    /* 19A4 8013B59C 03000224 */   addiu     $v0, $zero, 0x3
    /* 19A8 8013B5A0 0B00A210 */  beq        $a1, $v0, .L8013B5D0
    /* 19AC 8013B5A4 00000000 */   nop
  .L8013B5A8:
    /* 19B0 8013B5A8 02008230 */  andi       $v0, $a0, 0x2
    /* 19B4 8013B5AC 03004010 */  beqz       $v0, .L8013B5BC
    /* 19B8 8013B5B0 01000224 */   addiu     $v0, $zero, 0x1
    /* 19BC 8013B5B4 0600A210 */  beq        $a1, $v0, .L8013B5D0
    /* 19C0 8013B5B8 00000000 */   nop
  .L8013B5BC:
    /* 19C4 8013B5BC 04008230 */  andi       $v0, $a0, 0x4
    /* 19C8 8013B5C0 04004010 */  beqz       $v0, .L8013B5D4
    /* 19CC 8013B5C4 02000224 */   addiu     $v0, $zero, 0x2
    /* 19D0 8013B5C8 0200A214 */  bne        $a1, $v0, .L8013B5D4
    /* 19D4 8013B5CC 00000000 */   nop
  .L8013B5D0:
    /* 19D8 8013B5D0 01001724 */  addiu      $s7, $zero, 0x1
  .L8013B5D4:
    /* 19DC 8013B5D4 C9F6000C */  jal        ENG_random__Fl
    /* 19E0 8013B5D8 64000424 */   addiu     $a0, $zero, 0x64
    /* 19E4 8013B5DC 40181400 */  sll        $v1, $s4, 1
    /* 19E8 8013B5E0 21187400 */  addu       $v1, $v1, $s4
    /* 19EC 8013B5E4 C0180300 */  sll        $v1, $v1, 3
    /* 19F0 8013B5E8 0D80013C */  lui        $at, %hi(missiledata + 0xD)
    /* 19F4 8013B5EC 21082300 */  addu       $at, $at, $v1
    /* 19F8 8013B5F0 FD672390 */  lbu        $v1, %lo(missiledata + 0xD)($at)
    /* 19FC 8013B5F4 00000000 */  nop
    /* 1A00 8013B5F8 32006014 */  bnez       $v1, .L8013B6C4
    /* 1A04 8013B5FC 21A84000 */   addu      $s5, $v0, $zero
    /* 1A08 8013B600 40181300 */  sll        $v1, $s3, 1
    /* 1A0C 8013B604 21187300 */  addu       $v1, $v1, $s3
    /* 1A10 8013B608 80180300 */  sll        $v1, $v1, 2
    /* 1A14 8013B60C 21187300 */  addu       $v1, $v1, $s3
    /* 1A18 8013B610 00190300 */  sll        $v1, $v1, 4
    /* 1A1C 8013B614 23187300 */  subu       $v1, $v1, $s3
    /* 1A20 8013B618 80180300 */  sll        $v1, $v1, 2
    /* 1A24 8013B61C 21187300 */  addu       $v1, $v1, $s3
    /* 1A28 8013B620 C0180300 */  sll        $v1, $v1, 3
    /* 1A2C 8013B624 40101200 */  sll        $v0, $s2, 1
    /* 1A30 8013B628 21105200 */  addu       $v0, $v0, $s2
    /* 1A34 8013B62C 80100200 */  sll        $v0, $v0, 2
    /* 1A38 8013B630 21105200 */  addu       $v0, $v0, $s2
    /* 1A3C 8013B634 C0100200 */  sll        $v0, $v0, 3
    /* 1A40 8013B638 18001002 */  mult       $s0, $s0
    /* 1A44 8013B63C 1080013C */  lui        $at, %hi(monster + 0x48)
    /* 1A48 8013B640 21082200 */  addu       $at, $at, $v0
    /* 1A4C 8013B644 DC532280 */  lb         $v0, %lo(monster + 0x48)($at)
    /* 1A50 8013B648 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 1A54 8013B64C 21082300 */  addu       $at, $at, $v1
    /* 1A58 8013B650 74A62480 */  lb         $a0, %lo(plr + 0x13C)($at)
    /* 1A5C 8013B654 0E80013C */  lui        $at, %hi(plr + 0x19C8)
    /* 1A60 8013B658 21082300 */  addu       $at, $at, $v1
    /* 1A64 8013B65C 00BF268C */  lw         $a2, %lo(plr + 0x19C8)($at)
    /* 1A68 8013B660 0E80013C */  lui        $at, %hi(plr + 0x19A0)
    /* 1A6C 8013B664 21082300 */  addu       $at, $at, $v1
    /* 1A70 8013B668 D8BE258C */  lw         $a1, %lo(plr + 0x19A0)($at)
    /* 1A74 8013B66C CEFF4224 */  addiu      $v0, $v0, -0x32
    /* 1A78 8013B670 23208200 */  subu       $a0, $a0, $v0
    /* 1A7C 8013B674 23808600 */  subu       $s0, $a0, $a2
    /* 1A80 8013B678 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 1A84 8013B67C 21082300 */  addu       $at, $at, $v1
    /* 1A88 8013B680 38A62284 */  lh         $v0, %lo(plr + 0x100)($at)
    /* 1A8C 8013B684 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 1A90 8013B688 21082300 */  addu       $at, $at, $v1
    /* 1A94 8013B68C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 1A98 8013B690 21104500 */  addu       $v0, $v0, $a1
    /* 1A9C 8013B694 21800202 */  addu       $s0, $s0, $v0
    /* 1AA0 8013B698 12400000 */  mflo       $t0
    /* 1AA4 8013B69C 43100800 */  sra        $v0, $t0, 1
    /* 1AA8 8013B6A0 23800202 */  subu       $s0, $s0, $v0
    /* 1AAC 8013B6A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 1AB0 8013B6A8 02006214 */  bne        $v1, $v0, .L8013B6B4
    /* 1AB4 8013B6AC 00000000 */   nop
    /* 1AB8 8013B6B0 14001026 */  addiu      $s0, $s0, 0x14
  .L8013B6B4:
    /* 1ABC 8013B6B4 23006014 */  bnez       $v1, D_8013B744
    /* 1AC0 8013B6B8 0500022A */   slti      $v0, $s0, 0x5
    /* 1AC4 8013B6BC D0ED0408 */  j          D_8013B740
    /* 1AC8 8013B6C0 0A001026 */   addiu     $s0, $s0, 0xA
  .L8013B6C4:
    /* 1ACC 8013B6C4 40181300 */  sll        $v1, $s3, 1
    /* 1AD0 8013B6C8 21187300 */  addu       $v1, $v1, $s3
    /* 1AD4 8013B6CC 80180300 */  sll        $v1, $v1, 2
    /* 1AD8 8013B6D0 21187300 */  addu       $v1, $v1, $s3
    /* 1ADC 8013B6D4 00190300 */  sll        $v1, $v1, 4
    /* 1AE0 8013B6D8 23187300 */  subu       $v1, $v1, $s3
    /* 1AE4 8013B6DC 80180300 */  sll        $v1, $v1, 2
    /* 1AE8 8013B6E0 21187300 */  addu       $v1, $v1, $s3
    /* 1AEC 8013B6E4 40101200 */  sll        $v0, $s2, 1
    /* 1AF0 8013B6E8 21105200 */  addu       $v0, $v0, $s2
endlabel MonsterMHit__FiiiiiiUc
