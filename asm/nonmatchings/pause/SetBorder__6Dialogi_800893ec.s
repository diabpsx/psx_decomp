.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_800893ec, 0x8

glabel SetBorder__6Dialogi_800893ec
    /* 793EC 800893EC 0800E003 */  jr         $ra
    /* 793F0 800893F0 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_800893ec
