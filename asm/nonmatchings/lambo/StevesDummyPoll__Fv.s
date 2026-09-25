.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StevesDummyPoll__Fv, 0x8

glabel StevesDummyPoll__Fv
    /* 85844 80095844 0800E003 */  jr         $ra
    /* 85848 80095848 00000000 */   nop
endlabel StevesDummyPoll__Fv
