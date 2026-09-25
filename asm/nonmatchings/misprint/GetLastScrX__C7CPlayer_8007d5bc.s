.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLastScrX__C7CPlayer_8007d5bc, 0xC

glabel GetLastScrX__C7CPlayer_8007d5bc
    /* 6D5BC 8007D5BC 8400828C */  lw         $v0, 0x84($a0)
    /* 6D5C0 8007D5C0 0800E003 */  jr         $ra
    /* 6D5C4 8007D5C4 00000000 */   nop
endlabel GetLastScrX__C7CPlayer_8007d5bc
