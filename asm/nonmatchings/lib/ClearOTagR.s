.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearOTagR, 0xAC

glabel ClearOTagR
    /* 3F64 80013F64 0B80023C */  lui        $v0, %hi(D_800B54AE)
    /* 3F68 80013F68 AE544290 */  lbu        $v0, %lo(D_800B54AE)($v0)
    /* 3F6C 80013F6C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F70 80013F70 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3F74 80013F74 21808000 */  addu       $s0, $a0, $zero
    /* 3F78 80013F78 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3F7C 80013F7C 2188A000 */  addu       $s1, $a1, $zero
    /* 3F80 80013F80 0200422C */  sltiu      $v0, $v0, 0x2
    /* 3F84 80013F84 09004014 */  bnez       $v0, .L80013FAC
    /* 3F88 80013F88 1800BFAF */   sw        $ra, 0x18($sp)
    /* 3F8C 80013F8C 1180043C */  lui        $a0, %hi(D_8010DFDC)
    /* 3F90 80013F90 DCDF8424 */  addiu      $a0, $a0, %lo(D_8010DFDC)
    /* 3F94 80013F94 21280002 */  addu       $a1, $s0, $zero
    /* 3F98 80013F98 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3F9C 80013F9C A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3FA0 80013FA0 00000000 */  nop
    /* 3FA4 80013FA4 09F84000 */  jalr       $v0
    /* 3FA8 80013FA8 21302002 */   addu      $a2, $s1, $zero
  .L80013FAC:
    /* 3FAC 80013FAC 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 3FB0 80013FB0 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 3FB4 80013FB4 21200002 */  addu       $a0, $s0, $zero
    /* 3FB8 80013FB8 2C00428C */  lw         $v0, 0x2C($v0)
    /* 3FBC 80013FBC 00000000 */  nop
    /* 3FC0 80013FC0 09F84000 */  jalr       $v0
    /* 3FC4 80013FC4 21282002 */   addu      $a1, $s1, $zero
    /* 3FC8 80013FC8 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
    /* 3FCC 80013FCC FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
    /* 3FD0 80013FD0 21100002 */  addu       $v0, $s0, $zero
    /* 3FD4 80013FD4 0B80053C */  lui        $a1, %hi(D_800B556C)
    /* 3FD8 80013FD8 6C55A524 */  addiu      $a1, $a1, %lo(D_800B556C)
    /* 3FDC 80013FDC 0B80033C */  lui        $v1, %hi(D_800B5558)
    /* 3FE0 80013FE0 58556324 */  addiu      $v1, $v1, %lo(D_800B5558)
    /* 3FE4 80013FE4 24186600 */  and        $v1, $v1, $a2
    /* 3FE8 80013FE8 0004043C */  lui        $a0, (0x4000000 >> 16)
    /* 3FEC 80013FEC 25186400 */  or         $v1, $v1, $a0
    /* 3FF0 80013FF0 0000A3AC */  sw         $v1, 0x0($a1)
    /* 3FF4 80013FF4 2428A600 */  and        $a1, $a1, $a2
    /* 3FF8 80013FF8 000045AC */  sw         $a1, 0x0($v0)
    /* 3FFC 80013FFC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4000 80014000 1400B18F */  lw         $s1, 0x14($sp)
    /* 4004 80014004 1000B08F */  lw         $s0, 0x10($sp)
    /* 4008 80014008 0800E003 */  jr         $ra
    /* 400C 8001400C 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel ClearOTagR
