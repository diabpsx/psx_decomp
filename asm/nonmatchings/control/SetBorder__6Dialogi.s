.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi, 0x8

glabel SetBorder__6Dialogi
    /* 2763C 8003763C 0800E003 */  jr         $ra
    /* 27640 80037640 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi
