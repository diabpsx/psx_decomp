.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MergeToEmptyList, 0xD4

glabel MergeToEmptyList
    /* 11CD4 80021CD4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 11CD8 80021CD8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 11CDC 80021CDC 21A08000 */  addu       $s4, $a0, $zero
    /* 11CE0 80021CE0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 11CE4 80021CE4 2188A000 */  addu       $s1, $a1, $zero
    /* 11CE8 80021CE8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 11CEC 80021CEC 2400B5AF */  sw         $s5, 0x24($sp)
    /* 11CF0 80021CF0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 11CF4 80021CF4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 11CF8 80021CF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 11CFC 80021CFC 0800338E */  lw         $s3, 0x8($s1)
    /* 11D00 80021D00 0C00228E */  lw         $v0, 0xC($s1)
    /* 11D04 80021D04 2000908E */  lw         $s0, 0x20($s4)
    /* 11D08 80021D08 00000000 */  nop
    /* 11D0C 80021D0C 19000012 */  beqz       $s0, .L80021D74
    /* 11D10 80021D10 21A86202 */   addu      $s5, $s3, $v0
  .L80021D14:
    /* 11D14 80021D14 0800028E */  lw         $v0, 0x8($s0)
    /* 11D18 80021D18 0C00038E */  lw         $v1, 0xC($s0)
    /* 11D1C 80021D1C 0400128E */  lw         $s2, 0x4($s0)
    /* 11D20 80021D20 21204300 */  addu       $a0, $v0, $v1
    /* 11D24 80021D24 03006412 */  beq        $s3, $a0, .L80021D34
    /* 11D28 80021D28 00000000 */   nop
    /* 11D2C 80021D2C 0E00A216 */  bne        $s5, $v0, .L80021D68
    /* 11D30 80021D30 00000000 */   nop
  .L80021D34:
    /* 11D34 80021D34 0C00228E */  lw         $v0, 0xC($s1)
    /* 11D38 80021D38 00000000 */  nop
    /* 11D3C 80021D3C 21104300 */  addu       $v0, $v0, $v1
    /* 11D40 80021D40 04006416 */  bne        $s3, $a0, .L80021D54
    /* 11D44 80021D44 0C0022AE */   sw        $v0, 0xC($s1)
    /* 11D48 80021D48 0800028E */  lw         $v0, 0x8($s0)
    /* 11D4C 80021D4C 00000000 */  nop
    /* 11D50 80021D50 080022AE */  sw         $v0, 0x8($s1)
  .L80021D54:
    /* 11D54 80021D54 20008426 */  addiu      $a0, $s4, 0x20
    /* 11D58 80021D58 A386000C */  jal        DetachHdrFromList
    /* 11D5C 80021D5C 21280002 */   addu      $a1, $s0, $zero
    /* 11D60 80021D60 4488000C */  jal        ReleaseMemHdrBlock
    /* 11D64 80021D64 21200002 */   addu      $a0, $s0, $zero
  .L80021D68:
    /* 11D68 80021D68 21804002 */  addu       $s0, $s2, $zero
    /* 11D6C 80021D6C E9FF0016 */  bnez       $s0, .L80021D14
    /* 11D70 80021D70 00000000 */   nop
  .L80021D74:
    /* 11D74 80021D74 20008426 */  addiu      $a0, $s4, 0x20
    /* 11D78 80021D78 9B86000C */  jal        AttachHdrToList
    /* 11D7C 80021D7C 21282002 */   addu      $a1, $s1, $zero
    /* 11D80 80021D80 2800BF8F */  lw         $ra, 0x28($sp)
    /* 11D84 80021D84 2400B58F */  lw         $s5, 0x24($sp)
    /* 11D88 80021D88 2000B48F */  lw         $s4, 0x20($sp)
    /* 11D8C 80021D8C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 11D90 80021D90 1800B28F */  lw         $s2, 0x18($sp)
    /* 11D94 80021D94 1400B18F */  lw         $s1, 0x14($sp)
    /* 11D98 80021D98 1000B08F */  lw         $s0, 0x10($sp)
    /* 11D9C 80021D9C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 11DA0 80021DA0 0800E003 */  jr         $ra
    /* 11DA4 80021DA4 00000000 */   nop
endlabel MergeToEmptyList
