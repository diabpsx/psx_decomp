.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitThemes__Fv, 0x34C

glabel InitThemes__Fv
    /* 22D88 8015C980 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 22D8C 8015C984 1280033C */  lui        $v1, %hi(currlevel)
    /* 22D90 8015C988 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 22D94 8015C98C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 22D98 8015C990 101A82AF */  sw         $v0, %gp_rel(zharlib)($gp)
    /* 22D9C 8015C994 01000224 */  addiu      $v0, $zero, 0x1
    /* 22DA0 8015C998 141A82A3 */  sb         $v0, %gp_rel(armorFlag)($gp)
    /* 22DA4 8015C99C 241A82A3 */  sb         $v0, %gp_rel(bFountainFlag)($gp)
    /* 22DA8 8015C9A0 251A82A3 */  sb         $v0, %gp_rel(cauldronFlag)($gp)
    /* 22DAC 8015C9A4 261A82A3 */  sb         $v0, %gp_rel(mFountainFlag)($gp)
    /* 22DB0 8015C9A8 271A82A3 */  sb         $v0, %gp_rel(pFountainFlag)($gp)
    /* 22DB4 8015C9AC 281A82A3 */  sb         $v0, %gp_rel(tFountainFlag)($gp)
    /* 22DB8 8015C9B0 291A82A3 */  sb         $v0, %gp_rel(treasureFlag)($gp)
    /* 22DBC 8015C9B4 161A82A3 */  sb         $v0, %gp_rel(weaponFlag)($gp)
    /* 22DC0 8015C9B8 10000224 */  addiu      $v0, $zero, 0x10
    /* 22DC4 8015C9BC 4000BFAF */  sw         $ra, 0x40($sp)
    /* 22DC8 8015C9C0 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 22DCC 8015C9C4 3800B4AF */  sw         $s4, 0x38($sp)
    /* 22DD0 8015C9C8 3400B3AF */  sw         $s3, 0x34($sp)
    /* 22DD4 8015C9CC 3000B2AF */  sw         $s2, 0x30($sp)
    /* 22DD8 8015C9D0 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 22DDC 8015C9D4 2800B0AF */  sw         $s0, 0x28($sp)
    /* 22DE0 8015C9D8 0C1A80AF */  sw         $zero, %gp_rel(numthemes)($gp)
    /* 22DE4 8015C9DC 151A80A3 */  sb         $zero, %gp_rel(bCrossFlag)($gp)
    /* 22DE8 8015C9E0 B0006210 */  beq        $v1, $v0, .L8015CCA4
    /* 22DEC 8015C9E4 01000224 */   addiu     $v0, $zero, 0x1
    /* 22DF0 8015C9E8 1280033C */  lui        $v1, %hi(leveltype)
    /* 22DF4 8015C9EC 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 22DF8 8015C9F0 00000000 */  nop
    /* 22DFC 8015C9F4 38006214 */  bne        $v1, $v0, .L8015CAD8
    /* 22E00 8015C9F8 00000000 */   nop
    /* 22E04 8015C9FC 03001124 */  addiu      $s1, $zero, 0x3
    /* 22E08 8015CA00 1280023C */  lui        $v0, %hi(ThemeGoodIn + 0x3)
    /* 22E0C 8015CA04 AFC14224 */  addiu      $v0, $v0, %lo(ThemeGoodIn + 0x3)
  .L8015CA08:
    /* 22E10 8015CA08 000040A0 */  sb         $zero, 0x0($v0)
    /* 22E14 8015CA0C FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 22E18 8015CA10 FDFF2106 */  bgez       $s1, .L8015CA08
    /* 22E1C 8015CA14 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 22E20 8015CA18 21880000 */  addu       $s1, $zero, $zero
    /* 22E24 8015CA1C 1080123C */  lui        $s2, %hi(ThemeGood)
    /* 22E28 8015CA20 28275226 */  addiu      $s2, $s2, %lo(ThemeGood)
  .L8015CA24:
    /* 22E2C 8015CA24 0C1A828F */  lw         $v0, %gp_rel(numthemes)($gp)
    /* 22E30 8015CA28 00000000 */  nop
    /* 22E34 8015CA2C 32004228 */  slti       $v0, $v0, 0x32
    /* 22E38 8015CA30 29004010 */  beqz       $v0, .L8015CAD8
    /* 22E3C 8015CA34 00000000 */   nop
    /* 22E40 8015CA38 AF71050C */  jal        CheckThemeRoom__Fi
    /* 22E44 8015CA3C 21202002 */   addu      $a0, $s1, $zero
    /* 22E48 8015CA40 FF004230 */  andi       $v0, $v0, 0xFF
    /* 22E4C 8015CA44 20004010 */  beqz       $v0, .L8015CAC8
    /* 22E50 8015CA48 00000000 */   nop
    /* 22E54 8015CA4C 0C1A828F */  lw         $v0, %gp_rel(numthemes)($gp)
    /* 22E58 8015CA50 00000000 */  nop
    /* 22E5C 8015CA54 C0100200 */  sll        $v0, $v0, 3
    /* 22E60 8015CA58 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 22E64 8015CA5C 21082200 */  addu       $at, $at, $v0
    /* 22E68 8015CA60 4C2831AC */  sw         $s1, %lo(theme + 0x4)($at)
    /* 22E6C 8015CA64 C9F6000C */  jal        ENG_random__Fl
    /* 22E70 8015CA68 04000424 */   addiu     $a0, $zero, 0x4
    /* 22E74 8015CA6C 80100200 */  sll        $v0, $v0, 2
    /* 22E78 8015CA70 21105200 */  addu       $v0, $v0, $s2
    /* 22E7C 8015CA74 0000508C */  lw         $s0, 0x0($v0)
  .L8015CA78:
    /* 22E80 8015CA78 0C1A848F */  lw         $a0, %gp_rel(numthemes)($gp)
    /* 22E84 8015CA7C 3871050C */  jal        SpecialThemeFit__Fii
    /* 22E88 8015CA80 21280002 */   addu      $a1, $s0, $zero
    /* 22E8C 8015CA84 FF004230 */  andi       $v0, $v0, 0xFF
    /* 22E90 8015CA88 05004014 */  bnez       $v0, .L8015CAA0
    /* 22E94 8015CA8C 00000000 */   nop
    /* 22E98 8015CA90 C9F6000C */  jal        ENG_random__Fl
    /* 22E9C 8015CA94 11000424 */   addiu     $a0, $zero, 0x11
    /* 22EA0 8015CA98 9E720508 */  j          .L8015CA78
    /* 22EA4 8015CA9C 21804000 */   addu      $s0, $v0, $zero
  .L8015CAA0:
    /* 22EA8 8015CAA0 0C1A828F */  lw         $v0, %gp_rel(numthemes)($gp)
    /* 22EAC 8015CAA4 00000000 */  nop
    /* 22EB0 8015CAA8 C0100200 */  sll        $v0, $v0, 3
    /* 22EB4 8015CAAC 1080013C */  lui        $at, %hi(theme)
    /* 22EB8 8015CAB0 21082200 */  addu       $at, $at, $v0
    /* 22EBC 8015CAB4 482830A0 */  sb         $s0, %lo(theme)($at)
    /* 22EC0 8015CAB8 0C1A828F */  lw         $v0, %gp_rel(numthemes)($gp)
    /* 22EC4 8015CABC 00000000 */  nop
    /* 22EC8 8015CAC0 01004224 */  addiu      $v0, $v0, 0x1
    /* 22ECC 8015CAC4 0C1A82AF */  sw         $v0, %gp_rel(numthemes)($gp)
  .L8015CAC8:
    /* 22ED0 8015CAC8 01003126 */  addiu      $s1, $s1, 0x1
    /* 22ED4 8015CACC 0001222A */  slti       $v0, $s1, 0x100
    /* 22ED8 8015CAD0 D4FF4014 */  bnez       $v0, .L8015CA24
    /* 22EDC 8015CAD4 00000000 */   nop
  .L8015CAD8:
    /* 22EE0 8015CAD8 1280033C */  lui        $v1, %hi(leveltype)
    /* 22EE4 8015CADC 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 22EE8 8015CAE0 00000000 */  nop
    /* 22EEC 8015CAE4 FEFF6224 */  addiu      $v0, $v1, -0x2
    /* 22EF0 8015CAE8 0200422C */  sltiu      $v0, $v0, 0x2
    /* 22EF4 8015CAEC 04004014 */  bnez       $v0, .L8015CB00
    /* 22EF8 8015CAF0 FF006330 */   andi      $v1, $v1, 0xFF
    /* 22EFC 8015CAF4 04000224 */  addiu      $v0, $zero, 0x4
    /* 22F00 8015CAF8 6A006214 */  bne        $v1, $v0, .L8015CCA4
    /* 22F04 8015CAFC 00000000 */   nop
  .L8015CB00:
    /* 22F08 8015CB00 1280023C */  lui        $v0, %hi(themeCount)
    /* 22F0C 8015CB04 4CC1428C */  lw         $v0, %lo(themeCount)($v0)
    /* 22F10 8015CB08 00000000 */  nop
    /* 22F14 8015CB0C 0C004018 */  blez       $v0, .L8015CB40
    /* 22F18 8015CB10 21880000 */   addu      $s1, $zero, $zero
    /* 22F1C 8015CB14 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 22F20 8015CB18 21180000 */  addu       $v1, $zero, $zero
  .L8015CB1C:
    /* 22F24 8015CB1C 1080013C */  lui        $at, %hi(theme)
    /* 22F28 8015CB20 21082300 */  addu       $at, $at, $v1
    /* 22F2C 8015CB24 482824A0 */  sb         $a0, %lo(theme)($at)
    /* 22F30 8015CB28 1280023C */  lui        $v0, %hi(themeCount)
    /* 22F34 8015CB2C 4CC1428C */  lw         $v0, %lo(themeCount)($v0)
    /* 22F38 8015CB30 01003126 */  addiu      $s1, $s1, 0x1
    /* 22F3C 8015CB34 2A102202 */  slt        $v0, $s1, $v0
    /* 22F40 8015CB38 F8FF4014 */  bnez       $v0, .L8015CB1C
    /* 22F44 8015CB3C 08006324 */   addiu     $v1, $v1, 0x8
  .L8015CB40:
    /* 22F48 8015CB40 DC9E010C */  jal        QuestStatus__Fi
    /* 22F4C 8015CB44 03000424 */   addiu     $a0, $zero, 0x3
    /* 22F50 8015CB48 FF004230 */  andi       $v0, $v0, 0xFF
    /* 22F54 8015CB4C 22004010 */  beqz       $v0, .L8015CBD8
    /* 22F58 8015CB50 00000000 */   nop
    /* 22F5C 8015CB54 1280023C */  lui        $v0, %hi(themeCount)
    /* 22F60 8015CB58 4CC1428C */  lw         $v0, %lo(themeCount)($v0)
    /* 22F64 8015CB5C 00000000 */  nop
    /* 22F68 8015CB60 1F004018 */  blez       $v0, .L8015CBE0
    /* 22F6C 8015CB64 21880000 */   addu      $s1, $zero, $zero
    /* 22F70 8015CB68 05001324 */  addiu      $s3, $zero, 0x5
    /* 22F74 8015CB6C 21900000 */  addu       $s2, $zero, $zero
    /* 22F78 8015CB70 21800000 */  addu       $s0, $zero, $zero
  .L8015CB74:
    /* 22F7C 8015CB74 21202002 */  addu       $a0, $s1, $zero
    /* 22F80 8015CB78 1480013C */  lui        $at, %hi(themeLoc + 0x8)
    /* 22F84 8015CB7C 21083200 */  addu       $at, $at, $s2
    /* 22F88 8015CB80 709C228C */  lw         $v0, %lo(themeLoc + 0x8)($at)
    /* 22F8C 8015CB84 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 22F90 8015CB88 21083000 */  addu       $at, $at, $s0
    /* 22F94 8015CB8C 4C2822AC */  sw         $v0, %lo(theme + 0x4)($at)
    /* 22F98 8015CB90 3871050C */  jal        SpecialThemeFit__Fii
    /* 22F9C 8015CB94 05000524 */   addiu     $a1, $zero, 0x5
    /* 22FA0 8015CB98 FF004230 */  andi       $v0, $v0, 0xFF
    /* 22FA4 8015CB9C 07004010 */  beqz       $v0, .L8015CBBC
    /* 22FA8 8015CBA0 00000000 */   nop
    /* 22FAC 8015CBA4 1080013C */  lui        $at, %hi(theme)
    /* 22FB0 8015CBA8 21083000 */  addu       $at, $at, $s0
    /* 22FB4 8015CBAC 482833A0 */  sb         $s3, %lo(theme)($at)
    /* 22FB8 8015CBB0 101A91AF */  sw         $s1, %gp_rel(zharlib)($gp)
    /* 22FBC 8015CBB4 F6720508 */  j          .L8015CBD8
    /* 22FC0 8015CBB8 00000000 */   nop
  .L8015CBBC:
    /* 22FC4 8015CBBC 14005226 */  addiu      $s2, $s2, 0x14
    /* 22FC8 8015CBC0 1280023C */  lui        $v0, %hi(themeCount)
    /* 22FCC 8015CBC4 4CC1428C */  lw         $v0, %lo(themeCount)($v0)
    /* 22FD0 8015CBC8 01003126 */  addiu      $s1, $s1, 0x1
    /* 22FD4 8015CBCC 2A102202 */  slt        $v0, $s1, $v0
    /* 22FD8 8015CBD0 E8FF4014 */  bnez       $v0, .L8015CB74
    /* 22FDC 8015CBD4 08001026 */   addiu     $s0, $s0, 0x8
  .L8015CBD8:
    /* 22FE0 8015CBD8 1280023C */  lui        $v0, %hi(themeCount)
    /* 22FE4 8015CBDC 4CC1428C */  lw         $v0, %lo(themeCount)($v0)
  .L8015CBE0:
    /* 22FE8 8015CBE0 00000000 */  nop
    /* 22FEC 8015CBE4 29004018 */  blez       $v0, .L8015CC8C
    /* 22FF0 8015CBE8 21880000 */   addu      $s1, $zero, $zero
    /* 22FF4 8015CBEC 1080153C */  lui        $s5, %hi(ThemeGood)
    /* 22FF8 8015CBF0 2827B526 */  addiu      $s5, $s5, %lo(ThemeGood)
    /* 22FFC 8015CBF4 1080123C */  lui        $s2, %hi(theme)
    /* 23000 8015CBF8 48285226 */  addiu      $s2, $s2, %lo(theme)
    /* 23004 8015CBFC 21A00000 */  addu       $s4, $zero, $zero
    /* 23008 8015CC00 21980000 */  addu       $s3, $zero, $zero
  .L8015CC04:
    /* 2300C 8015CC04 00004382 */  lb         $v1, 0x0($s2)
    /* 23010 8015CC08 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 23014 8015CC0C 17006214 */  bne        $v1, $v0, .L8015CC6C
    /* 23018 8015CC10 00000000 */   nop
    /* 2301C 8015CC14 1480013C */  lui        $at, %hi(themeLoc + 0x8)
    /* 23020 8015CC18 21083300 */  addu       $at, $at, $s3
    /* 23024 8015CC1C 709C228C */  lw         $v0, %lo(themeLoc + 0x8)($at)
    /* 23028 8015CC20 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 2302C 8015CC24 21083400 */  addu       $at, $at, $s4
    /* 23030 8015CC28 4C2822AC */  sw         $v0, %lo(theme + 0x4)($at)
    /* 23034 8015CC2C C9F6000C */  jal        ENG_random__Fl
    /* 23038 8015CC30 04000424 */   addiu     $a0, $zero, 0x4
    /* 2303C 8015CC34 80100200 */  sll        $v0, $v0, 2
    /* 23040 8015CC38 21105500 */  addu       $v0, $v0, $s5
    /* 23044 8015CC3C 0000508C */  lw         $s0, 0x0($v0)
  .L8015CC40:
    /* 23048 8015CC40 21202002 */  addu       $a0, $s1, $zero
    /* 2304C 8015CC44 3871050C */  jal        SpecialThemeFit__Fii
    /* 23050 8015CC48 21280002 */   addu      $a1, $s0, $zero
    /* 23054 8015CC4C FF004230 */  andi       $v0, $v0, 0xFF
    /* 23058 8015CC50 05004014 */  bnez       $v0, .L8015CC68
    /* 2305C 8015CC54 00000000 */   nop
    /* 23060 8015CC58 C9F6000C */  jal        ENG_random__Fl
    /* 23064 8015CC5C 11000424 */   addiu     $a0, $zero, 0x11
    /* 23068 8015CC60 10730508 */  j          .L8015CC40
    /* 2306C 8015CC64 21804000 */   addu      $s0, $v0, $zero
  .L8015CC68:
    /* 23070 8015CC68 000050A2 */  sb         $s0, 0x0($s2)
  .L8015CC6C:
    /* 23074 8015CC6C 08005226 */  addiu      $s2, $s2, 0x8
    /* 23078 8015CC70 08009426 */  addiu      $s4, $s4, 0x8
    /* 2307C 8015CC74 1280023C */  lui        $v0, %hi(themeCount)
    /* 23080 8015CC78 4CC1428C */  lw         $v0, %lo(themeCount)($v0)
    /* 23084 8015CC7C 01003126 */  addiu      $s1, $s1, 0x1
    /* 23088 8015CC80 2A102202 */  slt        $v0, $s1, $v0
    /* 2308C 8015CC84 DFFF4014 */  bnez       $v0, .L8015CC04
    /* 23090 8015CC88 14007326 */   addiu     $s3, $s3, 0x14
  .L8015CC8C:
    /* 23094 8015CC8C 0C1A828F */  lw         $v0, %gp_rel(numthemes)($gp)
    /* 23098 8015CC90 1280033C */  lui        $v1, %hi(themeCount)
    /* 2309C 8015CC94 4CC1638C */  lw         $v1, %lo(themeCount)($v1)
    /* 230A0 8015CC98 00000000 */  nop
    /* 230A4 8015CC9C 21104300 */  addu       $v0, $v0, $v1
    /* 230A8 8015CCA0 0C1A82AF */  sw         $v0, %gp_rel(numthemes)($gp)
  .L8015CCA4:
    /* 230AC 8015CCA4 4000BF8F */  lw         $ra, 0x40($sp)
    /* 230B0 8015CCA8 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 230B4 8015CCAC 3800B48F */  lw         $s4, 0x38($sp)
    /* 230B8 8015CCB0 3400B38F */  lw         $s3, 0x34($sp)
    /* 230BC 8015CCB4 3000B28F */  lw         $s2, 0x30($sp)
    /* 230C0 8015CCB8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 230C4 8015CCBC 2800B08F */  lw         $s0, 0x28($sp)
    /* 230C8 8015CCC0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 230CC 8015CCC4 0800E003 */  jr         $ra
    /* 230D0 8015CCC8 00000000 */   nop
endlabel InitThemes__Fv
