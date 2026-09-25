.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCreature__7TextDati, 0x1C

glabel GetCreature__7TextDati
    /* 4FC04 8005FC04 80280500 */  sll        $a1, $a1, 2
    /* 4FC08 8005FC08 3400828C */  lw         $v0, 0x34($a0)
    /* 4FC0C 8005FC0C 3800838C */  lw         $v1, 0x38($a0)
    /* 4FC10 8005FC10 2128A200 */  addu       $a1, $a1, $v0
    /* 4FC14 8005FC14 0000A28C */  lw         $v0, 0x0($a1)
    /* 4FC18 8005FC18 0800E003 */  jr         $ra
    /* 4FC1C 8005FC1C 21106200 */   addu      $v0, $v1, $v0
endlabel GetCreature__7TextDati
