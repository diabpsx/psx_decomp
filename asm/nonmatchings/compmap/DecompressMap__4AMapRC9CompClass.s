.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DecompressMap__4AMapRC9CompClass, 0x134

glabel DecompressMap__4AMapRC9CompClass
    /* 71FEC 80081FEC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 71FF0 80081FF0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 71FF4 80081FF4 21888000 */  addu       $s1, $a0, $zero
    /* 71FF8 80081FF8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 71FFC 80081FFC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 72000 80082000 2000B2AF */  sw         $s2, 0x20($sp)
    /* 72004 80082004 1800B0AF */  sw         $s0, 0x18($sp)
    /* 72008 80082008 0C00228E */  lw         $v0, 0xC($s1)
    /* 7200C 8008200C 00000000 */  nop
    /* 72010 80082010 06004010 */  beqz       $v0, .L8008202C
    /* 72014 80082014 2198A000 */   addu      $s3, $a1, $zero
    /* 72018 80082018 21200000 */  addu       $a0, $zero, $zero
    /* 7201C 8008201C 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 72020 80082020 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 72024 80082024 A583000C */  jal        DBG_Error
    /* 72028 80082028 A7010624 */   addiu     $a2, $zero, 0x1A7
  .L8008202C:
    /* 7202C 8008202C 0000228E */  lw         $v0, 0x0($s1)
    /* 72030 80082030 00000000 */  nop
    /* 72034 80082034 07004014 */  bnez       $v0, .L80082054
    /* 72038 80082038 58120424 */   addiu     $a0, $zero, 0x1258
    /* 7203C 8008203C 21200000 */  addu       $a0, $zero, $zero
    /* 72040 80082040 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 72044 80082044 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 72048 80082048 A583000C */  jal        DBG_Error
    /* 7204C 8008204C A8010624 */   addiu     $a2, $zero, 0x1A8
    /* 72050 80082050 58120424 */  addiu      $a0, $zero, 0x1258
  .L80082054:
    /* 72054 80082054 1280063C */  lui        $a2, %hi(D_8011BCC0)
    /* 72058 80082058 C0BCC624 */  addiu      $a2, $a2, %lo(D_8011BCC0)
    /* 7205C 8008205C 7785000C */  jal        GAL_Alloc
    /* 72060 80082060 01000524 */   addiu     $a1, $zero, 0x1
    /* 72064 80082064 21904000 */  addu       $s2, $v0, $zero
    /* 72068 80082068 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 7206C 8008206C 05004216 */  bne        $s2, $v0, .L80082084
    /* 72070 80082070 21200000 */   addu      $a0, $zero, $zero
    /* 72074 80082074 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 72078 80082078 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 7207C 8008207C A583000C */  jal        DBG_Error
    /* 72080 80082080 B2010624 */   addiu     $a2, $zero, 0x1B2
  .L80082084:
    /* 72084 80082084 DD85000C */  jal        GAL_Lock
    /* 72088 80082088 21204002 */   addu      $a0, $s2, $zero
    /* 7208C 8008208C 21804000 */  addu       $s0, $v0, $zero
    /* 72090 80082090 06000016 */  bnez       $s0, .L800820AC
    /* 72094 80082094 00000000 */   nop
    /* 72098 80082098 21200000 */  addu       $a0, $zero, $zero
    /* 7209C 8008209C 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 720A0 800820A0 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 720A4 800820A4 A583000C */  jal        DBG_Error
    /* 720A8 800820A8 B5010624 */   addiu     $a2, $zero, 0x1B5
  .L800820AC:
    /* 720AC 800820AC 1E07020C */  jal        GetMap__4AMap
    /* 720B0 800820B0 21202002 */   addu      $a0, $s1, $zero
    /* 720B4 800820B4 21280002 */  addu       $a1, $s0, $zero
    /* 720B8 800820B8 21804000 */  addu       $s0, $v0, $zero
    /* 720BC 800820BC 21300002 */  addu       $a2, $s0, $zero
    /* 720C0 800820C0 0000638E */  lw         $v1, 0x0($s3)
    /* 720C4 800820C4 0800228E */  lw         $v0, 0x8($s1)
    /* 720C8 800820C8 10006484 */  lh         $a0, 0x10($v1)
    /* 720CC 800820CC 58120724 */  addiu      $a3, $zero, 0x1258
    /* 720D0 800820D0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 720D4 800820D4 1400628C */  lw         $v0, 0x14($v1)
    /* 720D8 800820D8 00000000 */  nop
    /* 720DC 800820DC 09F84000 */  jalr       $v0
    /* 720E0 800820E0 21206402 */   addu      $a0, $s3, $a0
    /* 720E4 800820E4 21202002 */  addu       $a0, $s1, $zero
    /* 720E8 800820E8 6607020C */  jal        ReleaseMap__4AMapP6DLevel
    /* 720EC 800820EC 21280002 */   addu      $a1, $s0, $zero
    /* 720F0 800820F0 AA06020C */  jal        Init__4AMap
    /* 720F4 800820F4 21202002 */   addu      $a0, $s1, $zero
    /* 720F8 800820F8 040032AE */  sw         $s2, 0x4($s1)
    /* 720FC 800820FC 000020AE */  sw         $zero, 0x0($s1)
    /* 72100 80082100 2800BF8F */  lw         $ra, 0x28($sp)
    /* 72104 80082104 2400B38F */  lw         $s3, 0x24($sp)
    /* 72108 80082108 2000B28F */  lw         $s2, 0x20($sp)
    /* 7210C 8008210C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 72110 80082110 1800B08F */  lw         $s0, 0x18($sp)
    /* 72114 80082114 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 72118 80082118 0800E003 */  jr         $ra
    /* 7211C 8008211C 00000000 */   nop
endlabel DecompressMap__4AMapRC9CompClass
