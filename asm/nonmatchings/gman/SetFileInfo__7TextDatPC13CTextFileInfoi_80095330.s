.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetFileInfo__7TextDatPC13CTextFileInfoi_80095330, 0xC

glabel SetFileInfo__7TextDatPC13CTextFileInfoi_80095330
    /* 85330 80095330 480085AC */  sw         $a1, 0x48($a0)
    /* 85334 80095334 0800E003 */  jr         $ra
    /* 85338 80095338 040086AC */   sw        $a2, 0x4($a0)
endlabel SetFileInfo__7TextDatPC13CTextFileInfoi_80095330
