.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdControl, 0x13C

glabel CdControl
    /* AE58 8001AE58 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* AE5C 8001AE5C 1400B1AF */  sw         $s1, 0x14($sp)
    /* AE60 8001AE60 2188A000 */  addu       $s1, $a1, $zero
    /* AE64 8001AE64 1800B2AF */  sw         $s2, 0x18($sp)
    /* AE68 8001AE68 2190C000 */  addu       $s2, $a2, $zero
    /* AE6C 8001AE6C 2000B4AF */  sw         $s4, 0x20($sp)
    /* AE70 8001AE70 21A08000 */  addu       $s4, $a0, $zero
    /* AE74 8001AE74 1000B0AF */  sw         $s0, 0x10($sp)
    /* AE78 8001AE78 03001024 */  addiu      $s0, $zero, 0x3
    /* AE7C 8001AE7C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* AE80 8001AE80 FF009332 */  andi       $s3, $s4, 0xFF
    /* AE84 8001AE84 0B80033C */  lui        $v1, %hi(D_800B5E6C)
    /* AE88 8001AE88 6C5E6324 */  addiu      $v1, $v1, %lo(D_800B5E6C)
    /* AE8C 8001AE8C 2400B5AF */  sw         $s5, 0x24($sp)
    /* AE90 8001AE90 0B80153C */  lui        $s5, %hi(CD_cbsync)
    /* AE94 8001AE94 F45EB58E */  lw         $s5, %lo(CD_cbsync)($s5)
    /* AE98 8001AE98 80101300 */  sll        $v0, $s3, 2
    /* AE9C 8001AE9C 2800B6AF */  sw         $s6, 0x28($sp)
    /* AEA0 8001AEA0 21B04300 */  addu       $s6, $v0, $v1
    /* AEA4 8001AEA4 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* AEA8 8001AEA8 21B80000 */  addu       $s7, $zero, $zero
    /* AEAC 8001AEAC 3000BEAF */  sw         $fp, 0x30($sp)
    /* AEB0 8001AEB0 FFFF1E24 */  addiu      $fp, $zero, -0x1
    /* AEB4 8001AEB4 3400BFAF */  sw         $ra, 0x34($sp)
  .L8001AEB8:
    /* AEB8 8001AEB8 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* AEBC 8001AEBC F45E20AC */  sw         $zero, %lo(CD_cbsync)($at)
    /* AEC0 8001AEC0 01000824 */  addiu      $t0, $zero, 0x1
    /* AEC4 8001AEC4 0B006812 */  beq        $s3, $t0, .L8001AEF4
    /* AEC8 8001AEC8 00000000 */   nop
    /* AECC 8001AECC 0B80023C */  lui        $v0, %hi(CD_status)
    /* AED0 8001AED0 045F4290 */  lbu        $v0, %lo(CD_status)($v0)
    /* AED4 8001AED4 00000000 */  nop
    /* AED8 8001AED8 10004230 */  andi       $v0, $v0, 0x10
    /* AEDC 8001AEDC 05004010 */  beqz       $v0, .L8001AEF4
    /* AEE0 8001AEE0 01000424 */   addiu     $a0, $zero, 0x1
    /* AEE4 8001AEE4 21280000 */  addu       $a1, $zero, $zero
    /* AEE8 8001AEE8 21300000 */  addu       $a2, $zero, $zero
    /* AEEC 8001AEEC B86F000C */  jal        CD_cw
    /* AEF0 8001AEF0 21380000 */   addu      $a3, $zero, $zero
  .L8001AEF4:
    /* AEF4 8001AEF4 0B002012 */  beqz       $s1, .L8001AF24
    /* AEF8 8001AEF8 00000000 */   nop
    /* AEFC 8001AEFC 0000C28E */  lw         $v0, 0x0($s6)
    /* AF00 8001AF00 00000000 */  nop
    /* AF04 8001AF04 07004010 */  beqz       $v0, .L8001AF24
    /* AF08 8001AF08 02000424 */   addiu     $a0, $zero, 0x2
    /* AF0C 8001AF0C 21282002 */  addu       $a1, $s1, $zero
    /* AF10 8001AF10 21304002 */  addu       $a2, $s2, $zero
    /* AF14 8001AF14 B86F000C */  jal        CD_cw
    /* AF18 8001AF18 21380000 */   addu      $a3, $zero, $zero
    /* AF1C 8001AF1C 0A004014 */  bnez       $v0, .L8001AF48
    /* AF20 8001AF20 00000000 */   nop
  .L8001AF24:
    /* AF24 8001AF24 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* AF28 8001AF28 F45E35AC */  sw         $s5, %lo(CD_cbsync)($at)
    /* AF2C 8001AF2C FF008432 */  andi       $a0, $s4, 0xFF
    /* AF30 8001AF30 21282002 */  addu       $a1, $s1, $zero
    /* AF34 8001AF34 21304002 */  addu       $a2, $s2, $zero
    /* AF38 8001AF38 B86F000C */  jal        CD_cw
    /* AF3C 8001AF3C 21380000 */   addu      $a3, $zero, $zero
    /* AF40 8001AF40 08004010 */  beqz       $v0, .L8001AF64
    /* AF44 8001AF44 0100E226 */   addiu     $v0, $s7, 0x1
  .L8001AF48:
    /* AF48 8001AF48 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* AF4C 8001AF4C DAFF1E16 */  bne        $s0, $fp, .L8001AEB8
    /* AF50 8001AF50 00000000 */   nop
    /* AF54 8001AF54 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* AF58 8001AF58 F45E35AC */  sw         $s5, %lo(CD_cbsync)($at)
    /* AF5C 8001AF5C FFFF1724 */  addiu      $s7, $zero, -0x1
    /* AF60 8001AF60 0100E226 */  addiu      $v0, $s7, 0x1
  .L8001AF64:
    /* AF64 8001AF64 3400BF8F */  lw         $ra, 0x34($sp)
    /* AF68 8001AF68 3000BE8F */  lw         $fp, 0x30($sp)
    /* AF6C 8001AF6C 2C00B78F */  lw         $s7, 0x2C($sp)
    /* AF70 8001AF70 2800B68F */  lw         $s6, 0x28($sp)
    /* AF74 8001AF74 2400B58F */  lw         $s5, 0x24($sp)
    /* AF78 8001AF78 2000B48F */  lw         $s4, 0x20($sp)
    /* AF7C 8001AF7C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* AF80 8001AF80 1800B28F */  lw         $s2, 0x18($sp)
    /* AF84 8001AF84 1400B18F */  lw         $s1, 0x14($sp)
    /* AF88 8001AF88 1000B08F */  lw         $s0, 0x10($sp)
    /* AF8C 8001AF8C 0800E003 */  jr         $ra
    /* AF90 8001AF90 3800BD27 */   addiu     $sp, $sp, 0x38
endlabel CdControl
