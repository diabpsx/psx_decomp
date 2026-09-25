.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdSetDebug, 0x14

glabel CdSetDebug
    /* AD74 8001AD74 0B80023C */  lui        $v0, %hi(CD_debug)
    /* AD78 8001AD78 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* AD7C 8001AD7C 0B80013C */  lui        $at, %hi(CD_debug)
    /* AD80 8001AD80 0800E003 */  jr         $ra
    /* AD84 8001AD84 005F24AC */   sw        $a0, %lo(CD_debug)($at)
endlabel CdSetDebug
