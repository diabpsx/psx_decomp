.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_800adf80, 0x1C

glabel GetFr__7TextDati_800adf80
    /* 9DF80 800ADF80 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 9DF84 800ADF84 40100500 */  sll        $v0, $a1, 1
    /* 9DF88 800ADF88 21104500 */  addu       $v0, $v0, $a1
    /* 9DF8C 800ADF8C 2400838C */  lw         $v1, 0x24($a0)
    /* 9DF90 800ADF90 80100200 */  sll        $v0, $v0, 2
    /* 9DF94 800ADF94 0800E003 */  jr         $ra
    /* 9DF98 800ADF98 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_800adf80
