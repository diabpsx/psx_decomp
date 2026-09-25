.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeCursor__Fv, 0x8

glabel FreeCursor__Fv
    /* 2773C 8003773C 0800E003 */  jr         $ra
    /* 27740 80037740 00000000 */   nop
endlabel FreeCursor__Fv
