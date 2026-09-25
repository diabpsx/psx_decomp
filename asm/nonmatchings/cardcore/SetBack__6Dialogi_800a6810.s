.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_800a6810, 0x8

glabel SetBack__6Dialogi_800a6810
    /* 96810 800A6810 0800E003 */  jr         $ra
    /* 96814 800A6814 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_800a6810
