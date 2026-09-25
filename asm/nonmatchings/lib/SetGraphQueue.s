.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetGraphQueue, 0xA4

glabel SetGraphQueue
    /* 38CC 800138CC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 38D0 800138D0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 38D4 800138D4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 38D8 800138D8 0B80113C */  lui        $s1, %hi(D_800B54AD)
    /* 38DC 800138DC AD543126 */  addiu      $s1, $s1, %lo(D_800B54AD)
    /* 38E0 800138E0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 38E4 800138E4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 38E8 800138E8 01002292 */  lbu        $v0, 0x1($s1)
    /* 38EC 800138EC 00003292 */  lbu        $s2, 0x0($s1)
    /* 38F0 800138F0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 38F4 800138F4 08004014 */  bnez       $v0, .L80013918
    /* 38F8 800138F8 21808000 */   addu      $s0, $a0, $zero
    /* 38FC 800138FC 1180043C */  lui        $a0, %hi(D_8010DF0C)
    /* 3900 80013900 0CDF8424 */  addiu      $a0, $a0, %lo(D_8010DF0C)
    /* 3904 80013904 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 3908 80013908 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 390C 8001390C 00000000 */  nop
    /* 3910 80013910 09F84000 */  jalr       $v0
    /* 3914 80013914 21280002 */   addu      $a1, $s0, $zero
  .L80013918:
    /* 3918 80013918 00002292 */  lbu        $v0, 0x0($s1)
    /* 391C 8001391C 00000000 */  nop
    /* 3920 80013920 0D000212 */  beq        $s0, $v0, .L80013958
    /* 3924 80013924 21104002 */   addu      $v0, $s2, $zero
    /* 3928 80013928 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 392C 8001392C A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 3930 80013930 00000000 */  nop
    /* 3934 80013934 3400428C */  lw         $v0, 0x34($v0)
    /* 3938 80013938 00000000 */  nop
    /* 393C 8001393C 09F84000 */  jalr       $v0
    /* 3940 80013940 01000424 */   addiu     $a0, $zero, 0x1
    /* 3944 80013944 02000424 */  addiu      $a0, $zero, 0x2
    /* 3948 80013948 21280000 */  addu       $a1, $zero, $zero
    /* 394C 8001394C B748000C */  jal        DMACallback
    /* 3950 80013950 000030A2 */   sb        $s0, 0x0($s1)
    /* 3954 80013954 21104002 */  addu       $v0, $s2, $zero
  .L80013958:
    /* 3958 80013958 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 395C 8001395C 1800B28F */  lw         $s2, 0x18($sp)
    /* 3960 80013960 1400B18F */  lw         $s1, 0x14($sp)
    /* 3964 80013964 1000B08F */  lw         $s0, 0x10($sp)
    /* 3968 80013968 0800E003 */  jr         $ra
    /* 396C 8001396C 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel SetGraphQueue
