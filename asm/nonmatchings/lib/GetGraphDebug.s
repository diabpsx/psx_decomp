.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetGraphDebug, 0x10

glabel GetGraphDebug
    /* 3970 80013970 0B80023C */  lui        $v0, %hi(D_800B54AE)
    /* 3974 80013974 AE544290 */  lbu        $v0, %lo(D_800B54AE)($v0)
    /* 3978 80013978 0800E003 */  jr         $ra
    /* 397C 8001397C 00000000 */   nop
endlabel GetGraphDebug
