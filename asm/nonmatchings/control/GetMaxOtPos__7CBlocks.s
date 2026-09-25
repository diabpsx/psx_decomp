.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMaxOtPos__7CBlocks, 0x8

glabel GetMaxOtPos__7CBlocks
    /* 276F4 800376F4 0800E003 */  jr         $ra
    /* 276F8 800376F8 FF010224 */   addiu     $v0, $zero, 0x1FF
endlabel GetMaxOtPos__7CBlocks
