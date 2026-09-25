.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearOutDungeonMap__Fv, 0x200

glabel ClearOutDungeonMap__Fv
    /* 28CF4 80038CF4 1280023C */  lui        $v0, %hi(mydflags)
    /* 28CF8 80038CF8 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 28CFC 80038CFC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 28D00 80038D00 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28D04 80038D04 21880000 */  addu       $s1, $zero, $zero
    /* 28D08 80038D08 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28D0C 80038D0C 21800000 */  addu       $s0, $zero, $zero
    /* 28D10 80038D10 06004014 */  bnez       $v0, .L80038D2C
    /* 28D14 80038D14 1800BFAF */   sw        $ra, 0x18($sp)
    /* 28D18 80038D18 21200000 */  addu       $a0, $zero, $zero
    /* 28D1C 80038D1C 1180053C */  lui        $a1, %hi(D_80111164)
    /* 28D20 80038D20 6411A524 */  addiu      $a1, $a1, %lo(D_80111164)
    /* 28D24 80038D24 A583000C */  jal        DBG_Error
    /* 28D28 80038D28 250A0624 */   addiu     $a2, $zero, 0xA25
  .L80038D2C:
    /* 28D2C 80038D2C 1280033C */  lui        $v1, %hi(leveltype)
    /* 28D30 80038D30 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 28D34 80038D34 02000224 */  addiu      $v0, $zero, 0x2
    /* 28D38 80038D38 10006210 */  beq        $v1, $v0, .L80038D7C
    /* 28D3C 80038D3C 03006228 */   slti      $v0, $v1, 0x3
    /* 28D40 80038D40 05004010 */  beqz       $v0, .L80038D58
    /* 28D44 80038D44 01000224 */   addiu     $v0, $zero, 0x1
    /* 28D48 80038D48 0A006210 */  beq        $v1, $v0, .L80038D74
    /* 28D4C 80038D4C 00000000 */   nop
    /* 28D50 80038D50 64E30008 */  j          .L80038D90
    /* 28D54 80038D54 01001124 */   addiu     $s1, $zero, 0x1
  .L80038D58:
    /* 28D58 80038D58 03000224 */  addiu      $v0, $zero, 0x3
    /* 28D5C 80038D5C 09006210 */  beq        $v1, $v0, .L80038D84
    /* 28D60 80038D60 04000224 */   addiu     $v0, $zero, 0x4
    /* 28D64 80038D64 09006210 */  beq        $v1, $v0, .L80038D8C
    /* 28D68 80038D68 00000000 */   nop
    /* 28D6C 80038D6C 64E30008 */  j          .L80038D90
    /* 28D70 80038D70 01001124 */   addiu     $s1, $zero, 0x1
  .L80038D74:
    /* 28D74 80038D74 64E30008 */  j          .L80038D90
    /* 28D78 80038D78 16001024 */   addiu     $s0, $zero, 0x16
  .L80038D7C:
    /* 28D7C 80038D7C 64E30008 */  j          .L80038D90
    /* 28D80 80038D80 0C001024 */   addiu     $s0, $zero, 0xC
  .L80038D84:
    /* 28D84 80038D84 64E30008 */  j          .L80038D90
    /* 28D88 80038D88 08001024 */   addiu     $s0, $zero, 0x8
  .L80038D8C:
    /* 28D8C 80038D8C 14001024 */  addiu      $s0, $zero, 0x14
  .L80038D90:
    /* 28D90 80038D90 21300000 */  addu       $a2, $zero, $zero
    /* 28D94 80038D94 21280000 */  addu       $a1, $zero, $zero
  .L80038D98:
    /* 28D98 80038D98 7000C228 */  slti       $v0, $a2, 0x70
    /* 28D9C 80038D9C 1E004010 */  beqz       $v0, .L80038E18
    /* 28DA0 80038DA0 21200000 */   addu      $a0, $zero, $zero
    /* 28DA4 80038DA4 2118A000 */  addu       $v1, $a1, $zero
  .L80038DA8:
    /* 28DA8 80038DA8 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 28DAC 80038DAC 21082300 */  addu       $at, $at, $v1
    /* 28DB0 80038DB0 2A7A20A0 */  sb         $zero, %lo(dung_map + 0x2)($at)
    /* 28DB4 80038DB4 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 28DB8 80038DB8 21082300 */  addu       $at, $at, $v1
    /* 28DBC 80038DBC 2B7A20A0 */  sb         $zero, %lo(dung_map + 0x3)($at)
    /* 28DC0 80038DC0 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 28DC4 80038DC4 21082300 */  addu       $at, $at, $v1
    /* 28DC8 80038DC8 2C7A20A0 */  sb         $zero, %lo(dung_map + 0x4)($at)
    /* 28DCC 80038DCC 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 28DD0 80038DD0 21082300 */  addu       $at, $at, $v1
    /* 28DD4 80038DD4 2D7A20A0 */  sb         $zero, %lo(dung_map + 0x5)($at)
    /* 28DD8 80038DD8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 28DDC 80038DDC 21082300 */  addu       $at, $at, $v1
    /* 28DE0 80038DE0 2E7A20A0 */  sb         $zero, %lo(dung_map + 0x6)($at)
    /* 28DE4 80038DE4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 28DE8 80038DE8 21082300 */  addu       $at, $at, $v1
    /* 28DEC 80038DEC 2F7A20A0 */  sb         $zero, %lo(dung_map + 0x7)($at)
    /* 28DF0 80038DF0 0E80013C */  lui        $at, %hi(dung_map)
    /* 28DF4 80038DF4 21082300 */  addu       $at, $at, $v1
    /* 28DF8 80038DF8 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 28DFC 80038DFC 01008424 */  addiu      $a0, $a0, 0x1
    /* 28E00 80038E00 70008228 */  slti       $v0, $a0, 0x70
    /* 28E04 80038E04 E8FF4014 */  bnez       $v0, .L80038DA8
    /* 28E08 80038E08 08006324 */   addiu     $v1, $v1, 0x8
    /* 28E0C 80038E0C 8003A524 */  addiu      $a1, $a1, 0x380
    /* 28E10 80038E10 66E30008 */  j          .L80038D98
    /* 28E14 80038E14 0100C624 */   addiu     $a2, $a2, 0x1
  .L80038E18:
    /* 28E18 80038E18 30002016 */  bnez       $s1, .L80038EDC
    /* 28E1C 80038E1C 21380000 */   addu      $a3, $zero, $zero
    /* 28E20 80038E20 21300000 */  addu       $a2, $zero, $zero
  .L80038E24:
    /* 28E24 80038E24 2800E228 */  slti       $v0, $a3, 0x28
    /* 28E28 80038E28 0D004010 */  beqz       $v0, .L80038E60
    /* 28E2C 80038E2C 21200000 */   addu      $a0, $zero, $zero
    /* 28E30 80038E30 2128C000 */  addu       $a1, $a2, $zero
  .L80038E34:
    /* 28E34 80038E34 2110A400 */  addu       $v0, $a1, $a0
    /* 28E38 80038E38 1280033C */  lui        $v1, %hi(mydflags)
    /* 28E3C 80038E3C D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 28E40 80038E40 01008424 */  addiu      $a0, $a0, 0x1
    /* 28E44 80038E44 21186200 */  addu       $v1, $v1, $v0
    /* 28E48 80038E48 28008228 */  slti       $v0, $a0, 0x28
    /* 28E4C 80038E4C F9FF4014 */  bnez       $v0, .L80038E34
    /* 28E50 80038E50 000060A0 */   sb        $zero, 0x0($v1)
    /* 28E54 80038E54 2800C624 */  addiu      $a2, $a2, 0x28
    /* 28E58 80038E58 89E30008 */  j          .L80038E24
    /* 28E5C 80038E5C 0100E724 */   addiu     $a3, $a3, 0x1
  .L80038E60:
    /* 28E60 80038E60 21280000 */  addu       $a1, $zero, $zero
    /* 28E64 80038E64 0E80063C */  lui        $a2, %hi(pdungeon)
    /* 28E68 80038E68 C452C624 */  addiu      $a2, $a2, %lo(pdungeon)
  .L80038E6C:
    /* 28E6C 80038E6C 2800A228 */  slti       $v0, $a1, 0x28
    /* 28E70 80038E70 0A004010 */  beqz       $v0, .L80038E9C
    /* 28E74 80038E74 21200000 */   addu      $a0, $zero, $zero
    /* 28E78 80038E78 2118C000 */  addu       $v1, $a2, $zero
  .L80038E7C:
    /* 28E7C 80038E7C 21106500 */  addu       $v0, $v1, $a1
    /* 28E80 80038E80 000040A0 */  sb         $zero, 0x0($v0)
    /* 28E84 80038E84 01008424 */  addiu      $a0, $a0, 0x1
    /* 28E88 80038E88 28008228 */  slti       $v0, $a0, 0x28
    /* 28E8C 80038E8C FBFF4014 */  bnez       $v0, .L80038E7C
    /* 28E90 80038E90 28006324 */   addiu     $v1, $v1, 0x28
    /* 28E94 80038E94 9BE30008 */  j          .L80038E6C
    /* 28E98 80038E98 0100A524 */   addiu     $a1, $a1, 0x1
  .L80038E9C:
    /* 28E9C 80038E9C 21280000 */  addu       $a1, $zero, $zero
    /* 28EA0 80038EA0 0E80073C */  lui        $a3, %hi(dungeon)
    /* 28EA4 80038EA4 C440E724 */  addiu      $a3, $a3, %lo(dungeon)
  .L80038EA8:
    /* 28EA8 80038EA8 3000A228 */  slti       $v0, $a1, 0x30
    /* 28EAC 80038EAC 0B004010 */  beqz       $v0, .L80038EDC
    /* 28EB0 80038EB0 21200000 */   addu      $a0, $zero, $zero
    /* 28EB4 80038EB4 40300500 */  sll        $a2, $a1, 1
    /* 28EB8 80038EB8 2118E000 */  addu       $v1, $a3, $zero
  .L80038EBC:
    /* 28EBC 80038EBC 2110C300 */  addu       $v0, $a2, $v1
    /* 28EC0 80038EC0 000050A4 */  sh         $s0, 0x0($v0)
    /* 28EC4 80038EC4 01008424 */  addiu      $a0, $a0, 0x1
    /* 28EC8 80038EC8 30008228 */  slti       $v0, $a0, 0x30
    /* 28ECC 80038ECC FBFF4014 */  bnez       $v0, .L80038EBC
    /* 28ED0 80038ED0 60006324 */   addiu     $v1, $v1, 0x60
    /* 28ED4 80038ED4 AAE30008 */  j          .L80038EA8
    /* 28ED8 80038ED8 0100A524 */   addiu     $a1, $a1, 0x1
  .L80038EDC:
    /* 28EDC 80038EDC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 28EE0 80038EE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 28EE4 80038EE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 28EE8 80038EE8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28EEC 80038EEC 0800E003 */  jr         $ra
    /* 28EF0 80038EF0 00000000 */   nop
endlabel ClearOutDungeonMap__Fv
