.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdSyncCallback, 0x14

glabel CdSyncCallback
    /* AE30 8001AE30 0B80023C */  lui        $v0, %hi(CD_cbsync)
    /* AE34 8001AE34 F45E428C */  lw         $v0, %lo(CD_cbsync)($v0)
    /* AE38 8001AE38 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* AE3C 8001AE3C 0800E003 */  jr         $ra
    /* AE40 8001AE40 F45E24AC */   sw        $a0, %lo(CD_cbsync)($at)
endlabel CdSyncCallback
