.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoStreamFile__5DatIOPCciPFPUciib_bii, 0x20C

glabel LoStreamFile__5DatIOPCciPFPUciib_bii
    /* 76A34 80086A34 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 76A38 80086A38 1400B1AF */  sw         $s1, 0x14($sp)
    /* 76A3C 80086A3C 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 76A40 80086A40 1000B0AF */  sw         $s0, 0x10($sp)
    /* 76A44 80086A44 2180A000 */  addu       $s0, $a1, $zero
    /* 76A48 80086A48 2000B4AF */  sw         $s4, 0x20($sp)
    /* 76A4C 80086A4C 21A0C000 */  addu       $s4, $a2, $zero
    /* 76A50 80086A50 3000BEAF */  sw         $fp, 0x30($sp)
    /* 76A54 80086A54 21F0E000 */  addu       $fp, $a3, $zero
    /* 76A58 80086A58 3400BFAF */  sw         $ra, 0x34($sp)
    /* 76A5C 80086A5C 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 76A60 80086A60 2800B6AF */  sw         $s6, 0x28($sp)
    /* 76A64 80086A64 2400B5AF */  sw         $s5, 0x24($sp)
    /* 76A68 80086A68 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 76A6C 80086A6C 0600201E */  bgtz       $s1, .L80086A88
    /* 76A70 80086A70 1800B2AF */   sw        $s2, 0x18($sp)
    /* 76A74 80086A74 21200000 */  addu       $a0, $zero, $zero
    /* 76A78 80086A78 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76A7C 80086A7C AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76A80 80086A80 A583000C */  jal        DBG_Error
    /* 76A84 80086A84 B6000624 */   addiu     $a2, $zero, 0xB6
  .L80086A88:
    /* 76A88 80086A88 0700801E */  bgtz       $s4, .L80086AA8
    /* 76A8C 80086A8C 21200002 */   addu      $a0, $s0, $zero
    /* 76A90 80086A90 21200000 */  addu       $a0, $zero, $zero
    /* 76A94 80086A94 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76A98 80086A98 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76A9C 80086A9C A583000C */  jal        DBG_Error
    /* 76AA0 80086AA0 B7000624 */   addiu     $a2, $zero, 0xB7
    /* 76AA4 80086AA4 21200002 */  addu       $a0, $s0, $zero
  .L80086AA8:
    /* 76AA8 80086AA8 0E8D000C */  jal        DDXopen
    /* 76AAC 80086AAC 21280000 */   addu      $a1, $zero, $zero
    /* 76AB0 80086AB0 21984000 */  addu       $s3, $v0, $zero
    /* 76AB4 80086AB4 FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 76AB8 80086AB8 07007016 */  bne        $s3, $s0, .L80086AD8
    /* 76ABC 80086ABC 21208002 */   addu      $a0, $s4, $zero
    /* 76AC0 80086AC0 21200000 */  addu       $a0, $zero, $zero
    /* 76AC4 80086AC4 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76AC8 80086AC8 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76ACC 80086ACC A583000C */  jal        DBG_Error
    /* 76AD0 80086AD0 BA000624 */   addiu     $a2, $zero, 0xBA
    /* 76AD4 80086AD4 21208002 */  addu       $a0, $s4, $zero
  .L80086AD8:
    /* 76AD8 80086AD8 1180063C */  lui        $a2, %hi(D_801101C0)
    /* 76ADC 80086ADC C001C624 */  addiu      $a2, $a2, %lo(D_801101C0)
    /* 76AE0 80086AE0 7785000C */  jal        GAL_Alloc
    /* 76AE4 80086AE4 01000524 */   addiu     $a1, $zero, 0x1
    /* 76AE8 80086AE8 21A84000 */  addu       $s5, $v0, $zero
    /* 76AEC 80086AEC 0500B016 */  bne        $s5, $s0, .L80086B04
    /* 76AF0 80086AF0 21200000 */   addu      $a0, $zero, $zero
    /* 76AF4 80086AF4 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76AF8 80086AF8 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76AFC 80086AFC A583000C */  jal        DBG_Error
    /* 76B00 80086B00 BD000624 */   addiu     $a2, $zero, 0xBD
  .L80086B04:
    /* 76B04 80086B04 DD85000C */  jal        GAL_Lock
    /* 76B08 80086B08 2120A002 */   addu      $a0, $s5, $zero
    /* 76B0C 80086B0C 21904000 */  addu       $s2, $v0, $zero
    /* 76B10 80086B10 07004016 */  bnez       $s2, .L80086B30
    /* 76B14 80086B14 21206002 */   addu      $a0, $s3, $zero
    /* 76B18 80086B18 21200000 */  addu       $a0, $zero, $zero
    /* 76B1C 80086B1C 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76B20 80086B20 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76B24 80086B24 A583000C */  jal        DBG_Error
    /* 76B28 80086B28 C0000624 */   addiu     $a2, $zero, 0xC0
    /* 76B2C 80086B2C 21206002 */  addu       $a0, $s3, $zero
  .L80086B30:
    /* 76B30 80086B30 4800A58F */  lw         $a1, 0x48($sp)
    /* 76B34 80086B34 21300000 */  addu       $a2, $zero, $zero
    /* 76B38 80086B38 978D000C */  jal        DDXlseek
    /* 76B3C 80086B3C 21B02002 */   addu      $s6, $s1, $zero
    /* 76B40 80086B40 07005014 */  bne        $v0, $s0, .L80086B60
    /* 76B44 80086B44 FFFF1724 */   addiu     $s7, $zero, -0x1
    /* 76B48 80086B48 21200000 */  addu       $a0, $zero, $zero
    /* 76B4C 80086B4C 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76B50 80086B50 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76B54 80086B54 A583000C */  jal        DBG_Error
    /* 76B58 80086B58 C5000624 */   addiu     $a2, $zero, 0xC5
    /* 76B5C 80086B5C FFFF1724 */  addiu      $s7, $zero, -0x1
  .L80086B60:
    /* 76B60 80086B60 16002012 */  beqz       $s1, .L80086BBC
    /* 76B64 80086B64 2A109102 */   slt       $v0, $s4, $s1
    /* 76B68 80086B68 02004010 */  beqz       $v0, .L80086B74
    /* 76B6C 80086B6C 21802002 */   addu      $s0, $s1, $zero
    /* 76B70 80086B70 21808002 */  addu       $s0, $s4, $zero
  .L80086B74:
    /* 76B74 80086B74 21206002 */  addu       $a0, $s3, $zero
    /* 76B78 80086B78 21284002 */  addu       $a1, $s2, $zero
    /* 76B7C 80086B7C 488D000C */  jal        DDXread
    /* 76B80 80086B80 21300002 */   addu      $a2, $s0, $zero
    /* 76B84 80086B84 07005714 */  bne        $v0, $s7, .L80086BA4
    /* 76B88 80086B88 21204002 */   addu      $a0, $s2, $zero
    /* 76B8C 80086B8C 21200000 */  addu       $a0, $zero, $zero
    /* 76B90 80086B90 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76B94 80086B94 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76B98 80086B98 A583000C */  jal        DBG_Error
    /* 76B9C 80086B9C CF000624 */   addiu     $a2, $zero, 0xCF
    /* 76BA0 80086BA0 21204002 */  addu       $a0, $s2, $zero
  .L80086BA4:
    /* 76BA4 80086BA4 2328D102 */  subu       $a1, $s6, $s1
    /* 76BA8 80086BA8 21300002 */  addu       $a2, $s0, $zero
    /* 76BAC 80086BAC 09F8C003 */  jalr       $fp
    /* 76BB0 80086BB0 0100272E */   sltiu     $a3, $s1, 0x1
    /* 76BB4 80086BB4 D81A0208 */  j          .L80086B60
    /* 76BB8 80086BB8 23883002 */   subu      $s1, $s1, $s0
  .L80086BBC:
    /* 76BBC 80086BBC 358D000C */  jal        DDXclose
    /* 76BC0 80086BC0 21206002 */   addu      $a0, $s3, $zero
    /* 76BC4 80086BC4 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 76BC8 80086BC8 05004314 */  bne        $v0, $v1, .L80086BE0
    /* 76BCC 80086BCC 21200000 */   addu      $a0, $zero, $zero
    /* 76BD0 80086BD0 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76BD4 80086BD4 AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76BD8 80086BD8 A583000C */  jal        DBG_Error
    /* 76BDC 80086BDC D7000624 */   addiu     $a2, $zero, 0xD7
  .L80086BE0:
    /* 76BE0 80086BE0 1886000C */  jal        GAL_Free
    /* 76BE4 80086BE4 2120A002 */   addu      $a0, $s5, $zero
    /* 76BE8 80086BE8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 76BEC 80086BEC 07004014 */  bnez       $v0, .L80086C0C
    /* 76BF0 80086BF0 01000224 */   addiu     $v0, $zero, 0x1
    /* 76BF4 80086BF4 21200000 */  addu       $a0, $zero, $zero
    /* 76BF8 80086BF8 1180053C */  lui        $a1, %hi(D_801101AC)
    /* 76BFC 80086BFC AC01A524 */  addiu      $a1, $a1, %lo(D_801101AC)
    /* 76C00 80086C00 A583000C */  jal        DBG_Error
    /* 76C04 80086C04 DA000624 */   addiu     $a2, $zero, 0xDA
    /* 76C08 80086C08 01000224 */  addiu      $v0, $zero, 0x1
  .L80086C0C:
    /* 76C0C 80086C0C 3400BF8F */  lw         $ra, 0x34($sp)
    /* 76C10 80086C10 3000BE8F */  lw         $fp, 0x30($sp)
    /* 76C14 80086C14 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 76C18 80086C18 2800B68F */  lw         $s6, 0x28($sp)
    /* 76C1C 80086C1C 2400B58F */  lw         $s5, 0x24($sp)
    /* 76C20 80086C20 2000B48F */  lw         $s4, 0x20($sp)
    /* 76C24 80086C24 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 76C28 80086C28 1800B28F */  lw         $s2, 0x18($sp)
    /* 76C2C 80086C2C 1400B18F */  lw         $s1, 0x14($sp)
    /* 76C30 80086C30 1000B08F */  lw         $s0, 0x10($sp)
    /* 76C34 80086C34 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 76C38 80086C38 0800E003 */  jr         $ra
    /* 76C3C 80086C3C 00000000 */   nop
endlabel LoStreamFile__5DatIOPCciPFPUciib_bii
