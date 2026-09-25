.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindValidShrine__Fi, 0xEC

glabel FindValidShrine__Fi
    /* 4CE34 8005CE34 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4CE38 8005CE38 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4CE3C 8005CE3C 21800000 */  addu       $s0, $zero, $zero
    /* 4CE40 8005CE40 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4CE44 8005CE44 1400B1AF */  sw         $s1, 0x14($sp)
  .L8005CE48:
    /* 4CE48 8005CE48 01001124 */  addiu      $s1, $zero, 0x1
  .L8005CE4C:
    /* 4CE4C 8005CE4C C9F6000C */  jal        ENG_random__Fl
    /* 4CE50 8005CE50 1A000424 */   addiu     $a0, $zero, 0x1A
    /* 4CE54 8005CE54 1280033C */  lui        $v1, %hi(currlevel)
    /* 4CE58 8005CE58 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 4CE5C 8005CE5C 00000000 */  nop
    /* 4CE60 8005CE60 0A006010 */  beqz       $v1, .L8005CE8C
    /* 4CE64 8005CE64 21204000 */   addu      $a0, $v0, $zero
    /* 4CE68 8005CE68 07000224 */  addiu      $v0, $zero, 0x7
    /* 4CE6C 8005CE6C 02008214 */  bne        $a0, $v0, .L8005CE78
    /* 4CE70 8005CE70 11006228 */   slti      $v0, $v1, 0x11
    /* 4CE74 8005CE74 09006228 */  slti       $v0, $v1, 0x9
  .L8005CE78:
    /* 4CE78 8005CE78 04004010 */  beqz       $v0, .L8005CE8C
    /* 4CE7C 8005CE7C 08000224 */   addiu     $v0, $zero, 0x8
    /* 4CE80 8005CE80 03008210 */  beq        $a0, $v0, .L8005CE90
    /* 4CE84 8005CE84 FF000232 */   andi      $v0, $s0, 0xFF
    /* 4CE88 8005CE88 01001024 */  addiu      $s0, $zero, 0x1
  .L8005CE8C:
    /* 4CE8C 8005CE8C FF000232 */  andi       $v0, $s0, 0xFF
  .L8005CE90:
    /* 4CE90 8005CE90 EDFF4010 */  beqz       $v0, .L8005CE48
    /* 4CE94 8005CE94 00000000 */   nop
    /* 4CE98 8005CE98 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 4CE9C 8005CE9C A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 4CEA0 8005CEA0 00000000 */  nop
    /* 4CEA4 8005CEA4 0B005110 */  beq        $v0, $s1, .L8005CED4
    /* 4CEA8 8005CEA8 00000000 */   nop
    /* 4CEAC 8005CEAC 0E80013C */  lui        $at, %hi(shrineavail)
    /* 4CEB0 8005CEB0 21082400 */  addu       $at, $at, $a0
    /* 4CEB4 8005CEB4 1C8C2280 */  lb         $v0, %lo(shrineavail)($at)
    /* 4CEB8 8005CEB8 00000000 */  nop
    /* 4CEBC 8005CEBC 03005114 */  bne        $v0, $s1, .L8005CECC
    /* 4CEC0 8005CEC0 00000000 */   nop
    /* 4CEC4 8005CEC4 BF730108 */  j          .L8005CEFC
    /* 4CEC8 8005CEC8 21800000 */   addu      $s0, $zero, $zero
  .L8005CECC:
    /* 4CECC 8005CECC 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 4CED0 8005CED0 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
  .L8005CED4:
    /* 4CED4 8005CED4 00000000 */  nop
    /* 4CED8 8005CED8 08005114 */  bne        $v0, $s1, .L8005CEFC
    /* 4CEDC 8005CEDC 01001024 */   addiu     $s0, $zero, 0x1
    /* 4CEE0 8005CEE0 0E80013C */  lui        $at, %hi(shrineavail)
    /* 4CEE4 8005CEE4 21082400 */  addu       $at, $at, $a0
    /* 4CEE8 8005CEE8 1C8C2280 */  lb         $v0, %lo(shrineavail)($at)
    /* 4CEEC 8005CEEC 00000000 */  nop
    /* 4CEF0 8005CEF0 02004238 */  xori       $v0, $v0, 0x2
    /* 4CEF4 8005CEF4 2B100200 */  sltu       $v0, $zero, $v0
    /* 4CEF8 8005CEF8 21804000 */  addu       $s0, $v0, $zero
  .L8005CEFC:
    /* 4CEFC 8005CEFC FF000232 */  andi       $v0, $s0, 0xFF
    /* 4CF00 8005CF00 D2FF4010 */  beqz       $v0, .L8005CE4C
    /* 4CF04 8005CF04 21108000 */   addu      $v0, $a0, $zero
    /* 4CF08 8005CF08 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4CF0C 8005CF0C 1400B18F */  lw         $s1, 0x14($sp)
    /* 4CF10 8005CF10 1000B08F */  lw         $s0, 0x10($sp)
    /* 4CF14 8005CF14 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4CF18 8005CF18 0800E003 */  jr         $ra
    /* 4CF1C 8005CF1C 00000000 */   nop
endlabel FindValidShrine__Fi
