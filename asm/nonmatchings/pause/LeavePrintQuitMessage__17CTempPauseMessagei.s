.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LeavePrintQuitMessage__17CTempPauseMessagei, 0x8

glabel LeavePrintQuitMessage__17CTempPauseMessagei
    /* 78FD0 80088FD0 0800E003 */  jr         $ra
    /* 78FD4 80088FD4 00000000 */   nop
endlabel LeavePrintQuitMessage__17CTempPauseMessagei
