.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckActive__4CPad_80089c10, 0xC

glabel CheckActive__4CPad_80089c10
    /* 79C10 80089C10 01008290 */  lbu        $v0, 0x1($a0)
    /* 79C14 80089C14 0800E003 */  jr         $ra
    /* 79C18 80089C18 00000000 */   nop
endlabel CheckActive__4CPad_80089c10
