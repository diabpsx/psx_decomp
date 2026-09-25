.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PAD_init2, 0xC

glabel PAD_init2
    /* 1E4C 80011E4C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1E50 80011E50 08004001 */  jr         $t2
    /* 1E54 80011E54 15000924 */   addiu     $t1, $zero, 0x15
endlabel PAD_init2
    /* 1E58 80011E58 00000000 */  nop
