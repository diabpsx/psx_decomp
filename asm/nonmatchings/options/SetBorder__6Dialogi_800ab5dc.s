.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_800ab5dc, 0x8

glabel SetBorder__6Dialogi_800ab5dc
    /* 9B5DC 800AB5DC 0800E003 */  jr         $ra
    /* 9B5E0 800AB5E0 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_800ab5dc
