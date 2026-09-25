.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlayInGameMovie__FPCc, 0x8

glabel PlayInGameMovie__FPCc
    /* 2DC34 8003DC34 0800E003 */  jr         $ra
    /* 2DC38 8003DC38 00000000 */   nop
endlabel PlayInGameMovie__FPCc
