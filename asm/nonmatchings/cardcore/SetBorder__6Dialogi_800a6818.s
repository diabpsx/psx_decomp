.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_800a6818, 0x8

glabel SetBorder__6Dialogi_800a6818
    /* 96818 800A6818 0800E003 */  jr         $ra
    /* 9681C 800A681C 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_800a6818
