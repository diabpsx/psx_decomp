.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMonster__FiiiiUc, 0xA0

glabel AddMonster__FiiiiUc
    /* 6FDD0 8007FDD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6FDD4 8007FDD4 21408000 */  addu       $t0, $a0, $zero
    /* 6FDD8 8007FDD8 1280033C */  lui        $v1, %hi(nummonsters)
    /* 6FDDC 8007FDDC CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 6FDE0 8007FDE0 3000A493 */  lbu        $a0, 0x30($sp)
    /* 6FDE4 8007FDE4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6FDE8 8007FDE8 BE006228 */  slti       $v0, $v1, 0xBE
    /* 6FDEC 8007FDEC 1A004010 */  beqz       $v0, .L8007FE58
    /* 6FDF0 8007FDF0 1800B0AF */   sw        $s0, 0x18($sp)
    /* 6FDF4 8007FDF4 01006224 */  addiu      $v0, $v1, 0x1
    /* 6FDF8 8007FDF8 1280013C */  lui        $at, %hi(nummonsters)
    /* 6FDFC 8007FDFC CCC222AC */  sw         $v0, %lo(nummonsters)($at)
    /* 6FE00 8007FE00 40100300 */  sll        $v0, $v1, 1
    /* 6FE04 8007FE04 1180013C */  lui        $at, %hi(monstactive)
    /* 6FE08 8007FE08 21082200 */  addu       $at, $at, $v0
    /* 6FE0C 8007FE0C C4A03084 */  lh         $s0, %lo(monstactive)($at)
    /* 6FE10 8007FE10 09008010 */  beqz       $a0, .L8007FE38
    /* 6FE14 8007FE14 C0100500 */   sll       $v0, $a1, 3
    /* 6FE18 8007FE18 C0180800 */  sll        $v1, $t0, 3
    /* 6FE1C 8007FE1C 23186800 */  subu       $v1, $v1, $t0
    /* 6FE20 8007FE20 C0190300 */  sll        $v1, $v1, 7
    /* 6FE24 8007FE24 21104300 */  addu       $v0, $v0, $v1
    /* 6FE28 8007FE28 01000326 */  addiu      $v1, $s0, 0x1
    /* 6FE2C 8007FE2C 0E80013C */  lui        $at, %hi(dung_map)
    /* 6FE30 8007FE30 21082200 */  addu       $at, $at, $v0
    /* 6FE34 8007FE34 287A23A4 */  sh         $v1, %lo(dung_map)($at)
  .L8007FE38:
    /* 6FE38 8007FE38 1000A5AF */  sw         $a1, 0x10($sp)
    /* 6FE3C 8007FE3C 21200002 */  addu       $a0, $s0, $zero
    /* 6FE40 8007FE40 2128C000 */  addu       $a1, $a2, $zero
    /* 6FE44 8007FE44 2130E000 */  addu       $a2, $a3, $zero
    /* 6FE48 8007FE48 13FE010C */  jal        InitMonster__Fiiiii
    /* 6FE4C 8007FE4C 21380001 */   addu      $a3, $t0, $zero
    /* 6FE50 8007FE50 97FF0108 */  j          .L8007FE5C
    /* 6FE54 8007FE54 21100002 */   addu      $v0, $s0, $zero
  .L8007FE58:
    /* 6FE58 8007FE58 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8007FE5C:
    /* 6FE5C 8007FE5C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6FE60 8007FE60 1800B08F */  lw         $s0, 0x18($sp)
    /* 6FE64 8007FE64 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6FE68 8007FE68 0800E003 */  jr         $ra
    /* 6FE6C 8007FE6C 00000000 */   nop
endlabel AddMonster__FiiiiUc
