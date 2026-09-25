.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTextDat__5CFontP7TextDat, 0x8

glabel SetTextDat__5CFontP7TextDat
    /* 79DAC 80089DAC 0800E003 */  jr         $ra
    /* 79DB0 80089DB0 140285AC */   sw        $a1, 0x214($a0)
endlabel SetTextDat__5CFontP7TextDat
