.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3SetWalls__Fv, 0xB4

glabel DRLG_L3SetWalls__Fv
    /* 12E70 8014CA68 10000924 */  addiu      $t1, $zero, 0x10
    /* 12E74 8014CA6C 21380000 */  addu       $a3, $zero, $zero
    /* 12E78 8014CA70 0E800B3C */  lui        $t3, %hi(dungeon)
    /* 12E7C 8014CA74 C4406B25 */  addiu      $t3, $t3, %lo(dungeon)
    /* 12E80 8014CA78 DFFF0A24 */  addiu      $t2, $zero, -0x21
  .L8014CA7C:
    /* 12E84 8014CA7C 2800E228 */  slti       $v0, $a3, 0x28
    /* 12E88 8014CA80 24004010 */  beqz       $v0, .L8014CB14
    /* 12E8C 8014CA84 21300000 */   addu      $a2, $zero, $zero
    /* 12E90 8014CA88 40400700 */  sll        $t0, $a3, 1
    /* 12E94 8014CA8C 21286001 */  addu       $a1, $t3, $zero
    /* 12E98 8014CA90 C0100900 */  sll        $v0, $t1, 3
    /* 12E9C 8014CA94 00384424 */  addiu      $a0, $v0, 0x3800
  .L8014CA98:
    /* 12EA0 8014CA98 2800C228 */  slti       $v0, $a2, 0x28
    /* 12EA4 8014CA9C 1A004010 */  beqz       $v0, .L8014CB08
    /* 12EA8 8014CAA0 21100501 */   addu      $v0, $t0, $a1
    /* 12EAC 8014CAA4 00004394 */  lhu        $v1, 0x0($v0)
    /* 12EB0 8014CAA8 00000000 */  nop
    /* 12EB4 8014CAAC F9FF6224 */  addiu      $v0, $v1, -0x7
    /* 12EB8 8014CAB0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 12EBC 8014CAB4 03004014 */  bnez       $v0, .L8014CAC4
    /* 12EC0 8014CAB8 00000000 */   nop
    /* 12EC4 8014CABC 06006014 */  bnez       $v1, .L8014CAD8
    /* 12EC8 8014CAC0 00000000 */   nop
  .L8014CAC4:
    /* 12ECC 8014CAC4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 12ED0 8014CAC8 21082400 */  addu       $at, $at, $a0
    /* 12ED4 8014CACC 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 12ED8 8014CAD0 BB320508 */  j          .L8014CAEC
    /* 12EDC 8014CAD4 20004234 */   ori       $v0, $v0, 0x20
  .L8014CAD8:
    /* 12EE0 8014CAD8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 12EE4 8014CADC 21082400 */  addu       $at, $at, $a0
    /* 12EE8 8014CAE0 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 12EEC 8014CAE4 00000000 */  nop
    /* 12EF0 8014CAE8 24104A00 */  and        $v0, $v0, $t2
  .L8014CAEC:
    /* 12EF4 8014CAEC 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 12EF8 8014CAF0 21082400 */  addu       $at, $at, $a0
    /* 12EFC 8014CAF4 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 12F00 8014CAF8 00078424 */  addiu      $a0, $a0, 0x700
    /* 12F04 8014CAFC 6000A524 */  addiu      $a1, $a1, 0x60
    /* 12F08 8014CB00 A6320508 */  j          .L8014CA98
    /* 12F0C 8014CB04 0100C624 */   addiu     $a2, $a2, 0x1
  .L8014CB08:
    /* 12F10 8014CB08 02002925 */  addiu      $t1, $t1, 0x2
    /* 12F14 8014CB0C 9F320508 */  j          .L8014CA7C
    /* 12F18 8014CB10 0100E724 */   addiu     $a3, $a3, 0x1
  .L8014CB14:
    /* 12F1C 8014CB14 0800E003 */  jr         $ra
    /* 12F20 8014CB18 00000000 */   nop
endlabel DRLG_L3SetWalls__Fv
