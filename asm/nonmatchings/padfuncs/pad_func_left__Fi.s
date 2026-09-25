.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_left__Fi, 0x8

glabel pad_func_left__Fi
    /* 90D88 800A0D88 0800E003 */  jr         $ra
    /* 90D8C 800A0D8C 00000000 */   nop
endlabel pad_func_left__Fi
