.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindPal__13PalCollectionUsUsi, 0xDC

glabel FindPal__13PalCollectionUsUsi
    /* 8ADF4 8009ADF4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8ADF8 8009ADF8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 8ADFC 8009ADFC 21A08000 */  addu       $s4, $a0, $zero
    /* 8AE00 8009AE00 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8AE04 8009AE04 2198E000 */  addu       $s3, $a3, $zero
    /* 8AE08 8009AE08 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8AE0C 8009AE0C 2190A000 */  addu       $s2, $a1, $zero
    /* 8AE10 8009AE10 2400BFAF */  sw         $ra, 0x24($sp)
    /* 8AE14 8009AE14 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8AE18 8009AE18 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8AE1C 8009AE1C E401908E */  lw         $s0, 0x1E4($s4)
    /* 8AE20 8009AE20 00000000 */  nop
    /* 8AE24 8009AE24 0D000012 */  beqz       $s0, .L8009AE5C
    /* 8AE28 8009AE28 2188C000 */   addu      $s1, $a2, $zero
  .L8009AE2C:
    /* 8AE2C 8009AE2C 21200002 */  addu       $a0, $s0, $zero
    /* 8AE30 8009AE30 FFFF4532 */  andi       $a1, $s2, 0xFFFF
    /* 8AE34 8009AE34 FFFF2632 */  andi       $a2, $s1, 0xFFFF
    /* 8AE38 8009AE38 A26C020C */  jal        IsEqual__C8PalEntryUsUsi
    /* 8AE3C 8009AE3C 21386002 */   addu      $a3, $s3, $zero
    /* 8AE40 8009AE40 1A004014 */  bnez       $v0, .L8009AEAC
    /* 8AE44 8009AE44 21100002 */   addu      $v0, $s0, $zero
    /* 8AE48 8009AE48 B06C020C */  jal        GetNext__Ct11TLinkedList1Z8PalEntry
    /* 8AE4C 8009AE4C 21200002 */   addu      $a0, $s0, $zero
    /* 8AE50 8009AE50 21804000 */  addu       $s0, $v0, $zero
    /* 8AE54 8009AE54 F5FF0016 */  bnez       $s0, .L8009AE2C
    /* 8AE58 8009AE58 00000000 */   nop
  .L8009AE5C:
    /* 8AE5C 8009AE5C E801908E */  lw         $s0, 0x1E8($s4)
    /* 8AE60 8009AE60 00000000 */  nop
    /* 8AE64 8009AE64 11000012 */  beqz       $s0, .L8009AEAC
    /* 8AE68 8009AE68 21100000 */   addu      $v0, $zero, $zero
  .L8009AE6C:
    /* 8AE6C 8009AE6C 21200002 */  addu       $a0, $s0, $zero
    /* 8AE70 8009AE70 FFFF4532 */  andi       $a1, $s2, 0xFFFF
    /* 8AE74 8009AE74 FFFF2632 */  andi       $a2, $s1, 0xFFFF
    /* 8AE78 8009AE78 A26C020C */  jal        IsEqual__C8PalEntryUsUsi
    /* 8AE7C 8009AE7C 21386002 */   addu      $a3, $s3, $zero
    /* 8AE80 8009AE80 05004010 */  beqz       $v0, .L8009AE98
    /* 8AE84 8009AE84 21208002 */   addu      $a0, $s4, $zero
    /* 8AE88 8009AE88 756C020C */  jal        MoveFromUnusedToUsed__t10Collection2Z8PalEntryi20P8PalEntry
    /* 8AE8C 8009AE8C 21280002 */   addu      $a1, $s0, $zero
    /* 8AE90 8009AE90 AB6B0208 */  j          .L8009AEAC
    /* 8AE94 8009AE94 21100002 */   addu      $v0, $s0, $zero
  .L8009AE98:
    /* 8AE98 8009AE98 B06C020C */  jal        GetNext__Ct11TLinkedList1Z8PalEntry
    /* 8AE9C 8009AE9C 21200002 */   addu      $a0, $s0, $zero
    /* 8AEA0 8009AEA0 21804000 */  addu       $s0, $v0, $zero
    /* 8AEA4 8009AEA4 F1FF0016 */  bnez       $s0, .L8009AE6C
    /* 8AEA8 8009AEA8 21100000 */   addu      $v0, $zero, $zero
  .L8009AEAC:
    /* 8AEAC 8009AEAC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 8AEB0 8009AEB0 2000B48F */  lw         $s4, 0x20($sp)
    /* 8AEB4 8009AEB4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 8AEB8 8009AEB8 1800B28F */  lw         $s2, 0x18($sp)
    /* 8AEBC 8009AEBC 1400B18F */  lw         $s1, 0x14($sp)
    /* 8AEC0 8009AEC0 1000B08F */  lw         $s0, 0x10($sp)
    /* 8AEC4 8009AEC4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8AEC8 8009AEC8 0800E003 */  jr         $ra
    /* 8AECC 8009AECC 00000000 */   nop
endlabel FindPal__13PalCollectionUsUsi
