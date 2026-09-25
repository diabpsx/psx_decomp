.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_8009896c, 0x1C

glabel GetFr__7TextDati_8009896c
    /* 8896C 8009896C FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 88970 80098970 40100500 */  sll        $v0, $a1, 1
    /* 88974 80098974 21104500 */  addu       $v0, $v0, $a1
    /* 88978 80098978 2400838C */  lw         $v1, 0x24($a0)
    /* 8897C 8009897C 80100200 */  sll        $v0, $v0, 2
    /* 88980 80098980 0800E003 */  jr         $ra
    /* 88984 80098984 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_8009896c
