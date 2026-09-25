.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_800a4f24, 0x8

glabel SetBack__6Dialogi_800a4f24
    /* 94F24 800A4F24 0800E003 */  jr         $ra
    /* 94F28 800A4F28 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_800a4f24
