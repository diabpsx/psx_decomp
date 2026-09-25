.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OpenEvent, 0xC

glabel OpenEvent
    /* 195C 8001195C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1960 80011960 08004001 */  jr         $t2
    /* 1964 80011964 08000924 */   addiu     $t1, $zero, 0x8
endlabel OpenEvent
    /* 1968 80011968 00000000 */  nop
