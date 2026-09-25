.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PCinit, 0xC

glabel PCinit
    /* 10A0 800110A0 4D400000 */  break      0, 257
    /* 10A4 800110A4 0800E003 */  jr         $ra
    /* 10A8 800110A8 00000000 */   nop
endlabel PCinit
