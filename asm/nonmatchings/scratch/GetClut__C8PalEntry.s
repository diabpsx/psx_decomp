.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetClut__C8PalEntry, 0xC

glabel GetClut__C8PalEntry
    /* 8B27C 8009B27C 0E008294 */  lhu        $v0, 0xE($a0)
    /* 8B280 8009B280 0800E003 */  jr         $ra
    /* 8B284 8009B284 00000000 */   nop
endlabel GetClut__C8PalEntry
