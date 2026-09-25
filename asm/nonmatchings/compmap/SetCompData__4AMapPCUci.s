.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetCompData__4AMapPCUci, 0xF0

glabel SetCompData__4AMapPCUci
    /* 71B88 80081B88 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 71B8C 80081B8C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 71B90 80081B90 21908000 */  addu       $s2, $a0, $zero
    /* 71B94 80081B94 2000B4AF */  sw         $s4, 0x20($sp)
    /* 71B98 80081B98 21A0A000 */  addu       $s4, $a1, $zero
    /* 71B9C 80081B9C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 71BA0 80081BA0 2198C000 */  addu       $s3, $a2, $zero
    /* 71BA4 80081BA4 2400BFAF */  sw         $ra, 0x24($sp)
    /* 71BA8 80081BA8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71BAC 80081BAC AA06020C */  jal        Init__4AMap
    /* 71BB0 80081BB0 1000B0AF */   sw        $s0, 0x10($sp)
    /* 71BB4 80081BB4 21206002 */  addu       $a0, $s3, $zero
    /* 71BB8 80081BB8 01000524 */  addiu      $a1, $zero, 0x1
    /* 71BBC 80081BBC 7785000C */  jal        GAL_Alloc
    /* 71BC0 80081BC0 21300000 */   addu      $a2, $zero, $zero
    /* 71BC4 80081BC4 21884000 */  addu       $s1, $v0, $zero
    /* 71BC8 80081BC8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 71BCC 80081BCC 05002216 */  bne        $s1, $v0, .L80081BE4
    /* 71BD0 80081BD0 21200000 */   addu      $a0, $zero, $zero
    /* 71BD4 80081BD4 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71BD8 80081BD8 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71BDC 80081BDC A583000C */  jal        DBG_Error
    /* 71BE0 80081BE0 11010624 */   addiu     $a2, $zero, 0x111
  .L80081BE4:
    /* 71BE4 80081BE4 DD85000C */  jal        GAL_Lock
    /* 71BE8 80081BE8 21202002 */   addu      $a0, $s1, $zero
    /* 71BEC 80081BEC 21804000 */  addu       $s0, $v0, $zero
    /* 71BF0 80081BF0 06000016 */  bnez       $s0, .L80081C0C
    /* 71BF4 80081BF4 00000000 */   nop
    /* 71BF8 80081BF8 21200000 */  addu       $a0, $zero, $zero
    /* 71BFC 80081BFC 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71C00 80081C00 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71C04 80081C04 A583000C */  jal        DBG_Error
    /* 71C08 80081C08 14010624 */   addiu     $a2, $zero, 0x114
  .L80081C0C:
    /* 71C0C 80081C0C 21200002 */  addu       $a0, $s0, $zero
    /* 71C10 80081C10 21288002 */  addu       $a1, $s4, $zero
    /* 71C14 80081C14 8B67000C */  jal        memcpy
    /* 71C18 80081C18 21306002 */   addu      $a2, $s3, $zero
    /* 71C1C 80081C1C F785000C */  jal        GAL_Unlock
    /* 71C20 80081C20 21202002 */   addu      $a0, $s1, $zero
    /* 71C24 80081C24 FF004230 */  andi       $v0, $v0, 0xFF
    /* 71C28 80081C28 07004014 */  bnez       $v0, .L80081C48
    /* 71C2C 80081C2C 01000224 */   addiu     $v0, $zero, 0x1
    /* 71C30 80081C30 21200000 */  addu       $a0, $zero, $zero
    /* 71C34 80081C34 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71C38 80081C38 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71C3C 80081C3C A583000C */  jal        DBG_Error
    /* 71C40 80081C40 19010624 */   addiu     $a2, $zero, 0x119
    /* 71C44 80081C44 01000224 */  addiu      $v0, $zero, 0x1
  .L80081C48:
    /* 71C48 80081C48 040051AE */  sw         $s1, 0x4($s2)
    /* 71C4C 80081C4C 000042AE */  sw         $v0, 0x0($s2)
    /* 71C50 80081C50 080053AE */  sw         $s3, 0x8($s2)
    /* 71C54 80081C54 2400BF8F */  lw         $ra, 0x24($sp)
    /* 71C58 80081C58 2000B48F */  lw         $s4, 0x20($sp)
    /* 71C5C 80081C5C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 71C60 80081C60 1800B28F */  lw         $s2, 0x18($sp)
    /* 71C64 80081C64 1400B18F */  lw         $s1, 0x14($sp)
    /* 71C68 80081C68 1000B08F */  lw         $s0, 0x10($sp)
    /* 71C6C 80081C6C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 71C70 80081C70 0800E003 */  jr         $ra
    /* 71C74 80081C74 00000000 */   nop
endlabel SetCompData__4AMapPCUci
