.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadPalette__FPCc, 0x8

glabel LoadPalette__FPCc
    /* 6EE64 8007EE64 0800E003 */  jr         $ra
    /* 6EE68 8007EE68 00000000 */   nop
endlabel LoadPalette__FPCc
