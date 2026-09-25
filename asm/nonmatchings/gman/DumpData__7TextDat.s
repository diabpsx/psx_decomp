.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpData__7TextDat, 0x128

glabel DumpData__7TextDat
    /* 83A84 80093A84 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 83A88 80093A88 1000B0AF */  sw         $s0, 0x10($sp)
    /* 83A8C 80093A8C 21808000 */  addu       $s0, $a0, $zero
    /* 83A90 80093A90 1800BFAF */  sw         $ra, 0x18($sp)
    /* 83A94 80093A94 EB4E020C */  jal        DumpHdr__7TextDat
    /* 83A98 80093A98 1400B1AF */   sw        $s1, 0x14($sp)
    /* 83A9C 80093A9C 8954020C */  jal        DumpDatFile__7TextDat
    /* 83AA0 80093AA0 21200002 */   addu      $a0, $s0, $zero
    /* 83AA4 80093AA4 1800048E */  lw         $a0, 0x18($s0)
    /* 83AA8 80093AA8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 83AAC 80093AAC 0A008210 */  beq        $a0, $v0, .L80093AD8
    /* 83AB0 80093AB0 00000000 */   nop
    /* 83AB4 80093AB4 1886000C */  jal        GAL_Free
    /* 83AB8 80093AB8 00000000 */   nop
    /* 83ABC 80093ABC FF004230 */  andi       $v0, $v0, 0xFF
    /* 83AC0 80093AC0 05004014 */  bnez       $v0, .L80093AD8
    /* 83AC4 80093AC4 21200000 */   addu      $a0, $zero, $zero
    /* 83AC8 80093AC8 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83ACC 80093ACC 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83AD0 80093AD0 A583000C */  jal        DBG_Error
    /* 83AD4 80093AD4 EE040624 */   addiu     $a2, $zero, 0x4EE
  .L80093AD8:
    /* 83AD8 80093AD8 1C00048E */  lw         $a0, 0x1C($s0)
    /* 83ADC 80093ADC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 83AE0 80093AE0 0A008210 */  beq        $a0, $v0, .L80093B0C
    /* 83AE4 80093AE4 00000000 */   nop
    /* 83AE8 80093AE8 1886000C */  jal        GAL_Free
    /* 83AEC 80093AEC 00000000 */   nop
    /* 83AF0 80093AF0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 83AF4 80093AF4 05004014 */  bnez       $v0, .L80093B0C
    /* 83AF8 80093AF8 21200000 */   addu      $a0, $zero, $zero
    /* 83AFC 80093AFC 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83B00 80093B00 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83B04 80093B04 A583000C */  jal        DBG_Error
    /* 83B08 80093B08 F4040624 */   addiu     $a2, $zero, 0x4F4
  .L80093B0C:
    /* 83B0C 80093B0C 2000048E */  lw         $a0, 0x20($s0)
    /* 83B10 80093B10 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 83B14 80093B14 0A008210 */  beq        $a0, $v0, .L80093B40
    /* 83B18 80093B18 00000000 */   nop
    /* 83B1C 80093B1C 1886000C */  jal        GAL_Free
    /* 83B20 80093B20 00000000 */   nop
    /* 83B24 80093B24 FF004230 */  andi       $v0, $v0, 0xFF
    /* 83B28 80093B28 05004014 */  bnez       $v0, .L80093B40
    /* 83B2C 80093B2C 21200000 */   addu      $a0, $zero, $zero
    /* 83B30 80093B30 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83B34 80093B34 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83B38 80093B38 A583000C */  jal        DBG_Error
    /* 83B3C 80093B3C FA040624 */   addiu     $a2, $zero, 0x4FA
  .L80093B40:
    /* 83B40 80093B40 4C00048E */  lw         $a0, 0x4C($s0)
    /* 83B44 80093B44 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 83B48 80093B48 03009110 */  beq        $a0, $s1, .L80093B58
    /* 83B4C 80093B4C 00000000 */   nop
    /* 83B50 80093B50 860D020C */  jal        GPUQ_DiscardHandle__Fl
    /* 83B54 80093B54 00000000 */   nop
  .L80093B58:
    /* 83B58 80093B58 6C00048E */  lw         $a0, 0x6C($s0)
    /* 83B5C 80093B5C 00000000 */  nop
    /* 83B60 80093B60 0A009110 */  beq        $a0, $s1, .L80093B8C
    /* 83B64 80093B64 00000000 */   nop
    /* 83B68 80093B68 1886000C */  jal        GAL_Free
    /* 83B6C 80093B6C 00000000 */   nop
    /* 83B70 80093B70 FF004230 */  andi       $v0, $v0, 0xFF
    /* 83B74 80093B74 05004014 */  bnez       $v0, .L80093B8C
    /* 83B78 80093B78 21200000 */   addu      $a0, $zero, $zero
    /* 83B7C 80093B7C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83B80 80093B80 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83B84 80093B84 A583000C */  jal        DBG_Error
    /* 83B88 80093B88 05050624 */   addiu     $a2, $zero, 0x505
  .L80093B8C:
    /* 83B8C 80093B8C 954E020C */  jal        InitData__7TextDat
    /* 83B90 80093B90 21200002 */   addu      $a0, $s0, $zero
    /* 83B94 80093B94 1800BF8F */  lw         $ra, 0x18($sp)
    /* 83B98 80093B98 1400B18F */  lw         $s1, 0x14($sp)
    /* 83B9C 80093B9C 1000B08F */  lw         $s0, 0x10($sp)
    /* 83BA0 80093BA0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 83BA4 80093BA4 0800E003 */  jr         $ra
    /* 83BA8 80093BA8 00000000 */   nop
endlabel DumpData__7TextDat
