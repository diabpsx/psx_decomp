.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching check_update_plr__Fi, 0x8

glabel check_update_plr__Fi
    /* 3FF6C 8004FF6C 0800E003 */  jr         $ra
    /* 3FF70 8004FF70 00000000 */   nop
endlabel check_update_plr__Fi
