.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SCR_GetBlackClut__Fv, 0xC

glabel SCR_GetBlackClut__Fv
    /* 8AC78 8009AC78 A4068297 */  lhu        $v0, %gp_rel(ShadClut)($gp)
    /* 8AC7C 8009AC7C 0800E003 */  jr         $ra
    /* 8AC80 8009AC80 00000000 */   nop
endlabel SCR_GetBlackClut__Fv
