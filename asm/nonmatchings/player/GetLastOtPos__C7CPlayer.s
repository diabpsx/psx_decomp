.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLastOtPos__C7CPlayer, 0xC

glabel GetLastOtPos__C7CPlayer
    /* 57490 80067490 8C00828C */  lw         $v0, 0x8C($a0)
    /* 57494 80067494 0800E003 */  jr         $ra
    /* 57498 80067498 00000000 */   nop
endlabel GetLastOtPos__C7CPlayer
