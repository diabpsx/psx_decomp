.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ManaTask__FP4TASK, 0x8

glabel ManaTask__FP4TASK
    /* 8B9C4 8009B9C4 0800E003 */  jr         $ra
    /* 8B9C8 8009B9C8 00000000 */   nop
endlabel ManaTask__FP4TASK
