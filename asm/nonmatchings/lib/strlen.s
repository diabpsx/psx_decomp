.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strlen, 0xC

glabel strlen
    /* 9E1C 80019E1C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 9E20 80019E20 08004001 */  jr         $t2
    /* 9E24 80019E24 1B000924 */   addiu     $t1, $zero, 0x1B
endlabel strlen
    /* 9E28 80019E28 00000000 */  nop
