.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching plr_encrypt__FUc, 0x8

glabel plr_encrypt__FUc
    /* 29EC0 80039EC0 0800E003 */  jr         $ra
    /* 29EC4 80039EC4 00000000 */   nop
endlabel plr_encrypt__FUc
