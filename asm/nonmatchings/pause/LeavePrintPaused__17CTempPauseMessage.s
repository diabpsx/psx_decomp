.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LeavePrintPaused__17CTempPauseMessage, 0x8

glabel LeavePrintPaused__17CTempPauseMessage
    /* 792B8 800892B8 0800E003 */  jr         $ra
    /* 792BC 800892BC 00000000 */   nop
endlabel LeavePrintPaused__17CTempPauseMessage
