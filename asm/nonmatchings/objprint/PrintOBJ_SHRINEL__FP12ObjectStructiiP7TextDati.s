.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_SHRINEL__FP12ObjectStructiiP7TextDati, 0xD8

glabel PrintOBJ_SHRINEL__FP12ObjectStructiiP7TextDati
    /* 6E710 8007E710 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6E714 8007E714 3800B0AF */  sw         $s0, 0x38($sp)
    /* 6E718 8007E718 21808000 */  addu       $s0, $a0, $zero
    /* 6E71C 8007E71C 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6E720 8007E720 2188A000 */  addu       $s1, $a1, $zero
    /* 6E724 8007E724 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6E728 8007E728 2190C000 */  addu       $s2, $a2, $zero
    /* 6E72C 8007E72C 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 6E730 8007E730 4800B4AF */  sw         $s4, 0x48($sp)
    /* 6E734 8007E734 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6E738 8007E738 21000282 */  lb         $v0, 0x21($s0)
    /* 6E73C 8007E73C 00000000 */  nop
    /* 6E740 8007E740 FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 6E744 8007E744 25000292 */  lbu        $v0, 0x25($s0)
    /* 6E748 8007E748 6000B48F */  lw         $s4, 0x60($sp)
    /* 6E74C 8007E74C 15004010 */  beqz       $v0, .L8007E7A4
    /* 6E750 8007E750 2198E000 */   addu      $s3, $a3, $zero
    /* 6E754 8007E754 F4FF2426 */  addiu      $a0, $s1, -0xC
    /* 6E758 8007E758 E4FF4526 */  addiu      $a1, $s2, -0x1C
    /* 6E75C 8007E75C 21300000 */  addu       $a2, $zero, $zero
    /* 6E760 8007E760 50000724 */  addiu      $a3, $zero, 0x50
    /* 6E764 8007E764 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6E768 8007E768 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6E76C 8007E76C C0100300 */  sll        $v0, $v1, 3
    /* 6E770 8007E770 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6E774 8007E774 40000224 */  addiu      $v0, $zero, 0x40
    /* 6E778 8007E778 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6E77C 8007E77C 80100300 */  sll        $v0, $v1, 2
    /* 6E780 8007E780 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6E784 8007E784 01000224 */  addiu      $v0, $zero, 0x1
    /* 6E788 8007E788 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6E78C 8007E78C 08000224 */  addiu      $v0, $zero, 0x8
    /* 6E790 8007E790 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6E794 8007E794 2400B4AF */  sw         $s4, 0x24($sp)
    /* 6E798 8007E798 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6E79C 8007E79C 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 6E7A0 8007E7A0 3000A2AF */   sw        $v0, 0x30($sp)
  .L8007E7A4:
    /* 6E7A4 8007E7A4 21200002 */  addu       $a0, $s0, $zero
    /* 6E7A8 8007E7A8 21282002 */  addu       $a1, $s1, $zero
    /* 6E7AC 8007E7AC 21304002 */  addu       $a2, $s2, $zero
    /* 6E7B0 8007E7B0 21386002 */  addu       $a3, $s3, $zero
    /* 6E7B4 8007E7B4 1000B4AF */  sw         $s4, 0x10($sp)
    /* 6E7B8 8007E7B8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6E7BC 8007E7BC 7AF6010C */  jal        DefaultObjPrint__FP12ObjectStructiiP7TextDatiii
    /* 6E7C0 8007E7C0 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6E7C4 8007E7C4 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 6E7C8 8007E7C8 4800B48F */  lw         $s4, 0x48($sp)
    /* 6E7CC 8007E7CC 4400B38F */  lw         $s3, 0x44($sp)
    /* 6E7D0 8007E7D0 4000B28F */  lw         $s2, 0x40($sp)
    /* 6E7D4 8007E7D4 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6E7D8 8007E7D8 3800B08F */  lw         $s0, 0x38($sp)
    /* 6E7DC 8007E7DC 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6E7E0 8007E7E0 0800E003 */  jr         $ra
    /* 6E7E4 8007E7E4 00000000 */   nop
endlabel PrintOBJ_SHRINEL__FP12ObjectStructiiP7TextDati
