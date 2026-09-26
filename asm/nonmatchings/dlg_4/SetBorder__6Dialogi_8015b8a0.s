.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_8015b8a0, 0x8

glabel SetBorder__6Dialogi_8015b8a0
    /* 21CA8 8015B8A0 0800E003 */  jr         $ra
    /* 21CAC 8015B8A4 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_8015b8a0
