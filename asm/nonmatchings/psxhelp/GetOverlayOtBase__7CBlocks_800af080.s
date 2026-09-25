.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOverlayOtBase__7CBlocks_800af080, 0x8

glabel GetOverlayOtBase__7CBlocks_800af080
    /* 9F080 800AF080 0800E003 */  jr         $ra
    /* 9F084 800AF084 E8010224 */   addiu     $v0, $zero, 0x1E8
endlabel GetOverlayOtBase__7CBlocks_800af080
