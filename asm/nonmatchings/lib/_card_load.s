.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _card_load, 0xC

glabel _card_load
    /* A7CC 8001A7CC A0000A24 */  addiu      $t2, $zero, 0xA0
    /* A7D0 8001A7D0 08004001 */  jr         $t2
    /* A7D4 8001A7D4 AC000924 */   addiu     $t1, $zero, 0xAC
endlabel _card_load
    /* A7D8 8001A7D8 00000000 */  nop
