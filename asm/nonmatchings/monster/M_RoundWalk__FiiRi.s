.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_RoundWalk__FiiRi, 0x14C

glabel M_RoundWalk__FiiRi
    /* 15E44 8014FA3C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 15E48 8014FA40 1800B2AF */  sw         $s2, 0x18($sp)
    /* 15E4C 8014FA44 21908000 */  addu       $s2, $a0, $zero
    /* 15E50 8014FA48 2000B4AF */  sw         $s4, 0x20($sp)
    /* 15E54 8014FA4C 21A0C000 */  addu       $s4, $a2, $zero
    /* 15E58 8014FA50 2400BFAF */  sw         $ra, 0x24($sp)
    /* 15E5C 8014FA54 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 15E60 8014FA58 1400B1AF */  sw         $s1, 0x14($sp)
    /* 15E64 8014FA5C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 15E68 8014FA60 0000828E */  lw         $v0, 0x0($s4)
    /* 15E6C 8014FA64 00000000 */  nop
    /* 15E70 8014FA68 05004010 */  beqz       $v0, .L8014FA80
    /* 15E74 8014FA6C 2180A000 */   addu      $s0, $a1, $zero
    /* 15E78 8014FA70 FFFF0226 */  addiu      $v0, $s0, -0x1
    /* 15E7C 8014FA74 07004230 */  andi       $v0, $v0, 0x7
    /* 15E80 8014FA78 A33E0508 */  j          .L8014FA8C
    /* 15E84 8014FA7C FFFF4224 */   addiu     $v0, $v0, -0x1
  .L8014FA80:
    /* 15E88 8014FA80 01000226 */  addiu      $v0, $s0, 0x1
    /* 15E8C 8014FA84 07004230 */  andi       $v0, $v0, 0x7
    /* 15E90 8014FA88 01004224 */  addiu      $v0, $v0, 0x1
  .L8014FA8C:
    /* 15E94 8014FA8C 07005030 */  andi       $s0, $v0, 0x7
    /* 15E98 8014FA90 21204002 */  addu       $a0, $s2, $zero
    /* 15E9C 8014FA94 21980002 */  addu       $s3, $s0, $zero
    /* 15EA0 8014FA98 EB53050C */  jal        DirOK__Fii
    /* 15EA4 8014FA9C 21286002 */   addu      $a1, $s3, $zero
    /* 15EA8 8014FAA0 21884000 */  addu       $s1, $v0, $zero
    /* 15EAC 8014FAA4 FF002232 */  andi       $v0, $s1, 0xFF
    /* 15EB0 8014FAA8 22004014 */  bnez       $v0, .L8014FB34
    /* 15EB4 8014FAAC 21204002 */   addu      $a0, $s2, $zero
    /* 15EB8 8014FAB0 0000828E */  lw         $v0, 0x0($s4)
    /* 15EBC 8014FAB4 00000000 */  nop
    /* 15EC0 8014FAB8 0B004010 */  beqz       $v0, .L8014FAE8
    /* 15EC4 8014FABC 21880000 */   addu      $s1, $zero, $zero
    /* 15EC8 8014FAC0 01006226 */  addiu      $v0, $s3, 0x1
    /* 15ECC 8014FAC4 07005030 */  andi       $s0, $v0, 0x7
    /* 15ED0 8014FAC8 21204002 */  addu       $a0, $s2, $zero
    /* 15ED4 8014FACC EB53050C */  jal        DirOK__Fii
    /* 15ED8 8014FAD0 21280002 */   addu      $a1, $s0, $zero
    /* 15EDC 8014FAD4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 15EE0 8014FAD8 12004014 */  bnez       $v0, .L8014FB24
    /* 15EE4 8014FADC 01000226 */   addiu     $v0, $s0, 0x1
    /* 15EE8 8014FAE0 C33E0508 */  j          .L8014FB0C
    /* 15EEC 8014FAE4 07005030 */   andi      $s0, $v0, 0x7
  .L8014FAE8:
    /* 15EF0 8014FAE8 FFFF6226 */  addiu      $v0, $s3, -0x1
    /* 15EF4 8014FAEC 07005030 */  andi       $s0, $v0, 0x7
    /* 15EF8 8014FAF0 21204002 */  addu       $a0, $s2, $zero
    /* 15EFC 8014FAF4 EB53050C */  jal        DirOK__Fii
    /* 15F00 8014FAF8 21280002 */   addu      $a1, $s0, $zero
    /* 15F04 8014FAFC FF004230 */  andi       $v0, $v0, 0xFF
    /* 15F08 8014FB00 08004014 */  bnez       $v0, .L8014FB24
    /* 15F0C 8014FB04 FFFF0226 */   addiu     $v0, $s0, -0x1
    /* 15F10 8014FB08 07005030 */  andi       $s0, $v0, 0x7
  .L8014FB0C:
    /* 15F14 8014FB0C 21204002 */  addu       $a0, $s2, $zero
    /* 15F18 8014FB10 EB53050C */  jal        DirOK__Fii
    /* 15F1C 8014FB14 21280002 */   addu      $a1, $s0, $zero
    /* 15F20 8014FB18 FF004230 */  andi       $v0, $v0, 0xFF
    /* 15F24 8014FB1C 03004010 */  beqz       $v0, .L8014FB2C
    /* 15F28 8014FB20 FF002232 */   andi      $v0, $s1, 0xFF
  .L8014FB24:
    /* 15F2C 8014FB24 01001124 */  addiu      $s1, $zero, 0x1
    /* 15F30 8014FB28 FF002232 */  andi       $v0, $s1, 0xFF
  .L8014FB2C:
    /* 15F34 8014FB2C 05004010 */  beqz       $v0, .L8014FB44
    /* 15F38 8014FB30 21204002 */   addu      $a0, $s2, $zero
  .L8014FB34:
    /* 15F3C 8014FB34 433C050C */  jal        M_WalkDir__Fii
    /* 15F40 8014FB38 21280002 */   addu      $a1, $s0, $zero
    /* 15F44 8014FB3C D93E0508 */  j          .L8014FB64
    /* 15F48 8014FB40 FF002232 */   andi      $v0, $s1, 0xFF
  .L8014FB44:
    /* 15F4C 8014FB44 04006526 */  addiu      $a1, $s3, 0x4
    /* 15F50 8014FB48 0000828E */  lw         $v0, 0x0($s4)
    /* 15F54 8014FB4C 0700A530 */  andi       $a1, $a1, 0x7
    /* 15F58 8014FB50 0100422C */  sltiu      $v0, $v0, 0x1
    /* 15F5C 8014FB54 D43D050C */  jal        M_CallWalk__Fii
    /* 15F60 8014FB58 000082AE */   sw        $v0, 0x0($s4)
    /* 15F64 8014FB5C 21884000 */  addu       $s1, $v0, $zero
    /* 15F68 8014FB60 FF002232 */  andi       $v0, $s1, 0xFF
  .L8014FB64:
    /* 15F6C 8014FB64 2400BF8F */  lw         $ra, 0x24($sp)
    /* 15F70 8014FB68 2000B48F */  lw         $s4, 0x20($sp)
    /* 15F74 8014FB6C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 15F78 8014FB70 1800B28F */  lw         $s2, 0x18($sp)
    /* 15F7C 8014FB74 1400B18F */  lw         $s1, 0x14($sp)
    /* 15F80 8014FB78 1000B08F */  lw         $s0, 0x10($sp)
    /* 15F84 8014FB7C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 15F88 8014FB80 0800E003 */  jr         $ra
    /* 15F8C 8014FB84 00000000 */   nop
endlabel M_RoundWalk__FiiRi
