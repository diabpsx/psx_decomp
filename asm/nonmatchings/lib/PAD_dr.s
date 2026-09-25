.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PAD_dr, 0xC

glabel PAD_dr
    /* 1AFC 80011AFC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1B00 80011B00 08004001 */  jr         $t2
    /* 1B04 80011B04 16000924 */   addiu     $t1, $zero, 0x16
endlabel PAD_dr
    /* 1B08 80011B08 00000000 */  nop
