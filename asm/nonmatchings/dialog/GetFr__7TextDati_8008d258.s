.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_8008d258, 0x1C

glabel GetFr__7TextDati_8008d258
    /* 7D258 8008D258 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 7D25C 8008D25C 40100500 */  sll        $v0, $a1, 1
    /* 7D260 8008D260 21104500 */  addu       $v0, $v0, $a1
    /* 7D264 8008D264 2400838C */  lw         $v1, 0x24($a0)
    /* 7D268 8008D268 80100200 */  sll        $v0, $v0, 2
    /* 7D26C 8008D26C 0800E003 */  jr         $ra
    /* 7D270 8008D270 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_8008d258
