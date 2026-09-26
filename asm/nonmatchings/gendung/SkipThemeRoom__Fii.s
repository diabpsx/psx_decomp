.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SkipThemeRoom__Fii, 0xCC

glabel SkipThemeRoom__Fii
    /* 21F04 8015BAFC F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 21F08 8015BB00 CC19828F */  lw         $v0, %gp_rel(themeCount)($gp)
    /* 21F0C 8015BB04 00000000 */  nop
    /* 21F10 8015BB08 2B004018 */  blez       $v0, .L8015BBB8
    /* 21F14 8015BB0C 21380000 */   addu      $a3, $zero, $zero
    /* 21F18 8015BB10 21404000 */  addu       $t0, $v0, $zero
    /* 21F1C 8015BB14 21300000 */  addu       $a2, $zero, $zero
  .L8015BB18:
    /* 21F20 8015BB18 1480013C */  lui        $at, %hi(themeLoc)
    /* 21F24 8015BB1C 21082600 */  addu       $at, $at, $a2
    /* 21F28 8015BB20 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 21F2C 8015BB24 00000000 */  nop
    /* 21F30 8015BB28 FEFF6224 */  addiu      $v0, $v1, -0x2
    /* 21F34 8015BB2C 2A108200 */  slt        $v0, $a0, $v0
    /* 21F38 8015BB30 1D004014 */  bnez       $v0, .L8015BBA8
    /* 21F3C 8015BB34 00000000 */   nop
    /* 21F40 8015BB38 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21F44 8015BB3C 21082600 */  addu       $at, $at, $a2
    /* 21F48 8015BB40 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21F4C 8015BB44 00000000 */  nop
    /* 21F50 8015BB48 21106200 */  addu       $v0, $v1, $v0
    /* 21F54 8015BB4C 02004224 */  addiu      $v0, $v0, 0x2
    /* 21F58 8015BB50 2A104400 */  slt        $v0, $v0, $a0
    /* 21F5C 8015BB54 14004014 */  bnez       $v0, .L8015BBA8
    /* 21F60 8015BB58 00000000 */   nop
    /* 21F64 8015BB5C 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21F68 8015BB60 21082600 */  addu       $at, $at, $a2
    /* 21F6C 8015BB64 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 21F70 8015BB68 00000000 */  nop
    /* 21F74 8015BB6C FEFF6224 */  addiu      $v0, $v1, -0x2
    /* 21F78 8015BB70 2A10A200 */  slt        $v0, $a1, $v0
    /* 21F7C 8015BB74 0C004014 */  bnez       $v0, .L8015BBA8
    /* 21F80 8015BB78 00000000 */   nop
    /* 21F84 8015BB7C 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21F88 8015BB80 21082600 */  addu       $at, $at, $a2
    /* 21F8C 8015BB84 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 21F90 8015BB88 00000000 */  nop
    /* 21F94 8015BB8C 21106200 */  addu       $v0, $v1, $v0
    /* 21F98 8015BB90 02004224 */  addiu      $v0, $v0, 0x2
    /* 21F9C 8015BB94 2A104500 */  slt        $v0, $v0, $a1
    /* 21FA0 8015BB98 04004014 */  bnez       $v0, .L8015BBAC
    /* 21FA4 8015BB9C 0100E724 */   addiu     $a3, $a3, 0x1
    /* 21FA8 8015BBA0 EF6E0508 */  j          .L8015BBBC
    /* 21FAC 8015BBA4 21100000 */   addu      $v0, $zero, $zero
  .L8015BBA8:
    /* 21FB0 8015BBA8 0100E724 */  addiu      $a3, $a3, 0x1
  .L8015BBAC:
    /* 21FB4 8015BBAC 2A10E800 */  slt        $v0, $a3, $t0
    /* 21FB8 8015BBB0 D9FF4014 */  bnez       $v0, .L8015BB18
    /* 21FBC 8015BBB4 1400C624 */   addiu     $a2, $a2, 0x14
  .L8015BBB8:
    /* 21FC0 8015BBB8 01000224 */  addiu      $v0, $zero, 0x1
  .L8015BBBC:
    /* 21FC4 8015BBBC 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 21FC8 8015BBC0 0800E003 */  jr         $ra
    /* 21FCC 8015BBC4 00000000 */   nop
endlabel SkipThemeRoom__Fii
