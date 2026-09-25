.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadTPage, 0xE8

glabel LoadTPage
    /* 2D7C 80012D7C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 2D80 80012D80 2400B3AF */  sw         $s3, 0x24($sp)
    /* 2D84 80012D84 4000B38F */  lw         $s3, 0x40($sp)
    /* 2D88 80012D88 4400A38F */  lw         $v1, 0x44($sp)
    /* 2D8C 80012D8C 4800A28F */  lw         $v0, 0x48($sp)
    /* 2D90 80012D90 21408000 */  addu       $t0, $a0, $zero
    /* 2D94 80012D94 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2D98 80012D98 2180A000 */  addu       $s0, $a1, $zero
    /* 2D9C 80012D9C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 2DA0 80012DA0 2190C000 */  addu       $s2, $a2, $zero
    /* 2DA4 80012DA4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 2DA8 80012DA8 2188E000 */  addu       $s1, $a3, $zero
    /* 2DAC 80012DAC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 2DB0 80012DB0 1000B1A7 */  sh         $s1, 0x10($sp)
    /* 2DB4 80012DB4 1600A2A7 */  sh         $v0, 0x16($sp)
    /* 2DB8 80012DB8 01000224 */  addiu      $v0, $zero, 0x1
    /* 2DBC 80012DBC 13000212 */  beq        $s0, $v0, .L80012E0C
    /* 2DC0 80012DC0 1200B3A7 */   sh        $s3, 0x12($sp)
    /* 2DC4 80012DC4 0200022A */  slti       $v0, $s0, 0x2
    /* 2DC8 80012DC8 05004010 */  beqz       $v0, .L80012DE0
    /* 2DCC 80012DCC 00000000 */   nop
    /* 2DD0 80012DD0 08000012 */  beqz       $s0, .L80012DF4
    /* 2DD4 80012DD4 1000A427 */   addiu     $a0, $sp, 0x10
    /* 2DD8 80012DD8 8A4B0008 */  j          .L80012E28
    /* 2DDC 80012DDC 00000000 */   nop
  .L80012DE0:
    /* 2DE0 80012DE0 02000224 */  addiu      $v0, $zero, 0x2
    /* 2DE4 80012DE4 0E000212 */  beq        $s0, $v0, .L80012E20
    /* 2DE8 80012DE8 1000A427 */   addiu     $a0, $sp, 0x10
    /* 2DEC 80012DEC 8A4B0008 */  j          .L80012E28
    /* 2DF0 80012DF0 00000000 */   nop
  .L80012DF4:
    /* 2DF4 80012DF4 02006104 */  bgez       $v1, .L80012E00
    /* 2DF8 80012DF8 21106000 */   addu      $v0, $v1, $zero
    /* 2DFC 80012DFC 03006224 */  addiu      $v0, $v1, 0x3
  .L80012E00:
    /* 2E00 80012E00 83100200 */  sra        $v0, $v0, 2
    /* 2E04 80012E04 894B0008 */  j          .L80012E24
    /* 2E08 80012E08 1400A2A7 */   sh        $v0, 0x14($sp)
  .L80012E0C:
    /* 2E0C 80012E0C C2170300 */  srl        $v0, $v1, 31
    /* 2E10 80012E10 21106200 */  addu       $v0, $v1, $v0
    /* 2E14 80012E14 43100200 */  sra        $v0, $v0, 1
    /* 2E18 80012E18 894B0008 */  j          .L80012E24
    /* 2E1C 80012E1C 1400A2A7 */   sh        $v0, 0x14($sp)
  .L80012E20:
    /* 2E20 80012E20 1400A3A7 */  sh         $v1, 0x14($sp)
  .L80012E24:
    /* 2E24 80012E24 1000A427 */  addiu      $a0, $sp, 0x10
  .L80012E28:
    /* 2E28 80012E28 494F000C */  jal        LoadImage
    /* 2E2C 80012E2C 21280001 */   addu      $a1, $t0, $zero
    /* 2E30 80012E30 21200002 */  addu       $a0, $s0, $zero
    /* 2E34 80012E34 21284002 */  addu       $a1, $s2, $zero
    /* 2E38 80012E38 21302002 */  addu       $a2, $s1, $zero
    /* 2E3C 80012E3C 074C000C */  jal        GetTPage
    /* 2E40 80012E40 21386002 */   addu      $a3, $s3, $zero
    /* 2E44 80012E44 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 2E48 80012E48 2800BF8F */  lw         $ra, 0x28($sp)
    /* 2E4C 80012E4C 2400B38F */  lw         $s3, 0x24($sp)
    /* 2E50 80012E50 2000B28F */  lw         $s2, 0x20($sp)
    /* 2E54 80012E54 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2E58 80012E58 1800B08F */  lw         $s0, 0x18($sp)
    /* 2E5C 80012E5C 0800E003 */  jr         $ra
    /* 2E60 80012E60 3000BD27 */   addiu     $sp, $sp, 0x30
endlabel LoadTPage
