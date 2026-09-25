.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdReadCallback, 0x14

glabel CdReadCallback
    /* DC94 8001DC94 0B80023C */  lui        $v0, %hi(D_800B621C)
    /* DC98 8001DC98 1C62428C */  lw         $v0, %lo(D_800B621C)($v0)
    /* DC9C 8001DC9C 0B80013C */  lui        $at, %hi(D_800B621C)
    /* DCA0 8001DCA0 0800E003 */  jr         $ra
    /* DCA4 8001DCA4 1C6224AC */   sw        $a0, %lo(D_800B621C)($at)
endlabel CdReadCallback
