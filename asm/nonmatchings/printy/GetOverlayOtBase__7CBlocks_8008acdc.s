.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOverlayOtBase__7CBlocks_8008acdc, 0x8

glabel GetOverlayOtBase__7CBlocks_8008acdc
    /* 7ACDC 8008ACDC 0800E003 */  jr         $ra
    /* 7ACE0 8008ACE0 E8010224 */   addiu     $v0, $zero, 0x1E8
endlabel GetOverlayOtBase__7CBlocks_8008acdc
