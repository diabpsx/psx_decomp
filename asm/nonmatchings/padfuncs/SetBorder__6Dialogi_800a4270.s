.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_800a4270, 0x8

glabel SetBorder__6Dialogi_800a4270
    /* 94270 800A4270 0800E003 */  jr         $ra
    /* 94274 800A4274 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_800a4270
