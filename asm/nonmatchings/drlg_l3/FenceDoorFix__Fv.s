.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FenceDoorFix__Fv, 0x1F4

glabel FenceDoorFix__Fv
    /* 11EB8 8014BAB0 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 11EBC 8014BAB4 0000B0AF */  sw         $s0, 0x0($sp)
    /* 11EC0 8014BAB8 21580000 */  addu       $t3, $zero, $zero
    /* 11EC4 8014BABC 0E80183C */  lui        $t8, %hi(dungeon)
    /* 11EC8 8014BAC0 C4401827 */  addiu      $t8, $t8, %lo(dungeon)
    /* 11ECC 8014BAC4 A0FF1027 */  addiu      $s0, $t8, -0x60
    /* 11ED0 8014BAC8 07000F24 */  addiu      $t7, $zero, 0x7
    /* 11ED4 8014BACC 82001924 */  addiu      $t9, $zero, 0x82
    /* 11ED8 8014BAD0 84000E24 */  addiu      $t6, $zero, 0x84
    /* 11EDC 8014BAD4 40400B00 */  sll        $t0, $t3, 1
  .L8014BAD8:
    /* 11EE0 8014BAD8 85000D24 */  addiu      $t5, $zero, 0x85
    /* 11EE4 8014BADC 8A000C24 */  addiu      $t4, $zero, 0x8A
    /* 11EE8 8014BAE0 21380003 */  addu       $a3, $t8, $zero
    /* 11EEC 8014BAE4 21500000 */  addu       $t2, $zero, $zero
    /* 11EF0 8014BAE8 21480002 */  addu       $t1, $s0, $zero
  .L8014BAEC:
    /* 11EF4 8014BAEC 21280701 */  addu       $a1, $t0, $a3
    /* 11EF8 8014BAF0 0000A394 */  lhu        $v1, 0x0($a1)
    /* 11EFC 8014BAF4 92000224 */  addiu      $v0, $zero, 0x92
    /* 11F00 8014BAF8 2E006214 */  bne        $v1, $v0, .L8014BBB4
    /* 11F04 8014BAFC 21300701 */   addu      $a2, $t0, $a3
    /* 11F08 8014BB00 60000227 */  addiu      $v0, $t8, 0x60
    /* 11F0C 8014BB04 21104201 */  addu       $v0, $t2, $v0
    /* 11F10 8014BB08 21100201 */  addu       $v0, $t0, $v0
    /* 11F14 8014BB0C 00004394 */  lhu        $v1, 0x0($v0)
    /* 11F18 8014BB10 00000000 */  nop
    /* 11F1C 8014BB14 7EFF6224 */  addiu      $v0, $v1, -0x82
    /* 11F20 8014BB18 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11F24 8014BB1C 23004010 */  beqz       $v0, .L8014BBAC
    /* 11F28 8014BB20 21100901 */   addu      $v0, $t0, $t1
    /* 11F2C 8014BB24 00004494 */  lhu        $a0, 0x0($v0)
    /* 11F30 8014BB28 00000000 */  nop
    /* 11F34 8014BB2C 7EFF8224 */  addiu      $v0, $a0, -0x82
    /* 11F38 8014BB30 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11F3C 8014BB34 1D004010 */  beqz       $v0, .L8014BBAC
    /* 11F40 8014BB38 FFFF6330 */   andi      $v1, $v1, 0xFFFF
    /* 11F44 8014BB3C 1D007910 */  beq        $v1, $t9, .L8014BBB4
    /* 11F48 8014BB40 FFFF8230 */   andi      $v0, $a0, 0xFFFF
    /* 11F4C 8014BB44 1B005910 */  beq        $v0, $t9, .L8014BBB4
    /* 11F50 8014BB48 00000000 */   nop
    /* 11F54 8014BB4C 19006E10 */  beq        $v1, $t6, .L8014BBB4
    /* 11F58 8014BB50 00000000 */   nop
    /* 11F5C 8014BB54 17004E10 */  beq        $v0, $t6, .L8014BBB4
    /* 11F60 8014BB58 00000000 */   nop
    /* 11F64 8014BB5C 15006D10 */  beq        $v1, $t5, .L8014BBB4
    /* 11F68 8014BB60 00000000 */   nop
    /* 11F6C 8014BB64 13004D10 */  beq        $v0, $t5, .L8014BBB4
    /* 11F70 8014BB68 86000424 */   addiu     $a0, $zero, 0x86
    /* 11F74 8014BB6C 11006410 */  beq        $v1, $a0, .L8014BBB4
    /* 11F78 8014BB70 00000000 */   nop
    /* 11F7C 8014BB74 0F004410 */  beq        $v0, $a0, .L8014BBB4
    /* 11F80 8014BB78 88000424 */   addiu     $a0, $zero, 0x88
    /* 11F84 8014BB7C 0D006410 */  beq        $v1, $a0, .L8014BBB4
    /* 11F88 8014BB80 00000000 */   nop
    /* 11F8C 8014BB84 0B004410 */  beq        $v0, $a0, .L8014BBB4
    /* 11F90 8014BB88 00000000 */   nop
    /* 11F94 8014BB8C 09006C10 */  beq        $v1, $t4, .L8014BBB4
    /* 11F98 8014BB90 00000000 */   nop
    /* 11F9C 8014BB94 07004C10 */  beq        $v0, $t4, .L8014BBB4
    /* 11FA0 8014BB98 8C000424 */   addiu     $a0, $zero, 0x8C
    /* 11FA4 8014BB9C 05006410 */  beq        $v1, $a0, .L8014BBB4
    /* 11FA8 8014BBA0 00000000 */   nop
    /* 11FAC 8014BBA4 03004410 */  beq        $v0, $a0, .L8014BBB4
    /* 11FB0 8014BBA8 00000000 */   nop
  .L8014BBAC:
    /* 11FB4 8014BBAC 1B2F0508 */  j          .L8014BC6C
    /* 11FB8 8014BBB0 0000AFA4 */   sh        $t7, 0x0($a1)
  .L8014BBB4:
    /* 11FBC 8014BBB4 0000C394 */  lhu        $v1, 0x0($a2)
    /* 11FC0 8014BBB8 93000224 */  addiu      $v0, $zero, 0x93
    /* 11FC4 8014BBBC 2B006214 */  bne        $v1, $v0, .L8014BC6C
    /* 11FC8 8014BBC0 00000000 */   nop
    /* 11FCC 8014BBC4 0200C394 */  lhu        $v1, 0x2($a2)
    /* 11FD0 8014BBC8 00000000 */  nop
    /* 11FD4 8014BBCC 7EFF6224 */  addiu      $v0, $v1, -0x82
    /* 11FD8 8014BBD0 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11FDC 8014BBD4 24004010 */  beqz       $v0, .L8014BC68
    /* 11FE0 8014BBD8 00000000 */   nop
    /* 11FE4 8014BBDC FEFFC494 */  lhu        $a0, -0x2($a2)
    /* 11FE8 8014BBE0 00000000 */  nop
    /* 11FEC 8014BBE4 7EFF8224 */  addiu      $v0, $a0, -0x82
    /* 11FF0 8014BBE8 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11FF4 8014BBEC 1E004010 */  beqz       $v0, .L8014BC68
    /* 11FF8 8014BBF0 FFFF6330 */   andi      $v1, $v1, 0xFFFF
    /* 11FFC 8014BBF4 83000524 */  addiu      $a1, $zero, 0x83
    /* 12000 8014BBF8 1C006510 */  beq        $v1, $a1, .L8014BC6C
    /* 12004 8014BBFC FFFF8230 */   andi      $v0, $a0, 0xFFFF
    /* 12008 8014BC00 1A004510 */  beq        $v0, $a1, .L8014BC6C
    /* 1200C 8014BC04 00000000 */   nop
    /* 12010 8014BC08 18006E10 */  beq        $v1, $t6, .L8014BC6C
    /* 12014 8014BC0C 00000000 */   nop
    /* 12018 8014BC10 16004E10 */  beq        $v0, $t6, .L8014BC6C
    /* 1201C 8014BC14 00000000 */   nop
    /* 12020 8014BC18 14006D10 */  beq        $v1, $t5, .L8014BC6C
    /* 12024 8014BC1C 00000000 */   nop
    /* 12028 8014BC20 12004D10 */  beq        $v0, $t5, .L8014BC6C
    /* 1202C 8014BC24 87000424 */   addiu     $a0, $zero, 0x87
    /* 12030 8014BC28 10006410 */  beq        $v1, $a0, .L8014BC6C
    /* 12034 8014BC2C 00000000 */   nop
    /* 12038 8014BC30 0E004410 */  beq        $v0, $a0, .L8014BC6C
    /* 1203C 8014BC34 89000424 */   addiu     $a0, $zero, 0x89
    /* 12040 8014BC38 0C006410 */  beq        $v1, $a0, .L8014BC6C
    /* 12044 8014BC3C 00000000 */   nop
    /* 12048 8014BC40 0A004410 */  beq        $v0, $a0, .L8014BC6C
    /* 1204C 8014BC44 00000000 */   nop
    /* 12050 8014BC48 08006C10 */  beq        $v1, $t4, .L8014BC6C
    /* 12054 8014BC4C 00000000 */   nop
    /* 12058 8014BC50 06004C10 */  beq        $v0, $t4, .L8014BC6C
    /* 1205C 8014BC54 8B000424 */   addiu     $a0, $zero, 0x8B
    /* 12060 8014BC58 04006410 */  beq        $v1, $a0, .L8014BC6C
    /* 12064 8014BC5C 00000000 */   nop
    /* 12068 8014BC60 02004410 */  beq        $v0, $a0, .L8014BC6C
    /* 1206C 8014BC64 00000000 */   nop
  .L8014BC68:
    /* 12070 8014BC68 0000CFA4 */  sh         $t7, 0x0($a2)
  .L8014BC6C:
    /* 12074 8014BC6C 6000E724 */  addiu      $a3, $a3, 0x60
    /* 12078 8014BC70 60004A25 */  addiu      $t2, $t2, 0x60
    /* 1207C 8014BC74 000F0227 */  addiu      $v0, $t8, 0xF00
    /* 12080 8014BC78 2A10E200 */  slt        $v0, $a3, $v0
    /* 12084 8014BC7C 9BFF4014 */  bnez       $v0, .L8014BAEC
    /* 12088 8014BC80 60002925 */   addiu     $t1, $t1, 0x60
    /* 1208C 8014BC84 01006B25 */  addiu      $t3, $t3, 0x1
    /* 12090 8014BC88 28006229 */  slti       $v0, $t3, 0x28
    /* 12094 8014BC8C 92FF4014 */  bnez       $v0, .L8014BAD8
    /* 12098 8014BC90 40400B00 */   sll       $t0, $t3, 1
    /* 1209C 8014BC94 0000B08F */  lw         $s0, 0x0($sp)
    /* 120A0 8014BC98 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 120A4 8014BC9C 0800E003 */  jr         $ra
    /* 120A8 8014BCA0 00000000 */   nop
endlabel FenceDoorFix__Fv
