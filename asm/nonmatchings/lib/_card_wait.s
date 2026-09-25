.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _card_wait, 0xC

glabel _card_wait
    /* A7EC 8001A7EC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* A7F0 8001A7F0 08004001 */  jr         $t2
    /* A7F4 8001A7F4 5D000924 */   addiu     $t1, $zero, 0x5D
endlabel _card_wait
    /* A7F8 8001A7F8 00000000 */  nop
