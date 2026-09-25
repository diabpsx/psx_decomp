.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RES, 0x4

glabel RES
    /* 238 80010238 00000000 */  nop
endlabel RES
