.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfCreatures__7TextDat, 0x14

glabel GetNumOfCreatures__7TextDat
    /* 8531C 8009531C 2800828C */  lw         $v0, 0x28($a0)
    /* 85320 80095320 00000000 */  nop
    /* 85324 80095324 1C00428C */  lw         $v0, 0x1C($v0)
    /* 85328 80095328 0800E003 */  jr         $ra
    /* 8532C 8009532C 00000000 */   nop
endlabel GetNumOfCreatures__7TextDat
