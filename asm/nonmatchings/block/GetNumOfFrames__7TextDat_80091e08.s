.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfFrames__7TextDat_80091e08, 0x14

glabel GetNumOfFrames__7TextDat_80091e08
    /* 81E08 80091E08 2800828C */  lw         $v0, 0x28($a0)
    /* 81E0C 80091E0C 00000000 */  nop
    /* 81E10 80091E10 20004294 */  lhu        $v0, 0x20($v0)
    /* 81E14 80091E14 0800E003 */  jr         $ra
    /* 81E18 80091E18 00000000 */   nop
endlabel GetNumOfFrames__7TextDat_80091e08
