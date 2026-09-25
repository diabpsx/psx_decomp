.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RGBRES, 0x4

glabel RGBRES
    /* 234 80010234 00000000 */  nop
endlabel RGBRES
