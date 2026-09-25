.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _card_info, 0xC

glabel _card_info
    /* A7BC 8001A7BC A0000A24 */  addiu      $t2, $zero, 0xA0
    /* A7C0 8001A7C0 08004001 */  jr         $t2
    /* A7C4 8001A7C4 AB000924 */   addiu     $t1, $zero, 0xAB
endlabel _card_info
    /* A7C8 8001A7C8 00000000 */  nop
