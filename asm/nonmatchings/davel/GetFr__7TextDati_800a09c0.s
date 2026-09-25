.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFr__7TextDati_800a09c0, 0x1C

glabel GetFr__7TextDati_800a09c0
    /* 909C0 800A09C0 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 909C4 800A09C4 40100500 */  sll        $v0, $a1, 1
    /* 909C8 800A09C8 21104500 */  addu       $v0, $v0, $a1
    /* 909CC 800A09CC 2400838C */  lw         $v1, 0x24($a0)
    /* 909D0 800A09D0 80100200 */  sll        $v0, $v0, 2
    /* 909D4 800A09D4 0800E003 */  jr         $ra
    /* 909D8 800A09D8 21106200 */   addu      $v0, $v1, $v0
endlabel GetFr__7TextDati_800a09c0
