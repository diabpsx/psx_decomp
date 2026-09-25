.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CompressMap__4AMapRC9CompClass, 0x1C4

glabel CompressMap__4AMapRC9CompClass
    /* 71E28 80081E28 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 71E2C 80081E2C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71E30 80081E30 21808000 */  addu       $s0, $a0, $zero
    /* 71E34 80081E34 2400BFAF */  sw         $ra, 0x24($sp)
    /* 71E38 80081E38 2000B4AF */  sw         $s4, 0x20($sp)
    /* 71E3C 80081E3C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 71E40 80081E40 1800B2AF */  sw         $s2, 0x18($sp)
    /* 71E44 80081E44 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71E48 80081E48 0C00028E */  lw         $v0, 0xC($s0)
    /* 71E4C 80081E4C 00000000 */  nop
    /* 71E50 80081E50 06004010 */  beqz       $v0, .L80081E6C
    /* 71E54 80081E54 2198A000 */   addu      $s3, $a1, $zero
    /* 71E58 80081E58 21200000 */  addu       $a0, $zero, $zero
    /* 71E5C 80081E5C 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71E60 80081E60 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71E64 80081E64 A583000C */  jal        DBG_Error
    /* 71E68 80081E68 6A010624 */   addiu     $a2, $zero, 0x16A
  .L80081E6C:
    /* 71E6C 80081E6C 0000028E */  lw         $v0, 0x0($s0)
    /* 71E70 80081E70 00000000 */  nop
    /* 71E74 80081E74 05004010 */  beqz       $v0, .L80081E8C
    /* 71E78 80081E78 21200000 */   addu      $a0, $zero, $zero
    /* 71E7C 80081E7C 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71E80 80081E80 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71E84 80081E84 A583000C */  jal        DBG_Error
    /* 71E88 80081E88 6B010624 */   addiu     $a2, $zero, 0x16B
  .L80081E8C:
    /* 71E8C 80081E8C 58120424 */  addiu      $a0, $zero, 0x1258
    /* 71E90 80081E90 1280063C */  lui        $a2, %hi(D_8011BCC0)
    /* 71E94 80081E94 C0BCC624 */  addiu      $a2, $a2, %lo(D_8011BCC0)
    /* 71E98 80081E98 7785000C */  jal        GAL_Alloc
    /* 71E9C 80081E9C 01000524 */   addiu     $a1, $zero, 0x1
    /* 71EA0 80081EA0 21904000 */  addu       $s2, $v0, $zero
    /* 71EA4 80081EA4 FFFF1424 */  addiu      $s4, $zero, -0x1
    /* 71EA8 80081EA8 05005416 */  bne        $s2, $s4, .L80081EC0
    /* 71EAC 80081EAC 21200000 */   addu      $a0, $zero, $zero
    /* 71EB0 80081EB0 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71EB4 80081EB4 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71EB8 80081EB8 A583000C */  jal        DBG_Error
    /* 71EBC 80081EBC 74010624 */   addiu     $a2, $zero, 0x174
  .L80081EC0:
    /* 71EC0 80081EC0 DD85000C */  jal        GAL_Lock
    /* 71EC4 80081EC4 21204002 */   addu      $a0, $s2, $zero
    /* 71EC8 80081EC8 21884000 */  addu       $s1, $v0, $zero
    /* 71ECC 80081ECC 06002016 */  bnez       $s1, .L80081EE8
    /* 71ED0 80081ED0 00000000 */   nop
    /* 71ED4 80081ED4 21200000 */  addu       $a0, $zero, $zero
    /* 71ED8 80081ED8 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71EDC 80081EDC 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71EE0 80081EE0 A583000C */  jal        DBG_Error
    /* 71EE4 80081EE4 77010624 */   addiu     $a2, $zero, 0x177
  .L80081EE8:
    /* 71EE8 80081EE8 1E07020C */  jal        GetMap__4AMap
    /* 71EEC 80081EEC 21200002 */   addu      $a0, $s0, $zero
    /* 71EF0 80081EF0 21282002 */  addu       $a1, $s1, $zero
    /* 71EF4 80081EF4 21884000 */  addu       $s1, $v0, $zero
    /* 71EF8 80081EF8 21302002 */  addu       $a2, $s1, $zero
    /* 71EFC 80081EFC 0000638E */  lw         $v1, 0x0($s3)
    /* 71F00 80081F00 58120724 */  addiu      $a3, $zero, 0x1258
    /* 71F04 80081F04 08006484 */  lh         $a0, 0x8($v1)
    /* 71F08 80081F08 0C00628C */  lw         $v0, 0xC($v1)
    /* 71F0C 80081F0C 00000000 */  nop
    /* 71F10 80081F10 09F84000 */  jalr       $v0
    /* 71F14 80081F14 21206402 */   addu      $a0, $s3, $a0
    /* 71F18 80081F18 080002AE */  sw         $v0, 0x8($s0)
    /* 71F1C 80081F1C 59124228 */  slti       $v0, $v0, 0x1259
    /* 71F20 80081F20 05004014 */  bnez       $v0, .L80081F38
    /* 71F24 80081F24 21200000 */   addu      $a0, $zero, $zero
    /* 71F28 80081F28 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71F2C 80081F2C 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71F30 80081F30 A583000C */  jal        DBG_Error
    /* 71F34 80081F34 7E010624 */   addiu     $a2, $zero, 0x17E
  .L80081F38:
    /* 71F38 80081F38 0800048E */  lw         $a0, 0x8($s0)
    /* 71F3C 80081F3C F889000C */  jal        GAL_AlignSizeToType
    /* 71F40 80081F40 01000524 */   addiu     $a1, $zero, 0x1
    /* 71F44 80081F44 21204002 */  addu       $a0, $s2, $zero
    /* 71F48 80081F48 B984000C */  jal        GAL_SplitBlock
    /* 71F4C 80081F4C 21284000 */   addu      $a1, $v0, $zero
    /* 71F50 80081F50 0C005410 */  beq        $v0, $s4, .L80081F84
    /* 71F54 80081F54 21200002 */   addu      $a0, $s0, $zero
    /* 71F58 80081F58 1886000C */  jal        GAL_Free
    /* 71F5C 80081F5C 21204000 */   addu      $a0, $v0, $zero
    /* 71F60 80081F60 FF004230 */  andi       $v0, $v0, 0xFF
    /* 71F64 80081F64 06004014 */  bnez       $v0, .L80081F80
    /* 71F68 80081F68 00000000 */   nop
    /* 71F6C 80081F6C 21200000 */  addu       $a0, $zero, $zero
    /* 71F70 80081F70 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71F74 80081F74 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71F78 80081F78 A583000C */  jal        DBG_Error
    /* 71F7C 80081F7C 88010624 */   addiu     $a2, $zero, 0x188
  .L80081F80:
    /* 71F80 80081F80 21200002 */  addu       $a0, $s0, $zero
  .L80081F84:
    /* 71F84 80081F84 6607020C */  jal        ReleaseMap__4AMapP6DLevel
    /* 71F88 80081F88 21282002 */   addu      $a1, $s1, $zero
    /* 71F8C 80081F8C AA06020C */  jal        Init__4AMap
    /* 71F90 80081F90 21200002 */   addu      $a0, $s0, $zero
    /* 71F94 80081F94 F785000C */  jal        GAL_Unlock
    /* 71F98 80081F98 21204002 */   addu      $a0, $s2, $zero
    /* 71F9C 80081F9C FF004230 */  andi       $v0, $v0, 0xFF
    /* 71FA0 80081FA0 07004014 */  bnez       $v0, .L80081FC0
    /* 71FA4 80081FA4 01000224 */   addiu     $v0, $zero, 0x1
    /* 71FA8 80081FA8 21200000 */  addu       $a0, $zero, $zero
    /* 71FAC 80081FAC 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71FB0 80081FB0 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71FB4 80081FB4 A583000C */  jal        DBG_Error
    /* 71FB8 80081FB8 93010624 */   addiu     $a2, $zero, 0x193
    /* 71FBC 80081FBC 01000224 */  addiu      $v0, $zero, 0x1
  .L80081FC0:
    /* 71FC0 80081FC0 040012AE */  sw         $s2, 0x4($s0)
    /* 71FC4 80081FC4 000002AE */  sw         $v0, 0x0($s0)
    /* 71FC8 80081FC8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 71FCC 80081FCC 2000B48F */  lw         $s4, 0x20($sp)
    /* 71FD0 80081FD0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 71FD4 80081FD4 1800B28F */  lw         $s2, 0x18($sp)
    /* 71FD8 80081FD8 1400B18F */  lw         $s1, 0x14($sp)
    /* 71FDC 80081FDC 1000B08F */  lw         $s0, 0x10($sp)
    /* 71FE0 80081FE0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 71FE4 80081FE4 0800E003 */  jr         $ra
    /* 71FE8 80081FE8 00000000 */   nop
endlabel CompressMap__4AMapRC9CompClass
