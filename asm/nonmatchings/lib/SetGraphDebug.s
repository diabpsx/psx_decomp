.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetGraphDebug, 0x5C

glabel SetGraphDebug
    /* 3870 80013870 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3874 80013874 0B80033C */  lui        $v1, %hi(D_800B54AE)
    /* 3878 80013878 AE546324 */  addiu      $v1, $v1, %lo(D_800B54AE)
    /* 387C 8001387C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 3880 80013880 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3884 80013884 00007090 */  lbu        $s0, 0x0($v1)
    /* 3888 80013888 000064A0 */  sb         $a0, 0x0($v1)
    /* 388C 8001388C FF008430 */  andi       $a0, $a0, 0xFF
    /* 3890 80013890 0A008010 */  beqz       $a0, .L800138BC
    /* 3894 80013894 21100002 */   addu      $v0, $s0, $zero
    /* 3898 80013898 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 389C 8001389C A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 38A0 800138A0 00006590 */  lbu        $a1, 0x0($v1)
    /* 38A4 800138A4 FEFF6690 */  lbu        $a2, -0x2($v1)
    /* 38A8 800138A8 01006790 */  lbu        $a3, 0x1($v1)
    /* 38AC 800138AC 1180043C */  lui        $a0, %hi(D_8010DEE0)
    /* 38B0 800138B0 09F84000 */  jalr       $v0
    /* 38B4 800138B4 E0DE8424 */   addiu     $a0, $a0, %lo(D_8010DEE0)
    /* 38B8 800138B8 21100002 */  addu       $v0, $s0, $zero
  .L800138BC:
    /* 38BC 800138BC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 38C0 800138C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 38C4 800138C4 0800E003 */  jr         $ra
    /* 38C8 800138C8 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SetGraphDebug
