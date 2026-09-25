.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asynchasio, 0xC

glabel asynchasio
    /* 19108 80029108 DC1C828F */  lw         $v0, %gp_rel(streamhasioflag)($gp)
    /* 1910C 8002910C 0800E003 */  jr         $ra
    /* 19110 80029110 0100422C */   sltiu     $v0, $v0, 0x1
endlabel asynchasio
