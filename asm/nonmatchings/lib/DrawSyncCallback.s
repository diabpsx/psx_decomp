.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSyncCallback, 0x60

glabel DrawSyncCallback
    /* 3980 80013980 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3984 80013984 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3988 80013988 0B80103C */  lui        $s0, %hi(D_800B54AE)
    /* 398C 8001398C AE541026 */  addiu      $s0, $s0, %lo(D_800B54AE)
    /* 3990 80013990 1800BFAF */  sw         $ra, 0x18($sp)
    /* 3994 80013994 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3998 80013998 00000292 */  lbu        $v0, 0x0($s0)
    /* 399C 8001399C 00000000 */  nop
    /* 39A0 800139A0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 39A4 800139A4 07004014 */  bnez       $v0, .L800139C4
    /* 39A8 800139A8 21888000 */   addu      $s1, $a0, $zero
    /* 39AC 800139AC 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 39B0 800139B0 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 39B4 800139B4 1180043C */  lui        $a0, %hi(D_8010DF20)
    /* 39B8 800139B8 20DF8424 */  addiu      $a0, $a0, %lo(D_8010DF20)
    /* 39BC 800139BC 09F84000 */  jalr       $v0
    /* 39C0 800139C0 21282002 */   addu      $a1, $s1, $zero
  .L800139C4:
    /* 39C4 800139C4 0A00028E */  lw         $v0, 0xA($s0)
    /* 39C8 800139C8 0A0011AE */  sw         $s1, 0xA($s0)
    /* 39CC 800139CC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 39D0 800139D0 1400B18F */  lw         $s1, 0x14($sp)
    /* 39D4 800139D4 1000B08F */  lw         $s0, 0x10($sp)
    /* 39D8 800139D8 0800E003 */  jr         $ra
    /* 39DC 800139DC 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel DrawSyncCallback
