.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _card_write, 0xC

glabel _card_write
    /* A83C 8001A83C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* A840 8001A840 08004001 */  jr         $t2
    /* A844 8001A844 4E000924 */   addiu     $t1, $zero, 0x4E
endlabel _card_write
    /* A848 8001A848 00000000 */  nop
