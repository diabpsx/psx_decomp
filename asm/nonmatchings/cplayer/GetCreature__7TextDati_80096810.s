.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCreature__7TextDati_80096810, 0x1C

glabel GetCreature__7TextDati_80096810
    /* 86810 80096810 80280500 */  sll        $a1, $a1, 2
    /* 86814 80096814 3400828C */  lw         $v0, 0x34($a0)
    /* 86818 80096818 3800838C */  lw         $v1, 0x38($a0)
    /* 8681C 8009681C 2128A200 */  addu       $a1, $a1, $v0
    /* 86820 80096820 0000A28C */  lw         $v0, 0x0($a1)
    /* 86824 80096824 0800E003 */  jr         $ra
    /* 86828 80096828 21106200 */   addu      $v0, $v1, $v0
endlabel GetCreature__7TextDati_80096810
