.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgestreamqueue, 0x78

glabel purgestreamqueue
    /* 1D724 8002D724 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D728 8002D728 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D72C 8002D72C 21808000 */  addu       $s0, $a0, $zero
    /* 1D730 8002D730 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D734 8002D734 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D738 8002D738 7800028E */  lw         $v0, 0x78($s0)
    /* 1D73C 8002D73C 00000000 */  nop
    /* 1D740 8002D740 0C004010 */  beqz       $v0, .L8002D774
    /* 1D744 8002D744 21880000 */   addu      $s1, $zero, $zero
  .L8002D748:
    /* 1D748 8002D748 7800048E */  lw         $a0, 0x78($s0)
    /* 1D74C 8002D74C 00000000 */  nop
    /* 1D750 8002D750 9800828C */  lw         $v0, 0x98($a0)
    /* 1D754 8002D754 00000000 */  nop
    /* 1D758 8002D758 780002AE */  sw         $v0, 0x78($s0)
    /* 1D75C 8002D75C F8BC000C */  jal        putstreamblock
    /* 1D760 8002D760 00000000 */   nop
    /* 1D764 8002D764 7800028E */  lw         $v0, 0x78($s0)
    /* 1D768 8002D768 00000000 */  nop
    /* 1D76C 8002D76C F6FF4014 */  bnez       $v0, .L8002D748
    /* 1D770 8002D770 01003126 */   addiu     $s1, $s1, 0x1
  .L8002D774:
    /* 1D774 8002D774 7800028E */  lw         $v0, 0x78($s0)
    /* 1D778 8002D778 00000000 */  nop
    /* 1D77C 8002D77C 7C0002AE */  sw         $v0, 0x7C($s0)
    /* 1D780 8002D780 21102002 */  addu       $v0, $s1, $zero
    /* 1D784 8002D784 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D788 8002D788 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D78C 8002D78C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D790 8002D790 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D794 8002D794 0800E003 */  jr         $ra
    /* 1D798 8002D798 00000000 */   nop
endlabel purgestreamqueue
