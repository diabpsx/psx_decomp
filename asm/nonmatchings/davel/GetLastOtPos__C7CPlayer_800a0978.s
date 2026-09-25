.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLastOtPos__C7CPlayer_800a0978, 0xC

glabel GetLastOtPos__C7CPlayer_800a0978
    /* 90978 800A0978 8C00828C */  lw         $v0, 0x8C($a0)
    /* 9097C 800A097C 0800E003 */  jr         $ra
    /* 90980 800A0980 00000000 */   nop
endlabel GetLastOtPos__C7CPlayer_800a0978
