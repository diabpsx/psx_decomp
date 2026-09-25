.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_8008ad74, 0x1C

glabel GetFr__7TextDati_8008ad74
    /* 7AD74 8008AD74 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 7AD78 8008AD78 40100500 */  sll        $v0, $a1, 1
    /* 7AD7C 8008AD7C 21104500 */  addu       $v0, $v0, $a1
    /* 7AD80 8008AD80 2400838C */  lw         $v1, 0x24($a0)
    /* 7AD84 8008AD84 80100200 */  sll        $v0, $v0, 2
    /* 7AD88 8008AD88 0800E003 */  jr         $ra
    /* 7AD8C 8008AD8C 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_8008ad74
