.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReadAtAddr__6FileIOPCcPUci, 0xC4

glabel ReadAtAddr__6FileIOPCcPUci
    /* 75BF4 80085BF4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 75BF8 80085BF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75BFC 80085BFC 21808000 */  addu       $s0, $a0, $zero
    /* 75C00 80085C00 1400B1AF */  sw         $s1, 0x14($sp)
    /* 75C04 80085C04 2188E000 */  addu       $s1, $a3, $zero
    /* 75C08 80085C08 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 75C0C 80085C0C 2198C000 */  addu       $s3, $a2, $zero
    /* 75C10 80085C10 1800B2AF */  sw         $s2, 0x18($sp)
    /* 75C14 80085C14 0B80123C */  lui        $s2, %hi(_6FileIO_FileToLoad)
    /* 75C18 80085C18 70795226 */  addiu      $s2, $s2, %lo(_6FileIO_FileToLoad)
    /* 75C1C 80085C1C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 75C20 80085C20 7E17020C */  jal        FindFile__6FileIOPCcPc
    /* 75C24 80085C24 21304002 */   addu      $a2, $s2, $zero
    /* 75C28 80085C28 07004014 */  bnez       $v0, .L80085C48
    /* 75C2C 80085C2C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 75C30 80085C30 21200000 */  addu       $a0, $zero, $zero
    /* 75C34 80085C34 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 75C38 80085C38 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 75C3C 80085C3C A583000C */  jal        DBG_Error
    /* 75C40 80085C40 A4000624 */   addiu     $a2, $zero, 0xA4
    /* 75C44 80085C44 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80085C48:
    /* 75C48 80085C48 0A002216 */  bne        $s1, $v0, .L80085C74
    /* 75C4C 80085C4C 21284002 */   addu      $a1, $s2, $zero
    /* 75C50 80085C50 1000028E */  lw         $v0, 0x10($s0)
    /* 75C54 80085C54 00000000 */  nop
    /* 75C58 80085C58 20004484 */  lh         $a0, 0x20($v0)
    /* 75C5C 80085C5C 2400428C */  lw         $v0, 0x24($v0)
    /* 75C60 80085C60 00000000 */  nop
    /* 75C64 80085C64 09F84000 */  jalr       $v0
    /* 75C68 80085C68 21200402 */   addu      $a0, $s0, $a0
    /* 75C6C 80085C6C 21884000 */  addu       $s1, $v0, $zero
    /* 75C70 80085C70 21284002 */  addu       $a1, $s2, $zero
  .L80085C74:
    /* 75C74 80085C74 21306002 */  addu       $a2, $s3, $zero
    /* 75C78 80085C78 1000028E */  lw         $v0, 0x10($s0)
    /* 75C7C 80085C7C 21382002 */  addu       $a3, $s1, $zero
    /* 75C80 80085C80 18004484 */  lh         $a0, 0x18($v0)
    /* 75C84 80085C84 1C00428C */  lw         $v0, 0x1C($v0)
    /* 75C88 80085C88 00000000 */  nop
    /* 75C8C 80085C8C 09F84000 */  jalr       $v0
    /* 75C90 80085C90 21200402 */   addu      $a0, $s0, $a0
    /* 75C94 80085C94 01000224 */  addiu      $v0, $zero, 0x1
    /* 75C98 80085C98 2000BF8F */  lw         $ra, 0x20($sp)
    /* 75C9C 80085C9C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 75CA0 80085CA0 1800B28F */  lw         $s2, 0x18($sp)
    /* 75CA4 80085CA4 1400B18F */  lw         $s1, 0x14($sp)
    /* 75CA8 80085CA8 1000B08F */  lw         $s0, 0x10($sp)
    /* 75CAC 80085CAC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 75CB0 80085CB0 0800E003 */  jr         $ra
    /* 75CB4 80085CB4 00000000 */   nop
endlabel ReadAtAddr__6FileIOPCcPUci
