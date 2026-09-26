.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3Spawn__FiiPi, 0x20C

glabel DRLG_L3Spawn__FiiPi
    /* 10E50 8014AA48 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 10E54 8014AA4C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 10E58 8014AA50 21808000 */  addu       $s0, $a0, $zero
    /* 10E5C 8014AA54 1800B2AF */  sw         $s2, 0x18($sp)
    /* 10E60 8014AA58 2190C000 */  addu       $s2, $a2, $zero
    /* 10E64 8014AA5C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 10E68 8014AA60 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 10E6C 8014AA64 1400B1AF */  sw         $s1, 0x14($sp)
    /* 10E70 8014AA68 0000428E */  lw         $v0, 0x0($s2)
    /* 10E74 8014AA6C 00000000 */  nop
    /* 10E78 8014AA70 29004228 */  slti       $v0, $v0, 0x29
    /* 10E7C 8014AA74 56004010 */  beqz       $v0, .L8014ABD0
    /* 10E80 8014AA78 2188A000 */   addu      $s1, $a1, $zero
    /* 10E84 8014AA7C 54000006 */  bltz       $s0, .L8014ABD0
    /* 10E88 8014AA80 00000000 */   nop
    /* 10E8C 8014AA84 52002006 */  bltz       $s1, .L8014ABD0
    /* 10E90 8014AA88 2800022A */   slti      $v0, $s0, 0x28
    /* 10E94 8014AA8C 50004010 */  beqz       $v0, .L8014ABD0
    /* 10E98 8014AA90 2800222A */   slti      $v0, $s1, 0x28
    /* 10E9C 8014AA94 4E004010 */  beqz       $v0, .L8014ABD0
    /* 10EA0 8014AA98 40101000 */   sll       $v0, $s0, 1
    /* 10EA4 8014AA9C 0E80033C */  lui        $v1, %hi(dungeon)
    /* 10EA8 8014AAA0 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 10EAC 8014AAA4 21105000 */  addu       $v0, $v0, $s0
    /* 10EB0 8014AAA8 40110200 */  sll        $v0, $v0, 5
    /* 10EB4 8014AAAC 21104300 */  addu       $v0, $v0, $v1
    /* 10EB8 8014AAB0 40181100 */  sll        $v1, $s1, 1
    /* 10EBC 8014AAB4 21186200 */  addu       $v1, $v1, $v0
    /* 10EC0 8014AAB8 00006494 */  lhu        $a0, 0x0($v1)
    /* 10EC4 8014AABC 00000000 */  nop
    /* 10EC8 8014AAC0 80008230 */  andi       $v0, $a0, 0x80
    /* 10ECC 8014AAC4 5B004014 */  bnez       $v0, .L8014AC34
    /* 10ED0 8014AAC8 21100000 */   addu      $v0, $zero, $zero
    /* 10ED4 8014AACC 80008234 */  ori        $v0, $a0, 0x80
    /* 10ED8 8014AAD0 21988000 */  addu       $s3, $a0, $zero
    /* 10EDC 8014AAD4 000062A4 */  sh         $v0, 0x0($v1)
    /* 10EE0 8014AAD8 0000428E */  lw         $v0, 0x0($s2)
    /* 10EE4 8014AADC FF006332 */  andi       $v1, $s3, 0xFF
    /* 10EE8 8014AAE0 01004224 */  addiu      $v0, $v0, 0x1
    /* 10EEC 8014AAE4 000042AE */  sw         $v0, 0x0($s2)
    /* 10EF0 8014AAE8 08000224 */  addiu      $v0, $zero, 0x8
    /* 10EF4 8014AAEC 3A006210 */  beq        $v1, $v0, .L8014ABD8
    /* 10EF8 8014AAF0 00000000 */   nop
    /* 10EFC 8014AAF4 1580013C */  lui        $at, %hi(spawntable_801486c4)
    /* 10F00 8014AAF8 21082300 */  addu       $at, $at, $v1
    /* 10F04 8014AAFC C4862290 */  lbu        $v0, %lo(spawntable_801486c4)($at)
    /* 10F08 8014AB00 00000000 */  nop
    /* 10F0C 8014AB04 08004230 */  andi       $v0, $v0, 0x8
    /* 10F10 8014AB08 07004010 */  beqz       $v0, .L8014AB28
    /* 10F14 8014AB0C 21200002 */   addu      $a0, $s0, $zero
    /* 10F18 8014AB10 FFFF2526 */  addiu      $a1, $s1, -0x1
    /* 10F1C 8014AB14 EF29050C */  jal        DRLG_L3SpawnEdge__FiiPi
    /* 10F20 8014AB18 21304002 */   addu      $a2, $s2, $zero
    /* 10F24 8014AB1C 01000324 */  addiu      $v1, $zero, 0x1
    /* 10F28 8014AB20 44004310 */  beq        $v0, $v1, .L8014AC34
    /* 10F2C 8014AB24 01000224 */   addiu     $v0, $zero, 0x1
  .L8014AB28:
    /* 10F30 8014AB28 FF006232 */  andi       $v0, $s3, 0xFF
    /* 10F34 8014AB2C 1580013C */  lui        $at, %hi(spawntable_801486c4)
    /* 10F38 8014AB30 21082200 */  addu       $at, $at, $v0
    /* 10F3C 8014AB34 C4862290 */  lbu        $v0, %lo(spawntable_801486c4)($at)
    /* 10F40 8014AB38 00000000 */  nop
    /* 10F44 8014AB3C 04004230 */  andi       $v0, $v0, 0x4
    /* 10F48 8014AB40 07004010 */  beqz       $v0, .L8014AB60
    /* 10F4C 8014AB44 21200002 */   addu      $a0, $s0, $zero
    /* 10F50 8014AB48 01002526 */  addiu      $a1, $s1, 0x1
    /* 10F54 8014AB4C EF29050C */  jal        DRLG_L3SpawnEdge__FiiPi
    /* 10F58 8014AB50 21304002 */   addu      $a2, $s2, $zero
    /* 10F5C 8014AB54 01000324 */  addiu      $v1, $zero, 0x1
    /* 10F60 8014AB58 36004310 */  beq        $v0, $v1, .L8014AC34
    /* 10F64 8014AB5C 01000224 */   addiu     $v0, $zero, 0x1
  .L8014AB60:
    /* 10F68 8014AB60 FF006232 */  andi       $v0, $s3, 0xFF
    /* 10F6C 8014AB64 1580013C */  lui        $at, %hi(spawntable_801486c4)
    /* 10F70 8014AB68 21082200 */  addu       $at, $at, $v0
    /* 10F74 8014AB6C C4862290 */  lbu        $v0, %lo(spawntable_801486c4)($at)
    /* 10F78 8014AB70 00000000 */  nop
    /* 10F7C 8014AB74 02004230 */  andi       $v0, $v0, 0x2
    /* 10F80 8014AB78 07004010 */  beqz       $v0, .L8014AB98
    /* 10F84 8014AB7C 01000426 */   addiu     $a0, $s0, 0x1
    /* 10F88 8014AB80 21282002 */  addu       $a1, $s1, $zero
    /* 10F8C 8014AB84 EF29050C */  jal        DRLG_L3SpawnEdge__FiiPi
    /* 10F90 8014AB88 21304002 */   addu      $a2, $s2, $zero
    /* 10F94 8014AB8C 01000324 */  addiu      $v1, $zero, 0x1
    /* 10F98 8014AB90 28004310 */  beq        $v0, $v1, .L8014AC34
    /* 10F9C 8014AB94 01000224 */   addiu     $v0, $zero, 0x1
  .L8014AB98:
    /* 10FA0 8014AB98 FF006232 */  andi       $v0, $s3, 0xFF
    /* 10FA4 8014AB9C 1580013C */  lui        $at, %hi(spawntable_801486c4)
    /* 10FA8 8014ABA0 21082200 */  addu       $at, $at, $v0
    /* 10FAC 8014ABA4 C4862290 */  lbu        $v0, %lo(spawntable_801486c4)($at)
    /* 10FB0 8014ABA8 00000000 */  nop
    /* 10FB4 8014ABAC 01004230 */  andi       $v0, $v0, 0x1
    /* 10FB8 8014ABB0 1F004010 */  beqz       $v0, .L8014AC30
    /* 10FBC 8014ABB4 FFFF0426 */   addiu     $a0, $s0, -0x1
    /* 10FC0 8014ABB8 21282002 */  addu       $a1, $s1, $zero
    /* 10FC4 8014ABBC EF29050C */  jal        DRLG_L3SpawnEdge__FiiPi
    /* 10FC8 8014ABC0 21304002 */   addu      $a2, $s2, $zero
    /* 10FCC 8014ABC4 01000324 */  addiu      $v1, $zero, 0x1
    /* 10FD0 8014ABC8 1A004314 */  bne        $v0, $v1, .L8014AC34
    /* 10FD4 8014ABCC 21100000 */   addu      $v0, $zero, $zero
  .L8014ABD0:
    /* 10FD8 8014ABD0 0D2B0508 */  j          .L8014AC34
    /* 10FDC 8014ABD4 01000224 */   addiu     $v0, $zero, 0x1
  .L8014ABD8:
    /* 10FE0 8014ABD8 01000426 */  addiu      $a0, $s0, 0x1
    /* 10FE4 8014ABDC 21282002 */  addu       $a1, $s1, $zero
    /* 10FE8 8014ABE0 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 10FEC 8014ABE4 21304002 */   addu      $a2, $s2, $zero
    /* 10FF0 8014ABE8 01001324 */  addiu      $s3, $zero, 0x1
    /* 10FF4 8014ABEC F8FF5310 */  beq        $v0, $s3, .L8014ABD0
    /* 10FF8 8014ABF0 FFFF0426 */   addiu     $a0, $s0, -0x1
    /* 10FFC 8014ABF4 21282002 */  addu       $a1, $s1, $zero
    /* 11000 8014ABF8 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 11004 8014ABFC 21304002 */   addu      $a2, $s2, $zero
    /* 11008 8014AC00 F3FF5310 */  beq        $v0, $s3, .L8014ABD0
    /* 1100C 8014AC04 21200002 */   addu      $a0, $s0, $zero
    /* 11010 8014AC08 01002526 */  addiu      $a1, $s1, 0x1
    /* 11014 8014AC0C 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 11018 8014AC10 21304002 */   addu      $a2, $s2, $zero
    /* 1101C 8014AC14 EEFF5310 */  beq        $v0, $s3, .L8014ABD0
    /* 11020 8014AC18 21200002 */   addu      $a0, $s0, $zero
    /* 11024 8014AC1C FFFF2526 */  addiu      $a1, $s1, -0x1
    /* 11028 8014AC20 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 1102C 8014AC24 21304002 */   addu      $a2, $s2, $zero
    /* 11030 8014AC28 02005310 */  beq        $v0, $s3, .L8014AC34
    /* 11034 8014AC2C 01000224 */   addiu     $v0, $zero, 0x1
  .L8014AC30:
    /* 11038 8014AC30 21100000 */  addu       $v0, $zero, $zero
  .L8014AC34:
    /* 1103C 8014AC34 2000BF8F */  lw         $ra, 0x20($sp)
    /* 11040 8014AC38 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 11044 8014AC3C 1800B28F */  lw         $s2, 0x18($sp)
    /* 11048 8014AC40 1400B18F */  lw         $s1, 0x14($sp)
    /* 1104C 8014AC44 1000B08F */  lw         $s0, 0x10($sp)
    /* 11050 8014AC48 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 11054 8014AC4C 0800E003 */  jr         $ra
    /* 11058 8014AC50 00000000 */   nop
endlabel DRLG_L3Spawn__FiiPi
