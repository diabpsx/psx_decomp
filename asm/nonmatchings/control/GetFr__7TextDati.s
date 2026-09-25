.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati, 0x1C

glabel GetFr__7TextDati
    /* 27718 80037718 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 2771C 8003771C 40100500 */  sll        $v0, $a1, 1
    /* 27720 80037720 21104500 */  addu       $v0, $v0, $a1
    /* 27724 80037724 2400838C */  lw         $v1, 0x24($a0)
    /* 27728 80037728 80100200 */  sll        $v0, $v0, 2
    /* 2772C 8003772C 0800E003 */  jr         $ra
    /* 27730 80037730 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati
