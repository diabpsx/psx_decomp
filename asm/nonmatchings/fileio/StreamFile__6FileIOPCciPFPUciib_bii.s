.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StreamFile__6FileIOPCciPFPUciib_bii, 0xE0

glabel StreamFile__6FileIOPCciPFPUciib_bii
    /* 75B14 80085B14 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 75B18 80085B18 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 75B1C 80085B1C 21888000 */  addu       $s1, $a0, $zero
    /* 75B20 80085B20 1800B0AF */  sw         $s0, 0x18($sp)
    /* 75B24 80085B24 4C00B08F */  lw         $s0, 0x4C($sp)
    /* 75B28 80085B28 2400B3AF */  sw         $s3, 0x24($sp)
    /* 75B2C 80085B2C 2198C000 */  addu       $s3, $a2, $zero
    /* 75B30 80085B30 2000B2AF */  sw         $s2, 0x20($sp)
    /* 75B34 80085B34 0B80123C */  lui        $s2, %hi(_6FileIO_FileToLoad)
    /* 75B38 80085B38 70795226 */  addiu      $s2, $s2, %lo(_6FileIO_FileToLoad)
    /* 75B3C 80085B3C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 75B40 80085B40 4800B58F */  lw         $s5, 0x48($sp)
    /* 75B44 80085B44 21304002 */  addu       $a2, $s2, $zero
    /* 75B48 80085B48 2800B4AF */  sw         $s4, 0x28($sp)
    /* 75B4C 80085B4C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 75B50 80085B50 7E17020C */  jal        FindFile__6FileIOPCcPc
    /* 75B54 80085B54 21A0E000 */   addu      $s4, $a3, $zero
    /* 75B58 80085B58 07004014 */  bnez       $v0, .L80085B78
    /* 75B5C 80085B5C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 75B60 80085B60 21200000 */  addu       $a0, $zero, $zero
    /* 75B64 80085B64 1180053C */  lui        $a1, %hi(D_801100E0)
    /* 75B68 80085B68 E000A524 */  addiu      $a1, $a1, %lo(D_801100E0)
    /* 75B6C 80085B6C A583000C */  jal        DBG_Error
    /* 75B70 80085B70 91000624 */   addiu     $a2, $zero, 0x91
    /* 75B74 80085B74 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80085B78:
    /* 75B78 80085B78 0A000216 */  bne        $s0, $v0, .L80085BA4
    /* 75B7C 80085B7C 21284002 */   addu      $a1, $s2, $zero
    /* 75B80 80085B80 1000228E */  lw         $v0, 0x10($s1)
    /* 75B84 80085B84 00000000 */  nop
    /* 75B88 80085B88 20004484 */  lh         $a0, 0x20($v0)
    /* 75B8C 80085B8C 2400428C */  lw         $v0, 0x24($v0)
    /* 75B90 80085B90 00000000 */  nop
    /* 75B94 80085B94 09F84000 */  jalr       $v0
    /* 75B98 80085B98 21202402 */   addu      $a0, $s1, $a0
    /* 75B9C 80085B9C 21804000 */  addu       $s0, $v0, $zero
    /* 75BA0 80085BA0 21284002 */  addu       $a1, $s2, $zero
  .L80085BA4:
    /* 75BA4 80085BA4 21306002 */  addu       $a2, $s3, $zero
    /* 75BA8 80085BA8 1000228E */  lw         $v0, 0x10($s1)
    /* 75BAC 80085BAC 21388002 */  addu       $a3, $s4, $zero
    /* 75BB0 80085BB0 1000B5AF */  sw         $s5, 0x10($sp)
    /* 75BB4 80085BB4 1400B0AF */  sw         $s0, 0x14($sp)
    /* 75BB8 80085BB8 30004484 */  lh         $a0, 0x30($v0)
    /* 75BBC 80085BBC 3400428C */  lw         $v0, 0x34($v0)
    /* 75BC0 80085BC0 00000000 */  nop
    /* 75BC4 80085BC4 09F84000 */  jalr       $v0
    /* 75BC8 80085BC8 21202402 */   addu      $a0, $s1, $a0
    /* 75BCC 80085BCC 3000BF8F */  lw         $ra, 0x30($sp)
    /* 75BD0 80085BD0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 75BD4 80085BD4 2800B48F */  lw         $s4, 0x28($sp)
    /* 75BD8 80085BD8 2400B38F */  lw         $s3, 0x24($sp)
    /* 75BDC 80085BDC 2000B28F */  lw         $s2, 0x20($sp)
    /* 75BE0 80085BE0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 75BE4 80085BE4 1800B08F */  lw         $s0, 0x18($sp)
    /* 75BE8 80085BE8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 75BEC 80085BEC 0800E003 */  jr         $ra
    /* 75BF0 80085BF0 00000000 */   nop
endlabel StreamFile__6FileIOPCciPFPUciib_bii
