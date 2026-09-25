.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PutBlocksInRegionIntoList, 0xA4

glabel PutBlocksInRegionIntoList
    /* 12AF0 80022AF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 12AF4 80022AF4 2400B3AF */  sw         $s3, 0x24($sp)
    /* 12AF8 80022AF8 21988000 */  addu       $s3, $a0, $zero
    /* 12AFC 80022AFC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 12B00 80022B00 2190C000 */  addu       $s2, $a2, $zero
    /* 12B04 80022B04 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 12B08 80022B08 2800B4AF */  sw         $s4, 0x28($sp)
    /* 12B0C 80022B0C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 12B10 80022B10 1800B0AF */  sw         $s0, 0x18($sp)
    /* 12B14 80022B14 0000508E */  lw         $s0, 0x0($s2)
    /* 12B18 80022B18 00000000 */  nop
    /* 12B1C 80022B1C 14000012 */  beqz       $s0, .L80022B70
    /* 12B20 80022B20 21A0A000 */   addu      $s4, $a1, $zero
  .L80022B24:
    /* 12B24 80022B24 0400118E */  lw         $s1, 0x4($s0)
    /* 12B28 80022B28 0800028E */  lw         $v0, 0x8($s0)
    /* 12B2C 80022B2C 21206002 */  addu       $a0, $s3, $zero
    /* 12B30 80022B30 1000A2AF */  sw         $v0, 0x10($sp)
    /* 12B34 80022B34 0C00028E */  lw         $v0, 0xC($s0)
    /* 12B38 80022B38 1000A527 */  addiu      $a1, $sp, 0x10
    /* 12B3C 80022B3C E58A000C */  jal        CollideRegions
    /* 12B40 80022B40 1400A2AF */   sw        $v0, 0x14($sp)
    /* 12B44 80022B44 FF004230 */  andi       $v0, $v0, 0xFF
    /* 12B48 80022B48 06004010 */  beqz       $v0, .L80022B64
    /* 12B4C 80022B4C 21204002 */   addu      $a0, $s2, $zero
    /* 12B50 80022B50 A386000C */  jal        DetachHdrFromList
    /* 12B54 80022B54 21280002 */   addu      $a1, $s0, $zero
    /* 12B58 80022B58 21208002 */  addu       $a0, $s4, $zero
    /* 12B5C 80022B5C 9B86000C */  jal        AttachHdrToList
    /* 12B60 80022B60 21280002 */   addu      $a1, $s0, $zero
  .L80022B64:
    /* 12B64 80022B64 21802002 */  addu       $s0, $s1, $zero
    /* 12B68 80022B68 EEFF0016 */  bnez       $s0, .L80022B24
    /* 12B6C 80022B6C 00000000 */   nop
  .L80022B70:
    /* 12B70 80022B70 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 12B74 80022B74 2800B48F */  lw         $s4, 0x28($sp)
    /* 12B78 80022B78 2400B38F */  lw         $s3, 0x24($sp)
    /* 12B7C 80022B7C 2000B28F */  lw         $s2, 0x20($sp)
    /* 12B80 80022B80 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 12B84 80022B84 1800B08F */  lw         $s0, 0x18($sp)
    /* 12B88 80022B88 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 12B8C 80022B8C 0800E003 */  jr         $ra
    /* 12B90 80022B90 00000000 */   nop
endlabel PutBlocksInRegionIntoList
