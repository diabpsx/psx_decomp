.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdReadSync, 0xC8

glabel CdReadSync
    /* DBCC 8001DBCC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* DBD0 8001DBD0 1800B2AF */  sw         $s2, 0x18($sp)
    /* DBD4 8001DBD4 21908000 */  addu       $s2, $a0, $zero
    /* DBD8 8001DBD8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* DBDC 8001DBDC 2198A000 */  addu       $s3, $a1, $zero
    /* DBE0 8001DBE0 1400B1AF */  sw         $s1, 0x14($sp)
    /* DBE4 8001DBE4 0B80113C */  lui        $s1, %hi(D_800B623C)
    /* DBE8 8001DBE8 3C623126 */  addiu      $s1, $s1, %lo(D_800B623C)
    /* DBEC 8001DBEC 2000BFAF */  sw         $ra, 0x20($sp)
    /* DBF0 8001DBF0 1000B0AF */  sw         $s0, 0x10($sp)
  .L8001DBF4:
    /* DBF4 8001DBF4 1748000C */  jal        VSync
    /* DBF8 8001DBF8 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* DBFC 8001DBFC 0000238E */  lw         $v1, 0x0($s1)
    /* DC00 8001DC00 00000000 */  nop
    /* DC04 8001DC04 B0046324 */  addiu      $v1, $v1, 0x4B0
    /* DC08 8001DC08 2A186200 */  slt        $v1, $v1, $v0
    /* DC0C 8001DC0C 13006014 */  bnez       $v1, .L8001DC5C
    /* DC10 8001DC10 FFFF1024 */   addiu     $s0, $zero, -0x1
    /* DC14 8001DC14 F8FF228E */  lw         $v0, -0x8($s1)
    /* DC18 8001DC18 00000000 */  nop
    /* DC1C 8001DC1C 09004004 */  bltz       $v0, .L8001DC44
    /* DC20 8001DC20 00000000 */   nop
    /* DC24 8001DC24 1748000C */  jal        VSync
    /* DC28 8001DC28 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* DC2C 8001DC2C FCFF238E */  lw         $v1, -0x4($s1)
    /* DC30 8001DC30 00000000 */  nop
    /* DC34 8001DC34 3C006324 */  addiu      $v1, $v1, 0x3C
    /* DC38 8001DC38 2A186200 */  slt        $v1, $v1, $v0
    /* DC3C 8001DC3C 06006010 */  beqz       $v1, .L8001DC58
    /* DC40 8001DC40 00000000 */   nop
  .L8001DC44:
    /* DC44 8001DC44 1276000C */  jal        func_8001D848
    /* DC48 8001DC48 01000424 */   addiu     $a0, $zero, 0x1
    /* DC4C 8001DC4C E4FF308E */  lw         $s0, -0x1C($s1)
    /* DC50 8001DC50 17770008 */  j          .L8001DC5C
    /* DC54 8001DC54 00000000 */   nop
  .L8001DC58:
    /* DC58 8001DC58 F8FF308E */  lw         $s0, -0x8($s1)
  .L8001DC5C:
    /* DC5C 8001DC5C 03004016 */  bnez       $s2, .L8001DC6C
    /* DC60 8001DC60 01000424 */   addiu     $a0, $zero, 0x1
    /* DC64 8001DC64 E3FF001E */  bgtz       $s0, .L8001DBF4
    /* DC68 8001DC68 00000000 */   nop
  .L8001DC6C:
    /* DC6C 8001DC6C 846B000C */  jal        CdReady
    /* DC70 8001DC70 21286002 */   addu      $a1, $s3, $zero
    /* DC74 8001DC74 21100002 */  addu       $v0, $s0, $zero
    /* DC78 8001DC78 2000BF8F */  lw         $ra, 0x20($sp)
    /* DC7C 8001DC7C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* DC80 8001DC80 1800B28F */  lw         $s2, 0x18($sp)
    /* DC84 8001DC84 1400B18F */  lw         $s1, 0x14($sp)
    /* DC88 8001DC88 1000B08F */  lw         $s0, 0x10($sp)
    /* DC8C 8001DC8C 0800E003 */  jr         $ra
    /* DC90 8001DC90 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel CdReadSync
