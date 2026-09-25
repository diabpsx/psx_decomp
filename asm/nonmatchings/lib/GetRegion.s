.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetRegion, 0xF8

glabel GetRegion
    /* 12C34 80022C34 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 12C38 80022C38 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 12C3C 80022C3C 21888000 */  addu       $s1, $a0, $zero
    /* 12C40 80022C40 2000B2AF */  sw         $s2, 0x20($sp)
    /* 12C44 80022C44 2190A000 */  addu       $s2, $a1, $zero
    /* 12C48 80022C48 1800B0AF */  sw         $s0, 0x18($sp)
    /* 12C4C 80022C4C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 12C50 80022C50 0000248E */  lw         $a0, 0x0($s1)
    /* 12C54 80022C54 4B8B000C */  jal        FindNextBlock
    /* 12C58 80022C58 2180C000 */   addu      $s0, $a2, $zero
    /* 12C5C 80022C5C 21184000 */  addu       $v1, $v0, $zero
    /* 12C60 80022C60 05006010 */  beqz       $v1, .L80022C78
    /* 12C64 80022C64 00000000 */   nop
    /* 12C68 80022C68 0800628C */  lw         $v0, 0x8($v1)
    /* 12C6C 80022C6C 0C00638C */  lw         $v1, 0xC($v1)
    /* 12C70 80022C70 238B0008 */  j          .L80022C8C
    /* 12C74 80022C74 21104300 */   addu      $v0, $v0, $v1
  .L80022C78:
    /* 12C78 80022C78 0000228E */  lw         $v0, 0x0($s1)
    /* 12C7C 80022C7C 00000000 */  nop
    /* 12C80 80022C80 23004014 */  bnez       $v0, .L80022D10
    /* 12C84 80022C84 21100000 */   addu      $v0, $zero, $zero
    /* 12C88 80022C88 0000028E */  lw         $v0, 0x0($s0)
  .L80022C8C:
    /* 12C8C 80022C8C 00000000 */  nop
    /* 12C90 80022C90 1000A2AF */  sw         $v0, 0x10($sp)
    /* 12C94 80022C94 1000A48F */  lw         $a0, 0x10($sp)
    /* 12C98 80022C98 4B8B000C */  jal        FindNextBlock
    /* 12C9C 80022C9C 21284002 */   addu      $a1, $s2, $zero
    /* 12CA0 80022CA0 05004010 */  beqz       $v0, .L80022CB8
    /* 12CA4 80022CA4 00000000 */   nop
    /* 12CA8 80022CA8 0800428C */  lw         $v0, 0x8($v0)
    /* 12CAC 80022CAC 1000A38F */  lw         $v1, 0x10($sp)
    /* 12CB0 80022CB0 338B0008 */  j          .L80022CCC
    /* 12CB4 80022CB4 23104300 */   subu      $v0, $v0, $v1
  .L80022CB8:
    /* 12CB8 80022CB8 0000028E */  lw         $v0, 0x0($s0)
    /* 12CBC 80022CBC 0400038E */  lw         $v1, 0x4($s0)
    /* 12CC0 80022CC0 1000A48F */  lw         $a0, 0x10($sp)
    /* 12CC4 80022CC4 21104300 */  addu       $v0, $v0, $v1
    /* 12CC8 80022CC8 23104400 */  subu       $v0, $v0, $a0
  .L80022CCC:
    /* 12CCC 80022CCC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 12CD0 80022CD0 21202002 */  addu       $a0, $s1, $zero
    /* 12CD4 80022CD4 E58A000C */  jal        CollideRegions
    /* 12CD8 80022CD8 1000A527 */   addiu     $a1, $sp, 0x10
    /* 12CDC 80022CDC FF004230 */  andi       $v0, $v0, 0xFF
    /* 12CE0 80022CE0 05004010 */  beqz       $v0, .L80022CF8
    /* 12CE4 80022CE4 00000000 */   nop
    /* 12CE8 80022CE8 0000228E */  lw         $v0, 0x0($s1)
    /* 12CEC 80022CEC 00000000 */  nop
    /* 12CF0 80022CF0 07004014 */  bnez       $v0, .L80022D10
    /* 12CF4 80022CF4 21100000 */   addu      $v0, $zero, $zero
  .L80022CF8:
    /* 12CF8 80022CF8 1000A28F */  lw         $v0, 0x10($sp)
    /* 12CFC 80022CFC 00000000 */  nop
    /* 12D00 80022D00 000022AE */  sw         $v0, 0x0($s1)
    /* 12D04 80022D04 1400A38F */  lw         $v1, 0x14($sp)
    /* 12D08 80022D08 01000234 */  ori        $v0, $zero, 0x1
    /* 12D0C 80022D0C 040023AE */  sw         $v1, 0x4($s1)
  .L80022D10:
    /* 12D10 80022D10 2400BF8F */  lw         $ra, 0x24($sp)
    /* 12D14 80022D14 2000B28F */  lw         $s2, 0x20($sp)
    /* 12D18 80022D18 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 12D1C 80022D1C 1800B08F */  lw         $s0, 0x18($sp)
    /* 12D20 80022D20 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 12D24 80022D24 0800E003 */  jr         $ra
    /* 12D28 80022D28 00000000 */   nop
endlabel GetRegion
