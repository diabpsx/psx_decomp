.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTexId__7CPlayer, 0xC

glabel GetTexId__7CPlayer
    /* 8C520 8009C520 8000828C */  lw         $v0, 0x80($a0)
    /* 8C524 8009C524 0800E003 */  jr         $ra
    /* 8C528 8009C528 00000000 */   nop
endlabel GetTexId__7CPlayer
