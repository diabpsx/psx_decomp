.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_800aefd0, 0x8

glabel SetBorder__6Dialogi_800aefd0
    /* 9EFD0 800AEFD0 0800E003 */  jr         $ra
    /* 9EFD4 800AEFD4 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_800aefd0
