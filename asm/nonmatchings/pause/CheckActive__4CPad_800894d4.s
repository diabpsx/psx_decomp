.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckActive__4CPad_800894d4, 0xC

glabel CheckActive__4CPad_800894d4
    /* 794D4 800894D4 01008290 */  lbu        $v0, 0x1($a0)
    /* 794D8 800894D8 0800E003 */  jr         $ra
    /* 794DC 800894DC 00000000 */   nop
endlabel CheckActive__4CPad_800894d4
