.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findnamedpurgeableblockinclass, 0xAC

glabel findnamedpurgeableblockinclass
    /* 19D04 80029D04 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 19D08 80029D08 000FA530 */  andi       $a1, $a1, 0xF00
    /* 19D0C 80029D0C 032A0500 */  sra        $a1, $a1, 8
    /* 19D10 80029D10 40100500 */  sll        $v0, $a1, 1
    /* 19D14 80029D14 21104500 */  addu       $v0, $v0, $a1
    /* 19D18 80029D18 C0100200 */  sll        $v0, $v0, 3
    /* 19D1C 80029D1C 1380033C */  lui        $v1, %hi(memclass)
    /* 19D20 80029D20 307A6324 */  addiu      $v1, $v1, %lo(memclass)
    /* 19D24 80029D24 1400B1AF */  sw         $s1, 0x14($sp)
    /* 19D28 80029D28 21884300 */  addu       $s1, $v0, $v1
    /* 19D2C 80029D2C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 19D30 80029D30 1800B2AF */  sw         $s2, 0x18($sp)
    /* 19D34 80029D34 46BD000C */  jal        filename
    /* 19D38 80029D38 1000B0AF */   sw        $s0, 0x10($sp)
    /* 19D3C 80029D3C 0000308E */  lw         $s0, 0x0($s1)
    /* 19D40 80029D40 0400238E */  lw         $v1, 0x4($s1)
    /* 19D44 80029D44 00000000 */  nop
    /* 19D48 80029D48 11000312 */  beq        $s0, $v1, .L80029D90
    /* 19D4C 80029D4C 21904000 */   addu      $s2, $v0, $zero
    /* 19D50 80029D50 21204002 */  addu       $a0, $s2, $zero
  .L80029D54:
    /* 19D54 80029D54 04000526 */  addiu      $a1, $s0, 0x4
    /* 19D58 80029D58 4375000C */  jal        strncmp
    /* 19D5C 80029D5C 0C000624 */   addiu     $a2, $zero, 0xC
    /* 19D60 80029D60 06004014 */  bnez       $v0, .L80029D7C
    /* 19D64 80029D64 00000000 */   nop
    /* 19D68 80029D68 1800028E */  lw         $v0, 0x18($s0)
    /* 19D6C 80029D6C 00000000 */  nop
    /* 19D70 80029D70 08004230 */  andi       $v0, $v0, 0x8
    /* 19D74 80029D74 07004014 */  bnez       $v0, .L80029D94
    /* 19D78 80029D78 21100002 */   addu      $v0, $s0, $zero
  .L80029D7C:
    /* 19D7C 80029D7C 2000108E */  lw         $s0, 0x20($s0)
    /* 19D80 80029D80 0400228E */  lw         $v0, 0x4($s1)
    /* 19D84 80029D84 00000000 */  nop
    /* 19D88 80029D88 F2FF0216 */  bne        $s0, $v0, .L80029D54
    /* 19D8C 80029D8C 21204002 */   addu      $a0, $s2, $zero
  .L80029D90:
    /* 19D90 80029D90 21100000 */  addu       $v0, $zero, $zero
  .L80029D94:
    /* 19D94 80029D94 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 19D98 80029D98 1800B28F */  lw         $s2, 0x18($sp)
    /* 19D9C 80029D9C 1400B18F */  lw         $s1, 0x14($sp)
    /* 19DA0 80029DA0 1000B08F */  lw         $s0, 0x10($sp)
    /* 19DA4 80029DA4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 19DA8 80029DA8 0800E003 */  jr         $ra
    /* 19DAC 80029DAC 00000000 */   nop
endlabel findnamedpurgeableblockinclass
