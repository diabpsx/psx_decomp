.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTick__4CPadUs, 0x8

glabel SetPadTick__4CPadUs
    /* 2760C 8003760C 0800E003 */  jr         $ra
    /* 27610 80037610 030085A0 */   sb        $a1, 0x3($a0)
endlabel SetPadTick__4CPadUs
