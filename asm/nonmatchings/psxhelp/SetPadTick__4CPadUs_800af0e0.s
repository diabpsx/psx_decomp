.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTick__4CPadUs_800af0e0, 0x8

glabel SetPadTick__4CPadUs_800af0e0
    /* 9F0E0 800AF0E0 0800E003 */  jr         $ra
    /* 9F0E4 800AF0E4 030085A0 */   sb        $a1, 0x3($a0)
endlabel SetPadTick__4CPadUs_800af0e0
