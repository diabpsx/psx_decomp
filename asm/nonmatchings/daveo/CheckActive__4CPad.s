.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckActive__4CPad, 0xC

glabel CheckActive__4CPad
    /* 75840 80085840 01008290 */  lbu        $v0, 0x1($a0)
    /* 75844 80085844 0800E003 */  jr         $ra
    /* 75848 80085848 00000000 */   nop
endlabel CheckActive__4CPad
