.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching read, 0xC

glabel read
    /* 19CC 800119CC B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 19D0 800119D0 08004001 */  jr         $t2
    /* 19D4 800119D4 34000924 */   addiu     $t1, $zero, 0x34
endlabel read
    /* 19D8 800119D8 00000000 */  nop
