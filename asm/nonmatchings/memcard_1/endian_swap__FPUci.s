.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching endian_swap__FPUci, 0x34

glabel endian_swap__FPUci
    /* 8B00 801426F8 0A00A018 */  blez       $a1, .L80142724
    /* 8B04 801426FC 00000000 */   nop
    /* 8B08 80142700 2128A400 */  addu       $a1, $a1, $a0
  .L80142704:
    /* 8B0C 80142704 01008290 */  lbu        $v0, 0x1($a0)
    /* 8B10 80142708 00008390 */  lbu        $v1, 0x0($a0)
    /* 8B14 8014270C 000082A0 */  sb         $v0, 0x0($a0)
    /* 8B18 80142710 010083A0 */  sb         $v1, 0x1($a0)
    /* 8B1C 80142714 02008424 */  addiu      $a0, $a0, 0x2
    /* 8B20 80142718 2A108500 */  slt        $v0, $a0, $a1
    /* 8B24 8014271C F9FF4014 */  bnez       $v0, .L80142704
    /* 8B28 80142720 00000000 */   nop
  .L80142724:
    /* 8B2C 80142724 0800E003 */  jr         $ra
    /* 8B30 80142728 00000000 */   nop
endlabel endian_swap__FPUci
