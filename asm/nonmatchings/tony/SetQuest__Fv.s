.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetQuest__Fv, 0x8

glabel SetQuest__Fv
    /* 8B9B4 8009B9B4 0800E003 */  jr         $ra
    /* 8B9B8 8009B9B8 00000000 */   nop
endlabel SetQuest__Fv
