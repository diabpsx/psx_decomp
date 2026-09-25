.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_800825d8, 0x8

glabel SetBack__6Dialogi_800825d8
    /* 725D8 800825D8 0800E003 */  jr         $ra
    /* 725DC 800825DC 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_800825d8
