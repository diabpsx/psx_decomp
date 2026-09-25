.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuWrite0, 0x158

glabel SpuWrite0
    /* 8D5C 80018D5C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8D60 80018D60 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8D64 80018D64 21888000 */  addu       $s1, $a0, $zero
    /* 8D68 80018D68 3000B6AF */  sw         $s6, 0x30($sp)
    /* 8D6C 80018D6C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 8D70 80018D70 0B80153C */  lui        $s5, %hi(_spu_transMode)
    /* 8D74 80018D74 685AB58E */  lw         $s5, %lo(_spu_transMode)($s5)
    /* 8D78 80018D78 01000224 */  addiu      $v0, $zero, 0x1
    /* 8D7C 80018D7C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 8D80 80018D80 2800B4AF */  sw         $s4, 0x28($sp)
    /* 8D84 80018D84 2400B3AF */  sw         $s3, 0x24($sp)
    /* 8D88 80018D88 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8D8C 80018D8C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8D90 80018D90 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8D94 80018D94 0400A216 */  bne        $s5, $v0, .L80018DA8
    /* 8D98 80018D98 21B00000 */   addu      $s6, $zero, $zero
    /* 8D9C 80018D9C 0B80013C */  lui        $at, %hi(_spu_transMode)
    /* 8DA0 80018DA0 685A20AC */  sw         $zero, %lo(_spu_transMode)($at)
    /* 8DA4 80018DA4 01001624 */  addiu      $s6, $zero, 0x1
  .L80018DA8:
    /* 8DA8 80018DA8 01001424 */  addiu      $s4, $zero, 0x1
    /* 8DAC 80018DAC 0B80023C */  lui        $v0, %hi(_spu_tsa)
    /* 8DB0 80018DB0 645A4294 */  lhu        $v0, %lo(_spu_tsa)($v0)
    /* 8DB4 80018DB4 0B80033C */  lui        $v1, %hi(_spu_mem_mode_plus)
    /* 8DB8 80018DB8 745A638C */  lw         $v1, %lo(_spu_mem_mode_plus)($v1)
    /* 8DBC 80018DBC 0B80043C */  lui        $a0, %hi(_spu_transferCallback)
    /* 8DC0 80018DC0 845A848C */  lw         $a0, %lo(_spu_transferCallback)($a0)
    /* 8DC4 80018DC4 00000000 */  nop
    /* 8DC8 80018DC8 07008010 */  beqz       $a0, .L80018DE8
    /* 8DCC 80018DCC 04906200 */   sllv      $s2, $v0, $v1
    /* 8DD0 80018DD0 0B80023C */  lui        $v0, %hi(_spu_transferCallback)
    /* 8DD4 80018DD4 845A428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
    /* 8DD8 80018DD8 00000000 */  nop
    /* 8DDC 80018DDC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8DE0 80018DE0 0B80013C */  lui        $at, %hi(_spu_transferCallback)
    /* 8DE4 80018DE4 845A20AC */  sw         $zero, %lo(_spu_transferCallback)($at)
  .L80018DE8:
    /* 8DE8 80018DE8 21980000 */  addu       $s3, $zero, $zero
    /* 8DEC 80018DEC 0104222E */  sltiu      $v0, $s1, 0x401
  .L80018DF0:
    /* 8DF0 80018DF0 03004014 */  bnez       $v0, .L80018E00
    /* 8DF4 80018DF4 82111100 */   srl       $v0, $s1, 6
    /* 8DF8 80018DF8 85630008 */  j          .L80018E14
    /* 8DFC 80018DFC 00041024 */   addiu     $s0, $zero, 0x400
  .L80018E00:
    /* 8E00 80018E00 80810200 */  sll        $s0, $v0, 6
    /* 8E04 80018E04 2B101102 */  sltu       $v0, $s0, $s1
    /* 8E08 80018E08 02004010 */  beqz       $v0, .L80018E14
    /* 8E0C 80018E0C 21A00000 */   addu      $s4, $zero, $zero
    /* 8E10 80018E10 40001026 */  addiu      $s0, $s0, 0x40
  .L80018E14:
    /* 8E14 80018E14 02000424 */  addiu      $a0, $zero, 0x2
    /* 8E18 80018E18 605B000C */  jal        _spu_t
    /* 8E1C 80018E1C 21284002 */   addu      $a1, $s2, $zero
    /* 8E20 80018E20 605B000C */  jal        _spu_t
    /* 8E24 80018E24 01000424 */   addiu     $a0, $zero, 0x1
    /* 8E28 80018E28 03000424 */  addiu      $a0, $zero, 0x3
    /* 8E2C 80018E2C 0B80053C */  lui        $a1, %hi(_spu_zerobuf)
    /* 8E30 80018E30 3856A524 */  addiu      $a1, $a1, %lo(_spu_zerobuf)
    /* 8E34 80018E34 605B000C */  jal        _spu_t
    /* 8E38 80018E38 21300002 */   addu      $a2, $s0, $zero
    /* 8E3C 80018E3C 0B80043C */  lui        $a0, %hi(_spu_EVdma)
    /* 8E40 80018E40 D455848C */  lw         $a0, %lo(_spu_EVdma)($a0)
    /* 8E44 80018E44 00FC3126 */  addiu      $s1, $s1, -0x400
    /* 8E48 80018E48 00045226 */  addiu      $s2, $s2, 0x400
    /* 8E4C 80018E4C BF62000C */  jal        WaitEvent
    /* 8E50 80018E50 21987002 */   addu      $s3, $s3, $s0
    /* 8E54 80018E54 E6FF8016 */  bnez       $s4, .L80018DF0
    /* 8E58 80018E58 0104222E */   sltiu     $v0, $s1, 0x401
    /* 8E5C 80018E5C 0300C012 */  beqz       $s6, .L80018E6C
    /* 8E60 80018E60 00000000 */   nop
    /* 8E64 80018E64 0B80013C */  lui        $at, %hi(_spu_transMode)
    /* 8E68 80018E68 685A35AC */  sw         $s5, %lo(_spu_transMode)($at)
  .L80018E6C:
    /* 8E6C 80018E6C 1000A28F */  lw         $v0, 0x10($sp)
    /* 8E70 80018E70 00000000 */  nop
    /* 8E74 80018E74 05004010 */  beqz       $v0, .L80018E8C
    /* 8E78 80018E78 21106002 */   addu      $v0, $s3, $zero
    /* 8E7C 80018E7C 1000A28F */  lw         $v0, 0x10($sp)
    /* 8E80 80018E80 0B80013C */  lui        $at, %hi(_spu_transferCallback)
    /* 8E84 80018E84 845A22AC */  sw         $v0, %lo(_spu_transferCallback)($at)
    /* 8E88 80018E88 21106002 */  addu       $v0, $s3, $zero
  .L80018E8C:
    /* 8E8C 80018E8C 3400BF8F */  lw         $ra, 0x34($sp)
    /* 8E90 80018E90 3000B68F */  lw         $s6, 0x30($sp)
    /* 8E94 80018E94 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 8E98 80018E98 2800B48F */  lw         $s4, 0x28($sp)
    /* 8E9C 80018E9C 2400B38F */  lw         $s3, 0x24($sp)
    /* 8EA0 80018EA0 2000B28F */  lw         $s2, 0x20($sp)
    /* 8EA4 80018EA4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8EA8 80018EA8 1800B08F */  lw         $s0, 0x18($sp)
    /* 8EAC 80018EAC 0800E003 */  jr         $ra
    /* 8EB0 80018EB0 3800BD27 */   addiu     $sp, $sp, 0x38
endlabel SpuWrite0
    /* 8EB4 80018EB4 00000000 */  nop
    /* 8EB8 80018EB8 00000000 */  nop
