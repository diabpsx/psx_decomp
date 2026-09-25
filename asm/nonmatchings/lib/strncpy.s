.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strncpy, 0xC

glabel strncpy
    /* 9E0C 80019E0C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 9E10 80019E10 08004001 */  jr         $t2
    /* 9E14 80019E14 1A000924 */   addiu     $t1, $zero, 0x1A
endlabel strncpy
    /* 9E18 80019E18 00000000 */  nop
