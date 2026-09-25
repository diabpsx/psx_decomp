.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitHeap, 0xC

glabel InitHeap
    /* 192C 8001192C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 1930 80011930 08004001 */  jr         $t2
    /* 1934 80011934 39000924 */   addiu     $t1, $zero, 0x39
endlabel InitHeap
    /* 1938 80011938 00000000 */  nop
