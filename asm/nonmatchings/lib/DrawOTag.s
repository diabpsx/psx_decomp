.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawOTag, 0x70

glabel DrawOTag
    /* 406C 8001406C 0B80023C */  lui        $v0, %hi(D_800B54AE)
    /* 4070 80014070 AE544290 */  lbu        $v0, %lo(D_800B54AE)($v0)
    /* 4074 80014074 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4078 80014078 1000B0AF */  sw         $s0, 0x10($sp)
    /* 407C 8001407C 21808000 */  addu       $s0, $a0, $zero
    /* 4080 80014080 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4084 80014084 08004014 */  bnez       $v0, .L800140A8
    /* 4088 80014088 1400BFAF */   sw        $ra, 0x14($sp)
    /* 408C 8001408C 1180043C */  lui        $a0, %hi(D_8010DFF4)
    /* 4090 80014090 F4DF8424 */  addiu      $a0, $a0, %lo(D_8010DFF4)
    /* 4094 80014094 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 4098 80014098 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 409C 8001409C 00000000 */  nop
    /* 40A0 800140A0 09F84000 */  jalr       $v0
    /* 40A4 800140A4 21280002 */   addu      $a1, $s0, $zero
  .L800140A8:
    /* 40A8 800140A8 21280002 */  addu       $a1, $s0, $zero
    /* 40AC 800140AC 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 40B0 800140B0 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 40B4 800140B4 21300000 */  addu       $a2, $zero, $zero
    /* 40B8 800140B8 1800448C */  lw         $a0, 0x18($v0)
    /* 40BC 800140BC 0800428C */  lw         $v0, 0x8($v0)
    /* 40C0 800140C0 00000000 */  nop
    /* 40C4 800140C4 09F84000 */  jalr       $v0
    /* 40C8 800140C8 21380000 */   addu      $a3, $zero, $zero
    /* 40CC 800140CC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 40D0 800140D0 1000B08F */  lw         $s0, 0x10($sp)
    /* 40D4 800140D4 0800E003 */  jr         $ra
    /* 40D8 800140D8 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel DrawOTag
