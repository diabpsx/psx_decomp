.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetName__C13CTextFileInfo, 0xC

glabel GetName__C13CTextFileInfo
    /* 85388 80095388 0000828C */  lw         $v0, 0x0($a0)
    /* 8538C 8009538C 0800E003 */  jr         $ra
    /* 85390 80095390 00000000 */   nop
endlabel GetName__C13CTextFileInfo
