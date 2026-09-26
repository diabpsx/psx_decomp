.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_80161e78, 0x8

glabel SetBack__6Dialogi_80161e78
    /* 28280 80161E78 0800E003 */  jr         $ra
    /* 28284 80161E7C 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_80161e78
