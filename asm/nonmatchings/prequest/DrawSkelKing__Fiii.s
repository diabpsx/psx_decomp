.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSkelKing__Fiii, 0x94

glabel DrawSkelKing__Fiii
    /* 251D8 8015EDD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 251DC 8015EDD4 80100400 */  sll        $v0, $a0, 2
    /* 251E0 8015EDD8 21104400 */  addu       $v0, $v0, $a0
    /* 251E4 8015EDDC 80100200 */  sll        $v0, $v0, 2
    /* 251E8 8015EDE0 0E80033C */  lui        $v1, %hi(quests)
    /* 251EC 8015EDE4 40DA6324 */  addiu      $v1, $v1, %lo(quests)
    /* 251F0 8015EDE8 21104300 */  addu       $v0, $v0, $v1
    /* 251F4 8015EDEC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 251F8 8015EDF0 40800500 */  sll        $s0, $a1, 1
    /* 251FC 8015EDF4 1C000326 */  addiu      $v1, $s0, 0x1C
    /* 25200 8015EDF8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 25204 8015EDFC 40900600 */  sll        $s2, $a2, 1
    /* 25208 8015EE00 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2520C 8015EE04 17005126 */  addiu      $s1, $s2, 0x17
    /* 25210 8015EE08 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 25214 8015EE0C 040043AC */  sw         $v1, 0x4($v0)
    /* 25218 8015EE10 0D00A018 */  blez       $a1, .L8015EE48
    /* 2521C 8015EE14 080051AC */   sw        $s1, 0x8($v0)
    /* 25220 8015EE18 0300C228 */  slti       $v0, $a2, 0x3
    /* 25224 8015EE1C 0A004014 */  bnez       $v0, .L8015EE48
    /* 25228 8015EE20 1B001026 */   addiu     $s0, $s0, 0x1B
    /* 2522C 8015EE24 21200002 */  addu       $a0, $s0, $zero
    /* 25230 8015EE28 F20A020C */  jal        SetSOLID__Fii
    /* 25234 8015EE2C 21282002 */   addu      $a1, $s1, $zero
    /* 25238 8015EE30 21200002 */  addu       $a0, $s0, $zero
    /* 2523C 8015EE34 4A0B020C */  jal        SetMISSILE__Fii
    /* 25240 8015EE38 21282002 */   addu      $a1, $s1, $zero
    /* 25244 8015EE3C 21200002 */  addu       $a0, $s0, $zero
    /* 25248 8015EE40 F20A020C */  jal        SetSOLID__Fii
    /* 2524C 8015EE44 15004526 */   addiu     $a1, $s2, 0x15
  .L8015EE48:
    /* 25250 8015EE48 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 25254 8015EE4C 1800B28F */  lw         $s2, 0x18($sp)
    /* 25258 8015EE50 1400B18F */  lw         $s1, 0x14($sp)
    /* 2525C 8015EE54 1000B08F */  lw         $s0, 0x10($sp)
    /* 25260 8015EE58 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 25264 8015EE5C 0800E003 */  jr         $ra
    /* 25268 8015EE60 00000000 */   nop
endlabel DrawSkelKing__Fiii
