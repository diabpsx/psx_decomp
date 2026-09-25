.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching snd_update__FUc, 0x8

glabel snd_update__FUc
    /* 67D14 80077D14 0800E003 */  jr         $ra
    /* 67D18 80077D18 00000000 */   nop
endlabel snd_update__FUc
