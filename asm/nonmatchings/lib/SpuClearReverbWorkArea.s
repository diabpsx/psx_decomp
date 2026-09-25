.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuClearReverbWorkArea, 0x194

glabel SpuClearReverbWorkArea
    /* 895C 8001895C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8960 80018960 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8964 80018964 21808000 */  addu       $s0, $a0, $zero
    /* 8968 80018968 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 896C 8001896C 0A00022E */  sltiu      $v0, $s0, 0xA
    /* 8970 80018970 3000BFAF */  sw         $ra, 0x30($sp)
    /* 8974 80018974 2800B4AF */  sw         $s4, 0x28($sp)
    /* 8978 80018978 2400B3AF */  sw         $s3, 0x24($sp)
    /* 897C 8001897C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8980 80018980 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8984 80018984 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8988 80018988 0A004010 */  beqz       $v0, .L800189B4
    /* 898C 8001898C 21A80000 */   addu      $s5, $zero, $zero
    /* 8990 80018990 0B80033C */  lui        $v1, %hi(_spu_rev_startaddr)
    /* 8994 80018994 BC5A6324 */  addiu      $v1, $v1, %lo(_spu_rev_startaddr)
    /* 8998 80018998 80101000 */  sll        $v0, $s0, 2
    /* 899C 8001899C 21884300 */  addu       $s1, $v0, $v1
    /* 89A0 800189A0 0000248E */  lw         $a0, 0x0($s1)
    /* 89A4 800189A4 D75E000C */  jal        _SpuIsInAllocateArea_
    /* 89A8 800189A8 00000000 */   nop
    /* 89AC 800189AC 03004010 */  beqz       $v0, .L800189BC
    /* 89B0 800189B0 00000000 */   nop
  .L800189B4:
    /* 89B4 800189B4 B3620008 */  j          .L80018ACC
    /* 89B8 800189B8 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L800189BC:
    /* 89BC 800189BC 08000016 */  bnez       $s0, .L800189E0
    /* 89C0 800189C0 0100023C */   lui       $v0, (0x10000 >> 16)
    /* 89C4 800189C4 0B80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
    /* 89C8 800189C8 745A428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
    /* 89CC 800189CC 10000324 */  addiu      $v1, $zero, 0x10
    /* 89D0 800189D0 04884300 */  sllv       $s1, $v1, $v0
    /* 89D4 800189D4 F0FF0334 */  ori        $v1, $zero, 0xFFF0
    /* 89D8 800189D8 7E620008 */  j          .L800189F8
    /* 89DC 800189DC 04904300 */   sllv      $s2, $v1, $v0
  .L800189E0:
    /* 89E0 800189E0 0000248E */  lw         $a0, 0x0($s1)
    /* 89E4 800189E4 0B80033C */  lui        $v1, %hi(_spu_mem_mode_plus)
    /* 89E8 800189E8 745A638C */  lw         $v1, %lo(_spu_mem_mode_plus)($v1)
    /* 89EC 800189EC 23104400 */  subu       $v0, $v0, $a0
    /* 89F0 800189F0 04886200 */  sllv       $s1, $v0, $v1
    /* 89F4 800189F4 04906400 */  sllv       $s2, $a0, $v1
  .L800189F8:
    /* 89F8 800189F8 0B80143C */  lui        $s4, %hi(_spu_transMode)
    /* 89FC 800189FC 685A948E */  lw         $s4, %lo(_spu_transMode)($s4)
    /* 8A00 80018A00 01000224 */  addiu      $v0, $zero, 0x1
    /* 8A04 80018A04 04008216 */  bne        $s4, $v0, .L80018A18
    /* 8A08 80018A08 00000000 */   nop
    /* 8A0C 80018A0C 0B80013C */  lui        $at, %hi(_spu_transMode)
    /* 8A10 80018A10 685A20AC */  sw         $zero, %lo(_spu_transMode)($at)
    /* 8A14 80018A14 01001524 */  addiu      $s5, $zero, 0x1
  .L80018A18:
    /* 8A18 80018A18 0B80023C */  lui        $v0, %hi(_spu_transferCallback)
    /* 8A1C 80018A1C 845A428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
    /* 8A20 80018A20 00000000 */  nop
    /* 8A24 80018A24 07004010 */  beqz       $v0, .L80018A44
    /* 8A28 80018A28 01001324 */   addiu     $s3, $zero, 0x1
    /* 8A2C 80018A2C 0B80023C */  lui        $v0, %hi(_spu_transferCallback)
    /* 8A30 80018A30 845A428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
    /* 8A34 80018A34 00000000 */  nop
    /* 8A38 80018A38 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8A3C 80018A3C 0B80013C */  lui        $at, %hi(_spu_transferCallback)
    /* 8A40 80018A40 845A20AC */  sw         $zero, %lo(_spu_transferCallback)($at)
  .L80018A44:
    /* 8A44 80018A44 0104222E */  sltiu      $v0, $s1, 0x401
  .L80018A48:
    /* 8A48 80018A48 03004010 */  beqz       $v0, .L80018A58
    /* 8A4C 80018A4C 00041024 */   addiu     $s0, $zero, 0x400
    /* 8A50 80018A50 21802002 */  addu       $s0, $s1, $zero
    /* 8A54 80018A54 21980000 */  addu       $s3, $zero, $zero
  .L80018A58:
    /* 8A58 80018A58 02000424 */  addiu      $a0, $zero, 0x2
    /* 8A5C 80018A5C 605B000C */  jal        _spu_t
    /* 8A60 80018A60 21284002 */   addu      $a1, $s2, $zero
    /* 8A64 80018A64 605B000C */  jal        _spu_t
    /* 8A68 80018A68 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A6C 80018A6C 03000424 */  addiu      $a0, $zero, 0x3
    /* 8A70 80018A70 0B80053C */  lui        $a1, %hi(_spu_zerobuf)
    /* 8A74 80018A74 3856A524 */  addiu      $a1, $a1, %lo(_spu_zerobuf)
    /* 8A78 80018A78 605B000C */  jal        _spu_t
    /* 8A7C 80018A7C 21300002 */   addu      $a2, $s0, $zero
    /* 8A80 80018A80 0B80043C */  lui        $a0, %hi(_spu_EVdma)
    /* 8A84 80018A84 D455848C */  lw         $a0, %lo(_spu_EVdma)($a0)
    /* 8A88 80018A88 00FC3126 */  addiu      $s1, $s1, -0x400
    /* 8A8C 80018A8C BF62000C */  jal        WaitEvent
    /* 8A90 80018A90 00045226 */   addiu     $s2, $s2, 0x400
    /* 8A94 80018A94 ECFF6016 */  bnez       $s3, .L80018A48
    /* 8A98 80018A98 0104222E */   sltiu     $v0, $s1, 0x401
    /* 8A9C 80018A9C 0300A012 */  beqz       $s5, .L80018AAC
    /* 8AA0 80018AA0 00000000 */   nop
    /* 8AA4 80018AA4 0B80013C */  lui        $at, %hi(_spu_transMode)
    /* 8AA8 80018AA8 685A34AC */  sw         $s4, %lo(_spu_transMode)($at)
  .L80018AAC:
    /* 8AAC 80018AAC 1000A28F */  lw         $v0, 0x10($sp)
    /* 8AB0 80018AB0 00000000 */  nop
    /* 8AB4 80018AB4 05004010 */  beqz       $v0, .L80018ACC
    /* 8AB8 80018AB8 21100000 */   addu      $v0, $zero, $zero
    /* 8ABC 80018ABC 1000A28F */  lw         $v0, 0x10($sp)
    /* 8AC0 80018AC0 0B80013C */  lui        $at, %hi(_spu_transferCallback)
    /* 8AC4 80018AC4 845A22AC */  sw         $v0, %lo(_spu_transferCallback)($at)
    /* 8AC8 80018AC8 21100000 */  addu       $v0, $zero, $zero
  .L80018ACC:
    /* 8ACC 80018ACC 3000BF8F */  lw         $ra, 0x30($sp)
    /* 8AD0 80018AD0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 8AD4 80018AD4 2800B48F */  lw         $s4, 0x28($sp)
    /* 8AD8 80018AD8 2400B38F */  lw         $s3, 0x24($sp)
    /* 8ADC 80018ADC 2000B28F */  lw         $s2, 0x20($sp)
    /* 8AE0 80018AE0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8AE4 80018AE4 1800B08F */  lw         $s0, 0x18($sp)
    /* 8AE8 80018AE8 0800E003 */  jr         $ra
    /* 8AEC 80018AEC 3800BD27 */   addiu     $sp, $sp, 0x38
endlabel SpuClearReverbWorkArea
    /* 8AF0 80018AF0 00000000 */  nop
    /* 8AF4 80018AF4 00000000 */  nop
    /* 8AF8 80018AF8 00000000 */  nop
