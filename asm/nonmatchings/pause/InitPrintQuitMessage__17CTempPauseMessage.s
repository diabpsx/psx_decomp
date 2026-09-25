.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPrintQuitMessage__17CTempPauseMessage, 0x8

glabel InitPrintQuitMessage__17CTempPauseMessage
    /* 78E50 80088E50 0800E003 */  jr         $ra
    /* 78E54 80088E54 00000000 */   nop
endlabel InitPrintQuitMessage__17CTempPauseMessage
