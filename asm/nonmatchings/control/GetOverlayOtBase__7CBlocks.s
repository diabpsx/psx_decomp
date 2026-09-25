.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOverlayOtBase__7CBlocks, 0x8

glabel GetOverlayOtBase__7CBlocks
    /* 276EC 800376EC 0800E003 */  jr         $ra
    /* 276F0 800376F0 E8010224 */   addiu     $v0, $zero, 0x1E8
endlabel GetOverlayOtBase__7CBlocks
