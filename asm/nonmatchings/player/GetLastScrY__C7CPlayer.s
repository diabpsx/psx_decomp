.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLastScrY__C7CPlayer, 0xC

glabel GetLastScrY__C7CPlayer
    /* 5749C 8006749C 8800828C */  lw         $v0, 0x88($a0)
    /* 574A0 800674A0 0800E003 */  jr         $ra
    /* 574A4 800674A4 00000000 */   nop
endlabel GetLastScrY__C7CPlayer
