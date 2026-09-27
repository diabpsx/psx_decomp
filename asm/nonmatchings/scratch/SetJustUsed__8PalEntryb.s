.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetJustUsed__8PalEntryb, 0x8

glabel SetJustUsed__8PalEntryb
    /* 8B26C 8009B26C 0800E003 */  jr         $ra
    /* 8B270 8009B270 2110A000 */   addu      $v0, $a1, $zero
endlabel SetJustUsed__8PalEntryb
