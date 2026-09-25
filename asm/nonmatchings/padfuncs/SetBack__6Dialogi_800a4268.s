.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_800a4268, 0x8

glabel SetBack__6Dialogi_800a4268
    /* 94268 800A4268 0800E003 */  jr         $ra
    /* 9426C 800A426C 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_800a4268
