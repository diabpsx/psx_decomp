.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPal__7TextDati_80091e1c, 0x1C

glabel GetPal__7TextDati_80091e1c
    /* 81E1C 80091E1C 80280500 */  sll        $a1, $a1, 2
    /* 81E20 80091E20 3000828C */  lw         $v0, 0x30($a0)
    /* 81E24 80091E24 2C00838C */  lw         $v1, 0x2C($a0)
    /* 81E28 80091E28 2128A200 */  addu       $a1, $a1, $v0
    /* 81E2C 80091E2C 0000A28C */  lw         $v0, 0x0($a1)
    /* 81E30 80091E30 0800E003 */  jr         $ra
    /* 81E34 80091E34 21106200 */   addu      $v0, $v1, $v0
endlabel GetPal__7TextDati_80091e1c
