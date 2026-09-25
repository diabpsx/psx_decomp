.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_right__Fi, 0x8

glabel pad_func_right__Fi
    /* 90D90 800A0D90 0800E003 */  jr         $ra
    /* 90D94 800A0D94 00000000 */   nop
endlabel pad_func_right__Fi
