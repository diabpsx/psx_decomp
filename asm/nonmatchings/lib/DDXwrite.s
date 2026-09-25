.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXwrite, 0x9C

glabel DDXwrite
    /* 135C0 800235C0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 135C4 800235C4 2400BFAF */  sw         $ra, 0x24($sp)
    /* 135C8 800235C8 2000B2AF */  sw         $s2, 0x20($sp)
    /* 135CC 800235CC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 135D0 800235D0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 135D4 800235D4 21808000 */  addu       $s0, $a0, $zero
    /* 135D8 800235D8 2188C000 */  addu       $s1, $a2, $zero
    /* 135DC 800235DC 03002016 */  bnez       $s1, .L800235EC
    /* 135E0 800235E0 2190A000 */   addu      $s2, $a1, $zero
    /* 135E4 800235E4 908D0008 */  j          .L80023640
    /* 135E8 800235E8 21100000 */   addu      $v0, $zero, $zero
  .L800235EC:
    /* 135EC 800235EC 9B8C000C */  jal        SwapByte
    /* 135F0 800235F0 FE000434 */   ori       $a0, $zero, 0xFE
    /* 135F4 800235F4 9B8C000C */  jal        SwapByte
    /* 135F8 800235F8 77000434 */   ori       $a0, $zero, 0x77
    /* 135FC 800235FC AF8C000C */  jal        PutLong
    /* 13600 80023600 21200002 */   addu      $a0, $s0, $zero
    /* 13604 80023604 AF8C000C */  jal        PutLong
    /* 13608 80023608 21202002 */   addu      $a0, $s1, $zero
    /* 1360C 8002360C 0800201A */  blez       $s1, .L80023630
    /* 13610 80023610 21800000 */   addu      $s0, $zero, $zero
    /* 13614 80023614 21105002 */  addu       $v0, $s2, $s0
  .L80023618:
    /* 13618 80023618 00004490 */  lbu        $a0, 0x0($v0)
    /* 1361C 8002361C 9B8C000C */  jal        SwapByte
    /* 13620 80023620 01001026 */   addiu     $s0, $s0, 0x1
    /* 13624 80023624 2A101102 */  slt        $v0, $s0, $s1
    /* 13628 80023628 FBFF4014 */  bnez       $v0, .L80023618
    /* 1362C 8002362C 21105002 */   addu      $v0, $s2, $s0
  .L80023630:
    /* 13630 80023630 9B8C000C */  jal        SwapByte
    /* 13634 80023634 21200000 */   addu      $a0, $zero, $zero
    /* 13638 80023638 C28C000C */  jal        GetLong
    /* 1363C 8002363C 00000000 */   nop
  .L80023640:
    /* 13640 80023640 2400BF8F */  lw         $ra, 0x24($sp)
    /* 13644 80023644 2000B28F */  lw         $s2, 0x20($sp)
    /* 13648 80023648 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1364C 8002364C 1800B08F */  lw         $s0, 0x18($sp)
    /* 13650 80023650 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 13654 80023654 0800E003 */  jr         $ra
    /* 13658 80023658 00000000 */   nop
endlabel DDXwrite
