.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTickMask__4CPadUs_8009dbc8, 0x8

glabel SetPadTickMask__4CPadUs_8009dbc8
    /* 8DBC8 8009DBC8 0800E003 */  jr         $ra
    /* 8DBCC 8009DBCC 040085A4 */   sh        $a1, 0x4($a0)
endlabel SetPadTickMask__4CPadUs_8009dbc8
