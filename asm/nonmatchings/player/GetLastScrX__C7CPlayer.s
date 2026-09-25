.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLastScrX__C7CPlayer, 0xC

glabel GetLastScrX__C7CPlayer
    /* 574A8 800674A8 8400828C */  lw         $v0, 0x84($a0)
    /* 574AC 800674AC 0800E003 */  jr         $ra
    /* 574B0 800674B0 00000000 */   nop
endlabel GetLastScrX__C7CPlayer
