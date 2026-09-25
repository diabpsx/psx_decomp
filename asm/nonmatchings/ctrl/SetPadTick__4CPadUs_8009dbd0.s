.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTick__4CPadUs_8009dbd0, 0x8

glabel SetPadTick__4CPadUs_8009dbd0
    /* 8DBD0 8009DBD0 0800E003 */  jr         $ra
    /* 8DBD4 8009DBD4 030085A0 */   sb        $a1, 0x3($a0)
endlabel SetPadTick__4CPadUs_8009dbd0
