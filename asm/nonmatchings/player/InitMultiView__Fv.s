.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitMultiView__Fv, 0x8

glabel InitMultiView__Fv
    /* 50C44 80060C44 0800E003 */  jr         $ra
    /* 50C48 80060C48 00000000 */   nop
endlabel InitMultiView__Fv
