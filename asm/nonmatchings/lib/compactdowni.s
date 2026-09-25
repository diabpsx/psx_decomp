.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching compactdowni, 0x184

glabel compactdowni
    /* 1BD70 8002BD70 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1BD74 8002BD74 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1BD78 8002BD78 21888000 */  addu       $s1, $a0, $zero
    /* 1BD7C 8002BD7C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1BD80 8002BD80 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1BD84 8002BD84 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1BD88 8002BD88 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BD8C 8002BD8C 0000238E */  lw         $v1, 0x0($s1)
    /* 1BD90 8002BD90 1000228E */  lw         $v0, 0x10($s1)
    /* 1BD94 8002BD94 2000308E */  lw         $s0, 0x20($s1)
    /* 1BD98 8002BD98 2198A000 */  addu       $s3, $a1, $zero
    /* 1BD9C 8002BD9C 21280000 */  addu       $a1, $zero, $zero
    /* 1BDA0 8002BDA0 21906200 */  addu       $s2, $v1, $v0
    /* 1BDA4 8002BDA4 21880002 */  addu       $s1, $s0, $zero
  .L8002BDA8:
    /* 1BDA8 8002BDA8 21200000 */  addu       $a0, $zero, $zero
  .L8002BDAC:
    /* 1BDAC 8002BDAC 0000038E */  lw         $v1, 0x0($s0)
    /* 1BDB0 8002BDB0 00000000 */  nop
    /* 1BDB4 8002BDB4 2B104302 */  sltu       $v0, $s2, $v1
    /* 1BDB8 8002BDB8 07004014 */  bnez       $v0, .L8002BDD8
    /* 1BDBC 8002BDBC 00000000 */   nop
    /* 1BDC0 8002BDC0 07001312 */  beq        $s0, $s3, .L8002BDE0
    /* 1BDC4 8002BDC4 00000000 */   nop
    /* 1BDC8 8002BDC8 1000028E */  lw         $v0, 0x10($s0)
    /* 1BDCC 8002BDCC 2000108E */  lw         $s0, 0x20($s0)
    /* 1BDD0 8002BDD0 6BAF0008 */  j          .L8002BDAC
    /* 1BDD4 8002BDD4 21906200 */   addu      $s2, $v1, $v0
  .L8002BDD8:
    /* 1BDD8 8002BDD8 23207200 */  subu       $a0, $v1, $s2
    /* 1BDDC 8002BDDC 21880002 */  addu       $s1, $s0, $zero
  .L8002BDE0:
    /* 1BDE0 8002BDE0 26008014 */  bnez       $a0, .L8002BE7C
    /* 1BDE4 8002BDE4 2110A000 */   addu      $v0, $a1, $zero
    /* 1BDE8 8002BDE8 B5AF0008 */  j          .L8002BED4
    /* 1BDEC 8002BDEC 00000000 */   nop
  .L8002BDF0:
    /* 1BDF0 8002BDF0 2000108E */  lw         $s0, 0x20($s0)
    /* 1BDF4 8002BDF4 6BAF0008 */  j          .L8002BDAC
    /* 1BDF8 8002BDF8 21200000 */   addu      $a0, $zero, $zero
  .L8002BDFC:
    /* 1BDFC 8002BDFC 0000248E */  lw         $a0, 0x0($s1)
    /* 1BE00 8002BE00 F1B1000C */  jal        blockmove
    /* 1BE04 8002BE04 21284002 */   addu      $a1, $s2, $zero
    /* 1BE08 8002BE08 2400238E */  lw         $v1, 0x24($s1)
    /* 1BE0C 8002BE0C 2000228E */  lw         $v0, 0x20($s1)
    /* 1BE10 8002BE10 000032AE */  sw         $s2, 0x0($s1)
    /* 1BE14 8002BE14 200062AC */  sw         $v0, 0x20($v1)
    /* 1BE18 8002BE18 2000238E */  lw         $v1, 0x20($s1)
    /* 1BE1C 8002BE1C 2400228E */  lw         $v0, 0x24($s1)
    /* 1BE20 8002BE20 00000000 */  nop
    /* 1BE24 8002BE24 240062AC */  sw         $v0, 0x24($v1)
    /* 1BE28 8002BE28 200030AE */  sw         $s0, 0x20($s1)
    /* 1BE2C 8002BE2C 2400028E */  lw         $v0, 0x24($s0)
    /* 1BE30 8002BE30 00000000 */  nop
    /* 1BE34 8002BE34 240022AE */  sw         $v0, 0x24($s1)
    /* 1BE38 8002BE38 2400028E */  lw         $v0, 0x24($s0)
    /* 1BE3C 8002BE3C 00000000 */  nop
    /* 1BE40 8002BE40 200051AC */  sw         $s1, 0x20($v0)
    /* 1BE44 8002BE44 240011AE */  sw         $s1, 0x24($s0)
    /* 1BE48 8002BE48 1000228E */  lw         $v0, 0x10($s1)
    /* 1BE4C 8002BE4C 01000524 */  addiu      $a1, $zero, 0x1
    /* 1BE50 8002BE50 6AAF0008 */  j          .L8002BDA8
    /* 1BE54 8002BE54 21904202 */   addu      $s2, $s2, $v0
  .L8002BE58:
    /* 1BE58 8002BE58 0000048E */  lw         $a0, 0x0($s0)
    /* 1BE5C 8002BE5C 1000068E */  lw         $a2, 0x10($s0)
    /* 1BE60 8002BE60 F1B1000C */  jal        blockmove
    /* 1BE64 8002BE64 21284002 */   addu      $a1, $s2, $zero
    /* 1BE68 8002BE68 1000028E */  lw         $v0, 0x10($s0)
    /* 1BE6C 8002BE6C 01000524 */  addiu      $a1, $zero, 0x1
    /* 1BE70 8002BE70 000012AE */  sw         $s2, 0x0($s0)
    /* 1BE74 8002BE74 6AAF0008 */  j          .L8002BDA8
    /* 1BE78 8002BE78 21904202 */   addu      $s2, $s2, $v0
  .L8002BE7C:
    /* 1BE7C 8002BE7C 15003312 */  beq        $s1, $s3, .L8002BED4
    /* 1BE80 8002BE80 2110A000 */   addu      $v0, $a1, $zero
    /* 1BE84 8002BE84 1800228E */  lw         $v0, 0x18($s1)
    /* 1BE88 8002BE88 00000000 */  nop
    /* 1BE8C 8002BE8C 18004230 */  andi       $v0, $v0, 0x18
    /* 1BE90 8002BE90 04004014 */  bnez       $v0, .L8002BEA4
    /* 1BE94 8002BE94 00000000 */   nop
    /* 1BE98 8002BE98 2000318E */  lw         $s1, 0x20($s1)
    /* 1BE9C 8002BE9C 9FAF0008 */  j          .L8002BE7C
    /* 1BEA0 8002BEA0 00000000 */   nop
  .L8002BEA4:
    /* 1BEA4 8002BEA4 ECFF3012 */  beq        $s1, $s0, .L8002BE58
    /* 1BEA8 8002BEA8 00000000 */   nop
    /* 1BEAC 8002BEAC 1000268E */  lw         $a2, 0x10($s1)
    /* 1BEB0 8002BEB0 00000000 */  nop
    /* 1BEB4 8002BEB4 2A108600 */  slt        $v0, $a0, $a2
    /* 1BEB8 8002BEB8 D0FF4010 */  beqz       $v0, .L8002BDFC
    /* 1BEBC 8002BEBC 00000000 */   nop
    /* 1BEC0 8002BEC0 0000038E */  lw         $v1, 0x0($s0)
    /* 1BEC4 8002BEC4 1000028E */  lw         $v0, 0x10($s0)
    /* 1BEC8 8002BEC8 C9FF1316 */  bne        $s0, $s3, .L8002BDF0
    /* 1BECC 8002BECC 21906200 */   addu      $s2, $v1, $v0
    /* 1BED0 8002BED0 2110A000 */  addu       $v0, $a1, $zero
  .L8002BED4:
    /* 1BED4 8002BED4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1BED8 8002BED8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1BEDC 8002BEDC 1800B28F */  lw         $s2, 0x18($sp)
    /* 1BEE0 8002BEE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 1BEE4 8002BEE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BEE8 8002BEE8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1BEEC 8002BEEC 0800E003 */  jr         $ra
    /* 1BEF0 8002BEF0 00000000 */   nop
endlabel compactdowni
