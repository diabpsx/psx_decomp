.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80013AE0, 0x11C

glabel func_80013AE0
    /* 3AE0 80013AE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3AE4 80013AE4 21408000 */  addu       $t0, $a0, $zero
    /* 3AE8 80013AE8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 3AEC 80013AEC 0B80043C */  lui        $a0, %hi(D_800B54AE)
    /* 3AF0 80013AF0 AE548424 */  addiu      $a0, $a0, %lo(D_800B54AE)
    /* 3AF4 80013AF4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 3AF8 80013AF8 00008390 */  lbu        $v1, 0x0($a0)
    /* 3AFC 80013AFC 01000224 */  addiu      $v0, $zero, 0x1
    /* 3B00 80013B00 06006210 */  beq        $v1, $v0, .L80013B1C
    /* 3B04 80013B04 2180A000 */   addu      $s0, $a1, $zero
    /* 3B08 80013B08 02000224 */  addiu      $v0, $zero, 0x2
    /* 3B0C 80013B0C 26006210 */  beq        $v1, $v0, .L80013BA8
    /* 3B10 80013B10 00000000 */   nop
    /* 3B14 80013B14 FB4E0008 */  j          .L80013BEC
    /* 3B18 80013B18 00000000 */   nop
  .L80013B1C:
    /* 3B1C 80013B1C 04000586 */  lh         $a1, 0x4($s0)
    /* 3B20 80013B20 02008384 */  lh         $v1, 0x2($a0)
    /* 3B24 80013B24 00000000 */  nop
    /* 3B28 80013B28 2A106500 */  slt        $v0, $v1, $a1
    /* 3B2C 80013B2C 1B004014 */  bnez       $v0, .L80013B9C
    /* 3B30 80013B30 00000000 */   nop
    /* 3B34 80013B34 00000786 */  lh         $a3, 0x0($s0)
    /* 3B38 80013B38 00000000 */  nop
    /* 3B3C 80013B3C 2110A700 */  addu       $v0, $a1, $a3
    /* 3B40 80013B40 2A106200 */  slt        $v0, $v1, $v0
    /* 3B44 80013B44 15004014 */  bnez       $v0, .L80013B9C
    /* 3B48 80013B48 00000000 */   nop
    /* 3B4C 80013B4C 02000386 */  lh         $v1, 0x2($s0)
    /* 3B50 80013B50 04008484 */  lh         $a0, 0x4($a0)
    /* 3B54 80013B54 00000000 */  nop
    /* 3B58 80013B58 2A108300 */  slt        $v0, $a0, $v1
    /* 3B5C 80013B5C 0F004014 */  bnez       $v0, .L80013B9C
    /* 3B60 80013B60 00000000 */   nop
    /* 3B64 80013B64 06000686 */  lh         $a2, 0x6($s0)
    /* 3B68 80013B68 00000000 */  nop
    /* 3B6C 80013B6C 21106600 */  addu       $v0, $v1, $a2
    /* 3B70 80013B70 2A108200 */  slt        $v0, $a0, $v0
    /* 3B74 80013B74 09004014 */  bnez       $v0, .L80013B9C
    /* 3B78 80013B78 00000000 */   nop
    /* 3B7C 80013B7C 0700A018 */  blez       $a1, .L80013B9C
    /* 3B80 80013B80 00000000 */   nop
    /* 3B84 80013B84 0500E004 */  bltz       $a3, .L80013B9C
    /* 3B88 80013B88 00000000 */   nop
    /* 3B8C 80013B8C 03006004 */  bltz       $v1, .L80013B9C
    /* 3B90 80013B90 00000000 */   nop
    /* 3B94 80013B94 1500C01C */  bgtz       $a2, .L80013BEC
    /* 3B98 80013B98 00000000 */   nop
  .L80013B9C:
    /* 3B9C 80013B9C 1180043C */  lui        $a0, %hi(D_8010DF64)
    /* 3BA0 80013BA0 EC4E0008 */  j          .L80013BB0
    /* 3BA4 80013BA4 64DF8424 */   addiu     $a0, $a0, %lo(D_8010DF64)
  .L80013BA8:
    /* 3BA8 80013BA8 1180043C */  lui        $a0, %hi(D_8010DF84)
    /* 3BAC 80013BAC 84DF8424 */  addiu      $a0, $a0, %lo(D_8010DF84)
  .L80013BB0:
    /* 3BB0 80013BB0 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3BB4 80013BB4 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3BB8 80013BB8 00000000 */  nop
    /* 3BBC 80013BBC 09F84000 */  jalr       $v0
    /* 3BC0 80013BC0 21280001 */   addu      $a1, $t0, $zero
    /* 3BC4 80013BC4 00000586 */  lh         $a1, 0x0($s0)
    /* 3BC8 80013BC8 02000686 */  lh         $a2, 0x2($s0)
    /* 3BCC 80013BCC 04000786 */  lh         $a3, 0x4($s0)
    /* 3BD0 80013BD0 06000386 */  lh         $v1, 0x6($s0)
    /* 3BD4 80013BD4 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3BD8 80013BD8 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 3BDC 80013BDC 1180043C */  lui        $a0, %hi(D_8010DF70)
    /* 3BE0 80013BE0 70DF8424 */  addiu      $a0, $a0, %lo(D_8010DF70)
    /* 3BE4 80013BE4 09F84000 */  jalr       $v0
    /* 3BE8 80013BE8 1000A3AF */   sw        $v1, 0x10($sp)
  .L80013BEC:
    /* 3BEC 80013BEC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 3BF0 80013BF0 1800B08F */  lw         $s0, 0x18($sp)
    /* 3BF4 80013BF4 0800E003 */  jr         $ra
    /* 3BF8 80013BF8 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel func_80013AE0
