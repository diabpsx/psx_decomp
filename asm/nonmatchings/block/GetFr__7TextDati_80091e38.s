.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_80091e38, 0x1C

glabel GetFr__7TextDati_80091e38
    /* 81E38 80091E38 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 81E3C 80091E3C 40100500 */  sll        $v0, $a1, 1
    /* 81E40 80091E40 21104500 */  addu       $v0, $v0, $a1
    /* 81E44 80091E44 2400838C */  lw         $v1, 0x24($a0)
    /* 81E48 80091E48 80100200 */  sll        $v0, $v0, 2
    /* 81E4C 80091E4C 0800E003 */  jr         $ra
    /* 81E50 80091E50 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_80091e38
