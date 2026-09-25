.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPAD2, 0xC

glabel StartPAD2
    /* 1E2C 80011E2C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1E30 80011E30 08004001 */  jr         $t2
    /* 1E34 80011E34 13000924 */   addiu     $t1, $zero, 0x13
endlabel StartPAD2
    /* 1E38 80011E38 00000000 */  nop
