.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013B19C, 0x94

glabel func_8013B19C
    /* 15A4 8013B19C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 15A8 8013B1A0 1480033C */  lui        $v1, %hi(D_80139DD0)
    /* 15AC 8013B1A4 D09D638C */  lw         $v1, %lo(D_80139DD0)($v1)
    /* 15B0 8013B1A8 1000023C */  lui        $v0, (0x100000 >> 16)
    /* 15B4 8013B1AC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 15B8 8013B1B0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 15BC 8013B1B4 0000628C */  lw         $v0, 0x0($v1)
    /* 15C0 8013B1B8 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 15C4 8013B1BC 24104300 */  and        $v0, $v0, $v1
    /* 15C8 8013B1C0 17004010 */  beqz       $v0, .L8013B220
    /* 15CC 8013B1C4 21100000 */   addu      $v0, $zero, $zero
    /* 15D0 8013B1C8 FFFF0424 */  addiu      $a0, $zero, -0x1
  .L8013B1CC:
    /* 15D4 8013B1CC 1000A28F */  lw         $v0, 0x10($sp)
    /* 15D8 8013B1D0 00000000 */  nop
    /* 15DC 8013B1D4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 15E0 8013B1D8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 15E4 8013B1DC 1000A28F */  lw         $v0, 0x10($sp)
    /* 15E8 8013B1E0 00000000 */  nop
    /* 15EC 8013B1E4 06004414 */  bne        $v0, $a0, .L8013B200
    /* 15F0 8013B1E8 00000000 */   nop
    /* 15F4 8013B1EC 1480043C */  lui        $a0, %hi(D_80139C28)
    /* 15F8 8013B1F0 92EC040C */  jal        func_8013B248
    /* 15FC 8013B1F4 289C8424 */   addiu     $a0, $a0, %lo(D_80139C28)
    /* 1600 8013B1F8 88EC0408 */  j          .L8013B220
    /* 1604 8013B1FC FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8013B200:
    /* 1608 8013B200 1480023C */  lui        $v0, %hi(D_80139DD0)
    /* 160C 8013B204 D09D428C */  lw         $v0, %lo(D_80139DD0)($v0)
    /* 1610 8013B208 00000000 */  nop
    /* 1614 8013B20C 0000428C */  lw         $v0, 0x0($v0)
    /* 1618 8013B210 00000000 */  nop
    /* 161C 8013B214 24104300 */  and        $v0, $v0, $v1
    /* 1620 8013B218 ECFF4014 */  bnez       $v0, .L8013B1CC
    /* 1624 8013B21C 21100000 */   addu      $v0, $zero, $zero
  .L8013B220:
    /* 1628 8013B220 1800BF8F */  lw         $ra, 0x18($sp)
    /* 162C 8013B224 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1630 8013B228 0800E003 */  jr         $ra
    /* 1634 8013B22C 00000000 */   nop
endlabel func_8013B19C
