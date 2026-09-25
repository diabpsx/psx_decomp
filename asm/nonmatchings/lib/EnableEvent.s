.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching EnableEvent, 0xC

glabel EnableEvent
    /* 197C 8001197C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1980 80011980 08004001 */  jr         $t2
    /* 1984 80011984 0C000924 */   addiu     $t1, $zero, 0xC
endlabel EnableEvent
    /* 1988 80011988 00000000 */  nop
