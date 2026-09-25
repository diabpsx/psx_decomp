.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WaitEvent, 0xC

glabel WaitEvent
    /* 8AFC 80018AFC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 8B00 80018B00 08004001 */  jr         $t2
    /* 8B04 80018B04 0A000924 */   addiu     $t1, $zero, 0xA
endlabel WaitEvent
    /* 8B08 80018B08 00000000 */  nop
