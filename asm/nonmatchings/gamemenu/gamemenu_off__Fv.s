.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching gamemenu_off__Fv, 0x8

glabel gamemenu_off__Fv
    /* 727D0 800827D0 0800E003 */  jr         $ra
    /* 727D4 800827D4 00000000 */   nop
endlabel gamemenu_off__Fv
