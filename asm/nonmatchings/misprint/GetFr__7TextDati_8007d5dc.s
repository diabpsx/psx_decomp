.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_8007d5dc, 0x1C

glabel GetFr__7TextDati_8007d5dc
    /* 6D5DC 8007D5DC FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 6D5E0 8007D5E0 40100500 */  sll        $v0, $a1, 1
    /* 6D5E4 8007D5E4 21104500 */  addu       $v0, $v0, $a1
    /* 6D5E8 8007D5E8 2400838C */  lw         $v1, 0x24($a0)
    /* 6D5EC 8007D5EC 80100200 */  sll        $v0, $v0, 2
    /* 6D5F0 8007D5F0 0800E003 */  jr         $ra
    /* 6D5F4 8007D5F4 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_8007d5dc
