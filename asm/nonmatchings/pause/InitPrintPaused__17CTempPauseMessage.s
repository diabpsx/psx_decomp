.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPrintPaused__17CTempPauseMessage, 0x8

glabel InitPrintPaused__17CTempPauseMessage
    /* 79160 80089160 0800E003 */  jr         $ra
    /* 79164 80089164 00000000 */   nop
endlabel InitPrintPaused__17CTempPauseMessage
