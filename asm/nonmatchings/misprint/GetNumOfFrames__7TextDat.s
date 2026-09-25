.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfFrames__7TextDat, 0x14

glabel GetNumOfFrames__7TextDat
    /* 6D5C8 8007D5C8 2800828C */  lw         $v0, 0x28($a0)
    /* 6D5CC 8007D5CC 00000000 */  nop
    /* 6D5D0 8007D5D0 20004294 */  lhu        $v0, 0x20($v0)
    /* 6D5D4 8007D5D4 0800E003 */  jr         $ra
    /* 6D5D8 8007D5D8 00000000 */   nop
endlabel GetNumOfFrames__7TextDat
