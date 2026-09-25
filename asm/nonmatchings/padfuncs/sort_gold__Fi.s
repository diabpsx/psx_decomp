.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching sort_gold__Fi, 0x108

glabel sort_gold__Fi
    /* 92A5C 800A2A5C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 92A60 800A2A60 3000B4AF */  sw         $s4, 0x30($sp)
    /* 92A64 800A2A64 21A08000 */  addu       $s4, $a0, $zero
    /* 92A68 800A2A68 2800B2AF */  sw         $s2, 0x28($sp)
    /* 92A6C 800A2A6C 21900000 */  addu       $s2, $zero, $zero
    /* 92A70 800A2A70 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 92A74 800A2A74 21980000 */  addu       $s3, $zero, $zero
    /* 92A78 800A2A78 1280033C */  lui        $v1, %hi(sel_data)
    /* 92A7C 800A2A7C 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 92A80 800A2A80 0E80043C */  lui        $a0, %hi(_pfind_list)
    /* 92A84 800A2A84 A8388424 */  addiu      $a0, $a0, %lo(_pfind_list)
    /* 92A88 800A2A88 3400BFAF */  sw         $ra, 0x34($sp)
    /* 92A8C 800A2A8C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 92A90 800A2A90 2000B0AF */  sw         $s0, 0x20($sp)
    /* 92A94 800A2A94 00110300 */  sll        $v0, $v1, 4
    /* 92A98 800A2A98 23104300 */  subu       $v0, $v0, $v1
    /* 92A9C 800A2A9C 40100200 */  sll        $v0, $v0, 1
    /* 92AA0 800A2AA0 1280013C */  lui        $at, %hi(_pfind_index)
    /* 92AA4 800A2AA4 21082300 */  addu       $at, $at, $v1
    /* 92AA8 800A2AA8 DCBB2380 */  lb         $v1, %lo(_pfind_index)($at)
    /* 92AAC 800A2AAC 00000000 */  nop
    /* 92AB0 800A2AB0 22006018 */  blez       $v1, .L800A2B3C
    /* 92AB4 800A2AB4 21884400 */   addu      $s1, $v0, $a0
    /* 92AB8 800A2AB8 02003026 */  addiu      $s0, $s1, 0x2
  .L800A2ABC:
    /* 92ABC 800A2ABC 00002582 */  lb         $a1, 0x0($s1)
    /* 92AC0 800A2AC0 00000000 */  nop
    /* 92AC4 800A2AC4 C0100500 */  sll        $v0, $a1, 3
    /* 92AC8 800A2AC8 23104500 */  subu       $v0, $v0, $a1
    /* 92ACC 800A2ACC 80100200 */  sll        $v0, $v0, 2
    /* 92AD0 800A2AD0 23104500 */  subu       $v0, $v0, $a1
    /* 92AD4 800A2AD4 80100200 */  sll        $v0, $v0, 2
    /* 92AD8 800A2AD8 0D80013C */  lui        $at, %hi(item + 0x2C)
    /* 92ADC 800A2ADC 21082200 */  addu       $at, $at, $v0
    /* 92AE0 800A2AE0 801D2384 */  lh         $v1, %lo(item + 0x2C)($at)
    /* 92AE4 800A2AE4 0B000224 */  addiu      $v0, $zero, 0xB
    /* 92AE8 800A2AE8 08006214 */  bne        $v1, $v0, .L800A2B0C
    /* 92AEC 800A2AEC 01000424 */   addiu     $a0, $zero, 0x1
    /* 92AF0 800A2AF0 01001324 */  addiu      $s3, $zero, 0x1
    /* 92AF4 800A2AF4 FFFFA230 */  andi       $v0, $a1, 0xFFFF
    /* 92AF8 800A2AF8 FFFF0692 */  lbu        $a2, -0x1($s0)
    /* 92AFC 800A2AFC 00000792 */  lbu        $a3, 0x0($s0)
    /* 92B00 800A2B00 2A000524 */  addiu      $a1, $zero, 0x2A
    /* 92B04 800A2B04 DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 92B08 800A2B08 1000A2AF */   sw        $v0, 0x10($sp)
  .L800A2B0C:
    /* 92B0C 800A2B0C 239C010C */  jal        CheckNewPath__Fi
    /* 92B10 800A2B10 21208002 */   addu      $a0, $s4, $zero
    /* 92B14 800A2B14 03001026 */  addiu      $s0, $s0, 0x3
    /* 92B18 800A2B18 1280023C */  lui        $v0, %hi(sel_data)
    /* 92B1C 800A2B1C 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 92B20 800A2B20 1280013C */  lui        $at, %hi(_pfind_index)
    /* 92B24 800A2B24 21082200 */  addu       $at, $at, $v0
    /* 92B28 800A2B28 DCBB2280 */  lb         $v0, %lo(_pfind_index)($at)
    /* 92B2C 800A2B2C 01005226 */  addiu      $s2, $s2, 0x1
    /* 92B30 800A2B30 2A104202 */  slt        $v0, $s2, $v0
    /* 92B34 800A2B34 E1FF4014 */  bnez       $v0, .L800A2ABC
    /* 92B38 800A2B38 03003126 */   addiu     $s1, $s1, 0x3
  .L800A2B3C:
    /* 92B3C 800A2B3C 21106002 */  addu       $v0, $s3, $zero
    /* 92B40 800A2B40 3400BF8F */  lw         $ra, 0x34($sp)
    /* 92B44 800A2B44 3000B48F */  lw         $s4, 0x30($sp)
    /* 92B48 800A2B48 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 92B4C 800A2B4C 2800B28F */  lw         $s2, 0x28($sp)
    /* 92B50 800A2B50 2400B18F */  lw         $s1, 0x24($sp)
    /* 92B54 800A2B54 2000B08F */  lw         $s0, 0x20($sp)
    /* 92B58 800A2B58 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 92B5C 800A2B5C 0800E003 */  jr         $ra
    /* 92B60 800A2B60 00000000 */   nop
endlabel sort_gold__Fi
