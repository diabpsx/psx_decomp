.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MonsterMHit__FiiiiiiUc, 0x7C0

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
    /* 18A8 8013B4A0 AE014014 */  bnez       $v0, .L8013BB5C
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
    /* 1950 8013B548 8401A210 */  beq        $a1, $v0, .L8013BB5C
    /* 1954 8013B54C 21100000 */   addu      $v0, $zero, $zero
  .L8013B550:
    /* 1958 8013B550 10008230 */  andi       $v0, $a0, 0x10
    /* 195C 8013B554 03004010 */  beqz       $v0, .L8013B564
    /* 1960 8013B558 01000224 */   addiu     $v0, $zero, 0x1
    /* 1964 8013B55C 7F01A210 */  beq        $a1, $v0, .L8013BB5C
    /* 1968 8013B560 21100000 */   addu      $v0, $zero, $zero
  .L8013B564:
    /* 196C 8013B564 20008230 */  andi       $v0, $a0, 0x20
    /* 1970 8013B568 03004010 */  beqz       $v0, .L8013B578
    /* 1974 8013B56C 02000224 */   addiu     $v0, $zero, 0x2
    /* 1978 8013B570 7A01A210 */  beq        $a1, $v0, .L8013BB5C
    /* 197C 8013B574 21100000 */   addu      $v0, $zero, $zero
  .L8013B578:
    /* 1980 8013B578 80008230 */  andi       $v0, $a0, 0x80
    /* 1984 8013B57C 05004010 */  beqz       $v0, .L8013B594
    /* 1988 8013B580 04000224 */   addiu     $v0, $zero, 0x4
    /* 198C 8013B584 0400A214 */  bne        $a1, $v0, .L8013B598
    /* 1990 8013B588 01008230 */   andi      $v0, $a0, 0x1
  .L8013B58C:
    /* 1994 8013B58C D7EE0408 */  j          .L8013BB5C
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
    /* 1ABC 8013B6B4 23006014 */  bnez       $v1, .L8013B744
    /* 1AC0 8013B6B8 0500022A */   slti      $v0, $s0, 0x5
    /* 1AC4 8013B6BC D0ED0408 */  j          .L8013B740
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
    /* 1AF4 8013B6EC 80100200 */  sll        $v0, $v0, 2
    /* 1AF8 8013B6F0 21105200 */  addu       $v0, $v0, $s2
    /* 1AFC 8013B6F4 C0100200 */  sll        $v0, $v0, 3
    /* 1B00 8013B6F8 C0180300 */  sll        $v1, $v1, 3
    /* 1B04 8013B6FC 1080013C */  lui        $at, %hi(monster + 0x47)
    /* 1B08 8013B700 21082200 */  addu       $at, $at, $v0
    /* 1B0C 8013B704 DB532480 */  lb         $a0, %lo(monster + 0x47)($at)
    /* 1B10 8013B708 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* 1B14 8013B70C 21082300 */  addu       $at, $at, $v1
    /* 1B18 8013B710 34A62284 */  lh         $v0, %lo(plr + 0xFC)($at)
    /* 1B1C 8013B714 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 1B20 8013B718 21082300 */  addu       $at, $at, $v1
    /* 1B24 8013B71C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 1B28 8013B720 40200400 */  sll        $a0, $a0, 1
    /* 1B2C 8013B724 CEFF8424 */  addiu      $a0, $a0, -0x32
    /* 1B30 8013B728 23104400 */  subu       $v0, $v0, $a0
    /* 1B34 8013B72C 23805000 */  subu       $s0, $v0, $s0
    /* 1B38 8013B730 02000224 */  addiu      $v0, $zero, 0x2
    /* 1B3C 8013B734 03006214 */  bne        $v1, $v0, .L8013B744
    /* 1B40 8013B738 0500022A */   slti      $v0, $s0, 0x5
    /* 1B44 8013B73C 14001026 */  addiu      $s0, $s0, 0x14
  .L8013B740:
    /* 1B48 8013B740 0500022A */  slti       $v0, $s0, 0x5
  .L8013B744:
    /* 1B4C 8013B744 03004010 */  beqz       $v0, .L8013B754
    /* 1B50 8013B748 6000022A */   slti      $v0, $s0, 0x60
    /* 1B54 8013B74C 05001024 */  addiu      $s0, $zero, 0x5
    /* 1B58 8013B750 6000022A */  slti       $v0, $s0, 0x60
  .L8013B754:
    /* 1B5C 8013B754 02004014 */  bnez       $v0, .L8013B760
    /* 1B60 8013B758 40101200 */   sll       $v0, $s2, 1
    /* 1B64 8013B75C 5F001024 */  addiu      $s0, $zero, 0x5F
  .L8013B760:
    /* 1B68 8013B760 21105200 */  addu       $v0, $v0, $s2
    /* 1B6C 8013B764 80100200 */  sll        $v0, $v0, 2
    /* 1B70 8013B768 21105200 */  addu       $v0, $v0, $s2
    /* 1B74 8013B76C C0880200 */  sll        $s1, $v0, 3
    /* 1B78 8013B770 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1B7C 8013B774 21083100 */  addu       $at, $at, $s1
    /* 1B80 8013B778 C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 1B84 8013B77C 0F000224 */  addiu      $v0, $zero, 0xF
    /* 1B88 8013B780 02006214 */  bne        $v1, $v0, .L8013B78C
    /* 1B8C 8013B784 21204002 */   addu      $a0, $s2, $zero
    /* 1B90 8013B788 21A80000 */  addu       $s5, $zero, $zero
  .L8013B78C:
    /* 1B94 8013B78C 635A050C */  jal        CheckMonsterHit__FiRUc
    /* 1B98 8013B790 1000A527 */   addiu     $a1, $sp, 0x10
    /* 1B9C 8013B794 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1BA0 8013B798 04004010 */  beqz       $v0, .L8013B7AC
    /* 1BA4 8013B79C 2A10B002 */   slt       $v0, $s5, $s0
    /* 1BA8 8013B7A0 1000A293 */  lbu        $v0, 0x10($sp)
    /* 1BAC 8013B7A4 D7EE0408 */  j          .L8013BB5C
    /* 1BB0 8013B7A8 00000000 */   nop
  .L8013B7AC:
    /* 1BB4 8013B7AC EA004010 */  beqz       $v0, .L8013BB58
    /* 1BB8 8013B7B0 3F000224 */   addiu     $v0, $zero, 0x3F
    /* 1BBC 8013B7B4 0C008216 */  bne        $s4, $v0, .L8013B7E8
    /* 1BC0 8013B7B8 2320D603 */   subu      $a0, $fp, $s6
    /* 1BC4 8013B7BC 5555033C */  lui        $v1, (0x55555556 >> 16)
    /* 1BC8 8013B7C0 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1BCC 8013B7C4 21083100 */  addu       $at, $at, $s1
    /* 1BD0 8013B7C8 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 1BD4 8013B7CC 56556334 */  ori        $v1, $v1, (0x55555556 & 0xFFFF)
    /* 1BD8 8013B7D0 18004300 */  mult       $v0, $v1
    /* 1BDC 8013B7D4 C3170200 */  sra        $v0, $v0, 31
    /* 1BE0 8013B7D8 10400000 */  mfhi       $t0
    /* 1BE4 8013B7DC 23100201 */  subu       $v0, $t0, $v0
    /* 1BE8 8013B7E0 FDED0408 */  j          .L8013B7F4
    /* 1BEC 8013B7E4 83810200 */   sra       $s0, $v0, 6
  .L8013B7E8:
    /* 1BF0 8013B7E8 C9F6000C */  jal        ENG_random__Fl
    /* 1BF4 8013B7EC 01008424 */   addiu     $a0, $a0, 0x1
    /* 1BF8 8013B7F0 21805600 */  addu       $s0, $v0, $s6
  .L8013B7F4:
    /* 1BFC 8013B7F4 40101400 */  sll        $v0, $s4, 1
    /* 1C00 8013B7F8 21105400 */  addu       $v0, $v0, $s4
    /* 1C04 8013B7FC C0100200 */  sll        $v0, $v0, 3
    /* 1C08 8013B800 0D80013C */  lui        $at, %hi(missiledata + 0xD)
    /* 1C0C 8013B804 21082200 */  addu       $at, $at, $v0
    /* 1C10 8013B808 FD672290 */  lbu        $v0, %lo(missiledata + 0xD)($at)
    /* 1C14 8013B80C 00000000 */  nop
    /* 1C18 8013B810 2C004014 */  bnez       $v0, .L8013B8C4
    /* 1C1C 8013B814 40101300 */   sll       $v0, $s3, 1
    /* 1C20 8013B818 21105300 */  addu       $v0, $v0, $s3
    /* 1C24 8013B81C 80100200 */  sll        $v0, $v0, 2
    /* 1C28 8013B820 21105300 */  addu       $v0, $v0, $s3
    /* 1C2C 8013B824 00110200 */  sll        $v0, $v0, 4
    /* 1C30 8013B828 23105300 */  subu       $v0, $v0, $s3
    /* 1C34 8013B82C 80100200 */  sll        $v0, $v0, 2
    /* 1C38 8013B830 21105300 */  addu       $v0, $v0, $s3
    /* 1C3C 8013B834 C0200200 */  sll        $a0, $v0, 3
    /* 1C40 8013B838 0E80013C */  lui        $at, %hi(plr + 0x199C)
    /* 1C44 8013B83C 21082400 */  addu       $at, $at, $a0
    /* 1C48 8013B840 D4BE228C */  lw         $v0, %lo(plr + 0x199C)($at)
    /* 1C4C 8013B844 00000000 */  nop
    /* 1C50 8013B848 18000202 */  mult       $s0, $v0
    /* 1C54 8013B84C 12100000 */  mflo       $v0
    /* 1C58 8013B850 EB51033C */  lui        $v1, (0x51EB851F >> 16)
    /* 1C5C 8013B854 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
    /* 1C60 8013B858 18004300 */  mult       $v0, $v1
    /* 1C64 8013B85C C3170200 */  sra        $v0, $v0, 31
    /* 1C68 8013B860 10400000 */  mfhi       $t0
    /* 1C6C 8013B864 43190800 */  sra        $v1, $t0, 5
    /* 1C70 8013B868 23186200 */  subu       $v1, $v1, $v0
    /* 1C74 8013B86C 21800302 */  addu       $s0, $s0, $v1
    /* 1C78 8013B870 0E80013C */  lui        $at, %hi(plr + 0x19A8)
    /* 1C7C 8013B874 21082400 */  addu       $at, $at, $a0
    /* 1C80 8013B878 E0BE228C */  lw         $v0, %lo(plr + 0x19A8)($at)
    /* 1C84 8013B87C 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 1C88 8013B880 21082400 */  addu       $at, $at, $a0
    /* 1C8C 8013B884 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 1C90 8013B888 21800202 */  addu       $s0, $s0, $v0
    /* 1C94 8013B88C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C98 8013B890 06006214 */  bne        $v1, $v0, .L8013B8AC
    /* 1C9C 8013B894 00000000 */   nop
    /* 1CA0 8013B898 0E80013C */  lui        $at, %hi(plr + 0x10C)
    /* 1CA4 8013B89C 21082400 */  addu       $at, $at, $a0
    /* 1CA8 8013B8A0 44A6228C */  lw         $v0, %lo(plr + 0x10C)($at)
    /* 1CAC 8013B8A4 31EE0408 */  j          .L8013B8C4
    /* 1CB0 8013B8A8 21800202 */   addu      $s0, $s0, $v0
  .L8013B8AC:
    /* 1CB4 8013B8AC 0E80013C */  lui        $at, %hi(plr + 0x10C)
    /* 1CB8 8013B8B0 21082400 */  addu       $at, $at, $a0
    /* 1CBC 8013B8B4 44A6228C */  lw         $v0, %lo(plr + 0x10C)($at)
    /* 1CC0 8013B8B8 00000000 */  nop
    /* 1CC4 8013B8BC 43100200 */  sra        $v0, $v0, 1
    /* 1CC8 8013B8C0 21800202 */  addu       $s0, $s0, $v0
  .L8013B8C4:
    /* 1CCC 8013B8C4 1800A893 */  lbu        $t0, 0x18($sp)
    /* 1CD0 8013B8C8 00000000 */  nop
    /* 1CD4 8013B8CC 02000015 */  bnez       $t0, .L8013B8D8
    /* 1CD8 8013B8D0 FF00E332 */   andi      $v1, $s7, 0xFF
    /* 1CDC 8013B8D4 80811000 */  sll        $s0, $s0, 6
  .L8013B8D8:
    /* 1CE0 8013B8D8 02006010 */  beqz       $v1, .L8013B8E4
    /* 1CE4 8013B8DC 40101200 */   sll       $v0, $s2, 1
    /* 1CE8 8013B8E0 83801000 */  sra        $s0, $s0, 2
  .L8013B8E4:
    /* 1CEC 8013B8E4 21105200 */  addu       $v0, $v0, $s2
    /* 1CF0 8013B8E8 80100200 */  sll        $v0, $v0, 2
    /* 1CF4 8013B8EC 21105200 */  addu       $v0, $v0, $s2
    /* 1CF8 8013B8F0 C0880200 */  sll        $s1, $v0, 3
    /* 1CFC 8013B8F4 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1D00 8013B8F8 21083100 */  addu       $at, $at, $s1
    /* 1D04 8013B8FC A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 1D08 8013B900 00000000 */  nop
    /* 1D0C 8013B904 23105000 */  subu       $v0, $v0, $s0
    /* 1D10 8013B908 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1D14 8013B90C 21083100 */  addu       $at, $at, $s1
    /* 1D18 8013B910 A45322AC */  sw         $v0, %lo(monster + 0x10)($at)
    /* 1D1C 8013B914 40101300 */  sll        $v0, $s3, 1
    /* 1D20 8013B918 21105300 */  addu       $v0, $v0, $s3
    /* 1D24 8013B91C 80100200 */  sll        $v0, $v0, 2
    /* 1D28 8013B920 21105300 */  addu       $v0, $v0, $s3
    /* 1D2C 8013B924 00110200 */  sll        $v0, $v0, 4
    /* 1D30 8013B928 23105300 */  subu       $v0, $v0, $s3
    /* 1D34 8013B92C 80100200 */  sll        $v0, $v0, 2
    /* 1D38 8013B930 21105300 */  addu       $v0, $v0, $s3
    /* 1D3C 8013B934 C0280200 */  sll        $a1, $v0, 3
    /* 1D40 8013B938 0E80013C */  lui        $at, %hi(plr + 0x19B8)
    /* 1D44 8013B93C 21082500 */  addu       $at, $at, $a1
    /* 1D48 8013B940 F0BE228C */  lw         $v0, %lo(plr + 0x19B8)($at)
    /* 1D4C 8013B944 00000000 */  nop
    /* 1D50 8013B948 00014230 */  andi       $v0, $v0, 0x100
    /* 1D54 8013B94C 09004010 */  beqz       $v0, .L8013B974
    /* 1D58 8013B950 00000000 */   nop
    /* 1D5C 8013B954 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1D60 8013B958 21083100 */  addu       $at, $at, $s1
    /* 1D64 8013B95C C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 1D68 8013B960 00000000 */  nop
    /* 1D6C 8013B964 08004234 */  ori        $v0, $v0, 0x8
    /* 1D70 8013B968 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 1D74 8013B96C 21083100 */  addu       $at, $at, $s1
    /* 1D78 8013B970 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
  .L8013B974:
    /* 1D7C 8013B974 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1D80 8013B978 21083100 */  addu       $at, $at, $s1
    /* 1D84 8013B97C A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 1D88 8013B980 00000000 */  nop
    /* 1D8C 8013B984 83110200 */  sra        $v0, $v0, 6
    /* 1D90 8013B988 0F00401C */  bgtz       $v0, .L8013B9C8
    /* 1D94 8013B98C 0F000224 */   addiu     $v0, $zero, 0xF
    /* 1D98 8013B990 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1D9C 8013B994 21083100 */  addu       $at, $at, $s1
    /* 1DA0 8013B998 C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 1DA4 8013B99C 00000000 */  nop
    /* 1DA8 8013B9A0 05006214 */  bne        $v1, $v0, .L8013B9B8
    /* 1DAC 8013B9A4 21204002 */   addu      $a0, $s2, $zero
    /* 1DB0 8013B9A8 F630050C */  jal        M_StartKill__Fii
    /* 1DB4 8013B9AC 21286002 */   addu      $a1, $s3, $zero
    /* 1DB8 8013B9B0 86EE0408 */  j          .L8013BA18
    /* 1DBC 8013B9B4 0F000224 */   addiu     $v0, $zero, 0xF
  .L8013B9B8:
    /* 1DC0 8013B9B8 F630050C */  jal        M_StartKill__Fii
    /* 1DC4 8013B9BC 21286002 */   addu      $a1, $s3, $zero
    /* 1DC8 8013B9C0 B3EE0408 */  j          .L8013BACC
    /* 1DCC 8013B9C4 40101200 */   sll       $v0, $s2, 1
  .L8013B9C8:
    /* 1DD0 8013B9C8 05006010 */  beqz       $v1, .L8013B9E0
    /* 1DD4 8013B9CC 21204002 */   addu      $a0, $s2, $zero
    /* 1DD8 8013B9D0 4AF5000C */  jal        PlayEffect__Fii
    /* 1DDC 8013B9D4 01000524 */   addiu     $a1, $zero, 0x1
    /* 1DE0 8013B9D8 B3EE0408 */  j          .L8013BACC
    /* 1DE4 8013B9DC 40101200 */   sll       $v0, $s2, 1
  .L8013B9E0:
    /* 1DE8 8013B9E0 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1DEC 8013B9E4 21083100 */  addu       $at, $at, $s1
    /* 1DF0 8013B9E8 C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 1DF4 8013B9EC 0F000224 */  addiu      $v0, $zero, 0xF
    /* 1DF8 8013B9F0 0E006214 */  bne        $v1, $v0, .L8013BA2C
    /* 1DFC 8013B9F4 40101400 */   sll       $v0, $s4, 1
    /* 1E00 8013B9F8 0400422A */  slti       $v0, $s2, 0x4
    /* 1E04 8013B9FC 06004014 */  bnez       $v0, .L8013BA18
    /* 1E08 8013BA00 0F000224 */   addiu     $v0, $zero, 0xF
    /* 1E0C 8013BA04 21204002 */  addu       $a0, $s2, $zero
    /* 1E10 8013BA08 21286002 */  addu       $a1, $s3, $zero
    /* 1E14 8013BA0C B62C050C */  jal        M_StartHit__Fiii
    /* 1E18 8013BA10 21300002 */   addu      $a2, $s0, $zero
    /* 1E1C 8013BA14 0F000224 */  addiu      $v0, $zero, 0xF
  .L8013BA18:
    /* 1E20 8013BA18 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1E24 8013BA1C 21083100 */  addu       $at, $at, $s1
    /* 1E28 8013BA20 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 1E2C 8013BA24 B3EE0408 */  j          .L8013BACC
    /* 1E30 8013BA28 40101200 */   sll       $v0, $s2, 1
  .L8013BA2C:
    /* 1E34 8013BA2C 21105400 */  addu       $v0, $v0, $s4
    /* 1E38 8013BA30 C0100200 */  sll        $v0, $v0, 3
    /* 1E3C 8013BA34 0D80013C */  lui        $at, %hi(missiledata + 0xD)
    /* 1E40 8013BA38 21082200 */  addu       $at, $at, $v0
    /* 1E44 8013BA3C FD672290 */  lbu        $v0, %lo(missiledata + 0xD)($at)
    /* 1E48 8013BA40 00000000 */  nop
    /* 1E4C 8013BA44 1A004014 */  bnez       $v0, .L8013BAB0
    /* 1E50 8013BA48 0400422A */   slti      $v0, $s2, 0x4
    /* 1E54 8013BA4C 0E80013C */  lui        $at, %hi(plr + 0x19B8)
    /* 1E58 8013BA50 21082500 */  addu       $at, $at, $a1
    /* 1E5C 8013BA54 F0BE228C */  lw         $v0, %lo(plr + 0x19B8)($at)
    /* 1E60 8013BA58 00000000 */  nop
    /* 1E64 8013BA5C 00084230 */  andi       $v0, $v0, 0x800
    /* 1E68 8013BA60 13004010 */  beqz       $v0, .L8013BAB0
    /* 1E6C 8013BA64 0400422A */   slti      $v0, $s2, 0x4
    /* 1E70 8013BA68 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 1E74 8013BA6C 21082500 */  addu       $at, $at, $a1
    /* 1E78 8013BA70 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 1E7C 8013BA74 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 1E80 8013BA78 21082500 */  addu       $at, $at, $a1
    /* 1E84 8013BA7C 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 1E88 8013BA80 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1E8C 8013BA84 21083100 */  addu       $at, $at, $s1
    /* 1E90 8013BA88 C8532680 */  lb         $a2, %lo(monster + 0x34)($at)
    /* 1E94 8013BA8C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1E98 8013BA90 21083100 */  addu       $at, $at, $s1
    /* 1E9C 8013BA94 C9532780 */  lb         $a3, %lo(monster + 0x35)($at)
    /* 1EA0 8013BA98 8AF6000C */  jal        GetDirection__Fiiii
    /* 1EA4 8013BA9C 00000000 */   nop
    /* 1EA8 8013BAA0 21204002 */  addu       $a0, $s2, $zero
    /* 1EAC 8013BAA4 2F2C050C */  jal        M_GetKnockback__Fii
    /* 1EB0 8013BAA8 21284000 */   addu      $a1, $v0, $zero
    /* 1EB4 8013BAAC 0400422A */  slti       $v0, $s2, 0x4
  .L8013BAB0:
    /* 1EB8 8013BAB0 06004014 */  bnez       $v0, .L8013BACC
    /* 1EBC 8013BAB4 40101200 */   sll       $v0, $s2, 1
    /* 1EC0 8013BAB8 21204002 */  addu       $a0, $s2, $zero
    /* 1EC4 8013BABC 21286002 */  addu       $a1, $s3, $zero
    /* 1EC8 8013BAC0 B62C050C */  jal        M_StartHit__Fiii
    /* 1ECC 8013BAC4 21300002 */   addu      $a2, $s0, $zero
    /* 1ED0 8013BAC8 40101200 */  sll        $v0, $s2, 1
  .L8013BACC:
    /* 1ED4 8013BACC 21105200 */  addu       $v0, $v0, $s2
    /* 1ED8 8013BAD0 80100200 */  sll        $v0, $v0, 2
    /* 1EDC 8013BAD4 21105200 */  addu       $v0, $v0, $s2
    /* 1EE0 8013BAD8 C0200200 */  sll        $a0, $v0, 3
    /* 1EE4 8013BADC 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 1EE8 8013BAE0 21082400 */  addu       $at, $at, $a0
    /* 1EEC 8013BAE4 E2532290 */  lbu        $v0, %lo(monster + 0x4E)($at)
    /* 1EF0 8013BAE8 00000000 */  nop
    /* 1EF4 8013BAEC 1B004014 */  bnez       $v0, .L8013BB5C
    /* 1EF8 8013BAF0 01000224 */   addiu     $v0, $zero, 0x1
    /* 1EFC 8013BAF4 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 1F00 8013BAF8 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 1F04 8013BAFC 21082400 */  addu       $at, $at, $a0
    /* 1F08 8013BB00 E25322A0 */  sb         $v0, %lo(monster + 0x4E)($at)
    /* 1F0C 8013BB04 40101300 */  sll        $v0, $s3, 1
    /* 1F10 8013BB08 21105300 */  addu       $v0, $v0, $s3
    /* 1F14 8013BB0C 80100200 */  sll        $v0, $v0, 2
    /* 1F18 8013BB10 21105300 */  addu       $v0, $v0, $s3
    /* 1F1C 8013BB14 00110200 */  sll        $v0, $v0, 4
    /* 1F20 8013BB18 23105300 */  subu       $v0, $v0, $s3
    /* 1F24 8013BB1C 80100200 */  sll        $v0, $v0, 2
    /* 1F28 8013BB20 21105300 */  addu       $v0, $v0, $s3
    /* 1F2C 8013BB24 C0100200 */  sll        $v0, $v0, 3
    /* 1F30 8013BB28 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 1F34 8013BB2C 21082200 */  addu       $at, $at, $v0
    /* 1F38 8013BB30 68A52394 */  lhu        $v1, %lo(plr + 0x30)($at)
    /* 1F3C 8013BB34 1080013C */  lui        $at, %hi(monster + 0x43)
    /* 1F40 8013BB38 21082400 */  addu       $at, $at, $a0
    /* 1F44 8013BB3C D75323A0 */  sb         $v1, %lo(monster + 0x43)($at)
    /* 1F48 8013BB40 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 1F4C 8013BB44 21082200 */  addu       $at, $at, $v0
    /* 1F50 8013BB48 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 1F54 8013BB4C 1080013C */  lui        $at, %hi(monster + 0x44)
    /* 1F58 8013BB50 21082400 */  addu       $at, $at, $a0
    /* 1F5C 8013BB54 D85322A0 */  sb         $v0, %lo(monster + 0x44)($at)
  .L8013BB58:
    /* 1F60 8013BB58 01000224 */  addiu      $v0, $zero, 0x1
  .L8013BB5C:
    /* 1F64 8013BB5C 4400BF8F */  lw         $ra, 0x44($sp)
    /* 1F68 8013BB60 4000BE8F */  lw         $fp, 0x40($sp)
    /* 1F6C 8013BB64 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 1F70 8013BB68 3800B68F */  lw         $s6, 0x38($sp)
    /* 1F74 8013BB6C 3400B58F */  lw         $s5, 0x34($sp)
    /* 1F78 8013BB70 3000B48F */  lw         $s4, 0x30($sp)
    /* 1F7C 8013BB74 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 1F80 8013BB78 2800B28F */  lw         $s2, 0x28($sp)
    /* 1F84 8013BB7C 2400B18F */  lw         $s1, 0x24($sp)
    /* 1F88 8013BB80 2000B08F */  lw         $s0, 0x20($sp)
    /* 1F8C 8013BB84 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 1F90 8013BB88 0800E003 */  jr         $ra
    /* 1F94 8013BB8C 00000000 */   nop
endlabel MonsterMHit__FiiiiiiUc
