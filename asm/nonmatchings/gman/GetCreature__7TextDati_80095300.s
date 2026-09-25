.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCreature__7TextDati_80095300, 0x1C

glabel GetCreature__7TextDati_80095300
    /* 85300 80095300 80280500 */  sll        $a1, $a1, 2
    /* 85304 80095304 3400828C */  lw         $v0, 0x34($a0)
    /* 85308 80095308 3800838C */  lw         $v1, 0x38($a0)
    /* 8530C 8009530C 2128A200 */  addu       $a1, $a1, $v0
    /* 85310 80095310 0000A28C */  lw         $v0, 0x0($a1)
    /* 85314 80095314 0800E003 */  jr         $ra
    /* 85318 80095318 21106200 */   addu      $v0, $v1, $v0
endlabel GetCreature__7TextDati_80095300
