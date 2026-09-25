.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setstreamspeed, 0x8

glabel setstreamspeed
    /* 1CF00 8002CF00 0800E003 */  jr         $ra
    /* 1CF04 8002CF04 21100000 */   addu      $v0, $zero, $zero
endlabel setstreamspeed
