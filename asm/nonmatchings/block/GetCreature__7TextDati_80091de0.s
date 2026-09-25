.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCreature__7TextDati_80091de0, 0x1C

glabel GetCreature__7TextDati_80091de0
    /* 81DE0 80091DE0 80280500 */  sll        $a1, $a1, 2
    /* 81DE4 80091DE4 3400828C */  lw         $v0, 0x34($a0)
    /* 81DE8 80091DE8 3800838C */  lw         $v1, 0x38($a0)
    /* 81DEC 80091DEC 2128A200 */  addu       $a1, $a1, $v0
    /* 81DF0 80091DF0 0000A28C */  lw         $v0, 0x0($a1)
    /* 81DF4 80091DF4 0800E003 */  jr         $ra
    /* 81DF8 80091DF8 21106200 */   addu      $v0, $v1, $v0
endlabel GetCreature__7TextDati_80091de0
