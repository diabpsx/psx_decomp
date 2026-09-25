.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _new_card, 0xC

glabel _new_card
    /* A84C 8001A84C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* A850 8001A850 08004001 */  jr         $t2
    /* A854 8001A854 50000924 */   addiu     $t1, $zero, 0x50
endlabel _new_card
    /* A858 8001A858 00000000 */  nop
