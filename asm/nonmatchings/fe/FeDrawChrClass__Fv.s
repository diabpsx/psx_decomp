.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeDrawChrClass__Fv, 0x488

glabel FeDrawChrClass__Fv
    /* 13BC 8013AFB4 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 13C0 8013AFB8 2800A427 */  addiu      $a0, $sp, 0x28
    /* 13C4 8013AFBC 7000BFAF */  sw         $ra, 0x70($sp)
    /* 13C8 8013AFC0 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 13CC 8013AFC4 6800B6AF */  sw         $s6, 0x68($sp)
    /* 13D0 8013AFC8 6400B5AF */  sw         $s5, 0x64($sp)
    /* 13D4 8013AFCC 6000B4AF */  sw         $s4, 0x60($sp)
    /* 13D8 8013AFD0 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 13DC 8013AFD4 5800B2AF */  sw         $s2, 0x58($sp)
    /* 13E0 8013AFD8 5400B1AF */  sw         $s1, 0x54($sp)
    /* 13E4 8013AFDC AFF2040C */  jal        __6Dialog_8013cabc
    /* 13E8 8013AFE0 5000B0AF */   sw        $s0, 0x50($sp)
    /* 13EC 8013AFE4 F80B838F */  lw         $v1, %gp_rel(FePlayerNo)($gp)
    /* 13F0 8013AFE8 C00B8297 */  lhu        $v0, %gp_rel(D_8011B340)($gp)
    /* 13F4 8013AFEC 80180300 */  sll        $v1, $v1, 2
    /* 13F8 8013AFF0 4000A2A7 */  sh         $v0, 0x40($sp)
    /* 13FC 8013AFF4 1280013C */  lui        $at, %hi(FeChrClass)
    /* 1400 8013AFF8 21082300 */  addu       $at, $at, $v1
    /* 1404 8013AFFC 8CB3238C */  lw         $v1, %lo(FeChrClass)($at)
    /* 1408 8013B000 01000224 */  addiu      $v0, $zero, 0x1
    /* 140C 8013B004 0C006210 */  beq        $v1, $v0, .L8013B038
    /* 1410 8013B008 02006228 */   slti      $v0, $v1, 0x2
    /* 1414 8013B00C 05004010 */  beqz       $v0, .L8013B024
    /* 1418 8013B010 00000000 */   nop
    /* 141C 8013B014 09006010 */  beqz       $v1, .L8013B03C
    /* 1420 8013B018 6E000524 */   addiu     $a1, $zero, 0x6E
    /* 1424 8013B01C 0FEC0408 */  j          .L8013B03C
    /* 1428 8013B020 6B000524 */   addiu     $a1, $zero, 0x6B
  .L8013B024:
    /* 142C 8013B024 02000224 */  addiu      $v0, $zero, 0x2
    /* 1430 8013B028 04006210 */  beq        $v1, $v0, .L8013B03C
    /* 1434 8013B02C 6D000524 */   addiu     $a1, $zero, 0x6D
    /* 1438 8013B030 0FEC0408 */  j          .L8013B03C
    /* 143C 8013B034 6B000524 */   addiu     $a1, $zero, 0x6B
  .L8013B038:
    /* 1440 8013B038 6C000524 */  addiu      $a1, $zero, 0x6C
  .L8013B03C:
    /* 1444 8013B03C 24000624 */  addiu      $a2, $zero, 0x24
    /* 1448 8013B040 32000724 */  addiu      $a3, $zero, 0x32
    /* 144C 8013B044 A00B848F */  lw         $a0, %gp_rel(FeTData)($gp)
    /* 1450 8013B048 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 1454 8013B04C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1458 8013B050 1400A2AF */  sw         $v0, 0x14($sp)
    /* 145C 8013B054 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 1460 8013B058 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1464 8013B05C F80B888F */  lw         $t0, %gp_rel(FePlayerNo)($gp)
    /* 1468 8013B060 1280153C */  lui        $s5, %hi(FeChrClass)
    /* 146C 8013B064 8CB3B526 */  addiu      $s5, $s5, %lo(FeChrClass)
    /* 1470 8013B068 80100800 */  sll        $v0, $t0, 2
    /* 1474 8013B06C 1280013C */  lui        $at, %hi(FeChrClass)
    /* 1478 8013B070 21082200 */  addu       $at, $at, $v0
    /* 147C 8013B074 8CB3238C */  lw         $v1, %lo(FeChrClass)($at)
    /* 1480 8013B078 FFFF1724 */  addiu      $s7, $zero, -0x1
    /* 1484 8013B07C E0007710 */  beq        $v1, $s7, .L8013B400
    /* 1488 8013B080 03000224 */   addiu     $v0, $zero, 0x3
    /* 148C 8013B084 DE006210 */  beq        $v1, $v0, .L8013B400
    /* 1490 8013B088 21280000 */   addu      $a1, $zero, $zero
    /* 1494 8013B08C 0C80143C */  lui        $s4, %hi(MediumFont)
    /* 1498 8013B090 D8829426 */  addiu      $s4, $s4, %lo(MediumFont)
    /* 149C 8013B094 21208002 */  addu       $a0, $s4, $zero
    /* 14A0 8013B098 12000624 */  addiu      $a2, $zero, 0x12
    /* 14A4 8013B09C 40380800 */  sll        $a3, $t0, 1
    /* 14A8 8013B0A0 2138E800 */  addu       $a3, $a3, $t0
    /* 14AC 8013B0A4 80380700 */  sll        $a3, $a3, 2
    /* 14B0 8013B0A8 2338E800 */  subu       $a3, $a3, $t0
    /* 14B4 8013B0AC 0D80023C */  lui        $v0, %hi(FePlayerName)
    /* 14B8 8013B0B0 F8E24224 */  addiu      $v0, $v0, %lo(FePlayerName)
    /* 14BC 8013B0B4 2138E200 */  addu       $a3, $a3, $v0
    /* 14C0 8013B0B8 AC000224 */  addiu      $v0, $zero, 0xAC
    /* 14C4 8013B0BC 3800A2A7 */  sh         $v0, 0x38($sp)
    /* 14C8 8013B0C0 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 14CC 8013B0C4 3A00A2A7 */  sh         $v0, 0x3A($sp)
    /* 14D0 8013B0C8 80000224 */  addiu      $v0, $zero, 0x80
    /* 14D4 8013B0CC 3C00A2A7 */  sh         $v0, 0x3C($sp)
    /* 14D8 8013B0D0 3E00A2A7 */  sh         $v0, 0x3E($sp)
    /* 14DC 8013B0D4 01000224 */  addiu      $v0, $zero, 0x1
    /* 14E0 8013B0D8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 14E4 8013B0DC 1280023C */  lui        $v0, %hi(GOLDR)
    /* 14E8 8013B0E0 DAAB4290 */  lbu        $v0, %lo(GOLDR)($v0)
    /* 14EC 8013B0E4 1280033C */  lui        $v1, %hi(GOLDG)
    /* 14F0 8013B0E8 DBAB6390 */  lbu        $v1, %lo(GOLDG)($v1)
    /* 14F4 8013B0EC 1280083C */  lui        $t0, %hi(GOLDB)
    /* 14F8 8013B0F0 DCAB0891 */  lbu        $t0, %lo(GOLDB)($t0)
    /* 14FC 8013B0F4 3800B227 */  addiu      $s2, $sp, 0x38
    /* 1500 8013B0F8 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1504 8013B0FC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 1508 8013B100 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 150C 8013B104 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1510 8013B108 2000A8AF */   sw        $t0, 0x20($sp)
    /* 1514 8013B10C 4AED010C */  jal        GetStr__Fi
    /* 1518 8013B110 45020424 */   addiu     $a0, $zero, 0x245
    /* 151C 8013B114 21208002 */  addu       $a0, $s4, $zero
    /* 1520 8013B118 21280000 */  addu       $a1, $zero, $zero
    /* 1524 8013B11C 27000624 */  addiu      $a2, $zero, 0x27
    /* 1528 8013B120 1280133C */  lui        $s3, %hi(WHITER)
    /* 152C 8013B124 D1AB7392 */  lbu        $s3, %lo(WHITER)($s3)
    /* 1530 8013B128 1280103C */  lui        $s0, %hi(WHITEG)
    /* 1534 8013B12C D2AB1092 */  lbu        $s0, %lo(WHITEG)($s0)
    /* 1538 8013B130 21384000 */  addu       $a3, $v0, $zero
    /* 153C 8013B134 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1540 8013B138 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1544 8013B13C 1800B3AF */  sw         $s3, 0x18($sp)
    /* 1548 8013B140 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 154C 8013B144 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1550 8013B148 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1554 8013B14C F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1558 8013B150 00000000 */  nop
    /* 155C 8013B154 80100200 */  sll        $v0, $v0, 2
    /* 1560 8013B158 21105500 */  addu       $v0, $v0, $s5
    /* 1564 8013B15C 0000428C */  lw         $v0, 0x0($v0)
    /* 1568 8013B160 00000000 */  nop
    /* 156C 8013B164 06005710 */  beq        $v0, $s7, .L8013B180
    /* 1570 8013B168 00000000 */   nop
    /* 1574 8013B16C 4000A427 */  addiu      $a0, $sp, 0x40
    /* 1578 8013B170 1280053C */  lui        $a1, %hi(D_8011B344)
    /* 157C 8013B174 44B3A524 */  addiu      $a1, $a1, %lo(D_8011B344)
    /* 1580 8013B178 9767000C */  jal        sprintf
    /* 1584 8013B17C 01000624 */   addiu     $a2, $zero, 0x1
  .L8013B180:
    /* 1588 8013B180 21208002 */  addu       $a0, $s4, $zero
    /* 158C 8013B184 21280000 */  addu       $a1, $zero, $zero
    /* 1590 8013B188 27000624 */  addiu      $a2, $zero, 0x27
    /* 1594 8013B18C 4000B127 */  addiu      $s1, $sp, 0x40
    /* 1598 8013B190 21382002 */  addu       $a3, $s1, $zero
    /* 159C 8013B194 02001624 */  addiu      $s6, $zero, 0x2
    /* 15A0 8013B198 1000B6AF */  sw         $s6, 0x10($sp)
    /* 15A4 8013B19C 1400B2AF */  sw         $s2, 0x14($sp)
    /* 15A8 8013B1A0 1800B3AF */  sw         $s3, 0x18($sp)
    /* 15AC 8013B1A4 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 15B0 8013B1A8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 15B4 8013B1AC 2000B0AF */   sw        $s0, 0x20($sp)
    /* 15B8 8013B1B0 4AED010C */  jal        GetStr__Fi
    /* 15BC 8013B1B4 19040424 */   addiu     $a0, $zero, 0x419
    /* 15C0 8013B1B8 21208002 */  addu       $a0, $s4, $zero
    /* 15C4 8013B1BC 21280000 */  addu       $a1, $zero, $zero
    /* 15C8 8013B1C0 34000624 */  addiu      $a2, $zero, 0x34
    /* 15CC 8013B1C4 21384000 */  addu       $a3, $v0, $zero
    /* 15D0 8013B1C8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 15D4 8013B1CC 1400B2AF */  sw         $s2, 0x14($sp)
    /* 15D8 8013B1D0 1800B3AF */  sw         $s3, 0x18($sp)
    /* 15DC 8013B1D4 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 15E0 8013B1D8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 15E4 8013B1DC 2000B0AF */   sw        $s0, 0x20($sp)
    /* 15E8 8013B1E0 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 15EC 8013B1E4 00000000 */  nop
    /* 15F0 8013B1E8 80100200 */  sll        $v0, $v0, 2
    /* 15F4 8013B1EC 21105500 */  addu       $v0, $v0, $s5
    /* 15F8 8013B1F0 0000428C */  lw         $v0, 0x0($v0)
    /* 15FC 8013B1F4 00000000 */  nop
    /* 1600 8013B1F8 08005710 */  beq        $v0, $s7, .L8013B21C
    /* 1604 8013B1FC 80100200 */   sll       $v0, $v0, 2
    /* 1608 8013B200 0E80013C */  lui        $at, %hi(StrengthTbl)
    /* 160C 8013B204 21082200 */  addu       $at, $at, $v0
    /* 1610 8013B208 FCA3268C */  lw         $a2, %lo(StrengthTbl)($at)
    /* 1614 8013B20C 1280053C */  lui        $a1, %hi(D_8011B344)
    /* 1618 8013B210 44B3A524 */  addiu      $a1, $a1, %lo(D_8011B344)
    /* 161C 8013B214 9767000C */  jal        sprintf
    /* 1620 8013B218 21202002 */   addu      $a0, $s1, $zero
  .L8013B21C:
    /* 1624 8013B21C 21208002 */  addu       $a0, $s4, $zero
    /* 1628 8013B220 21280000 */  addu       $a1, $zero, $zero
    /* 162C 8013B224 34000624 */  addiu      $a2, $zero, 0x34
    /* 1630 8013B228 21382002 */  addu       $a3, $s1, $zero
    /* 1634 8013B22C 1000B6AF */  sw         $s6, 0x10($sp)
    /* 1638 8013B230 1400B2AF */  sw         $s2, 0x14($sp)
    /* 163C 8013B234 1800B3AF */  sw         $s3, 0x18($sp)
    /* 1640 8013B238 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 1644 8013B23C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1648 8013B240 2000B0AF */   sw        $s0, 0x20($sp)
    /* 164C 8013B244 4AED010C */  jal        GetStr__Fi
    /* 1650 8013B248 6F020424 */   addiu     $a0, $zero, 0x26F
    /* 1654 8013B24C 21208002 */  addu       $a0, $s4, $zero
    /* 1658 8013B250 21280000 */  addu       $a1, $zero, $zero
    /* 165C 8013B254 41000624 */  addiu      $a2, $zero, 0x41
    /* 1660 8013B258 21384000 */  addu       $a3, $v0, $zero
    /* 1664 8013B25C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1668 8013B260 1400B2AF */  sw         $s2, 0x14($sp)
    /* 166C 8013B264 1800B3AF */  sw         $s3, 0x18($sp)
    /* 1670 8013B268 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 1674 8013B26C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1678 8013B270 2000B0AF */   sw        $s0, 0x20($sp)
    /* 167C 8013B274 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1680 8013B278 00000000 */  nop
    /* 1684 8013B27C 80100200 */  sll        $v0, $v0, 2
    /* 1688 8013B280 21105500 */  addu       $v0, $v0, $s5
    /* 168C 8013B284 0000428C */  lw         $v0, 0x0($v0)
    /* 1690 8013B288 00000000 */  nop
    /* 1694 8013B28C 08005710 */  beq        $v0, $s7, .L8013B2B0
    /* 1698 8013B290 80100200 */   sll       $v0, $v0, 2
    /* 169C 8013B294 0E80013C */  lui        $at, %hi(MagicTbl)
    /* 16A0 8013B298 21082200 */  addu       $at, $at, $v0
    /* 16A4 8013B29C 08A4268C */  lw         $a2, %lo(MagicTbl)($at)
    /* 16A8 8013B2A0 1280053C */  lui        $a1, %hi(D_8011B344)
    /* 16AC 8013B2A4 44B3A524 */  addiu      $a1, $a1, %lo(D_8011B344)
    /* 16B0 8013B2A8 9767000C */  jal        sprintf
    /* 16B4 8013B2AC 21202002 */   addu      $a0, $s1, $zero
  .L8013B2B0:
    /* 16B8 8013B2B0 21208002 */  addu       $a0, $s4, $zero
    /* 16BC 8013B2B4 21280000 */  addu       $a1, $zero, $zero
    /* 16C0 8013B2B8 41000624 */  addiu      $a2, $zero, 0x41
    /* 16C4 8013B2BC 21382002 */  addu       $a3, $s1, $zero
    /* 16C8 8013B2C0 1000B6AF */  sw         $s6, 0x10($sp)
    /* 16CC 8013B2C4 1400B2AF */  sw         $s2, 0x14($sp)
    /* 16D0 8013B2C8 1800B3AF */  sw         $s3, 0x18($sp)
    /* 16D4 8013B2CC 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 16D8 8013B2D0 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 16DC 8013B2D4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 16E0 8013B2D8 4AED010C */  jal        GetStr__Fi
    /* 16E4 8013B2DC FF000424 */   addiu     $a0, $zero, 0xFF
    /* 16E8 8013B2E0 21208002 */  addu       $a0, $s4, $zero
    /* 16EC 8013B2E4 21280000 */  addu       $a1, $zero, $zero
    /* 16F0 8013B2E8 4E000624 */  addiu      $a2, $zero, 0x4E
    /* 16F4 8013B2EC 21384000 */  addu       $a3, $v0, $zero
    /* 16F8 8013B2F0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 16FC 8013B2F4 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1700 8013B2F8 1800B3AF */  sw         $s3, 0x18($sp)
    /* 1704 8013B2FC 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 1708 8013B300 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 170C 8013B304 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1710 8013B308 F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 1714 8013B30C 00000000 */  nop
    /* 1718 8013B310 80100200 */  sll        $v0, $v0, 2
    /* 171C 8013B314 21105500 */  addu       $v0, $v0, $s5
    /* 1720 8013B318 0000428C */  lw         $v0, 0x0($v0)
    /* 1724 8013B31C 00000000 */  nop
    /* 1728 8013B320 08005710 */  beq        $v0, $s7, .L8013B344
    /* 172C 8013B324 80100200 */   sll       $v0, $v0, 2
    /* 1730 8013B328 0E80013C */  lui        $at, %hi(DexterityTbl)
    /* 1734 8013B32C 21082200 */  addu       $at, $at, $v0
    /* 1738 8013B330 14A4268C */  lw         $a2, %lo(DexterityTbl)($at)
    /* 173C 8013B334 1280053C */  lui        $a1, %hi(D_8011B344)
    /* 1740 8013B338 44B3A524 */  addiu      $a1, $a1, %lo(D_8011B344)
    /* 1744 8013B33C 9767000C */  jal        sprintf
    /* 1748 8013B340 21202002 */   addu      $a0, $s1, $zero
  .L8013B344:
    /* 174C 8013B344 21208002 */  addu       $a0, $s4, $zero
    /* 1750 8013B348 21280000 */  addu       $a1, $zero, $zero
    /* 1754 8013B34C 4E000624 */  addiu      $a2, $zero, 0x4E
    /* 1758 8013B350 21382002 */  addu       $a3, $s1, $zero
    /* 175C 8013B354 1000B6AF */  sw         $s6, 0x10($sp)
    /* 1760 8013B358 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1764 8013B35C 1800B3AF */  sw         $s3, 0x18($sp)
    /* 1768 8013B360 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 176C 8013B364 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1770 8013B368 2000B0AF */   sw        $s0, 0x20($sp)
    /* 1774 8013B36C 4AED010C */  jal        GetStr__Fi
    /* 1778 8013B370 B7040424 */   addiu     $a0, $zero, 0x4B7
    /* 177C 8013B374 21208002 */  addu       $a0, $s4, $zero
    /* 1780 8013B378 21280000 */  addu       $a1, $zero, $zero
    /* 1784 8013B37C 5B000624 */  addiu      $a2, $zero, 0x5B
    /* 1788 8013B380 21384000 */  addu       $a3, $v0, $zero
    /* 178C 8013B384 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1790 8013B388 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1794 8013B38C 1800B3AF */  sw         $s3, 0x18($sp)
    /* 1798 8013B390 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 179C 8013B394 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 17A0 8013B398 2000B0AF */   sw        $s0, 0x20($sp)
    /* 17A4 8013B39C F80B828F */  lw         $v0, %gp_rel(FePlayerNo)($gp)
    /* 17A8 8013B3A0 00000000 */  nop
    /* 17AC 8013B3A4 80100200 */  sll        $v0, $v0, 2
    /* 17B0 8013B3A8 21105500 */  addu       $v0, $v0, $s5
    /* 17B4 8013B3AC 0000428C */  lw         $v0, 0x0($v0)
    /* 17B8 8013B3B0 00000000 */  nop
    /* 17BC 8013B3B4 08005710 */  beq        $v0, $s7, .L8013B3D8
    /* 17C0 8013B3B8 80100200 */   sll       $v0, $v0, 2
    /* 17C4 8013B3BC 0E80013C */  lui        $at, %hi(VitalityTbl)
    /* 17C8 8013B3C0 21082200 */  addu       $at, $at, $v0
    /* 17CC 8013B3C4 20A4268C */  lw         $a2, %lo(VitalityTbl)($at)
    /* 17D0 8013B3C8 1280053C */  lui        $a1, %hi(D_8011B344)
    /* 17D4 8013B3CC 44B3A524 */  addiu      $a1, $a1, %lo(D_8011B344)
    /* 17D8 8013B3D0 9767000C */  jal        sprintf
    /* 17DC 8013B3D4 21202002 */   addu      $a0, $s1, $zero
  .L8013B3D8:
    /* 17E0 8013B3D8 21208002 */  addu       $a0, $s4, $zero
    /* 17E4 8013B3DC 21280000 */  addu       $a1, $zero, $zero
    /* 17E8 8013B3E0 5B000624 */  addiu      $a2, $zero, 0x5B
    /* 17EC 8013B3E4 21382002 */  addu       $a3, $s1, $zero
    /* 17F0 8013B3E8 1000B6AF */  sw         $s6, 0x10($sp)
    /* 17F4 8013B3EC 1400B2AF */  sw         $s2, 0x14($sp)
    /* 17F8 8013B3F0 1800B3AF */  sw         $s3, 0x18($sp)
    /* 17FC 8013B3F4 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 1800 8013B3F8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1804 8013B3FC 2000B0AF */   sw        $s0, 0x20($sp)
  .L8013B400:
    /* 1808 8013B400 2800A427 */  addiu      $a0, $sp, 0x28
    /* 180C 8013B404 A5F2040C */  jal        ___6Dialog_8013ca94
    /* 1810 8013B408 02000524 */   addiu     $a1, $zero, 0x2
    /* 1814 8013B40C 7000BF8F */  lw         $ra, 0x70($sp)
    /* 1818 8013B410 6C00B78F */  lw         $s7, 0x6C($sp)
    /* 181C 8013B414 6800B68F */  lw         $s6, 0x68($sp)
    /* 1820 8013B418 6400B58F */  lw         $s5, 0x64($sp)
    /* 1824 8013B41C 6000B48F */  lw         $s4, 0x60($sp)
    /* 1828 8013B420 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 182C 8013B424 5800B28F */  lw         $s2, 0x58($sp)
    /* 1830 8013B428 5400B18F */  lw         $s1, 0x54($sp)
    /* 1834 8013B42C 5000B08F */  lw         $s0, 0x50($sp)
    /* 1838 8013B430 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 183C 8013B434 0800E003 */  jr         $ra
    /* 1840 8013B438 00000000 */   nop
endlabel FeDrawChrClass__Fv
