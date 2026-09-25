.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching printf, 0xC

glabel printf
    /* 9E4C 80019E4C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 9E50 80019E50 08004001 */  jr         $t2
    /* 9E54 80019E54 3F000924 */   addiu     $t1, $zero, 0x3F
endlabel printf
    /* 9E58 80019E58 00000000 */  nop
