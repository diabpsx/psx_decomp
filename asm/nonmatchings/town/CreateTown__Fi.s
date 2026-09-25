.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateTown__Fi, 0x154

glabel CreateTown__Fi
    /* 64D48 80074D48 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 64D4C 80074D4C 0A000224 */  addiu      $v0, $zero, 0xA
    /* 64D50 80074D50 1280013C */  lui        $at, %hi(dminx)
    /* 64D54 80074D54 F8C022AC */  sw         $v0, %lo(dminx)($at)
    /* 64D58 80074D58 1280013C */  lui        $at, %hi(dminy)
    /* 64D5C 80074D5C FCC022AC */  sw         $v0, %lo(dminy)($at)
    /* 64D60 80074D60 54000224 */  addiu      $v0, $zero, 0x54
    /* 64D64 80074D64 1000BFAF */  sw         $ra, 0x10($sp)
    /* 64D68 80074D68 1280013C */  lui        $at, %hi(dmaxx)
    /* 64D6C 80074D6C 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* 64D70 80074D70 1280013C */  lui        $at, %hi(dmaxy)
    /* 64D74 80074D74 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* 64D78 80074D78 05008014 */  bnez       $a0, .L80074D90
    /* 64D7C 80074D7C 4B000224 */   addiu     $v0, $zero, 0x4B
    /* 64D80 80074D80 1280013C */  lui        $at, %hi(ViewX)
    /* 64D84 80074D84 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 64D88 80074D88 88D30108 */  j          .L80074E20
    /* 64D8C 80074D8C 44000224 */   addiu     $v0, $zero, 0x44
  .L80074D90:
    /* 64D90 80074D90 01000224 */  addiu      $v0, $zero, 0x1
    /* 64D94 80074D94 05008214 */  bne        $a0, $v0, .L80074DAC
    /* 64D98 80074D98 19000224 */   addiu     $v0, $zero, 0x19
    /* 64D9C 80074D9C 1280013C */  lui        $at, %hi(ViewX)
    /* 64DA0 80074DA0 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 64DA4 80074DA4 88D30108 */  j          .L80074E20
    /* 64DA8 80074DA8 1F000224 */   addiu     $v0, $zero, 0x1F
  .L80074DAC:
    /* 64DAC 80074DAC 07000224 */  addiu      $v0, $zero, 0x7
    /* 64DB0 80074DB0 1D008214 */  bne        $a0, $v0, .L80074E28
    /* 64DB4 80074DB4 05000224 */   addiu     $v0, $zero, 0x5
    /* 64DB8 80074DB8 1280033C */  lui        $v1, %hi(TWarpFrom)
    /* 64DBC 80074DBC 80BB638C */  lw         $v1, %lo(TWarpFrom)($v1)
    /* 64DC0 80074DC0 00000000 */  nop
    /* 64DC4 80074DC4 08006214 */  bne        $v1, $v0, .L80074DE8
    /* 64DC8 80074DC8 09000224 */   addiu     $v0, $zero, 0x9
    /* 64DCC 80074DCC 31000224 */  addiu      $v0, $zero, 0x31
    /* 64DD0 80074DD0 1280013C */  lui        $at, %hi(ViewX)
    /* 64DD4 80074DD4 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 64DD8 80074DD8 16000224 */  addiu      $v0, $zero, 0x16
    /* 64DDC 80074DDC 1280013C */  lui        $at, %hi(ViewY)
    /* 64DE0 80074DE0 18C122AC */  sw         $v0, %lo(ViewY)($at)
    /* 64DE4 80074DE4 09000224 */  addiu      $v0, $zero, 0x9
  .L80074DE8:
    /* 64DE8 80074DE8 08006214 */  bne        $v1, $v0, .L80074E0C
    /* 64DEC 80074DEC 0D000224 */   addiu     $v0, $zero, 0xD
    /* 64DF0 80074DF0 12000224 */  addiu      $v0, $zero, 0x12
    /* 64DF4 80074DF4 1280013C */  lui        $at, %hi(ViewX)
    /* 64DF8 80074DF8 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 64DFC 80074DFC 45000224 */  addiu      $v0, $zero, 0x45
    /* 64E00 80074E00 1280013C */  lui        $at, %hi(ViewY)
    /* 64E04 80074E04 18C122AC */  sw         $v0, %lo(ViewY)($at)
    /* 64E08 80074E08 0D000224 */  addiu      $v0, $zero, 0xD
  .L80074E0C:
    /* 64E0C 80074E0C 06006214 */  bne        $v1, $v0, .L80074E28
    /* 64E10 80074E10 29000224 */   addiu     $v0, $zero, 0x29
    /* 64E14 80074E14 1280013C */  lui        $at, %hi(ViewX)
    /* 64E18 80074E18 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 64E1C 80074E1C 51000224 */  addiu      $v0, $zero, 0x51
  .L80074E20:
    /* 64E20 80074E20 1280013C */  lui        $at, %hi(ViewY)
    /* 64E24 80074E24 18C122AC */  sw         $v0, %lo(ViewY)($at)
  .L80074E28:
    /* 64E28 80074E28 6FD2010C */  jal        T_Pass3__Fv
    /* 64E2C 80074E2C 00000000 */   nop
    /* 64E30 80074E30 21280000 */  addu       $a1, $zero, $zero
  .L80074E34:
    /* 64E34 80074E34 7000A228 */  slti       $v0, $a1, 0x70
    /* 64E38 80074E38 14004010 */  beqz       $v0, .L80074E8C
    /* 64E3C 80074E3C 21200000 */   addu      $a0, $zero, $zero
    /* 64E40 80074E40 C0180500 */  sll        $v1, $a1, 3
  .L80074E44:
    /* 64E44 80074E44 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 64E48 80074E48 21082300 */  addu       $at, $at, $v1
    /* 64E4C 80074E4C 2E7A20A0 */  sb         $zero, %lo(dung_map + 0x6)($at)
    /* 64E50 80074E50 0E80013C */  lui        $at, %hi(dung_map)
    /* 64E54 80074E54 21082300 */  addu       $at, $at, $v1
    /* 64E58 80074E58 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 64E5C 80074E5C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 64E60 80074E60 21082300 */  addu       $at, $at, $v1
    /* 64E64 80074E64 2B7A20A0 */  sb         $zero, %lo(dung_map + 0x3)($at)
    /* 64E68 80074E68 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 64E6C 80074E6C 21082300 */  addu       $at, $at, $v1
    /* 64E70 80074E70 2C7A20A0 */  sb         $zero, %lo(dung_map + 0x4)($at)
    /* 64E74 80074E74 01008424 */  addiu      $a0, $a0, 0x1
    /* 64E78 80074E78 70008228 */  slti       $v0, $a0, 0x70
    /* 64E7C 80074E7C F1FF4014 */  bnez       $v0, .L80074E44
    /* 64E80 80074E80 80036324 */   addiu     $v1, $v1, 0x380
    /* 64E84 80074E84 8DD30108 */  j          .L80074E34
    /* 64E88 80074E88 0100A524 */   addiu     $a1, $a1, 0x1
  .L80074E8C:
    /* 64E8C 80074E8C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 64E90 80074E90 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 64E94 80074E94 0800E003 */  jr         $ra
    /* 64E98 80074E98 00000000 */   nop
endlabel CreateTown__Fi
