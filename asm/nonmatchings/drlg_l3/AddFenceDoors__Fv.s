.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFenceDoors__Fv, 0xE4

glabel AddFenceDoors__Fv
    /* 11DD4 8014B9CC 21400000 */  addu       $t0, $zero, $zero
    /* 11DD8 8014B9D0 07000B24 */  addiu      $t3, $zero, 0x7
    /* 11DDC 8014B9D4 0E800A3C */  lui        $t2, %hi(dungeon)
    /* 11DE0 8014B9D8 C4404A25 */  addiu      $t2, $t2, %lo(dungeon)
    /* 11DE4 8014B9DC 60004C25 */  addiu      $t4, $t2, 0x60
  .L8014B9E0:
    /* 11DE8 8014B9E0 40280800 */  sll        $a1, $t0, 1
    /* 11DEC 8014B9E4 21204001 */  addu       $a0, $t2, $zero
    /* 11DF0 8014B9E8 21380000 */  addu       $a3, $zero, $zero
    /* 11DF4 8014B9EC 21308001 */  addu       $a2, $t4, $zero
    /* 11DF8 8014B9F0 000F8924 */  addiu      $t1, $a0, 0xF00
  .L8014B9F4:
    /* 11DFC 8014B9F4 2118A400 */  addu       $v1, $a1, $a0
    /* 11E00 8014B9F8 00006294 */  lhu        $v0, 0x0($v1)
    /* 11E04 8014B9FC 00000000 */  nop
    /* 11E08 8014BA00 20004B14 */  bne        $v0, $t3, .L8014BA84
    /* 11E0C 8014BA04 A0FF4225 */   addiu     $v0, $t2, -0x60
    /* 11E10 8014BA08 2110E200 */  addu       $v0, $a3, $v0
    /* 11E14 8014BA0C 2110A200 */  addu       $v0, $a1, $v0
    /* 11E18 8014BA10 00004294 */  lhu        $v0, 0x0($v0)
    /* 11E1C 8014BA14 00000000 */  nop
    /* 11E20 8014BA18 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11E24 8014BA1C 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11E28 8014BA20 07004010 */  beqz       $v0, .L8014BA40
    /* 11E2C 8014BA24 2110A600 */   addu      $v0, $a1, $a2
    /* 11E30 8014BA28 00004294 */  lhu        $v0, 0x0($v0)
    /* 11E34 8014BA2C 00000000 */  nop
    /* 11E38 8014BA30 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11E3C 8014BA34 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11E40 8014BA38 11004014 */  bnez       $v0, .L8014BA80
    /* 11E44 8014BA3C 92000224 */   addiu     $v0, $zero, 0x92
  .L8014BA40:
    /* 11E48 8014BA40 00006294 */  lhu        $v0, 0x0($v1)
    /* 11E4C 8014BA44 00000000 */  nop
    /* 11E50 8014BA48 0E004B14 */  bne        $v0, $t3, .L8014BA84
    /* 11E54 8014BA4C 00000000 */   nop
    /* 11E58 8014BA50 FEFF6294 */  lhu        $v0, -0x2($v1)
    /* 11E5C 8014BA54 00000000 */  nop
    /* 11E60 8014BA58 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11E64 8014BA5C 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11E68 8014BA60 08004010 */  beqz       $v0, .L8014BA84
    /* 11E6C 8014BA64 00000000 */   nop
    /* 11E70 8014BA68 02006294 */  lhu        $v0, 0x2($v1)
    /* 11E74 8014BA6C 00000000 */  nop
    /* 11E78 8014BA70 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11E7C 8014BA74 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11E80 8014BA78 02004010 */  beqz       $v0, .L8014BA84
    /* 11E84 8014BA7C 93000224 */   addiu     $v0, $zero, 0x93
  .L8014BA80:
    /* 11E88 8014BA80 000062A4 */  sh         $v0, 0x0($v1)
  .L8014BA84:
    /* 11E8C 8014BA84 60008424 */  addiu      $a0, $a0, 0x60
    /* 11E90 8014BA88 6000E724 */  addiu      $a3, $a3, 0x60
    /* 11E94 8014BA8C 2A108900 */  slt        $v0, $a0, $t1
    /* 11E98 8014BA90 D8FF4014 */  bnez       $v0, .L8014B9F4
    /* 11E9C 8014BA94 6000C624 */   addiu     $a2, $a2, 0x60
    /* 11EA0 8014BA98 01000825 */  addiu      $t0, $t0, 0x1
    /* 11EA4 8014BA9C 28000229 */  slti       $v0, $t0, 0x28
    /* 11EA8 8014BAA0 CFFF4014 */  bnez       $v0, .L8014B9E0
    /* 11EAC 8014BAA4 00000000 */   nop
    /* 11EB0 8014BAA8 0800E003 */  jr         $ra
    /* 11EB4 8014BAAC 00000000 */   nop
endlabel AddFenceDoors__Fv
