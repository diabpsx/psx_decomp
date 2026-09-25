.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_800ab694, 0x1C

glabel GetFr__7TextDati_800ab694
    /* 9B694 800AB694 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 9B698 800AB698 40100500 */  sll        $v0, $a1, 1
    /* 9B69C 800AB69C 21104500 */  addu       $v0, $v0, $a1
    /* 9B6A0 800AB6A0 2400838C */  lw         $v1, 0x24($a0)
    /* 9B6A4 800AB6A4 80100200 */  sll        $v0, $v0, 2
    /* 9B6A8 800AB6A8 0800E003 */  jr         $ra
    /* 9B6AC 800AB6AC 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_800ab694
