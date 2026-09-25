.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DummyPoll__Fv, 0x8

glabel DummyPoll__Fv
    /* 747C4 800847C4 0800E003 */  jr         $ra
    /* 747C8 800847C8 00000000 */   nop
endlabel DummyPoll__Fv
