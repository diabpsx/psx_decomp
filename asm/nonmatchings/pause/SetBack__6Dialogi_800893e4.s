.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_800893e4, 0x8

glabel SetBack__6Dialogi_800893e4
    /* 793E4 800893E4 0800E003 */  jr         $ra
    /* 793E8 800893E8 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_800893e4
