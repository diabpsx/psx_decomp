.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawLeftRight__Fv, 0x8

glabel DrawLeftRight__Fv
    /* 97234 800A7234 0800E003 */  jr         $ra
    /* 97238 800A7238 00000000 */   nop
endlabel DrawLeftRight__Fv
