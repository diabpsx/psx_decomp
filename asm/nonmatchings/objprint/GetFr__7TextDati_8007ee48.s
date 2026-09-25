.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_8007ee48, 0x1C

glabel GetFr__7TextDati_8007ee48
    /* 6EE48 8007EE48 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 6EE4C 8007EE4C 40100500 */  sll        $v0, $a1, 1
    /* 6EE50 8007EE50 21104500 */  addu       $v0, $v0, $a1
    /* 6EE54 8007EE54 2400838C */  lw         $v1, 0x24($a0)
    /* 6EE58 8007EE58 80100200 */  sll        $v0, $v0, 2
    /* 6EE5C 8007EE5C 0800E003 */  jr         $ra
    /* 6EE60 8007EE60 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_8007ee48
