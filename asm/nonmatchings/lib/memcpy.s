.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching memcpy, 0xC

glabel memcpy
    /* 9E2C 80019E2C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* 9E30 80019E30 08004001 */  jr         $t2
    /* 9E34 80019E34 2A000924 */   addiu     $t1, $zero, 0x2A
endlabel memcpy
    /* 9E38 80019E38 00000000 */  nop
