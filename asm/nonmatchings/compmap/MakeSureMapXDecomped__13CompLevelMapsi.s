.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeSureMapXDecomped__13CompLevelMapsi, 0xAC

glabel MakeSureMapXDecomped__13CompLevelMapsi
    /* 719FC 800819FC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 71A00 80081A00 1800B2AF */  sw         $s2, 0x18($sp)
    /* 71A04 80081A04 21908000 */  addu       $s2, $a0, $zero
    /* 71A08 80081A08 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 71A0C 80081A0C 2198A000 */  addu       $s3, $a1, $zero
    /* 71A10 80081A10 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71A14 80081A14 21880000 */  addu       $s1, $zero, $zero
    /* 71A18 80081A18 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71A1C 80081A1C 04005026 */  addiu      $s0, $s2, 0x4
    /* 71A20 80081A20 2000BFAF */  sw         $ra, 0x20($sp)
  .L80081A24:
    /* 71A24 80081A24 1600222A */  slti       $v0, $s1, 0x16
    /* 71A28 80081A28 0E004010 */  beqz       $v0, .L80081A64
    /* 71A2C 80081A2C 04004326 */   addiu     $v1, $s2, 0x4
    /* 71A30 80081A30 09003312 */  beq        $s1, $s3, .L80081A58
    /* 71A34 80081A34 00000000 */   nop
    /* 71A38 80081A38 5508020C */  jal        IsCompressed__4AMap
    /* 71A3C 80081A3C 21200002 */   addu      $a0, $s0, $zero
    /* 71A40 80081A40 01004238 */  xori       $v0, $v0, 0x1
    /* 71A44 80081A44 04004010 */  beqz       $v0, .L80081A58
    /* 71A48 80081A48 00000000 */   nop
    /* 71A4C 80081A4C 0000458E */  lw         $a1, 0x0($s2)
    /* 71A50 80081A50 8A07020C */  jal        CompressMap__4AMapRC9CompClass
    /* 71A54 80081A54 21200002 */   addu      $a0, $s0, $zero
  .L80081A58:
    /* 71A58 80081A58 10001026 */  addiu      $s0, $s0, 0x10
    /* 71A5C 80081A5C 89060208 */  j          .L80081A24
    /* 71A60 80081A60 01003126 */   addiu     $s1, $s1, 0x1
  .L80081A64:
    /* 71A64 80081A64 00111300 */  sll        $v0, $s3, 4
    /* 71A68 80081A68 21806200 */  addu       $s0, $v1, $v0
    /* 71A6C 80081A6C 5508020C */  jal        IsCompressed__4AMap
    /* 71A70 80081A70 21200002 */   addu      $a0, $s0, $zero
    /* 71A74 80081A74 04004010 */  beqz       $v0, .L80081A88
    /* 71A78 80081A78 00000000 */   nop
    /* 71A7C 80081A7C 0000458E */  lw         $a1, 0x0($s2)
    /* 71A80 80081A80 FB07020C */  jal        DecompressMap__4AMapRC9CompClass
    /* 71A84 80081A84 21200002 */   addu      $a0, $s0, $zero
  .L80081A88:
    /* 71A88 80081A88 2000BF8F */  lw         $ra, 0x20($sp)
    /* 71A8C 80081A8C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 71A90 80081A90 1800B28F */  lw         $s2, 0x18($sp)
    /* 71A94 80081A94 1400B18F */  lw         $s1, 0x14($sp)
    /* 71A98 80081A98 1000B08F */  lw         $s0, 0x10($sp)
    /* 71A9C 80081A9C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 71AA0 80081AA0 0800E003 */  jr         $ra
    /* 71AA4 80081AA4 00000000 */   nop
endlabel MakeSureMapXDecomped__13CompLevelMapsi
