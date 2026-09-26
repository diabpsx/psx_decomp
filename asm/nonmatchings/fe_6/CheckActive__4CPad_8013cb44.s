.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckActive__4CPad_8013cb44, 0xC

glabel CheckActive__4CPad_8013cb44
    /* 2F4C 8013CB44 01008290 */  lbu        $v0, 0x1($a0)
    /* 2F50 8013CB48 0800E003 */  jr         $ra
    /* 2F54 8013CB4C 00000000 */   nop
endlabel CheckActive__4CPad_8013cb44
