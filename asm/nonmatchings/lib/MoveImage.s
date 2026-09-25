.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MoveImage, 0xB8

glabel MoveImage
    /* 3DE4 80013DE4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3DE8 80013DE8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3DEC 80013DEC 21808000 */  addu       $s0, $a0, $zero
    /* 3DF0 80013DF0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3DF4 80013DF4 2190A000 */  addu       $s2, $a1, $zero
    /* 3DF8 80013DF8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3DFC 80013DFC 2188C000 */  addu       $s1, $a2, $zero
    /* 3E00 80013E00 1180043C */  lui        $a0, %hi(D_8010DFB8)
    /* 3E04 80013E04 B8DF8424 */  addiu      $a0, $a0, %lo(D_8010DFB8)
    /* 3E08 80013E08 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 3E0C 80013E0C B84E000C */  jal        func_80013AE0
    /* 3E10 80013E10 21280002 */   addu      $a1, $s0, $zero
    /* 3E14 80013E14 04000286 */  lh         $v0, 0x4($s0)
    /* 3E18 80013E18 00000000 */  nop
    /* 3E1C 80013E1C 19004010 */  beqz       $v0, .L80013E84
    /* 3E20 80013E20 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 3E24 80013E24 06000286 */  lh         $v0, 0x6($s0)
    /* 3E28 80013E28 00000000 */  nop
    /* 3E2C 80013E2C 03004014 */  bnez       $v0, .L80013E3C
    /* 3E30 80013E30 00141100 */   sll       $v0, $s1, 16
    /* 3E34 80013E34 A14F0008 */  j          .L80013E84
    /* 3E38 80013E38 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80013E3C:
    /* 3E3C 80013E3C 0B80033C */  lui        $v1, %hi(D_800B554C)
    /* 3E40 80013E40 4C556324 */  addiu      $v1, $v1, %lo(D_800B554C)
    /* 3E44 80013E44 FFFF4432 */  andi       $a0, $s2, 0xFFFF
    /* 3E48 80013E48 25104400 */  or         $v0, $v0, $a0
    /* 3E4C 80013E4C 0000058E */  lw         $a1, 0x0($s0)
    /* 3E50 80013E50 0B80073C */  lui        $a3, %hi(D_800B54A4)
    /* 3E54 80013E54 A454E78C */  lw         $a3, %lo(D_800B54A4)($a3)
    /* 3E58 80013E58 14000624 */  addiu      $a2, $zero, 0x14
    /* 3E5C 80013E5C 040062AC */  sw         $v0, 0x4($v1)
    /* 3E60 80013E60 000065AC */  sw         $a1, 0x0($v1)
    /* 3E64 80013E64 0400028E */  lw         $v0, 0x4($s0)
    /* 3E68 80013E68 F8FF6524 */  addiu      $a1, $v1, -0x8
    /* 3E6C 80013E6C 080062AC */  sw         $v0, 0x8($v1)
    /* 3E70 80013E70 1800E48C */  lw         $a0, 0x18($a3)
    /* 3E74 80013E74 0800E28C */  lw         $v0, 0x8($a3)
    /* 3E78 80013E78 00000000 */  nop
    /* 3E7C 80013E7C 09F84000 */  jalr       $v0
    /* 3E80 80013E80 21380000 */   addu      $a3, $zero, $zero
  .L80013E84:
    /* 3E84 80013E84 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 3E88 80013E88 1800B28F */  lw         $s2, 0x18($sp)
    /* 3E8C 80013E8C 1400B18F */  lw         $s1, 0x14($sp)
    /* 3E90 80013E90 1000B08F */  lw         $s0, 0x10($sp)
    /* 3E94 80013E94 0800E003 */  jr         $ra
    /* 3E98 80013E98 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel MoveImage
