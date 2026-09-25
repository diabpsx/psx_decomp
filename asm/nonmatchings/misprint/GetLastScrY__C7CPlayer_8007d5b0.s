.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLastScrY__C7CPlayer_8007d5b0, 0xC

glabel GetLastScrY__C7CPlayer_8007d5b0
    /* 6D5B0 8007D5B0 8800828C */  lw         $v0, 0x88($a0)
    /* 6D5B4 8007D5B4 0800E003 */  jr         $ra
    /* 6D5B8 8007D5B8 00000000 */   nop
endlabel GetLastScrY__C7CPlayer_8007d5b0
