.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTick__C4CPad_8015b818, 0x28

glabel GetTick__C4CPad_8015b818
    /* 21C20 8015B818 00008290 */  lbu        $v0, 0x0($a0)
    /* 21C24 8015B81C 00000000 */  nop
    /* 21C28 8015B820 04004014 */  bnez       $v0, .L8015B834
    /* 21C2C 8015B824 00000000 */   nop
    /* 21C30 8015B828 0E008294 */  lhu        $v0, 0xE($a0)
    /* 21C34 8015B82C 0E6E0508 */  j          .L8015B838
    /* 21C38 8015B830 00000000 */   nop
  .L8015B834:
    /* 21C3C 8015B834 18008294 */  lhu        $v0, 0x18($a0)
  .L8015B838:
    /* 21C40 8015B838 0800E003 */  jr         $ra
    /* 21C44 8015B83C 00000000 */   nop
endlabel GetTick__C4CPad_8015b818
