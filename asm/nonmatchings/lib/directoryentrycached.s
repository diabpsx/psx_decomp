.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching directoryentrycached, 0xD8

glabel directoryentrycached
    /* 17F04 80027F04 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 17F08 80027F08 2400B3AF */  sw         $s3, 0x24($sp)
    /* 17F0C 80027F0C 2198A000 */  addu       $s3, $a1, $zero
    /* 17F10 80027F10 2800B4AF */  sw         $s4, 0x28($sp)
    /* 17F14 80027F14 21A0C000 */  addu       $s4, $a2, $zero
    /* 17F18 80027F18 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 17F1C 80027F1C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 17F20 80027F20 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 17F24 80027F24 4A9F000C */  jal        basefilename
    /* 17F28 80027F28 1800B0AF */   sw        $s0, 0x18($sp)
    /* 17F2C 80027F2C 6C1C838F */  lw         $v1, %gp_rel(cachefiles)($gp)
    /* 17F30 80027F30 21880000 */  addu       $s1, $zero, $zero
    /* 17F34 80027F34 1F006018 */  blez       $v1, .L80027FB4
    /* 17F38 80027F38 21904000 */   addu      $s2, $v0, $zero
    /* 17F3C 80027F3C 21800000 */  addu       $s0, $zero, $zero
  .L80027F40:
    /* 17F40 80027F40 3423828F */  lw         $v0, %gp_rel(cachefile)($gp)
    /* 17F44 80027F44 00000000 */  nop
    /* 17F48 80027F48 21280202 */  addu       $a1, $s0, $v0
    /* 17F4C 80027F4C 0C00A28C */  lw         $v0, 0xC($a1)
    /* 17F50 80027F50 00000000 */  nop
    /* 17F54 80027F54 17004010 */  beqz       $v0, .L80027FB4
    /* 17F58 80027F58 21204002 */   addu      $a0, $s2, $zero
    /* 17F5C 80027F5C 4375000C */  jal        strncmp
    /* 17F60 80027F60 0C000624 */   addiu     $a2, $zero, 0xC
    /* 17F64 80027F64 0E004014 */  bnez       $v0, .L80027FA0
    /* 17F68 80027F68 01003126 */   addiu     $s1, $s1, 0x1
    /* 17F6C 80027F6C 3423828F */  lw         $v0, %gp_rel(cachefile)($gp)
    /* 17F70 80027F70 00000000 */  nop
    /* 17F74 80027F74 21100202 */  addu       $v0, $s0, $v0
    /* 17F78 80027F78 0C00428C */  lw         $v0, 0xC($v0)
    /* 17F7C 80027F7C 00000000 */  nop
    /* 17F80 80027F80 000062AE */  sw         $v0, 0x0($s3)
    /* 17F84 80027F84 3423828F */  lw         $v0, %gp_rel(cachefile)($gp)
    /* 17F88 80027F88 00000000 */  nop
    /* 17F8C 80027F8C 21100202 */  addu       $v0, $s0, $v0
    /* 17F90 80027F90 1000438C */  lw         $v1, 0x10($v0)
    /* 17F94 80027F94 01000224 */  addiu      $v0, $zero, 0x1
    /* 17F98 80027F98 EE9F0008 */  j          .L80027FB8
    /* 17F9C 80027F9C 000083AE */   sw        $v1, 0x0($s4)
  .L80027FA0:
    /* 17FA0 80027FA0 6C1C828F */  lw         $v0, %gp_rel(cachefiles)($gp)
    /* 17FA4 80027FA4 00000000 */  nop
    /* 17FA8 80027FA8 2A102202 */  slt        $v0, $s1, $v0
    /* 17FAC 80027FAC E4FF4014 */  bnez       $v0, .L80027F40
    /* 17FB0 80027FB0 14001026 */   addiu     $s0, $s0, 0x14
  .L80027FB4:
    /* 17FB4 80027FB4 21100000 */  addu       $v0, $zero, $zero
  .L80027FB8:
    /* 17FB8 80027FB8 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 17FBC 80027FBC 2800B48F */  lw         $s4, 0x28($sp)
    /* 17FC0 80027FC0 2400B38F */  lw         $s3, 0x24($sp)
    /* 17FC4 80027FC4 2000B28F */  lw         $s2, 0x20($sp)
    /* 17FC8 80027FC8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 17FCC 80027FCC 1800B08F */  lw         $s0, 0x18($sp)
    /* 17FD0 80027FD0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 17FD4 80027FD4 0800E003 */  jr         $ra
    /* 17FD8 80027FD8 00000000 */   nop
endlabel directoryentrycached
