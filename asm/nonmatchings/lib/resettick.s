.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resettick, 0x24

glabel resettick
    /* 20090 80030090 1280013C */  lui        $at, %hi(ticks)
    /* 20094 80030094 78C520AC */  sw         $zero, %lo(ticks)($at)
    /* 20098 80030098 1280023C */  lui        $v0, %hi(ticks)
    /* 2009C 8003009C 78C5428C */  lw         $v0, %lo(ticks)($v0)
    /* 200A0 800300A0 00000000 */  nop
    /* 200A4 800300A4 801E82AF */  sw         $v0, %gp_rel(tickval)($gp)
    /* 200A8 800300A8 7C1E82AF */  sw         $v0, %gp_rel(tickset)($gp)
    /* 200AC 800300AC 0800E003 */  jr         $ra
    /* 200B0 800300B0 00000000 */   nop
endlabel resettick
