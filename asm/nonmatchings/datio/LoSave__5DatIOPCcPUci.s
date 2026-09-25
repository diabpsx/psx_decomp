.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoSave__5DatIOPCcPUci, 0xA8

glabel LoSave__5DatIOPCcPUci
    /* 7698C 8008698C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 76990 80086990 1400B1AF */  sw         $s1, 0x14($sp)
    /* 76994 80086994 2188C000 */  addu       $s1, $a2, $zero
    /* 76998 80086998 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7699C 8008699C 2190E000 */  addu       $s2, $a3, $zero
    /* 769A0 800869A0 2120A000 */  addu       $a0, $a1, $zero
    /* 769A4 800869A4 21280000 */  addu       $a1, $zero, $zero
    /* 769A8 800869A8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 769AC 800869AC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 769B0 800869B0 E78C000C */  jal        DDXcreate
    /* 769B4 800869B4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 769B8 800869B8 21804000 */  addu       $s0, $v0, $zero
    /* 769BC 800869BC FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 769C0 800869C0 06001316 */  bne        $s0, $s3, .L800869DC
    /* 769C4 800869C4 00000000 */   nop
    /* 769C8 800869C8 21200000 */  addu       $a0, $zero, $zero
    /* 769CC 800869CC 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 769D0 800869D0 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 769D4 800869D4 A583000C */  jal        DBG_Error
    /* 769D8 800869D8 97000624 */   addiu     $a2, $zero, 0x97
  .L800869DC:
    /* 769DC 800869DC 21200002 */  addu       $a0, $s0, $zero
    /* 769E0 800869E0 21282002 */  addu       $a1, $s1, $zero
    /* 769E4 800869E4 708D000C */  jal        DDXwrite
    /* 769E8 800869E8 21304002 */   addu      $a2, $s2, $zero
    /* 769EC 800869EC 358D000C */  jal        DDXclose
    /* 769F0 800869F0 21200002 */   addu      $a0, $s0, $zero
    /* 769F4 800869F4 07005314 */  bne        $v0, $s3, .L80086A14
    /* 769F8 800869F8 01000224 */   addiu     $v0, $zero, 0x1
    /* 769FC 800869FC 21200000 */  addu       $a0, $zero, $zero
    /* 76A00 80086A00 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76A04 80086A04 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76A08 80086A08 A583000C */  jal        DBG_Error
    /* 76A0C 80086A0C 9C000624 */   addiu     $a2, $zero, 0x9C
    /* 76A10 80086A10 01000224 */  addiu      $v0, $zero, 0x1
  .L80086A14:
    /* 76A14 80086A14 2000BF8F */  lw         $ra, 0x20($sp)
    /* 76A18 80086A18 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 76A1C 80086A1C 1800B28F */  lw         $s2, 0x18($sp)
    /* 76A20 80086A20 1400B18F */  lw         $s1, 0x14($sp)
    /* 76A24 80086A24 1000B08F */  lw         $s0, 0x10($sp)
    /* 76A28 80086A28 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 76A2C 80086A2C 0800E003 */  jr         $ra
    /* 76A30 80086A30 00000000 */   nop
endlabel LoSave__5DatIOPCcPUci
