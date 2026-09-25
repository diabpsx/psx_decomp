.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching compactupi, 0x178

glabel compactupi
    /* 1BBA4 8002BBA4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1BBA8 8002BBA8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BBAC 8002BBAC 21808000 */  addu       $s0, $a0, $zero
    /* 1BBB0 8002BBB0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1BBB4 8002BBB4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1BBB8 8002BBB8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1BBBC 8002BBBC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1BBC0 8002BBC0 2400118E */  lw         $s1, 0x24($s0)
    /* 1BBC4 8002BBC4 2198A000 */  addu       $s3, $a1, $zero
    /* 1BBC8 8002BBC8 21400000 */  addu       $t0, $zero, $zero
    /* 1BBCC 8002BBCC 0000058E */  lw         $a1, 0x0($s0)
    /* 1BBD0 8002BBD0 21802002 */  addu       $s0, $s1, $zero
  .L8002BBD4:
    /* 1BBD4 8002BBD4 21380000 */  addu       $a3, $zero, $zero
  .L8002BBD8:
    /* 1BBD8 8002BBD8 0000248E */  lw         $a0, 0x0($s1)
    /* 1BBDC 8002BBDC 1000228E */  lw         $v0, 0x10($s1)
    /* 1BBE0 8002BBE0 00000000 */  nop
    /* 1BBE4 8002BBE4 21188200 */  addu       $v1, $a0, $v0
    /* 1BBE8 8002BBE8 2B106500 */  sltu       $v0, $v1, $a1
    /* 1BBEC 8002BBEC 06004014 */  bnez       $v0, .L8002BC08
    /* 1BBF0 8002BBF0 00000000 */   nop
    /* 1BBF4 8002BBF4 07003312 */  beq        $s1, $s3, .L8002BC14
    /* 1BBF8 8002BBF8 00000000 */   nop
    /* 1BBFC 8002BBFC 2400318E */  lw         $s1, 0x24($s1)
    /* 1BC00 8002BC00 F6AE0008 */  j          .L8002BBD8
    /* 1BC04 8002BC04 21288000 */   addu      $a1, $a0, $zero
  .L8002BC08:
    /* 1BC08 8002BC08 2338A300 */  subu       $a3, $a1, $v1
    /* 1BC0C 8002BC0C 21286000 */  addu       $a1, $v1, $zero
    /* 1BC10 8002BC10 21802002 */  addu       $s0, $s1, $zero
  .L8002BC14:
    /* 1BC14 8002BC14 2400E014 */  bnez       $a3, .L8002BCA8
    /* 1BC18 8002BC18 21100001 */   addu      $v0, $t0, $zero
    /* 1BC1C 8002BC1C 3FAF0008 */  j          .L8002BCFC
    /* 1BC20 8002BC20 00000000 */   nop
  .L8002BC24:
    /* 1BC24 8002BC24 2400318E */  lw         $s1, 0x24($s1)
    /* 1BC28 8002BC28 F6AE0008 */  j          .L8002BBD8
    /* 1BC2C 8002BC2C 21380000 */   addu      $a3, $zero, $zero
  .L8002BC30:
    /* 1BC30 8002BC30 2110A700 */  addu       $v0, $a1, $a3
    /* 1BC34 8002BC34 23904600 */  subu       $s2, $v0, $a2
    /* 1BC38 8002BC38 F1B1000C */  jal        blockmove
    /* 1BC3C 8002BC3C 21284002 */   addu      $a1, $s2, $zero
    /* 1BC40 8002BC40 2400038E */  lw         $v1, 0x24($s0)
    /* 1BC44 8002BC44 2000028E */  lw         $v0, 0x20($s0)
    /* 1BC48 8002BC48 000012AE */  sw         $s2, 0x0($s0)
    /* 1BC4C 8002BC4C 200062AC */  sw         $v0, 0x20($v1)
    /* 1BC50 8002BC50 2000038E */  lw         $v1, 0x20($s0)
    /* 1BC54 8002BC54 2400028E */  lw         $v0, 0x24($s0)
    /* 1BC58 8002BC58 00000000 */  nop
    /* 1BC5C 8002BC5C 240062AC */  sw         $v0, 0x24($v1)
    /* 1BC60 8002BC60 2000228E */  lw         $v0, 0x20($s1)
    /* 1BC64 8002BC64 240011AE */  sw         $s1, 0x24($s0)
    /* 1BC68 8002BC68 200002AE */  sw         $v0, 0x20($s0)
    /* 1BC6C 8002BC6C 2000228E */  lw         $v0, 0x20($s1)
    /* 1BC70 8002BC70 00000000 */  nop
    /* 1BC74 8002BC74 240050AC */  sw         $s0, 0x24($v0)
    /* 1BC78 8002BC78 200030AE */  sw         $s0, 0x20($s1)
    /* 1BC7C 8002BC7C 0000058E */  lw         $a1, 0x0($s0)
    /* 1BC80 8002BC80 F5AE0008 */  j          .L8002BBD4
    /* 1BC84 8002BC84 01000824 */   addiu     $t0, $zero, 0x1
  .L8002BC88:
    /* 1BC88 8002BC88 2110A700 */  addu       $v0, $a1, $a3
    /* 1BC8C 8002BC8C 23904600 */  subu       $s2, $v0, $a2
    /* 1BC90 8002BC90 F1B1000C */  jal        blockmove
    /* 1BC94 8002BC94 21284002 */   addu      $a1, $s2, $zero
    /* 1BC98 8002BC98 000012AE */  sw         $s2, 0x0($s0)
    /* 1BC9C 8002BC9C 21284002 */  addu       $a1, $s2, $zero
    /* 1BCA0 8002BCA0 F5AE0008 */  j          .L8002BBD4
    /* 1BCA4 8002BCA4 01000824 */   addiu     $t0, $zero, 0x1
  .L8002BCA8:
    /* 1BCA8 8002BCA8 14001312 */  beq        $s0, $s3, .L8002BCFC
    /* 1BCAC 8002BCAC 21100001 */   addu      $v0, $t0, $zero
    /* 1BCB0 8002BCB0 1800028E */  lw         $v0, 0x18($s0)
    /* 1BCB4 8002BCB4 00000000 */  nop
    /* 1BCB8 8002BCB8 18004230 */  andi       $v0, $v0, 0x18
    /* 1BCBC 8002BCBC 04004014 */  bnez       $v0, .L8002BCD0
    /* 1BCC0 8002BCC0 00000000 */   nop
    /* 1BCC4 8002BCC4 2400108E */  lw         $s0, 0x24($s0)
    /* 1BCC8 8002BCC8 2AAF0008 */  j          .L8002BCA8
    /* 1BCCC 8002BCCC 00000000 */   nop
  .L8002BCD0:
    /* 1BCD0 8002BCD0 0000048E */  lw         $a0, 0x0($s0)
    /* 1BCD4 8002BCD4 1000068E */  lw         $a2, 0x10($s0)
    /* 1BCD8 8002BCD8 00000000 */  nop
    /* 1BCDC 8002BCDC 21108600 */  addu       $v0, $a0, $a2
    /* 1BCE0 8002BCE0 E9FF4510 */  beq        $v0, $a1, .L8002BC88
    /* 1BCE4 8002BCE4 2A10E600 */   slt       $v0, $a3, $a2
    /* 1BCE8 8002BCE8 D1FF4010 */  beqz       $v0, .L8002BC30
    /* 1BCEC 8002BCEC 00000000 */   nop
    /* 1BCF0 8002BCF0 0000258E */  lw         $a1, 0x0($s1)
    /* 1BCF4 8002BCF4 CBFF3316 */  bne        $s1, $s3, .L8002BC24
    /* 1BCF8 8002BCF8 21100001 */   addu      $v0, $t0, $zero
  .L8002BCFC:
    /* 1BCFC 8002BCFC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1BD00 8002BD00 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1BD04 8002BD04 1800B28F */  lw         $s2, 0x18($sp)
    /* 1BD08 8002BD08 1400B18F */  lw         $s1, 0x14($sp)
    /* 1BD0C 8002BD0C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BD10 8002BD10 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1BD14 8002BD14 0800E003 */  jr         $ra
    /* 1BD18 8002BD18 00000000 */   nop
endlabel compactupi
