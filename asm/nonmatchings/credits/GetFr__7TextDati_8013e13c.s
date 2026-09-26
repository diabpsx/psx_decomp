.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_8013e13c, 0x1C

glabel GetFr__7TextDati_8013e13c
    /* 4544 8013E13C FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 4548 8013E140 40100500 */  sll        $v0, $a1, 1
    /* 454C 8013E144 21104500 */  addu       $v0, $v0, $a1
    /* 4550 8013E148 2400838C */  lw         $v1, 0x24($a0)
    /* 4554 8013E14C 80100200 */  sll        $v0, $v0, 2
    /* 4558 8013E150 0800E003 */  jr         $ra
    /* 455C 8013E154 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_8013e13c
