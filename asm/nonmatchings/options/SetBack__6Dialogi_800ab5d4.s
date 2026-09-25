.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBack__6Dialogi_800ab5d4, 0x8

glabel SetBack__6Dialogi_800ab5d4
    /* 9B5D4 800AB5D4 0800E003 */  jr         $ra
    /* 9B5D8 800AB5D8 080085AC */   sw        $a1, 0x8($a0)
endlabel SetBack__6Dialogi_800ab5d4
