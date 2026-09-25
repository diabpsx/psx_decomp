.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DaveLDummyPoll__Fv, 0x8

glabel DaveLDummyPoll__Fv
    /* 8E3F4 8009E3F4 0800E003 */  jr         $ra
    /* 8E3F8 8009E3F8 00000000 */   nop
endlabel DaveLDummyPoll__Fv
