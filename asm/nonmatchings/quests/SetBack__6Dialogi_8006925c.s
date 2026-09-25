.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_8006925c, 0x8

glabel SetBack__6Dialogi_8006925c
    /* 5925C 8006925C 0800E003 */  jr         $ra
    /* 59260 80069260 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_8006925c
