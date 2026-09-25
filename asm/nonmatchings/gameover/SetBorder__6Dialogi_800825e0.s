.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_800825e0, 0x8

glabel SetBorder__6Dialogi_800825e0
    /* 725E0 800825E0 0800E003 */  jr         $ra
    /* 725E4 800825E4 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_800825e0
