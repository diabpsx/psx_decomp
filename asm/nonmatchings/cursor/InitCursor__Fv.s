.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitCursor__Fv, 0x8

glabel InitCursor__Fv
    /* 27734 80037734 0800E003 */  jr         $ra
    /* 27738 80037738 00000000 */   nop
endlabel InitCursor__Fv
