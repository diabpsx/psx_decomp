.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_8004e9ac, 0x8

glabel SetBorder__6Dialogi_8004e9ac
    /* 3E9AC 8004E9AC 0800E003 */  jr         $ra
    /* 3E9B0 8004E9B0 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_8004e9ac
