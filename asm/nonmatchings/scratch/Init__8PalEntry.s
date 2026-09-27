.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init__8PalEntry, 0x8

glabel Init__8PalEntry
    /* 8B274 8009B274 0800E003 */  jr         $ra
    /* 8B278 8009B278 120080A4 */   sh        $zero, 0x12($a0)
endlabel Init__8PalEntry
