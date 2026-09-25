.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamfull, 0xC

glabel streamfull
    /* 1F2E8 8002F2E8 8C00828C */  lw         $v0, 0x8C($a0)
    /* 1F2EC 8002F2EC 0800E003 */  jr         $ra
    /* 1F2F0 8002F2F0 00000000 */   nop
endlabel streamfull
