.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfFrames__7TextDat_8009533c, 0x14

glabel GetNumOfFrames__7TextDat_8009533c
    /* 8533C 8009533C 2800828C */  lw         $v0, 0x28($a0)
    /* 85340 80095340 00000000 */  nop
    /* 85344 80095344 20004294 */  lhu        $v0, 0x20($v0)
    /* 85348 80095348 0800E003 */  jr         $ra
    /* 8534C 8009534C 00000000 */   nop
endlabel GetNumOfFrames__7TextDat_8009533c
