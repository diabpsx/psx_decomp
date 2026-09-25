.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PutAllLockedBlocksOntoList, 0x7C

glabel PutAllLockedBlocksOntoList
    /* 12DF8 80022DF8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 12DFC 80022DFC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 12E00 80022E00 2190A000 */  addu       $s2, $a1, $zero
    /* 12E04 80022E04 2000BFAF */  sw         $ra, 0x20($sp)
    /* 12E08 80022E08 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 12E0C 80022E0C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12E10 80022E10 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12E14 80022E14 0000508E */  lw         $s0, 0x0($s2)
    /* 12E18 80022E18 00000000 */  nop
    /* 12E1C 80022E1C 0D000012 */  beqz       $s0, .L80022E54
    /* 12E20 80022E20 21988000 */   addu      $s3, $a0, $zero
  .L80022E24:
    /* 12E24 80022E24 14000296 */  lhu        $v0, 0x14($s0)
    /* 12E28 80022E28 0400118E */  lw         $s1, 0x4($s0)
    /* 12E2C 80022E2C 06004010 */  beqz       $v0, .L80022E48
    /* 12E30 80022E30 21204002 */   addu      $a0, $s2, $zero
    /* 12E34 80022E34 A386000C */  jal        DetachHdrFromList
    /* 12E38 80022E38 21280002 */   addu      $a1, $s0, $zero
    /* 12E3C 80022E3C 21206002 */  addu       $a0, $s3, $zero
    /* 12E40 80022E40 9B86000C */  jal        AttachHdrToList
    /* 12E44 80022E44 21280002 */   addu      $a1, $s0, $zero
  .L80022E48:
    /* 12E48 80022E48 21802002 */  addu       $s0, $s1, $zero
    /* 12E4C 80022E4C F5FF0016 */  bnez       $s0, .L80022E24
    /* 12E50 80022E50 00000000 */   nop
  .L80022E54:
    /* 12E54 80022E54 2000BF8F */  lw         $ra, 0x20($sp)
    /* 12E58 80022E58 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 12E5C 80022E5C 1800B28F */  lw         $s2, 0x18($sp)
    /* 12E60 80022E60 1400B18F */  lw         $s1, 0x14($sp)
    /* 12E64 80022E64 1000B08F */  lw         $s0, 0x10($sp)
    /* 12E68 80022E68 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 12E6C 80022E6C 0800E003 */  jr         $ra
    /* 12E70 80022E70 00000000 */   nop
endlabel PutAllLockedBlocksOntoList
