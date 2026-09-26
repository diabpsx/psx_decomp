.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrepDoEnding__Fi, 0x148

glabel PrepDoEnding__Fi
    /* 14FCC 8014EBC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 14FD0 8014EBC8 1280033C */  lui        $v1, %hi(myplr)
    /* 14FD4 8014EBCC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 14FD8 8014EBD0 01008424 */  addiu      $a0, $a0, 0x1
    /* 14FDC 8014EBD4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 14FE0 8014EBD8 1280013C */  lui        $at, %hi(gbDoEnding)
    /* 14FE4 8014EBDC 01B824A0 */  sb         $a0, %lo(gbDoEnding)($at)
    /* 14FE8 8014EBE0 1280013C */  lui        $at, %hi(gbRunGame)
    /* 14FEC 8014EBE4 02B820A0 */  sb         $zero, %lo(gbRunGame)($at)
    /* 14FF0 8014EBE8 1280013C */  lui        $at, %hi(deathflag)
    /* 14FF4 8014EBEC 0CBA20A0 */  sb         $zero, %lo(deathflag)($at)
    /* 14FF8 8014EBF0 40100300 */  sll        $v0, $v1, 1
    /* 14FFC 8014EBF4 21104300 */  addu       $v0, $v0, $v1
    /* 15000 8014EBF8 80100200 */  sll        $v0, $v0, 2
    /* 15004 8014EBFC 21104300 */  addu       $v0, $v0, $v1
    /* 15008 8014EC00 00110200 */  sll        $v0, $v0, 4
    /* 1500C 8014EC04 23104300 */  subu       $v0, $v0, $v1
    /* 15010 8014EC08 80100200 */  sll        $v0, $v0, 2
    /* 15014 8014EC0C 21104300 */  addu       $v0, $v0, $v1
    /* 15018 8014EC10 C0280200 */  sll        $a1, $v0, 3
    /* 1501C 8014EC14 1280023C */  lui        $v0, %hi(gnDifficulty)
    /* 15020 8014EC18 08C1428C */  lw         $v0, %lo(gnDifficulty)($v0)
    /* 15024 8014EC1C 0E80013C */  lui        $at, %hi(plr + 0x19E4)
    /* 15028 8014EC20 21082500 */  addu       $at, $at, $a1
    /* 1502C 8014EC24 1CBF238C */  lw         $v1, %lo(plr + 0x19E4)($at)
    /* 15030 8014EC28 01004424 */  addiu      $a0, $v0, 0x1
    /* 15034 8014EC2C 2B106400 */  sltu       $v0, $v1, $a0
    /* 15038 8014EC30 02004010 */  beqz       $v0, .L8014EC3C
    /* 1503C 8014EC34 00000000 */   nop
    /* 15040 8014EC38 21188000 */  addu       $v1, $a0, $zero
  .L8014EC3C:
    /* 15044 8014EC3C 0E80013C */  lui        $at, %hi(plr + 0x19E4)
    /* 15048 8014EC40 21082500 */  addu       $at, $at, $a1
    /* 1504C 8014EC44 1CBF23AC */  sw         $v1, %lo(plr + 0x19E4)($at)
    /* 15050 8014EC48 21300000 */  addu       $a2, $zero, $zero
    /* 15054 8014EC4C 0B000924 */  addiu      $t1, $zero, 0xB
    /* 15058 8014EC50 01000824 */  addiu      $t0, $zero, 0x1
    /* 1505C 8014EC54 40000724 */  addiu      $a3, $zero, 0x40
    /* 15060 8014EC58 0E80033C */  lui        $v1, %hi(plr + 0x130)
    /* 15064 8014EC5C 68A66324 */  addiu      $v1, $v1, %lo(plr + 0x130)
    /* 15068 8014EC60 ECFF6524 */  addiu      $a1, $v1, -0x14
    /* 1506C 8014EC64 21200000 */  addu       $a0, $zero, $zero
  .L8014EC68:
    /* 15070 8014EC68 0E80013C */  lui        $at, %hi(plr + 0xD3)
    /* 15074 8014EC6C 21082400 */  addu       $at, $at, $a0
    /* 15078 8014EC70 0BA628A0 */  sb         $t0, %lo(plr + 0xD3)($at)
    /* 1507C 8014EC74 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 15080 8014EC78 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 15084 8014EC7C 0E80013C */  lui        $at, %hi(plr)
    /* 15088 8014EC80 21082400 */  addu       $at, $at, $a0
    /* 1508C 8014EC84 38A529AC */  sw         $t1, %lo(plr)($at)
    /* 15090 8014EC88 0200422C */  sltiu      $v0, $v0, 0x2
    /* 15094 8014EC8C 0D004014 */  bnez       $v0, .L8014ECC4
    /* 15098 8014EC90 00000000 */   nop
    /* 1509C 8014EC94 0000A28C */  lw         $v0, 0x0($a1)
    /* 150A0 8014EC98 00000000 */  nop
    /* 150A4 8014EC9C 83110200 */  sra        $v0, $v0, 6
    /* 150A8 8014ECA0 02004014 */  bnez       $v0, .L8014ECAC
    /* 150AC 8014ECA4 00000000 */   nop
    /* 150B0 8014ECA8 0000A7AC */  sw         $a3, 0x0($a1)
  .L8014ECAC:
    /* 150B4 8014ECAC 0000628C */  lw         $v0, 0x0($v1)
    /* 150B8 8014ECB0 00000000 */  nop
    /* 150BC 8014ECB4 83110200 */  sra        $v0, $v0, 6
    /* 150C0 8014ECB8 02004014 */  bnez       $v0, .L8014ECC4
    /* 150C4 8014ECBC 00000000 */   nop
    /* 150C8 8014ECC0 000067AC */  sw         $a3, 0x0($v1)
  .L8014ECC4:
    /* 150CC 8014ECC4 E8196324 */  addiu      $v1, $v1, 0x19E8
    /* 150D0 8014ECC8 E819A524 */  addiu      $a1, $a1, 0x19E8
    /* 150D4 8014ECCC 0100C624 */  addiu      $a2, $a2, 0x1
    /* 150D8 8014ECD0 0200C228 */  slti       $v0, $a2, 0x2
    /* 150DC 8014ECD4 E4FF4014 */  bnez       $v0, .L8014EC68
    /* 150E0 8014ECD8 E8198424 */   addiu     $a0, $a0, 0x19E8
    /* 150E4 8014ECDC 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 150E8 8014ECE0 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 150EC 8014ECE4 00000000 */  nop
    /* 150F0 8014ECE8 02004010 */  beqz       $v0, .L8014ECF4
    /* 150F4 8014ECEC 18000424 */   addiu     $a0, $zero, 0x18
    /* 150F8 8014ECF0 30000424 */  addiu      $a0, $zero, 0x30
  .L8014ECF4:
    /* 150FC 8014ECF4 FBDF010C */  jal        HappyMan__Fi
    /* 15100 8014ECF8 00000000 */   nop
    /* 15104 8014ECFC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 15108 8014ED00 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1510C 8014ED04 0800E003 */  jr         $ra
    /* 15110 8014ED08 00000000 */   nop
endlabel PrepDoEnding__Fi
