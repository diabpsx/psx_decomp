.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPal__7TextDati_8008d23c, 0x1C

glabel GetPal__7TextDati_8008d23c
    /* 7D23C 8008D23C 80280500 */  sll        $a1, $a1, 2
    /* 7D240 8008D240 3000828C */  lw         $v0, 0x30($a0)
    /* 7D244 8008D244 2C00838C */  lw         $v1, 0x2C($a0)
    /* 7D248 8008D248 2128A200 */  addu       $a1, $a1, $v0
    /* 7D24C 8008D24C 0000A28C */  lw         $v0, 0x0($a1)
    /* 7D250 8008D250 0800E003 */  jr         $ra
    /* 7D254 8008D254 21106200 */   addu      $v0, $v1, $v0
endlabel GetPal__7TextDati_8008d23c
