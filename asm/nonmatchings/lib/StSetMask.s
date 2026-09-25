.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StSetMask, 0x1C

glabel StSetMask
    /* DFCC 8001DFCC 1480013C */  lui        $at, %hi(StSTART_FLAG)
    /* DFD0 8001DFD0 D09B24AC */  sw         $a0, %lo(StSTART_FLAG)($at)
    /* DFD4 8001DFD4 1380013C */  lui        $at, %hi(StStartFrame)
    /* DFD8 8001DFD8 185225AC */  sw         $a1, %lo(StStartFrame)($at)
    /* DFDC 8001DFDC 1480013C */  lui        $at, %hi(StEndFrame)
    /* DFE0 8001DFE0 0800E003 */  jr         $ra
    /* DFE4 8001DFE4 CC9B26AC */   sw        $a2, %lo(StEndFrame)($at)
endlabel StSetMask
    /* DFE8 8001DFE8 00000000 */  nop
