.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDefDrawEnv, 0xB4

glabel SetDefDrawEnv
    /* 2F2C 80012F2C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2F30 80012F30 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2F34 80012F34 3800B28F */  lw         $s2, 0x38($sp)
    /* 2F38 80012F38 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2F3C 80012F3C 21888000 */  addu       $s1, $a0, $zero
    /* 2F40 80012F40 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 2F44 80012F44 2198A000 */  addu       $s3, $a1, $zero
    /* 2F48 80012F48 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2F4C 80012F4C 21A0C000 */  addu       $s4, $a2, $zero
    /* 2F50 80012F50 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2F54 80012F54 2400BFAF */  sw         $ra, 0x24($sp)
    /* 2F58 80012F58 584B000C */  jal        GetVideoMode
    /* 2F5C 80012F5C 2180E000 */   addu      $s0, $a3, $zero
    /* 2F60 80012F60 01000324 */  addiu      $v1, $zero, 0x1
    /* 2F64 80012F64 000033A6 */  sh         $s3, 0x0($s1)
    /* 2F68 80012F68 020034A6 */  sh         $s4, 0x2($s1)
    /* 2F6C 80012F6C 040030A6 */  sh         $s0, 0x4($s1)
    /* 2F70 80012F70 0C0020A6 */  sh         $zero, 0xC($s1)
    /* 2F74 80012F74 0E0020A6 */  sh         $zero, 0xE($s1)
    /* 2F78 80012F78 100020A6 */  sh         $zero, 0x10($s1)
    /* 2F7C 80012F7C 120020A6 */  sh         $zero, 0x12($s1)
    /* 2F80 80012F80 190020A2 */  sb         $zero, 0x19($s1)
    /* 2F84 80012F84 1A0020A2 */  sb         $zero, 0x1A($s1)
    /* 2F88 80012F88 1B0020A2 */  sb         $zero, 0x1B($s1)
    /* 2F8C 80012F8C 160023A2 */  sb         $v1, 0x16($s1)
    /* 2F90 80012F90 03004010 */  beqz       $v0, .L80012FA0
    /* 2F94 80012F94 060032A6 */   sh        $s2, 0x6($s1)
    /* 2F98 80012F98 E94B0008 */  j          .L80012FA4
    /* 2F9C 80012F9C 2101422A */   slti      $v0, $s2, 0x121
  .L80012FA0:
    /* 2FA0 80012FA0 0101422A */  slti       $v0, $s2, 0x101
  .L80012FA4:
    /* 2FA4 80012FA4 170022A2 */  sb         $v0, 0x17($s1)
    /* 2FA8 80012FA8 21102002 */  addu       $v0, $s1, $zero
    /* 2FAC 80012FAC 0A000324 */  addiu      $v1, $zero, 0xA
    /* 2FB0 80012FB0 080053A4 */  sh         $s3, 0x8($v0)
    /* 2FB4 80012FB4 0A0054A4 */  sh         $s4, 0xA($v0)
    /* 2FB8 80012FB8 140043A4 */  sh         $v1, 0x14($v0)
    /* 2FBC 80012FBC 180040A0 */  sb         $zero, 0x18($v0)
    /* 2FC0 80012FC0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 2FC4 80012FC4 2000B48F */  lw         $s4, 0x20($sp)
    /* 2FC8 80012FC8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 2FCC 80012FCC 1800B28F */  lw         $s2, 0x18($sp)
    /* 2FD0 80012FD0 1400B18F */  lw         $s1, 0x14($sp)
    /* 2FD4 80012FD4 1000B08F */  lw         $s0, 0x10($sp)
    /* 2FD8 80012FD8 0800E003 */  jr         $ra
    /* 2FDC 80012FDC 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel SetDefDrawEnv
