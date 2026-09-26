.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_8015b898, 0x8

glabel SetBack__6Dialogi_8015b898
    /* 21CA0 8015B898 0800E003 */  jr         $ra
    /* 21CA4 8015B89C 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_8015b898
