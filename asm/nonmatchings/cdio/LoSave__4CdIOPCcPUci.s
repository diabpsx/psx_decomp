.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoSave__4CdIOPCcPUci, 0xD4

glabel LoSave__4CdIOPCcPUci
    /* 76DC0 80086DC0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 76DC4 80086DC4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 76DC8 80086DC8 2188A000 */  addu       $s1, $a1, $zero
    /* 76DCC 80086DCC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 76DD0 80086DD0 2198C000 */  addu       $s3, $a2, $zero
    /* 76DD4 80086DD4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 76DD8 80086DD8 21A0E000 */  addu       $s4, $a3, $zero
    /* 76DDC 80086DDC 21202002 */  addu       $a0, $s1, $zero
    /* 76DE0 80086DE0 01000524 */  addiu      $a1, $zero, 0x1
    /* 76DE4 80086DE4 21300000 */  addu       $a2, $zero, $zero
    /* 76DE8 80086DE8 2400BFAF */  sw         $ra, 0x24($sp)
    /* 76DEC 80086DEC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 76DF0 80086DF0 AB43000C */  jal        PCopen
    /* 76DF4 80086DF4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 76DF8 80086DF8 21804000 */  addu       $s0, $v0, $zero
    /* 76DFC 80086DFC FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 76E00 80086E00 0D001216 */  bne        $s0, $s2, .L80086E38
    /* 76E04 80086E04 21200002 */   addu      $a0, $s0, $zero
    /* 76E08 80086E08 21202002 */  addu       $a0, $s1, $zero
    /* 76E0C 80086E0C C043000C */  jal        PCcreat
    /* 76E10 80086E10 21280000 */   addu      $a1, $zero, $zero
    /* 76E14 80086E14 21804000 */  addu       $s0, $v0, $zero
    /* 76E18 80086E18 06001216 */  bne        $s0, $s2, .L80086E34
    /* 76E1C 80086E1C 00000000 */   nop
    /* 76E20 80086E20 21200000 */  addu       $a0, $zero, $zero
    /* 76E24 80086E24 1180053C */  lui        $a1, %hi(D_80110214)
    /* 76E28 80086E28 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 76E2C 80086E2C A583000C */  jal        DBG_Error
    /* 76E30 80086E30 EB000624 */   addiu     $a2, $zero, 0xEB
  .L80086E34:
    /* 76E34 80086E34 21200002 */  addu       $a0, $s0, $zero
  .L80086E38:
    /* 76E38 80086E38 21286002 */  addu       $a1, $s3, $zero
    /* 76E3C 80086E3C 6144000C */  jal        PCwrite
    /* 76E40 80086E40 21308002 */   addu      $a2, $s4, $zero
    /* 76E44 80086E44 B343000C */  jal        PCclose
    /* 76E48 80086E48 21200002 */   addu      $a0, $s0, $zero
    /* 76E4C 80086E4C FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 76E50 80086E50 07004314 */  bne        $v0, $v1, .L80086E70
    /* 76E54 80086E54 01000224 */   addiu     $v0, $zero, 0x1
    /* 76E58 80086E58 21200000 */  addu       $a0, $zero, $zero
    /* 76E5C 80086E5C 1180053C */  lui        $a1, %hi(D_80110214)
    /* 76E60 80086E60 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 76E64 80086E64 A583000C */  jal        DBG_Error
    /* 76E68 80086E68 F1000624 */   addiu     $a2, $zero, 0xF1
    /* 76E6C 80086E6C 01000224 */  addiu      $v0, $zero, 0x1
  .L80086E70:
    /* 76E70 80086E70 2400BF8F */  lw         $ra, 0x24($sp)
    /* 76E74 80086E74 2000B48F */  lw         $s4, 0x20($sp)
    /* 76E78 80086E78 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 76E7C 80086E7C 1800B28F */  lw         $s2, 0x18($sp)
    /* 76E80 80086E80 1400B18F */  lw         $s1, 0x14($sp)
    /* 76E84 80086E84 1000B08F */  lw         $s0, 0x10($sp)
    /* 76E88 80086E88 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 76E8C 80086E8C 0800E003 */  jr         $ra
    /* 76E90 80086E90 00000000 */   nop
endlabel LoSave__4CdIOPCcPUci
