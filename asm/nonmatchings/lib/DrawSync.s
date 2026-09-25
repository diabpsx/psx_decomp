.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSync, 0x68

glabel DrawSync
    /* 3A78 80013A78 0B80023C */  lui        $v0, %hi(D_800B54AE)
    /* 3A7C 80013A7C AE544290 */  lbu        $v0, %lo(D_800B54AE)($v0)
    /* 3A80 80013A80 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3A84 80013A84 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3A88 80013A88 21808000 */  addu       $s0, $a0, $zero
    /* 3A8C 80013A8C 0200422C */  sltiu      $v0, $v0, 0x2
    /* 3A90 80013A90 08004014 */  bnez       $v0, .L80013AB4
    /* 3A94 80013A94 1400BFAF */   sw        $ra, 0x14($sp)
    /* 3A98 80013A98 1180043C */  lui        $a0, %hi(D_8010DF50)
    /* 3A9C 80013A9C 50DF8424 */  addiu      $a0, $a0, %lo(D_8010DF50)
    /* 3AA0 80013AA0 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3AA4 80013AA4 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3AA8 80013AA8 00000000 */  nop
    /* 3AAC 80013AAC 09F84000 */  jalr       $v0
    /* 3AB0 80013AB0 21280002 */   addu      $a1, $s0, $zero
  .L80013AB4:
    /* 3AB4 80013AB4 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 3AB8 80013AB8 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 3ABC 80013ABC 00000000 */  nop
    /* 3AC0 80013AC0 3C00428C */  lw         $v0, 0x3C($v0)
    /* 3AC4 80013AC4 00000000 */  nop
    /* 3AC8 80013AC8 09F84000 */  jalr       $v0
    /* 3ACC 80013ACC 21200002 */   addu      $a0, $s0, $zero
    /* 3AD0 80013AD0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 3AD4 80013AD4 1000B08F */  lw         $s0, 0x10($sp)
    /* 3AD8 80013AD8 0800E003 */  jr         $ra
    /* 3ADC 80013ADC 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel DrawSync
