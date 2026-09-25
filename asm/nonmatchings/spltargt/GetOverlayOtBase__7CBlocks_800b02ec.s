.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOverlayOtBase__7CBlocks_800b02ec, 0x8

glabel GetOverlayOtBase__7CBlocks_800b02ec
    /* A02EC 800B02EC 0800E003 */  jr         $ra
    /* A02F0 800B02F0 E8010224 */   addiu     $v0, $zero, 0x1E8
endlabel GetOverlayOtBase__7CBlocks_800b02ec
