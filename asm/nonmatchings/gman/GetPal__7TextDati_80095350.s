.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPal__7TextDati_80095350, 0x1C

glabel GetPal__7TextDati_80095350
    /* 85350 80095350 80280500 */  sll        $a1, $a1, 2
    /* 85354 80095354 3000828C */  lw         $v0, 0x30($a0)
    /* 85358 80095358 2C00838C */  lw         $v1, 0x2C($a0)
    /* 8535C 8009535C 2128A200 */  addu       $a1, $a1, $v0
    /* 85360 80095360 0000A28C */  lw         $v0, 0x0($a1)
    /* 85364 80095364 0800E003 */  jr         $ra
    /* 85368 80095368 21106200 */   addu      $v0, $v1, $v0
endlabel GetPal__7TextDati_80095350
