.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostAddL2Objs__Fiiii, 0xFC

glabel PostAddL2Objs__Fiiii
    /* 47628 80057628 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 4762C 8005762C 3000BEAF */  sw         $fp, 0x30($sp)
    /* 47630 80057630 21F08000 */  addu       $fp, $a0, $zero
    /* 47634 80057634 1800B2AF */  sw         $s2, 0x18($sp)
    /* 47638 80057638 2190A000 */  addu       $s2, $a1, $zero
    /* 4763C 8005763C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 47640 80057640 2198C000 */  addu       $s3, $a2, $zero
    /* 47644 80057644 2000B4AF */  sw         $s4, 0x20($sp)
    /* 47648 80057648 21A0E000 */  addu       $s4, $a3, $zero
    /* 4764C 8005764C 2A105402 */  slt        $v0, $s2, $s4
    /* 47650 80057650 3400BFAF */  sw         $ra, 0x34($sp)
    /* 47654 80057654 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 47658 80057658 2800B6AF */  sw         $s6, 0x28($sp)
    /* 4765C 8005765C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 47660 80057660 1400B1AF */  sw         $s1, 0x14($sp)
    /* 47664 80057664 22004010 */  beqz       $v0, .L800576F0
    /* 47668 80057668 1000B0AF */   sw        $s0, 0x10($sp)
    /* 4766C 8005766C 0D001724 */  addiu      $s7, $zero, 0xD
    /* 47670 80057670 1D021624 */  addiu      $s6, $zero, 0x21D
    /* 47674 80057674 11001524 */  addiu      $s5, $zero, 0x11
    /* 47678 80057678 2188C003 */  addu       $s1, $fp, $zero
  .L8005767C:
    /* 4767C 8005767C 2A103302 */  slt        $v0, $s1, $s3
    /* 47680 80057680 17004010 */  beqz       $v0, .L800576E0
    /* 47684 80057684 21202002 */   addu      $a0, $s1, $zero
  .L80057688:
    /* 47688 80057688 80D4010C */  jal        FindBlock__Fii
    /* 4768C 8005768C 21284002 */   addu      $a1, $s2, $zero
    /* 47690 80057690 21804000 */  addu       $s0, $v0, $zero
    /* 47694 80057694 03001712 */  beq        $s0, $s7, .L800576A4
    /* 47698 80057698 2A000424 */   addiu     $a0, $zero, 0x2A
    /* 4769C 8005769C 04001616 */  bne        $s0, $s6, .L800576B0
    /* 476A0 800576A0 00000000 */   nop
  .L800576A4:
    /* 476A4 800576A4 21282002 */  addu       $a1, $s1, $zero
    /* 476A8 800576A8 024F010C */  jal        PostAddObject__Fiii
    /* 476AC 800576AC 21304002 */   addu      $a2, $s2, $zero
  .L800576B0:
    /* 476B0 800576B0 03001512 */  beq        $s0, $s5, .L800576C0
    /* 476B4 800576B4 1E020224 */   addiu     $v0, $zero, 0x21E
    /* 476B8 800576B8 05000216 */  bne        $s0, $v0, .L800576D0
    /* 476BC 800576BC 00000000 */   nop
  .L800576C0:
    /* 476C0 800576C0 2B000424 */  addiu      $a0, $zero, 0x2B
    /* 476C4 800576C4 21282002 */  addu       $a1, $s1, $zero
    /* 476C8 800576C8 024F010C */  jal        PostAddObject__Fiii
    /* 476CC 800576CC 21304002 */   addu      $a2, $s2, $zero
  .L800576D0:
    /* 476D0 800576D0 01003126 */  addiu      $s1, $s1, 0x1
    /* 476D4 800576D4 2A103302 */  slt        $v0, $s1, $s3
    /* 476D8 800576D8 EBFF4014 */  bnez       $v0, .L80057688
    /* 476DC 800576DC 21202002 */   addu      $a0, $s1, $zero
  .L800576E0:
    /* 476E0 800576E0 01005226 */  addiu      $s2, $s2, 0x1
    /* 476E4 800576E4 2A105402 */  slt        $v0, $s2, $s4
    /* 476E8 800576E8 E4FF4014 */  bnez       $v0, .L8005767C
    /* 476EC 800576EC 2188C003 */   addu      $s1, $fp, $zero
  .L800576F0:
    /* 476F0 800576F0 3400BF8F */  lw         $ra, 0x34($sp)
    /* 476F4 800576F4 3000BE8F */  lw         $fp, 0x30($sp)
    /* 476F8 800576F8 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 476FC 800576FC 2800B68F */  lw         $s6, 0x28($sp)
    /* 47700 80057700 2400B58F */  lw         $s5, 0x24($sp)
    /* 47704 80057704 2000B48F */  lw         $s4, 0x20($sp)
    /* 47708 80057708 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 4770C 8005770C 1800B28F */  lw         $s2, 0x18($sp)
    /* 47710 80057710 1400B18F */  lw         $s1, 0x14($sp)
    /* 47714 80057714 1000B08F */  lw         $s0, 0x10($sp)
    /* 47718 80057718 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 4771C 8005771C 0800E003 */  jr         $ra
    /* 47720 80057720 00000000 */   nop
endlabel PostAddL2Objs__Fiiii
