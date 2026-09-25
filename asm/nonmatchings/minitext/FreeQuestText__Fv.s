.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeQuestText__Fv, 0x8

glabel FreeQuestText__Fv
    /* 3D95C 8004D95C 0800E003 */  jr         $ra
    /* 3D960 8004D960 00000000 */   nop
endlabel FreeQuestText__Fv
