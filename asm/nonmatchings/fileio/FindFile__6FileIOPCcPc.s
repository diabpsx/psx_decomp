.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindFile__6FileIOPCcPc, 0x114

glabel FindFile__6FileIOPCcPc
    /* 75DF8 80085DF8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 75DFC 80085DFC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75E00 80085E00 21808000 */  addu       $s0, $a0, $zero
    /* 75E04 80085E04 2000B4AF */  sw         $s4, 0x20($sp)
    /* 75E08 80085E08 21A0A000 */  addu       $s4, $a1, $zero
    /* 75E0C 80085E0C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 75E10 80085E10 2188C000 */  addu       $s1, $a2, $zero
    /* 75E14 80085E14 21202002 */  addu       $a0, $s1, $zero
    /* 75E18 80085E18 2400BFAF */  sw         $ra, 0x24($sp)
    /* 75E1C 80085E1C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 75E20 80085E20 F240000C */  jal        strcpy
    /* 75E24 80085E24 1800B2AF */   sw        $s2, 0x18($sp)
    /* 75E28 80085E28 1D21020C */  jal        strupr__FPc
    /* 75E2C 80085E2C 21202002 */   addu      $a0, $s1, $zero
    /* 75E30 80085E30 1000028E */  lw         $v0, 0x10($s0)
    /* 75E34 80085E34 21282002 */  addu       $a1, $s1, $zero
    /* 75E38 80085E38 10004484 */  lh         $a0, 0x10($v0)
    /* 75E3C 80085E3C 1400428C */  lw         $v0, 0x14($v0)
    /* 75E40 80085E40 00000000 */  nop
    /* 75E44 80085E44 09F84000 */  jalr       $v0
    /* 75E48 80085E48 21200402 */   addu      $a0, $s0, $a0
    /* 75E4C 80085E4C 26004014 */  bnez       $v0, .L80085EE8
    /* 75E50 80085E50 01000224 */   addiu     $v0, $zero, 0x1
    /* 75E54 80085E54 21980000 */  addu       $s3, $zero, $zero
    /* 75E58 80085E58 1918020C */  jal        SearchPathExists__6FileIO
    /* 75E5C 80085E5C 21200002 */   addu      $a0, $s0, $zero
    /* 75E60 80085E60 21004010 */  beqz       $v0, .L80085EE8
    /* 75E64 80085E64 21106002 */   addu      $v0, $s3, $zero
    /* 75E68 80085E68 ED17020C */  jal        LockSearchPath__6FileIO
    /* 75E6C 80085E6C 21200002 */   addu      $a0, $s0, $zero
    /* 75E70 80085E70 0C00128E */  lw         $s2, 0xC($s0)
    /* 75E74 80085E74 21200002 */  addu       $a0, $s0, $zero
  .L80085E78:
    /* 75E78 80085E78 21282002 */  addu       $a1, $s1, $zero
    /* 75E7C 80085E7C C317020C */  jal        CopyPathItem__6FileIOPcPCc
    /* 75E80 80085E80 21304002 */   addu      $a2, $s2, $zero
    /* 75E84 80085E84 21904000 */  addu       $s2, $v0, $zero
    /* 75E88 80085E88 14004012 */  beqz       $s2, .L80085EDC
    /* 75E8C 80085E8C 00000000 */   nop
    /* 75E90 80085E90 1280053C */  lui        $a1, %hi(D_8011AB38)
    /* 75E94 80085E94 38ABA524 */  addiu      $a1, $a1, %lo(D_8011AB38)
    /* 75E98 80085E98 FC40000C */  jal        strcat
    /* 75E9C 80085E9C 21202002 */   addu      $a0, $s1, $zero
    /* 75EA0 80085EA0 21202002 */  addu       $a0, $s1, $zero
    /* 75EA4 80085EA4 FC40000C */  jal        strcat
    /* 75EA8 80085EA8 21288002 */   addu      $a1, $s4, $zero
    /* 75EAC 80085EAC 1000028E */  lw         $v0, 0x10($s0)
    /* 75EB0 80085EB0 21282002 */  addu       $a1, $s1, $zero
    /* 75EB4 80085EB4 10004484 */  lh         $a0, 0x10($v0)
    /* 75EB8 80085EB8 1400428C */  lw         $v0, 0x14($v0)
    /* 75EBC 80085EBC 00000000 */  nop
    /* 75EC0 80085EC0 09F84000 */  jalr       $v0
    /* 75EC4 80085EC4 21200402 */   addu      $a0, $s0, $a0
    /* 75EC8 80085EC8 02004010 */  beqz       $v0, .L80085ED4
    /* 75ECC 80085ECC 00000000 */   nop
    /* 75ED0 80085ED0 01001324 */  addiu      $s3, $zero, 0x1
  .L80085ED4:
    /* 75ED4 80085ED4 E8FF6012 */  beqz       $s3, .L80085E78
    /* 75ED8 80085ED8 21200002 */   addu      $a0, $s0, $zero
  .L80085EDC:
    /* 75EDC 80085EDC 0318020C */  jal        UnlockSearchPath__6FileIO
    /* 75EE0 80085EE0 21200002 */   addu      $a0, $s0, $zero
    /* 75EE4 80085EE4 21106002 */  addu       $v0, $s3, $zero
  .L80085EE8:
    /* 75EE8 80085EE8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 75EEC 80085EEC 2000B48F */  lw         $s4, 0x20($sp)
    /* 75EF0 80085EF0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 75EF4 80085EF4 1800B28F */  lw         $s2, 0x18($sp)
    /* 75EF8 80085EF8 1400B18F */  lw         $s1, 0x14($sp)
    /* 75EFC 80085EFC 1000B08F */  lw         $s0, 0x10($sp)
    /* 75F00 80085F00 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 75F04 80085F04 0800E003 */  jr         $ra
    /* 75F08 80085F08 00000000 */   nop
endlabel FindFile__6FileIOPCcPc
