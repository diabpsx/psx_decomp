.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeRectTable__7CBlocks, 0x154

glabel MakeRectTable__7CBlocks
    /* 7DC1C 8008DC1C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 7DC20 8008DC20 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 7DC24 8008DC24 21888000 */  addu       $s1, $a0, $zero
    /* 7DC28 8008DC28 01800534 */  ori        $a1, $zero, 0x8001
    /* 7DC2C 8008DC2C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 7DC30 8008DC30 2400B3AF */  sw         $s3, 0x24($sp)
    /* 7DC34 8008DC34 2000B2AF */  sw         $s2, 0x20($sp)
    /* 7DC38 8008DC38 1800B0AF */  sw         $s0, 0x18($sp)
    /* 7DC3C 8008DC3C AC00248E */  lw         $a0, 0xAC($s1)
    /* 7DC40 8008DC40 1280063C */  lui        $a2, %hi(D_8011ACB4)
    /* 7DC44 8008DC44 B4ACC624 */  addiu      $a2, $a2, %lo(D_8011ACB4)
    /* 7DC48 8008DC48 7785000C */  jal        GAL_Alloc
    /* 7DC4C 8008DC4C C0200400 */   sll       $a0, $a0, 3
    /* 7DC50 8008DC50 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 7DC54 8008DC54 06004314 */  bne        $v0, $v1, .L8008DC70
    /* 7DC58 8008DC58 BC0022AE */   sw        $v0, 0xBC($s1)
    /* 7DC5C 8008DC5C 21200000 */  addu       $a0, $zero, $zero
    /* 7DC60 8008DC60 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DC64 8008DC64 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DC68 8008DC68 A583000C */  jal        DBG_Error
    /* 7DC6C 8008DC6C 96020624 */   addiu     $a2, $zero, 0x296
  .L8008DC70:
    /* 7DC70 8008DC70 BC00248E */  lw         $a0, 0xBC($s1)
    /* 7DC74 8008DC74 DD85000C */  jal        GAL_Lock
    /* 7DC78 8008DC78 00000000 */   nop
    /* 7DC7C 8008DC7C 06004014 */  bnez       $v0, .L8008DC98
    /* 7DC80 8008DC80 B80022AE */   sw        $v0, 0xB8($s1)
    /* 7DC84 8008DC84 21200000 */  addu       $a0, $zero, $zero
    /* 7DC88 8008DC88 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DC8C 8008DC8C 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DC90 8008DC90 A583000C */  jal        DBG_Error
    /* 7DC94 8008DC94 99020624 */   addiu     $a2, $zero, 0x299
  .L8008DC98:
    /* 7DC98 8008DC98 2000248E */  lw         $a0, 0x20($s1)
    /* 7DC9C 8008DC9C DD85000C */  jal        GAL_Lock
    /* 7DCA0 8008DCA0 00000000 */   nop
    /* 7DCA4 8008DCA4 21904000 */  addu       $s2, $v0, $zero
    /* 7DCA8 8008DCA8 05004016 */  bnez       $s2, .L8008DCC0
    /* 7DCAC 8008DCAC 21200000 */   addu      $a0, $zero, $zero
    /* 7DCB0 8008DCB0 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DCB4 8008DCB4 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DCB8 8008DCB8 A583000C */  jal        DBG_Error
    /* 7DCBC 8008DCBC 9F020624 */   addiu     $a2, $zero, 0x29F
  .L8008DCC0:
    /* 7DCC0 8008DCC0 3C00338E */  lw         $s3, 0x3C($s1)
    /* 7DCC4 8008DCC4 00000000 */  nop
    /* 7DCC8 8008DCC8 05006016 */  bnez       $s3, .L8008DCE0
    /* 7DCCC 8008DCCC 21200000 */   addu      $a0, $zero, $zero
    /* 7DCD0 8008DCD0 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DCD4 8008DCD4 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DCD8 8008DCD8 A583000C */  jal        DBG_Error
    /* 7DCDC 8008DCDC A2020624 */   addiu     $a2, $zero, 0x2A2
  .L8008DCE0:
    /* 7DCE0 8008DCE0 AC00228E */  lw         $v0, 0xAC($s1)
    /* 7DCE4 8008DCE4 00000000 */  nop
    /* 7DCE8 8008DCE8 0E004018 */  blez       $v0, .L8008DD24
    /* 7DCEC 8008DCEC 21800000 */   addu      $s0, $zero, $zero
    /* 7DCF0 8008DCF0 21282002 */  addu       $a1, $s1, $zero
  .L8008DCF4:
    /* 7DCF4 8008DCF4 0000448E */  lw         $a0, 0x0($s2)
    /* 7DCF8 8008DCF8 04005226 */  addiu      $s2, $s2, 0x4
    /* 7DCFC 8008DCFC C0301000 */  sll        $a2, $s0, 3
    /* 7DD00 8008DD00 B800228E */  lw         $v0, 0xB8($s1)
    /* 7DD04 8008DD04 21206402 */  addu       $a0, $s3, $a0
    /* 7DD08 8008DD08 C953020C */  jal        GetBoundingBox__6CBlockR7TextDatR4RECT
    /* 7DD0C 8008DD0C 21304600 */   addu      $a2, $v0, $a2
    /* 7DD10 8008DD10 AC00228E */  lw         $v0, 0xAC($s1)
    /* 7DD14 8008DD14 01001026 */  addiu      $s0, $s0, 0x1
    /* 7DD18 8008DD18 2A100202 */  slt        $v0, $s0, $v0
    /* 7DD1C 8008DD1C F5FF4014 */  bnez       $v0, .L8008DCF4
    /* 7DD20 8008DD20 21282002 */   addu      $a1, $s1, $zero
  .L8008DD24:
    /* 7DD24 8008DD24 2000248E */  lw         $a0, 0x20($s1)
    /* 7DD28 8008DD28 F785000C */  jal        GAL_Unlock
    /* 7DD2C 8008DD2C 00000000 */   nop
    /* 7DD30 8008DD30 2000228E */  lw         $v0, 0x20($s1)
    /* 7DD34 8008DD34 00000000 */  nop
    /* 7DD38 8008DD38 05004014 */  bnez       $v0, .L8008DD50
    /* 7DD3C 8008DD3C 21200000 */   addu      $a0, $zero, $zero
    /* 7DD40 8008DD40 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DD44 8008DD44 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DD48 8008DD48 A583000C */  jal        DBG_Error
    /* 7DD4C 8008DD4C AD020624 */   addiu     $a2, $zero, 0x2AD
  .L8008DD50:
    /* 7DD50 8008DD50 2800BF8F */  lw         $ra, 0x28($sp)
    /* 7DD54 8008DD54 2400B38F */  lw         $s3, 0x24($sp)
    /* 7DD58 8008DD58 2000B28F */  lw         $s2, 0x20($sp)
    /* 7DD5C 8008DD5C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 7DD60 8008DD60 1800B08F */  lw         $s0, 0x18($sp)
    /* 7DD64 8008DD64 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 7DD68 8008DD68 0800E003 */  jr         $ra
    /* 7DD6C 8008DD6C 00000000 */   nop
endlabel MakeRectTable__7CBlocks
