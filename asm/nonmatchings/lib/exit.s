.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching exit, 0xC

glabel exit
    /* 1F77C 8002F77C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1F780 8002F780 08004001 */  jr         $t2
    /* 1F784 8002F784 38000924 */   addiu     $t1, $zero, 0x38
endlabel exit
    /* 1F788 8002F788 00000000 */  nop
