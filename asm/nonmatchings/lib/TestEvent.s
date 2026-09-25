.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TestEvent, 0xC

glabel TestEvent
    /* 196C 8001196C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1970 80011970 08004001 */  jr         $t2
    /* 1974 80011974 0B000924 */   addiu     $t1, $zero, 0xB
endlabel TestEvent
    /* 1978 80011978 00000000 */  nop
