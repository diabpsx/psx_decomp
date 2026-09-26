.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_8015b840, 0x28

glabel GetDown__C4CPad_8015b840
    /* 21C48 8015B840 00008290 */  lbu        $v0, 0x0($a0)
    /* 21C4C 8015B844 00000000 */  nop
    /* 21C50 8015B848 04004014 */  bnez       $v0, .L8015B85C
    /* 21C54 8015B84C 00000000 */   nop
    /* 21C58 8015B850 0C008294 */  lhu        $v0, 0xC($a0)
    /* 21C5C 8015B854 186E0508 */  j          .L8015B860
    /* 21C60 8015B858 00000000 */   nop
  .L8015B85C:
    /* 21C64 8015B85C 16008294 */  lhu        $v0, 0x16($a0)
  .L8015B860:
    /* 21C68 8015B860 0800E003 */  jr         $ra
    /* 21C6C 8015B864 00000000 */   nop
endlabel GetDown__C4CPad_8015b840
