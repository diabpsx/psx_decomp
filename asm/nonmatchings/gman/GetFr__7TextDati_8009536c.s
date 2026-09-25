.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_8009536c, 0x1C

glabel GetFr__7TextDati_8009536c
    /* 8536C 8009536C FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 85370 80095370 40100500 */  sll        $v0, $a1, 1
    /* 85374 80095374 21104500 */  addu       $v0, $v0, $a1
    /* 85378 80095378 2400838C */  lw         $v1, 0x24($a0)
    /* 8537C 8009537C 80100200 */  sll        $v0, $v0, 2
    /* 85380 80095380 0800E003 */  jr         $ra
    /* 85384 80095384 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_8009536c
