.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDispMask, 0x98

glabel SetDispMask
    /* 39E0 800139E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 39E4 800139E4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 39E8 800139E8 0B80113C */  lui        $s1, %hi(D_800B54AE)
    /* 39EC 800139EC AE543126 */  addiu      $s1, $s1, %lo(D_800B54AE)
    /* 39F0 800139F0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 39F4 800139F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 39F8 800139F8 00002292 */  lbu        $v0, 0x0($s1)
    /* 39FC 800139FC 00000000 */  nop
    /* 3A00 80013A00 0200422C */  sltiu      $v0, $v0, 0x2
    /* 3A04 80013A04 08004014 */  bnez       $v0, .L80013A28
    /* 3A08 80013A08 21808000 */   addu      $s0, $a0, $zero
    /* 3A0C 80013A0C 1180043C */  lui        $a0, %hi(D_8010DF3C)
    /* 3A10 80013A10 3CDF8424 */  addiu      $a0, $a0, %lo(D_8010DF3C)
    /* 3A14 80013A14 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3A18 80013A18 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3A1C 80013A1C 00000000 */  nop
    /* 3A20 80013A20 09F84000 */  jalr       $v0
    /* 3A24 80013A24 21280002 */   addu      $a1, $s0, $zero
  .L80013A28:
    /* 3A28 80013A28 04000016 */  bnez       $s0, .L80013A3C
    /* 3A2C 80013A2C 6A002426 */   addiu     $a0, $s1, 0x6A
    /* 3A30 80013A30 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 3A34 80013A34 8759000C */  jal        func_8001661C
    /* 3A38 80013A38 14000624 */   addiu     $a2, $zero, 0x14
  .L80013A3C:
    /* 3A3C 80013A3C 0003043C */  lui        $a0, (0x3000001 >> 16)
    /* 3A40 80013A40 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 3A44 80013A44 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 3A48 80013A48 02000012 */  beqz       $s0, .L80013A54
    /* 3A4C 80013A4C 01008434 */   ori       $a0, $a0, (0x3000001 & 0xFFFF)
    /* 3A50 80013A50 0003043C */  lui        $a0, (0x3000000 >> 16)
  .L80013A54:
    /* 3A54 80013A54 1000428C */  lw         $v0, 0x10($v0)
    /* 3A58 80013A58 00000000 */  nop
    /* 3A5C 80013A5C 09F84000 */  jalr       $v0
    /* 3A60 80013A60 00000000 */   nop
    /* 3A64 80013A64 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3A68 80013A68 1400B18F */  lw         $s1, 0x14($sp)
    /* 3A6C 80013A6C 1000B08F */  lw         $s0, 0x10($sp)
    /* 3A70 80013A70 0800E003 */  jr         $ra
    /* 3A74 80013A74 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel SetDispMask
