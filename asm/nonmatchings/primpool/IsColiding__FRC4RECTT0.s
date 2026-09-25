.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsColiding__FRC4RECTT0, 0x68

glabel IsColiding__FRC4RECTT0
    /* 73FC8 80083FC8 0000A684 */  lh         $a2, 0x0($a1)
    /* 73FCC 80083FCC 0400A284 */  lh         $v0, 0x4($a1)
    /* 73FD0 80083FD0 00008384 */  lh         $v1, 0x0($a0)
    /* 73FD4 80083FD4 2110C200 */  addu       $v0, $a2, $v0
    /* 73FD8 80083FD8 2A106200 */  slt        $v0, $v1, $v0
    /* 73FDC 80083FDC 12004010 */  beqz       $v0, .L80084028
    /* 73FE0 80083FE0 21100000 */   addu      $v0, $zero, $zero
    /* 73FE4 80083FE4 04008284 */  lh         $v0, 0x4($a0)
    /* 73FE8 80083FE8 00000000 */  nop
    /* 73FEC 80083FEC 21106200 */  addu       $v0, $v1, $v0
    /* 73FF0 80083FF0 2A10C200 */  slt        $v0, $a2, $v0
    /* 73FF4 80083FF4 0C004010 */  beqz       $v0, .L80084028
    /* 73FF8 80083FF8 21100000 */   addu      $v0, $zero, $zero
    /* 73FFC 80083FFC 0200A684 */  lh         $a2, 0x2($a1)
    /* 74000 80084000 0600A284 */  lh         $v0, 0x6($a1)
    /* 74004 80084004 02008384 */  lh         $v1, 0x2($a0)
    /* 74008 80084008 2110C200 */  addu       $v0, $a2, $v0
    /* 7400C 8008400C 2A106200 */  slt        $v0, $v1, $v0
    /* 74010 80084010 05004010 */  beqz       $v0, .L80084028
    /* 74014 80084014 21100000 */   addu      $v0, $zero, $zero
    /* 74018 80084018 06008284 */  lh         $v0, 0x6($a0)
    /* 7401C 8008401C 00000000 */  nop
    /* 74020 80084020 21106200 */  addu       $v0, $v1, $v0
    /* 74024 80084024 2A10C200 */  slt        $v0, $a2, $v0
  .L80084028:
    /* 74028 80084028 0800E003 */  jr         $ra
    /* 7402C 8008402C 00000000 */   nop
endlabel IsColiding__FRC4RECTT0
