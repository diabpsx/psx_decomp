.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReadInitPadFlag, 0x10

glabel ReadInitPadFlag
    /* 1B18 80011B18 0B80023C */  lui        $v0, %hi(D_800B42BC)
    /* 1B1C 80011B1C BC42428C */  lw         $v0, %lo(D_800B42BC)($v0)
    /* 1B20 80011B20 0800E003 */  jr         $ra
    /* 1B24 80011B24 00000000 */   nop
endlabel ReadInitPadFlag
