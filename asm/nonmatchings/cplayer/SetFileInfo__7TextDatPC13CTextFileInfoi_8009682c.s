.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetFileInfo__7TextDatPC13CTextFileInfoi_8009682c, 0xC

glabel SetFileInfo__7TextDatPC13CTextFileInfoi_8009682c
    /* 8682C 8009682C 480085AC */  sw         $a1, 0x48($a0)
    /* 86830 80096830 0800E003 */  jr         $ra
    /* 86834 80096834 040086AC */   sw        $a2, 0x4($a0)
endlabel SetFileInfo__7TextDatPC13CTextFileInfoi_8009682c
