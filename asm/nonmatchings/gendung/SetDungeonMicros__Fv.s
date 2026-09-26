.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDungeonMicros__Fv, 0x8

glabel SetDungeonMicros__Fv
    /* 20470 8015A068 0800E003 */  jr         $ra
    /* 20474 8015A06C 00000000 */   nop
endlabel SetDungeonMicros__Fv
