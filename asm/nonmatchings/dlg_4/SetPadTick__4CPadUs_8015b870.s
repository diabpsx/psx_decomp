.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTick__4CPadUs_8015b870, 0x8

glabel SetPadTick__4CPadUs_8015b870
    /* 21C78 8015B870 0800E003 */  jr         $ra
    /* 21C7C 8015B874 030085A0 */   sb        $a1, 0x3($a0)
endlabel SetPadTick__4CPadUs_8015b870
