.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPAD2, 0xC

glabel InitPAD2
    /* 1E1C 80011E1C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1E20 80011E20 08004001 */  jr         $t2
    /* 1E24 80011E24 12000924 */   addiu     $t1, $zero, 0x12
endlabel InitPAD2
    /* 1E28 80011E28 00000000 */  nop
