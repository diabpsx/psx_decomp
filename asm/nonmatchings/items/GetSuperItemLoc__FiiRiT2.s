.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSuperItemLoc__FiiRiT2, 0xC8

glabel GetSuperItemLoc__FiiRiT2
    /* 309FC 800409FC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 30A00 80040A00 2000B4AF */  sw         $s4, 0x20($sp)
    /* 30A04 80040A04 21A08000 */  addu       $s4, $a0, $zero
    /* 30A08 80040A08 2800B6AF */  sw         $s6, 0x28($sp)
    /* 30A0C 80040A0C 21B0A000 */  addu       $s6, $a1, $zero
    /* 30A10 80040A10 2400B5AF */  sw         $s5, 0x24($sp)
    /* 30A14 80040A14 21A8C000 */  addu       $s5, $a2, $zero
    /* 30A18 80040A18 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 30A1C 80040A1C 2198E000 */  addu       $s3, $a3, $zero
    /* 30A20 80040A20 1400B1AF */  sw         $s1, 0x14($sp)
    /* 30A24 80040A24 01001124 */  addiu      $s1, $zero, 0x1
    /* 30A28 80040A28 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 30A2C 80040A2C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 30A30 80040A30 1000B0AF */  sw         $s0, 0x10($sp)
  .L80040A34:
    /* 30A34 80040A34 3200222A */  slti       $v0, $s1, 0x32
    /* 30A38 80040A38 17004010 */  beqz       $v0, .L80040A98
    /* 30A3C 80040A3C 23901100 */   negu      $s2, $s1
  .L80040A40:
    /* 30A40 80040A40 2A103202 */  slt        $v0, $s1, $s2
    /* 30A44 80040A44 12004014 */  bnez       $v0, .L80040A90
    /* 30A48 80040A48 2110D202 */   addu      $v0, $s6, $s2
    /* 30A4C 80040A4C 000062AE */  sw         $v0, 0x0($s3)
    /* 30A50 80040A50 23801100 */  negu       $s0, $s1
    /* 30A54 80040A54 2A103002 */  slt        $v0, $s1, $s0
    /* 30A58 80040A58 0B004014 */  bnez       $v0, .L80040A88
    /* 30A5C 80040A5C 21209002 */   addu      $a0, $s4, $s0
  .L80040A60:
    /* 30A60 80040A60 0000A4AE */  sw         $a0, 0x0($s5)
    /* 30A64 80040A64 0000658E */  lw         $a1, 0x0($s3)
    /* 30A68 80040A68 0301010C */  jal        ItemSpaceOk__Fii
    /* 30A6C 80040A6C 00000000 */   nop
    /* 30A70 80040A70 FF004230 */  andi       $v0, $v0, 0xFF
    /* 30A74 80040A74 08004014 */  bnez       $v0, .L80040A98
    /* 30A78 80040A78 01001026 */   addiu     $s0, $s0, 0x1
    /* 30A7C 80040A7C 2A103002 */  slt        $v0, $s1, $s0
    /* 30A80 80040A80 F7FF4010 */  beqz       $v0, .L80040A60
    /* 30A84 80040A84 21209002 */   addu      $a0, $s4, $s0
  .L80040A88:
    /* 30A88 80040A88 90020108 */  j          .L80040A40
    /* 30A8C 80040A8C 01005226 */   addiu     $s2, $s2, 0x1
  .L80040A90:
    /* 30A90 80040A90 8D020108 */  j          .L80040A34
    /* 30A94 80040A94 01003126 */   addiu     $s1, $s1, 0x1
  .L80040A98:
    /* 30A98 80040A98 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 30A9C 80040A9C 2800B68F */  lw         $s6, 0x28($sp)
    /* 30AA0 80040AA0 2400B58F */  lw         $s5, 0x24($sp)
    /* 30AA4 80040AA4 2000B48F */  lw         $s4, 0x20($sp)
    /* 30AA8 80040AA8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 30AAC 80040AAC 1800B28F */  lw         $s2, 0x18($sp)
    /* 30AB0 80040AB0 1400B18F */  lw         $s1, 0x14($sp)
    /* 30AB4 80040AB4 1000B08F */  lw         $s0, 0x10($sp)
    /* 30AB8 80040AB8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 30ABC 80040ABC 0800E003 */  jr         $ra
    /* 30AC0 80040AC0 00000000 */   nop
endlabel GetSuperItemLoc__FiiRiT2
