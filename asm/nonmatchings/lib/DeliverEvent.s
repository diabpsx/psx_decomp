.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeliverEvent, 0xC

glabel DeliverEvent
    /* 731C 8001731C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 7320 80017320 08004001 */  jr         $t2
    /* 7324 80017324 07000924 */   addiu     $t1, $zero, 0x7
endlabel DeliverEvent
    /* 7328 80017328 00000000 */  nop
