.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_SetWalls__Fv, 0xBC

glabel DRLG_SetWalls__Fv
    /* 2E10 8013CA08 10000824 */  addiu      $t0, $zero, 0x10
    /* 2E14 8013CA0C 21300000 */  addu       $a2, $zero, $zero
    /* 2E18 8013CA10 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 2E1C 8013CA14 C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
    /* 2E20 8013CA18 0D000B24 */  addiu      $t3, $zero, 0xD
    /* 2E24 8013CA1C 16000A24 */  addiu      $t2, $zero, 0x16
    /* 2E28 8013CA20 DFFF0924 */  addiu      $t1, $zero, -0x21
  .L8013CA24:
    /* 2E2C 8013CA24 2800C228 */  slti       $v0, $a2, 0x28
    /* 2E30 8013CA28 24004010 */  beqz       $v0, .L8013CABC
    /* 2E34 8013CA2C 21280000 */   addu      $a1, $zero, $zero
    /* 2E38 8013CA30 40380600 */  sll        $a3, $a2, 1
    /* 2E3C 8013CA34 21208001 */  addu       $a0, $t4, $zero
    /* 2E40 8013CA38 C0100800 */  sll        $v0, $t0, 3
    /* 2E44 8013CA3C 00384324 */  addiu      $v1, $v0, 0x3800
  .L8013CA40:
    /* 2E48 8013CA40 2800A228 */  slti       $v0, $a1, 0x28
    /* 2E4C 8013CA44 1A004010 */  beqz       $v0, .L8013CAB0
    /* 2E50 8013CA48 2110E400 */   addu      $v0, $a3, $a0
    /* 2E54 8013CA4C 00004294 */  lhu        $v0, 0x0($v0)
    /* 2E58 8013CA50 00000000 */  nop
    /* 2E5C 8013CA54 05004B10 */  beq        $v0, $t3, .L8013CA6C
    /* 2E60 8013CA58 00000000 */   nop
    /* 2E64 8013CA5C 03004A10 */  beq        $v0, $t2, .L8013CA6C
    /* 2E68 8013CA60 00000000 */   nop
    /* 2E6C 8013CA64 06004014 */  bnez       $v0, .L8013CA80
    /* 2E70 8013CA68 00000000 */   nop
  .L8013CA6C:
    /* 2E74 8013CA6C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 2E78 8013CA70 21082300 */  addu       $at, $at, $v1
    /* 2E7C 8013CA74 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 2E80 8013CA78 A5F20408 */  j          .L8013CA94
    /* 2E84 8013CA7C 20004234 */   ori       $v0, $v0, 0x20
  .L8013CA80:
    /* 2E88 8013CA80 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 2E8C 8013CA84 21082300 */  addu       $at, $at, $v1
    /* 2E90 8013CA88 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 2E94 8013CA8C 00000000 */  nop
    /* 2E98 8013CA90 24104900 */  and        $v0, $v0, $t1
  .L8013CA94:
    /* 2E9C 8013CA94 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 2EA0 8013CA98 21082300 */  addu       $at, $at, $v1
    /* 2EA4 8013CA9C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 2EA8 8013CAA0 00076324 */  addiu      $v1, $v1, 0x700
    /* 2EAC 8013CAA4 60008424 */  addiu      $a0, $a0, 0x60
    /* 2EB0 8013CAA8 90F20408 */  j          .L8013CA40
    /* 2EB4 8013CAAC 0100A524 */   addiu     $a1, $a1, 0x1
  .L8013CAB0:
    /* 2EB8 8013CAB0 02000825 */  addiu      $t0, $t0, 0x2
    /* 2EBC 8013CAB4 89F20408 */  j          .L8013CA24
    /* 2EC0 8013CAB8 0100C624 */   addiu     $a2, $a2, 0x1
  .L8013CABC:
    /* 2EC4 8013CABC 0800E003 */  jr         $ra
    /* 2EC8 8013CAC0 00000000 */   nop
endlabel DRLG_SetWalls__Fv
