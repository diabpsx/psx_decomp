.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_HoldThemeRooms__Fv, 0x1A4

glabel DRLG_HoldThemeRooms__Fv
    /* 21D60 8015B958 CC19828F */  lw         $v0, %gp_rel(themeCount)($gp)
    /* 21D64 8015B95C 00000000 */  nop
    /* 21D68 8015B960 63004018 */  blez       $v0, .L8015BAF0
    /* 21D6C 8015B964 F8FFBD27 */   addiu     $sp, $sp, -0x8
    /* 21D70 8015B968 61004018 */  blez       $v0, .L8015BAF0
    /* 21D74 8015B96C 21C80000 */   addu      $t9, $zero, $zero
    /* 21D78 8015B970 14800F3C */  lui        $t7, %hi(themeLoc + 0x10)
    /* 21D7C 8015B974 789CEF25 */  addiu      $t7, $t7, %lo(themeLoc + 0x10)
    /* 21D80 8015B978 F4FFF825 */  addiu      $t8, $t7, -0xC
    /* 21D84 8015B97C 21700000 */  addu       $t6, $zero, $zero
  .L8015B980:
    /* 21D88 8015B980 0000088F */  lw         $t0, 0x0($t8)
    /* 21D8C 8015B984 0000E28D */  lw         $v0, 0x0($t7)
    /* 21D90 8015B988 00000000 */  nop
    /* 21D94 8015B98C 21100201 */  addu       $v0, $t0, $v0
    /* 21D98 8015B990 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 21D9C 8015B994 2A100201 */  slt        $v0, $t0, $v0
    /* 21DA0 8015B998 4E004010 */  beqz       $v0, .L8015BAD4
    /* 21DA4 8015B99C 00110800 */   sll       $v0, $t0, 4
    /* 21DA8 8015B9A0 88004D24 */  addiu      $t5, $v0, 0x88
    /* 21DAC 8015B9A4 80004C24 */  addiu      $t4, $v0, 0x80
  .L8015B9A8:
    /* 21DB0 8015B9A8 1480013C */  lui        $at, %hi(themeLoc)
    /* 21DB4 8015B9AC 21082E00 */  addu       $at, $at, $t6
    /* 21DB8 8015B9B0 689C278C */  lw         $a3, %lo(themeLoc)($at)
    /* 21DBC 8015B9B4 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21DC0 8015B9B8 21082E00 */  addu       $at, $at, $t6
    /* 21DC4 8015B9BC 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21DC8 8015B9C0 00000000 */  nop
    /* 21DCC 8015B9C4 2110E200 */  addu       $v0, $a3, $v0
    /* 21DD0 8015B9C8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 21DD4 8015B9CC 2A10E200 */  slt        $v0, $a3, $v0
    /* 21DD8 8015B9D0 37004010 */  beqz       $v0, .L8015BAB0
    /* 21DDC 8015B9D4 C0100700 */   sll       $v0, $a3, 3
    /* 21DE0 8015B9D8 21588001 */  addu       $t3, $t4, $zero
    /* 21DE4 8015B9DC 2150A001 */  addu       $t2, $t5, $zero
    /* 21DE8 8015B9E0 2148C001 */  addu       $t1, $t6, $zero
    /* 21DEC 8015B9E4 23104700 */  subu       $v0, $v0, $a3
    /* 21DF0 8015B9E8 00120200 */  sll        $v0, $v0, 8
    /* 21DF4 8015B9EC 803B4624 */  addiu      $a2, $v0, 0x3B80
    /* 21DF8 8015B9F0 00384524 */  addiu      $a1, $v0, 0x3800
  .L8015B9F4:
    /* 21DFC 8015B9F4 21186501 */  addu       $v1, $t3, $a1
    /* 21E00 8015B9F8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 21E04 8015B9FC 21082300 */  addu       $at, $at, $v1
    /* 21E08 8015BA00 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 21E0C 8015BA04 00000000 */  nop
    /* 21E10 8015BA08 08004234 */  ori        $v0, $v0, 0x8
    /* 21E14 8015BA0C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 21E18 8015BA10 21082300 */  addu       $at, $at, $v1
    /* 21E1C 8015BA14 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 21E20 8015BA18 21186601 */  addu       $v1, $t3, $a2
    /* 21E24 8015BA1C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 21E28 8015BA20 21082300 */  addu       $at, $at, $v1
    /* 21E2C 8015BA24 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 21E30 8015BA28 21204601 */  addu       $a0, $t2, $a2
    /* 21E34 8015BA2C 08004234 */  ori        $v0, $v0, 0x8
    /* 21E38 8015BA30 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 21E3C 8015BA34 21082300 */  addu       $at, $at, $v1
    /* 21E40 8015BA38 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 21E44 8015BA3C 21184501 */  addu       $v1, $t2, $a1
    /* 21E48 8015BA40 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 21E4C 8015BA44 21082300 */  addu       $at, $at, $v1
    /* 21E50 8015BA48 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 21E54 8015BA4C 0100E724 */  addiu      $a3, $a3, 0x1
    /* 21E58 8015BA50 08004234 */  ori        $v0, $v0, 0x8
    /* 21E5C 8015BA54 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 21E60 8015BA58 21082300 */  addu       $at, $at, $v1
    /* 21E64 8015BA5C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 21E68 8015BA60 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 21E6C 8015BA64 21082400 */  addu       $at, $at, $a0
    /* 21E70 8015BA68 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 21E74 8015BA6C 0007C624 */  addiu      $a2, $a2, 0x700
    /* 21E78 8015BA70 08004234 */  ori        $v0, $v0, 0x8
    /* 21E7C 8015BA74 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 21E80 8015BA78 21082400 */  addu       $at, $at, $a0
    /* 21E84 8015BA7C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 21E88 8015BA80 1480013C */  lui        $at, %hi(themeLoc)
    /* 21E8C 8015BA84 21082900 */  addu       $at, $at, $t1
    /* 21E90 8015BA88 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 21E94 8015BA8C 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21E98 8015BA90 21082900 */  addu       $at, $at, $t1
    /* 21E9C 8015BA94 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 21EA0 8015BA98 00000000 */  nop
    /* 21EA4 8015BA9C 21104300 */  addu       $v0, $v0, $v1
    /* 21EA8 8015BAA0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 21EAC 8015BAA4 2A10E200 */  slt        $v0, $a3, $v0
    /* 21EB0 8015BAA8 D2FF4014 */  bnez       $v0, .L8015B9F4
    /* 21EB4 8015BAAC 0007A524 */   addiu     $a1, $a1, 0x700
  .L8015BAB0:
    /* 21EB8 8015BAB0 1000AD25 */  addiu      $t5, $t5, 0x10
    /* 21EBC 8015BAB4 0000028F */  lw         $v0, 0x0($t8)
    /* 21EC0 8015BAB8 0000E38D */  lw         $v1, 0x0($t7)
    /* 21EC4 8015BABC 01000825 */  addiu      $t0, $t0, 0x1
    /* 21EC8 8015BAC0 21104300 */  addu       $v0, $v0, $v1
    /* 21ECC 8015BAC4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 21ED0 8015BAC8 2A100201 */  slt        $v0, $t0, $v0
    /* 21ED4 8015BACC B6FF4014 */  bnez       $v0, .L8015B9A8
    /* 21ED8 8015BAD0 10008C25 */   addiu     $t4, $t4, 0x10
  .L8015BAD4:
    /* 21EDC 8015BAD4 1400EF25 */  addiu      $t7, $t7, 0x14
    /* 21EE0 8015BAD8 14001827 */  addiu      $t8, $t8, 0x14
    /* 21EE4 8015BADC CC19828F */  lw         $v0, %gp_rel(themeCount)($gp)
    /* 21EE8 8015BAE0 01003927 */  addiu      $t9, $t9, 0x1
    /* 21EEC 8015BAE4 2A102203 */  slt        $v0, $t9, $v0
    /* 21EF0 8015BAE8 A5FF4014 */  bnez       $v0, .L8015B980
    /* 21EF4 8015BAEC 1400CE25 */   addiu     $t6, $t6, 0x14
  .L8015BAF0:
    /* 21EF8 8015BAF0 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 21EFC 8015BAF4 0800E003 */  jr         $ra
    /* 21F00 8015BAF8 00000000 */   nop
endlabel DRLG_HoldThemeRooms__Fv
