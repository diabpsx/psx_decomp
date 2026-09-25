.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi, 0x8

glabel SetBack__6Dialogi
    /* 27634 80037634 0800E003 */  jr         $ra
    /* 27638 80037638 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi
