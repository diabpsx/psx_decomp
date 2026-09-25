.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching GTE_SetTransXYZ, 0x14

glabel GTE_SetTransXYZ
    /* C 8001000C 0028C448 */  ctc2       $a0, $5 /* handwritten instruction */
    /* 10 80010010 0030C548 */  ctc2       $a1, $6 /* handwritten instruction */
    /* 14 80010014 0038C648 */  ctc2       $a2, $7 /* handwritten instruction */
    /* 18 80010018 0800E003 */  jr         $ra
    /* 1C 8001001C 00000000 */   nop
endlabel GTE_SetTransXYZ
