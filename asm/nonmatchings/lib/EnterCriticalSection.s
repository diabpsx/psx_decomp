.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching EnterCriticalSection, 0x10

glabel EnterCriticalSection
    /* 198C 8001198C 01000424 */  addiu      $a0, $zero, 0x1
    /* 1990 80011990 0C000000 */  syscall    0 /* handwritten instruction */
    /* 1994 80011994 0800E003 */  jr         $ra
    /* 1998 80011998 00000000 */   nop
endlabel EnterCriticalSection
