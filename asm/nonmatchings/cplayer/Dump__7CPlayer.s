.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Dump__7CPlayer, 0x8

glabel Dump__7CPlayer
    /* 864D4 800964D4 0800E003 */  jr         $ra
    /* 864D8 800964D8 00000000 */   nop
endlabel Dump__7CPlayer
