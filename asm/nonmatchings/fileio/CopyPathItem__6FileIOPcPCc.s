.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CopyPathItem__6FileIOPcPCc, 0xA8

glabel CopyPathItem__6FileIOPcPCc
    /* 75F0C 80085F0C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 75F10 80085F10 2800B2AF */  sw         $s2, 0x28($sp)
    /* 75F14 80085F14 2190A000 */  addu       $s2, $a1, $zero
    /* 75F18 80085F18 2000B0AF */  sw         $s0, 0x20($sp)
    /* 75F1C 80085F1C 2180C000 */  addu       $s0, $a2, $zero
    /* 75F20 80085F20 00000392 */  lbu        $v1, 0x0($s0)
    /* 75F24 80085F24 00000282 */  lb         $v0, 0x0($s0)
    /* 75F28 80085F28 21280002 */  addu       $a1, $s0, $zero
    /* 75F2C 80085F2C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 75F30 80085F30 0B004010 */  beqz       $v0, .L80085F60
    /* 75F34 80085F34 2400B1AF */   sw        $s1, 0x24($sp)
    /* 75F38 80085F38 3B000424 */  addiu      $a0, $zero, 0x3B
    /* 75F3C 80085F3C 00160300 */  sll        $v0, $v1, 24
  .L80085F40:
    /* 75F40 80085F40 03160200 */  sra        $v0, $v0, 24
    /* 75F44 80085F44 07004410 */  beq        $v0, $a0, .L80085F64
    /* 75F48 80085F48 23880502 */   subu      $s1, $s0, $a1
    /* 75F4C 80085F4C 01001026 */  addiu      $s0, $s0, 0x1
    /* 75F50 80085F50 00000282 */  lb         $v0, 0x0($s0)
    /* 75F54 80085F54 00000392 */  lbu        $v1, 0x0($s0)
    /* 75F58 80085F58 F9FF4014 */  bnez       $v0, .L80085F40
    /* 75F5C 80085F5C 00160300 */   sll       $v0, $v1, 24
  .L80085F60:
    /* 75F60 80085F60 23880502 */  subu       $s1, $s0, $a1
  .L80085F64:
    /* 75F64 80085F64 0B002012 */  beqz       $s1, .L80085F94
    /* 75F68 80085F68 21204002 */   addu      $a0, $s2, $zero
    /* 75F6C 80085F6C 8B67000C */  jal        memcpy
    /* 75F70 80085F70 21302002 */   addu      $a2, $s1, $zero
    /* 75F74 80085F74 00000382 */  lb         $v1, 0x0($s0)
    /* 75F78 80085F78 21105102 */  addu       $v0, $s2, $s1
    /* 75F7C 80085F7C 03006010 */  beqz       $v1, .L80085F8C
    /* 75F80 80085F80 000040A0 */   sb        $zero, 0x0($v0)
    /* 75F84 80085F84 E6170208 */  j          .L80085F98
    /* 75F88 80085F88 01000226 */   addiu     $v0, $s0, 0x1
  .L80085F8C:
    /* 75F8C 80085F8C E6170208 */  j          .L80085F98
    /* 75F90 80085F90 21100002 */   addu      $v0, $s0, $zero
  .L80085F94:
    /* 75F94 80085F94 21100000 */  addu       $v0, $zero, $zero
  .L80085F98:
    /* 75F98 80085F98 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 75F9C 80085F9C 2800B28F */  lw         $s2, 0x28($sp)
    /* 75FA0 80085FA0 2400B18F */  lw         $s1, 0x24($sp)
    /* 75FA4 80085FA4 2000B08F */  lw         $s0, 0x20($sp)
    /* 75FA8 80085FA8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 75FAC 80085FAC 0800E003 */  jr         $ra
    /* 75FB0 80085FB0 00000000 */   nop
endlabel CopyPathItem__6FileIOPcPCc
