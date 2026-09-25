.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_SHRINER__FP12ObjectStructiiP7TextDati, 0xD8

glabel PrintOBJ_SHRINER__FP12ObjectStructiiP7TextDati
    /* 6E7E8 8007E7E8 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6E7EC 8007E7EC 3800B0AF */  sw         $s0, 0x38($sp)
    /* 6E7F0 8007E7F0 21808000 */  addu       $s0, $a0, $zero
    /* 6E7F4 8007E7F4 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6E7F8 8007E7F8 2188A000 */  addu       $s1, $a1, $zero
    /* 6E7FC 8007E7FC 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6E800 8007E800 2190C000 */  addu       $s2, $a2, $zero
    /* 6E804 8007E804 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 6E808 8007E808 4800B4AF */  sw         $s4, 0x48($sp)
    /* 6E80C 8007E80C 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6E810 8007E810 21000282 */  lb         $v0, 0x21($s0)
    /* 6E814 8007E814 00000000 */  nop
    /* 6E818 8007E818 FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 6E81C 8007E81C 25000292 */  lbu        $v0, 0x25($s0)
    /* 6E820 8007E820 6000B48F */  lw         $s4, 0x60($sp)
    /* 6E824 8007E824 15004010 */  beqz       $v0, .L8007E87C
    /* 6E828 8007E828 2198E000 */   addu      $s3, $a3, $zero
    /* 6E82C 8007E82C 08002426 */  addiu      $a0, $s1, 0x8
    /* 6E830 8007E830 E3FF4526 */  addiu      $a1, $s2, -0x1D
    /* 6E834 8007E834 21300000 */  addu       $a2, $zero, $zero
    /* 6E838 8007E838 50000724 */  addiu      $a3, $zero, 0x50
    /* 6E83C 8007E83C F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6E840 8007E840 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6E844 8007E844 C0100300 */  sll        $v0, $v1, 3
    /* 6E848 8007E848 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6E84C 8007E84C 40000224 */  addiu      $v0, $zero, 0x40
    /* 6E850 8007E850 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6E854 8007E854 80100300 */  sll        $v0, $v1, 2
    /* 6E858 8007E858 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6E85C 8007E85C 01000224 */  addiu      $v0, $zero, 0x1
    /* 6E860 8007E860 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6E864 8007E864 08000224 */  addiu      $v0, $zero, 0x8
    /* 6E868 8007E868 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6E86C 8007E86C 2400B4AF */  sw         $s4, 0x24($sp)
    /* 6E870 8007E870 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6E874 8007E874 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 6E878 8007E878 3000A2AF */   sw        $v0, 0x30($sp)
  .L8007E87C:
    /* 6E87C 8007E87C 21200002 */  addu       $a0, $s0, $zero
    /* 6E880 8007E880 21282002 */  addu       $a1, $s1, $zero
    /* 6E884 8007E884 21304002 */  addu       $a2, $s2, $zero
    /* 6E888 8007E888 21386002 */  addu       $a3, $s3, $zero
    /* 6E88C 8007E88C 1000B4AF */  sw         $s4, 0x10($sp)
    /* 6E890 8007E890 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6E894 8007E894 7AF6010C */  jal        DefaultObjPrint__FP12ObjectStructiiP7TextDatiii
    /* 6E898 8007E898 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6E89C 8007E89C 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 6E8A0 8007E8A0 4800B48F */  lw         $s4, 0x48($sp)
    /* 6E8A4 8007E8A4 4400B38F */  lw         $s3, 0x44($sp)
    /* 6E8A8 8007E8A8 4000B28F */  lw         $s2, 0x40($sp)
    /* 6E8AC 8007E8AC 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6E8B0 8007E8B0 3800B08F */  lw         $s0, 0x38($sp)
    /* 6E8B4 8007E8B4 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6E8B8 8007E8B8 0800E003 */  jr         $ra
    /* 6E8BC 8007E8BC 00000000 */   nop
endlabel PrintOBJ_SHRINER__FP12ObjectStructiiP7TextDati
