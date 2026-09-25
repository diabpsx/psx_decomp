.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTick__4CPadUs_800ab5ac, 0x8

glabel SetPadTick__4CPadUs_800ab5ac
    /* 9B5AC 800AB5AC 0800E003 */  jr         $ra
    /* 9B5B0 800AB5B0 030085A0 */   sb        $a1, 0x3($a0)
endlabel SetPadTick__4CPadUs_800ab5ac
