.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_FindStreamFile__FPcc, 0x18C

glabel BL_FindStreamFile__FPcc
    /* 77A6C 80087A6C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 77A70 80087A70 3800B2AF */  sw         $s2, 0x38($sp)
    /* 77A74 80087A74 21908000 */  addu       $s2, $a0, $zero
    /* 77A78 80087A78 3000B0AF */  sw         $s0, 0x30($sp)
    /* 77A7C 80087A7C 2180A000 */  addu       $s0, $a1, $zero
    /* 77A80 80087A80 3400B1AF */  sw         $s1, 0x34($sp)
    /* 77A84 80087A84 21880000 */  addu       $s1, $zero, $zero
    /* 77A88 80087A88 4400B5AF */  sw         $s5, 0x44($sp)
    /* 77A8C 80087A8C 21A80000 */  addu       $s5, $zero, $zero
    /* 77A90 80087A90 4000B4AF */  sw         $s4, 0x40($sp)
    /* 77A94 80087A94 21A00000 */  addu       $s4, $zero, $zero
    /* 77A98 80087A98 4800BFAF */  sw         $ra, 0x48($sp)
    /* 77A9C 80087A9C 8767000C */  jal        strlen
    /* 77AA0 80087AA0 3C00B3AF */   sw        $s3, 0x3C($sp)
    /* 77AA4 80087AA4 00861000 */  sll        $s0, $s0, 24
    /* 77AA8 80087AA8 03861000 */  sra        $s0, $s0, 24
    /* 77AAC 80087AAC 0A000012 */  beqz       $s0, .L80087AD8
    /* 77AB0 80087AB0 21984000 */   addu      $s3, $v0, $zero
    /* 77AB4 80087AB4 01000224 */  addiu      $v0, $zero, 0x1
    /* 77AB8 80087AB8 0A000216 */  bne        $s0, $v0, .L80087AE4
    /* 77ABC 80087ABC 00000000 */   nop
    /* 77AC0 80087AC0 E803828F */  lw         $v0, %gp_rel(LFileTab)($gp)
    /* 77AC4 80087AC4 E003958F */  lw         $s5, %gp_rel(BL_NoLumpFiles)($gp)
    /* 77AC8 80087AC8 B91E0208 */  j          .L80087AE4
    /* 77ACC 80087ACC 14005124 */   addiu     $s1, $v0, 0x14
  .L80087AD0:
    /* 77AD0 80087AD0 F41E0208 */  j          .L80087BD0
    /* 77AD4 80087AD4 21102002 */   addu      $v0, $s1, $zero
  .L80087AD8:
    /* 77AD8 80087AD8 EC03828F */  lw         $v0, %gp_rel(SFileTab)($gp)
    /* 77ADC 80087ADC E403958F */  lw         $s5, %gp_rel(BL_NoStreamFiles)($gp)
    /* 77AE0 80087AE0 14005124 */  addiu      $s1, $v0, 0x14
  .L80087AE4:
    /* 77AE4 80087AE4 1D21020C */  jal        strupr__FPc
    /* 77AE8 80087AE8 21204002 */   addu      $a0, $s2, $zero
    /* 77AEC 80087AEC 0C00601A */  blez       $s3, .L80087B20
    /* 77AF0 80087AF0 21180000 */   addu      $v1, $zero, $zero
    /* 77AF4 80087AF4 5C000524 */  addiu      $a1, $zero, 0x5C
    /* 77AF8 80087AF8 21204002 */  addu       $a0, $s2, $zero
  .L80087AFC:
    /* 77AFC 80087AFC 00008280 */  lb         $v0, 0x0($a0)
    /* 77B00 80087B00 00000000 */  nop
    /* 77B04 80087B04 02004514 */  bne        $v0, $a1, .L80087B10
    /* 77B08 80087B08 00000000 */   nop
    /* 77B0C 80087B0C 01007424 */  addiu      $s4, $v1, 0x1
  .L80087B10:
    /* 77B10 80087B10 01006324 */  addiu      $v1, $v1, 0x1
    /* 77B14 80087B14 2A107300 */  slt        $v0, $v1, $s3
    /* 77B18 80087B18 F8FF4014 */  bnez       $v0, .L80087AFC
    /* 77B1C 80087B1C 01008424 */   addiu     $a0, $a0, 0x1
  .L80087B20:
    /* 77B20 80087B20 0F008012 */  beqz       $s4, .L80087B60
    /* 77B24 80087B24 00000000 */   nop
    /* 77B28 80087B28 23287402 */  subu       $a1, $s3, $s4
    /* 77B2C 80087B2C 0A00A018 */  blez       $a1, .L80087B58
    /* 77B30 80087B30 21180000 */   addu      $v1, $zero, $zero
    /* 77B34 80087B34 21204002 */  addu       $a0, $s2, $zero
  .L80087B38:
    /* 77B38 80087B38 21107400 */  addu       $v0, $v1, $s4
    /* 77B3C 80087B3C 21104202 */  addu       $v0, $s2, $v0
    /* 77B40 80087B40 00004290 */  lbu        $v0, 0x0($v0)
    /* 77B44 80087B44 01006324 */  addiu      $v1, $v1, 0x1
    /* 77B48 80087B48 000082A0 */  sb         $v0, 0x0($a0)
    /* 77B4C 80087B4C 2A106500 */  slt        $v0, $v1, $a1
    /* 77B50 80087B50 F9FF4014 */  bnez       $v0, .L80087B38
    /* 77B54 80087B54 01008424 */   addiu     $a0, $a0, 0x1
  .L80087B58:
    /* 77B58 80087B58 21104302 */  addu       $v0, $s2, $v1
    /* 77B5C 80087B5C 000040A0 */  sb         $zero, 0x0($v0)
  .L80087B60:
    /* 77B60 80087B60 0D000324 */  addiu      $v1, $zero, 0xD
    /* 77B64 80087B64 1D00A227 */  addiu      $v0, $sp, 0x1D
  .L80087B68:
    /* 77B68 80087B68 000040A0 */  sb         $zero, 0x0($v0)
    /* 77B6C 80087B6C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 77B70 80087B70 FDFF6104 */  bgez       $v1, .L80087B68
    /* 77B74 80087B74 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 77B78 80087B78 21800000 */  addu       $s0, $zero, $zero
    /* 77B7C 80087B7C 1000B327 */  addiu      $s3, $sp, 0x10
  .L80087B80:
    /* 77B80 80087B80 2A101502 */  slt        $v0, $s0, $s5
    /* 77B84 80087B84 11004010 */  beqz       $v0, .L80087BCC
    /* 77B88 80087B88 21186002 */   addu      $v1, $s3, $zero
    /* 77B8C 80087B8C 21202002 */  addu       $a0, $s1, $zero
    /* 77B90 80087B90 0C006524 */  addiu      $a1, $v1, 0xC
  .L80087B94:
    /* 77B94 80087B94 00008290 */  lbu        $v0, 0x0($a0)
    /* 77B98 80087B98 00000000 */  nop
    /* 77B9C 80087B9C 000062A0 */  sb         $v0, 0x0($v1)
    /* 77BA0 80087BA0 01006324 */  addiu      $v1, $v1, 0x1
    /* 77BA4 80087BA4 2A106500 */  slt        $v0, $v1, $a1
    /* 77BA8 80087BA8 FAFF4014 */  bnez       $v0, .L80087B94
    /* 77BAC 80087BAC 01008424 */   addiu     $a0, $a0, 0x1
    /* 77BB0 80087BB0 21204002 */  addu       $a0, $s2, $zero
    /* 77BB4 80087BB4 7F67000C */  jal        strcmp
    /* 77BB8 80087BB8 1000A527 */   addiu     $a1, $sp, 0x10
    /* 77BBC 80087BBC C4FF4010 */  beqz       $v0, .L80087AD0
    /* 77BC0 80087BC0 01001026 */   addiu     $s0, $s0, 0x1
    /* 77BC4 80087BC4 E01E0208 */  j          .L80087B80
    /* 77BC8 80087BC8 14003126 */   addiu     $s1, $s1, 0x14
  .L80087BCC:
    /* 77BCC 80087BCC 21100000 */  addu       $v0, $zero, $zero
  .L80087BD0:
    /* 77BD0 80087BD0 4800BF8F */  lw         $ra, 0x48($sp)
    /* 77BD4 80087BD4 4400B58F */  lw         $s5, 0x44($sp)
    /* 77BD8 80087BD8 4000B48F */  lw         $s4, 0x40($sp)
    /* 77BDC 80087BDC 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 77BE0 80087BE0 3800B28F */  lw         $s2, 0x38($sp)
    /* 77BE4 80087BE4 3400B18F */  lw         $s1, 0x34($sp)
    /* 77BE8 80087BE8 3000B08F */  lw         $s0, 0x30($sp)
    /* 77BEC 80087BEC 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 77BF0 80087BF0 0800E003 */  jr         $ra
    /* 77BF4 80087BF4 00000000 */   nop
endlabel BL_FindStreamFile__FPcc
