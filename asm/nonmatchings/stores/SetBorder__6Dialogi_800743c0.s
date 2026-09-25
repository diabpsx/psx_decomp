.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_800743c0, 0x8

glabel SetBorder__6Dialogi_800743c0
    /* 643C0 800743C0 0800E003 */  jr         $ra
    /* 643C4 800743C4 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_800743c0
