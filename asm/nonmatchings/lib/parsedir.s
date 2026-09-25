.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching parsedir, 0xE4

glabel parsedir
    /* 17C44 80027C44 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 17C48 80027C48 1800B2AF */  sw         $s2, 0x18($sp)
    /* 17C4C 80027C4C 21908000 */  addu       $s2, $a0, $zero
    /* 17C50 80027C50 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 17C54 80027C54 2800B6AF */  sw         $s6, 0x28($sp)
    /* 17C58 80027C58 2400B5AF */  sw         $s5, 0x24($sp)
    /* 17C5C 80027C5C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 17C60 80027C60 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 17C64 80027C64 1400B1AF */  sw         $s1, 0x14($sp)
    /* 17C68 80027C68 1000B0AF */  sw         $s0, 0x10($sp)
    /* 17C6C 80027C6C 00004492 */  lbu        $a0, 0x0($s2)
    /* 17C70 80027C70 2198A000 */  addu       $s3, $a1, $zero
    /* 17C74 80027C74 21A0C000 */  addu       $s4, $a2, $zero
    /* 17C78 80027C78 1D008010 */  beqz       $a0, .L80027CF0
    /* 17C7C 80027C7C 21800000 */   addu      $s0, $zero, $zero
    /* 17C80 80027C80 3A001624 */  addiu      $s6, $zero, 0x3A
    /* 17C84 80027C84 2F001524 */  addiu      $s5, $zero, 0x2F
    /* 17C88 80027C88 21886002 */  addu       $s1, $s3, $zero
    /* 17C8C 80027C8C 2A101402 */  slt        $v0, $s0, $s4
  .L80027C90:
    /* 17C90 80027C90 17004010 */  beqz       $v0, .L80027CF0
    /* 17C94 80027C94 00000000 */   nop
    /* 17C98 80027C98 FF008430 */  andi       $a0, $a0, 0xFF
    /* 17C9C 80027C9C 04009614 */  bne        $a0, $s6, .L80027CB0
    /* 17CA0 80027CA0 01005226 */   addiu     $s2, $s2, 0x1
    /* 17CA4 80027CA4 21886002 */  addu       $s1, $s3, $zero
    /* 17CA8 80027CA8 389F0008 */  j          .L80027CE0
    /* 17CAC 80027CAC 21800000 */   addu      $s0, $zero, $zero
  .L80027CB0:
    /* 17CB0 80027CB0 03009510 */  beq        $a0, $s5, .L80027CC0
    /* 17CB4 80027CB4 5C000224 */   addiu     $v0, $zero, 0x5C
    /* 17CB8 80027CB8 05008214 */  bne        $a0, $v0, .L80027CD0
    /* 17CBC 80027CBC 00000000 */   nop
  .L80027CC0:
    /* 17CC0 80027CC0 0C000016 */  bnez       $s0, .L80027CF4
    /* 17CC4 80027CC4 21107002 */   addu      $v0, $s3, $s0
    /* 17CC8 80027CC8 389F0008 */  j          .L80027CE0
    /* 17CCC 80027CCC 00000000 */   nop
  .L80027CD0:
    /* 17CD0 80027CD0 69A1000C */  jal        toupper
    /* 17CD4 80027CD4 01001026 */   addiu     $s0, $s0, 0x1
    /* 17CD8 80027CD8 000022A2 */  sb         $v0, 0x0($s1)
    /* 17CDC 80027CDC 01003126 */  addiu      $s1, $s1, 0x1
  .L80027CE0:
    /* 17CE0 80027CE0 00004492 */  lbu        $a0, 0x0($s2)
    /* 17CE4 80027CE4 00000000 */  nop
    /* 17CE8 80027CE8 E9FF8014 */  bnez       $a0, .L80027C90
    /* 17CEC 80027CEC 2A101402 */   slt       $v0, $s0, $s4
  .L80027CF0:
    /* 17CF0 80027CF0 21107002 */  addu       $v0, $s3, $s0
  .L80027CF4:
    /* 17CF4 80027CF4 000040A0 */  sb         $zero, 0x0($v0)
    /* 17CF8 80027CF8 21104002 */  addu       $v0, $s2, $zero
    /* 17CFC 80027CFC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 17D00 80027D00 2800B68F */  lw         $s6, 0x28($sp)
    /* 17D04 80027D04 2400B58F */  lw         $s5, 0x24($sp)
    /* 17D08 80027D08 2000B48F */  lw         $s4, 0x20($sp)
    /* 17D0C 80027D0C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 17D10 80027D10 1800B28F */  lw         $s2, 0x18($sp)
    /* 17D14 80027D14 1400B18F */  lw         $s1, 0x14($sp)
    /* 17D18 80027D18 1000B08F */  lw         $s0, 0x10($sp)
    /* 17D1C 80027D1C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 17D20 80027D20 0800E003 */  jr         $ra
    /* 17D24 80027D24 00000000 */   nop
endlabel parsedir
