.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPal__7TextDati, 0x1C

glabel GetPal__7TextDati
    /* 276FC 800376FC 80280500 */  sll        $a1, $a1, 2
    /* 27700 80037700 3000828C */  lw         $v0, 0x30($a0)
    /* 27704 80037704 2C00838C */  lw         $v1, 0x2C($a0)
    /* 27708 80037708 2128A200 */  addu       $a1, $a1, $v0
    /* 2770C 8003770C 0000A28C */  lw         $v0, 0x0($a1)
    /* 27710 80037710 0800E003 */  jr         $ra
    /* 27714 80037714 21106200 */   addu      $v0, $v1, $v0
endlabel GetPal__7TextDati
