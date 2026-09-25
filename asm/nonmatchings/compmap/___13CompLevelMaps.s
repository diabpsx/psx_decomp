.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___13CompLevelMaps, 0x90

glabel ___13CompLevelMaps
    /* 71674 80081674 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 71678 80081678 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7167C 8008167C 21888000 */  addu       $s1, $a0, $zero
    /* 71680 80081680 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 71684 80081684 2198A000 */  addu       $s3, $a1, $zero
    /* 71688 80081688 2000BFAF */  sw         $ra, 0x20($sp)
    /* 7168C 8008168C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 71690 80081690 C105020C */  jal        Init__13CompLevelMaps
    /* 71694 80081694 1000B0AF */   sw        $s0, 0x10($sp)
    /* 71698 80081698 04002226 */  addiu      $v0, $s1, 0x4
    /* 7169C 8008169C 0C004010 */  beqz       $v0, .L800816D0
    /* 716A0 800816A0 00000000 */   nop
    /* 716A4 800816A4 64013026 */  addiu      $s0, $s1, 0x164
    /* 716A8 800816A8 09005010 */  beq        $v0, $s0, .L800816D0
    /* 716AC 800816AC 00000000 */   nop
    /* 716B0 800816B0 21904000 */  addu       $s2, $v0, $zero
    /* 716B4 800816B4 F0FF1026 */  addiu      $s0, $s0, -0x10
  .L800816B8:
    /* 716B8 800816B8 21200002 */  addu       $a0, $s0, $zero
    /* 716BC 800816BC 5808020C */  jal        ___4AMap
    /* 716C0 800816C0 02000524 */   addiu     $a1, $zero, 0x2
    /* 716C4 800816C4 FCFF5016 */  bne        $s2, $s0, .L800816B8
    /* 716C8 800816C8 F0FF1026 */   addiu     $s0, $s0, -0x10
    /* 716CC 800816CC 10001026 */  addiu      $s0, $s0, 0x10
  .L800816D0:
    /* 716D0 800816D0 01006232 */  andi       $v0, $s3, 0x1
    /* 716D4 800816D4 03004010 */  beqz       $v0, .L800816E4
    /* 716D8 800816D8 00000000 */   nop
    /* 716DC 800816DC BE44000C */  jal        __builtin_delete
    /* 716E0 800816E0 21202002 */   addu      $a0, $s1, $zero
  .L800816E4:
    /* 716E4 800816E4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 716E8 800816E8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 716EC 800816EC 1800B28F */  lw         $s2, 0x18($sp)
    /* 716F0 800816F0 1400B18F */  lw         $s1, 0x14($sp)
    /* 716F4 800816F4 1000B08F */  lw         $s0, 0x10($sp)
    /* 716F8 800816F8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 716FC 800816FC 0800E003 */  jr         $ra
    /* 71700 80081700 00000000 */   nop
endlabel ___13CompLevelMaps
