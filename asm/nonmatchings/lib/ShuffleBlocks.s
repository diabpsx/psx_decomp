.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShuffleBlocks, 0x90

glabel ShuffleBlocks
    /* 12D68 80022D68 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 12D6C 80022D6C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 12D70 80022D70 2198C000 */  addu       $s3, $a2, $zero
    /* 12D74 80022D74 1800B2AF */  sw         $s2, 0x18($sp)
    /* 12D78 80022D78 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12D7C 80022D7C 21808000 */  addu       $s0, $a0, $zero
    /* 12D80 80022D80 2000BFAF */  sw         $ra, 0x20($sp)
    /* 12D84 80022D84 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12D88 80022D88 0000B18C */  lw         $s1, 0x0($a1)
    /* 12D8C 80022D8C 11000012 */  beqz       $s0, .L80022DD4
    /* 12D90 80022D90 21900000 */   addu      $s2, $zero, $zero
  .L80022D94:
    /* 12D94 80022D94 0C00068E */  lw         $a2, 0xC($s0)
    /* 12D98 80022D98 0800058E */  lw         $a1, 0x8($s0)
    /* 12D9C 80022D9C 00000000 */  nop
    /* 12DA0 80022DA0 06002512 */  beq        $s1, $a1, .L80022DBC
    /* 12DA4 80022DA4 21904602 */   addu      $s2, $s2, $a2
    /* 12DA8 80022DA8 1400628E */  lw         $v0, 0x14($s3)
    /* 12DAC 80022DAC 00000000 */  nop
    /* 12DB0 80022DB0 09F84000 */  jalr       $v0
    /* 12DB4 80022DB4 21202002 */   addu      $a0, $s1, $zero
    /* 12DB8 80022DB8 080011AE */  sw         $s1, 0x8($s0)
  .L80022DBC:
    /* 12DBC 80022DBC 0800038E */  lw         $v1, 0x8($s0)
    /* 12DC0 80022DC0 0C00028E */  lw         $v0, 0xC($s0)
    /* 12DC4 80022DC4 0400108E */  lw         $s0, 0x4($s0)
    /* 12DC8 80022DC8 00000000 */  nop
    /* 12DCC 80022DCC F1FF0016 */  bnez       $s0, .L80022D94
    /* 12DD0 80022DD0 21886200 */   addu      $s1, $v1, $v0
  .L80022DD4:
    /* 12DD4 80022DD4 21104002 */  addu       $v0, $s2, $zero
    /* 12DD8 80022DD8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 12DDC 80022DDC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 12DE0 80022DE0 1800B28F */  lw         $s2, 0x18($sp)
    /* 12DE4 80022DE4 1400B18F */  lw         $s1, 0x14($sp)
    /* 12DE8 80022DE8 1000B08F */  lw         $s0, 0x10($sp)
    /* 12DEC 80022DEC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 12DF0 80022DF0 0800E003 */  jr         $ra
    /* 12DF4 80022DF4 00000000 */   nop
endlabel ShuffleBlocks
