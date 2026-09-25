.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdReadyCallback, 0x14

glabel CdReadyCallback
    /* AE44 8001AE44 0B80023C */  lui        $v0, %hi(CD_cbready)
    /* AE48 8001AE48 F85E428C */  lw         $v0, %lo(CD_cbready)($v0)
    /* AE4C 8001AE4C 0B80013C */  lui        $at, %hi(CD_cbready)
    /* AE50 8001AE50 0800E003 */  jr         $ra
    /* AE54 8001AE54 F85E24AC */   sw        $a0, %lo(CD_cbready)($at)
endlabel CdReadyCallback
