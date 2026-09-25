.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching ExitCriticalSection, 0x10

glabel ExitCriticalSection
    /* 199C 8001199C 02000424 */  addiu      $a0, $zero, 0x2
    /* 19A0 800119A0 0C000000 */  syscall    0 /* handwritten instruction */
    /* 19A4 800119A4 0800E003 */  jr         $ra
    /* 19A8 800119A8 00000000 */   nop
endlabel ExitCriticalSection
