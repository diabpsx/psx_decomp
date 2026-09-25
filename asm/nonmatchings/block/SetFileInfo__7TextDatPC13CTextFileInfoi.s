.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetFileInfo__7TextDatPC13CTextFileInfoi, 0xC

glabel SetFileInfo__7TextDatPC13CTextFileInfoi
    /* 81DFC 80091DFC 480085AC */  sw         $a1, 0x48($a0)
    /* 81E00 80091E00 0800E003 */  jr         $ra
    /* 81E04 80091E04 040086AC */   sw        $a2, 0x4($a0)
endlabel SetFileInfo__7TextDatPC13CTextFileInfoi
