.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_8009dbf8, 0x8

glabel SetBorder__6Dialogi_8009dbf8
    /* 8DBF8 8009DBF8 0800E003 */  jr         $ra
    /* 8DBFC 8009DBFC 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_8009dbf8
