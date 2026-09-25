.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _card_read, 0xC

glabel _card_read
    /* A7DC 8001A7DC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* A7E0 8001A7E0 08004001 */  jr         $t2
    /* A7E4 8001A7E4 4F000924 */   addiu     $t1, $zero, 0x4F
endlabel _card_read
    /* A7E8 8001A7E8 00000000 */  nop
