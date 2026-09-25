.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoReadFileAtAddr__5DatIOPCcPUci, 0xC0

glabel LoReadFileAtAddr__5DatIOPCcPUci
    /* 76818 80086818 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 7681C 8008681C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 76820 80086820 2190C000 */  addu       $s2, $a2, $zero
    /* 76824 80086824 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 76828 80086828 2198E000 */  addu       $s3, $a3, $zero
    /* 7682C 8008682C 2120A000 */  addu       $a0, $a1, $zero
    /* 76830 80086830 21280000 */  addu       $a1, $zero, $zero
    /* 76834 80086834 2000BFAF */  sw         $ra, 0x20($sp)
    /* 76838 80086838 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7683C 8008683C 0E8D000C */  jal        DDXopen
    /* 76840 80086840 1000B0AF */   sw        $s0, 0x10($sp)
    /* 76844 80086844 21804000 */  addu       $s0, $v0, $zero
    /* 76848 80086848 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 7684C 8008684C 07001116 */  bne        $s0, $s1, .L8008686C
    /* 76850 80086850 21200002 */   addu      $a0, $s0, $zero
    /* 76854 80086854 21200000 */  addu       $a0, $zero, $zero
    /* 76858 80086858 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 7685C 8008685C AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76860 80086860 A583000C */  jal        DBG_Error
    /* 76864 80086864 71000624 */   addiu     $a2, $zero, 0x71
    /* 76868 80086868 21200002 */  addu       $a0, $s0, $zero
  .L8008686C:
    /* 7686C 8008686C 21284002 */  addu       $a1, $s2, $zero
    /* 76870 80086870 488D000C */  jal        DDXread
    /* 76874 80086874 21306002 */   addu      $a2, $s3, $zero
    /* 76878 80086878 05005114 */  bne        $v0, $s1, .L80086890
    /* 7687C 8008687C 21200000 */   addu      $a0, $zero, $zero
    /* 76880 80086880 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76884 80086884 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76888 80086888 A583000C */  jal        DBG_Error
    /* 7688C 8008688C 74000624 */   addiu     $a2, $zero, 0x74
  .L80086890:
    /* 76890 80086890 358D000C */  jal        DDXclose
    /* 76894 80086894 21200002 */   addu      $a0, $s0, $zero
    /* 76898 80086898 07005114 */  bne        $v0, $s1, .L800868B8
    /* 7689C 8008689C 01000224 */   addiu     $v0, $zero, 0x1
    /* 768A0 800868A0 21200000 */  addu       $a0, $zero, $zero
    /* 768A4 800868A4 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 768A8 800868A8 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 768AC 800868AC A583000C */  jal        DBG_Error
    /* 768B0 800868B0 77000624 */   addiu     $a2, $zero, 0x77
    /* 768B4 800868B4 01000224 */  addiu      $v0, $zero, 0x1
  .L800868B8:
    /* 768B8 800868B8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 768BC 800868BC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 768C0 800868C0 1800B28F */  lw         $s2, 0x18($sp)
    /* 768C4 800868C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 768C8 800868C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 768CC 800868CC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 768D0 800868D0 0800E003 */  jr         $ra
    /* 768D4 800868D4 00000000 */   nop
endlabel LoReadFileAtAddr__5DatIOPCcPUci
