.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_AllocAt, 0xDC

glabel GAL_AllocAt
    /* 11DA8 80021DA8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 11DAC 80021DAC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 11DB0 80021DB0 21988000 */  addu       $s3, $a0, $zero
    /* 11DB4 80021DB4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 11DB8 80021DB8 2190A000 */  addu       $s2, $a1, $zero
    /* 11DBC 80021DBC FFFF043C */  lui        $a0, (0xFFFF7FFF >> 16)
    /* 11DC0 80021DC0 FF7F8434 */  ori        $a0, $a0, (0xFFFF7FFF & 0xFFFF)
    /* 11DC4 80021DC4 2420C400 */  and        $a0, $a2, $a0
    /* 11DC8 80021DC8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 11DCC 80021DCC 21A0E000 */  addu       $s4, $a3, $zero
    /* 11DD0 80021DD0 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 11DD4 80021DD4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 11DD8 80021DD8 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 11DDC 80021DDC 1800B0AF */   sw        $s0, 0x18($sp)
    /* 11DE0 80021DE0 21884000 */  addu       $s1, $v0, $zero
    /* 11DE4 80021DE4 05002016 */  bnez       $s1, .L80021DFC
    /* 11DE8 80021DE8 00000000 */   nop
    /* 11DEC 80021DEC 0389000C */  jal        GSetError
    /* 11DF0 80021DF0 04000434 */   ori       $a0, $zero, 0x4
    /* 11DF4 80021DF4 98870008 */  j          .L80021E60
    /* 11DF8 80021DF8 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80021DFC:
    /* 11DFC 80021DFC 10002596 */  lhu        $a1, 0x10($s1)
    /* 11E00 80021E00 C486000C */  jal        AlignPtr
    /* 11E04 80021E04 21204002 */   addu      $a0, $s2, $zero
    /* 11E08 80021E08 21904000 */  addu       $s2, $v0, $zero
    /* 11E0C 80021E0C 10002596 */  lhu        $a1, 0x10($s1)
    /* 11E10 80021E10 D086000C */  jal        AlignSize
    /* 11E14 80021E14 21206002 */   addu      $a0, $s3, $zero
    /* 11E18 80021E18 21284002 */  addu       $a1, $s2, $zero
    /* 11E1C 80021E1C 2000248E */  lw         $a0, 0x20($s1)
    /* 11E20 80021E20 0788000C */  jal        FindBlockInTheseBounds
    /* 11E24 80021E24 21304000 */   addu      $a2, $v0, $zero
    /* 11E28 80021E28 21804000 */  addu       $s0, $v0, $zero
    /* 11E2C 80021E2C 0B000012 */  beqz       $s0, .L80021E5C
    /* 11E30 80021E30 20002426 */   addiu     $a0, $s1, 0x20
    /* 11E34 80021E34 A386000C */  jal        DetachHdrFromList
    /* 11E38 80021E38 21280002 */   addu      $a1, $s0, $zero
    /* 11E3C 80021E3C 1000B4AF */  sw         $s4, 0x10($sp)
    /* 11E40 80021E40 21202002 */  addu       $a0, $s1, $zero
    /* 11E44 80021E44 21280002 */  addu       $a1, $s0, $zero
    /* 11E48 80021E48 21304002 */  addu       $a2, $s2, $zero
    /* 11E4C 80021E4C A187000C */  jal        LoAlloc
    /* 11E50 80021E50 21386002 */   addu      $a3, $s3, $zero
    /* 11E54 80021E54 98870008 */  j          .L80021E60
    /* 11E58 80021E58 00000000 */   nop
  .L80021E5C:
    /* 11E5C 80021E5C FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80021E60:
    /* 11E60 80021E60 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 11E64 80021E64 2800B48F */  lw         $s4, 0x28($sp)
    /* 11E68 80021E68 2400B38F */  lw         $s3, 0x24($sp)
    /* 11E6C 80021E6C 2000B28F */  lw         $s2, 0x20($sp)
    /* 11E70 80021E70 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 11E74 80021E74 1800B08F */  lw         $s0, 0x18($sp)
    /* 11E78 80021E78 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 11E7C 80021E7C 0800E003 */  jr         $ra
    /* 11E80 80021E80 00000000 */   nop
endlabel GAL_AllocAt
