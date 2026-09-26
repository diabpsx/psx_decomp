.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTickMask__4CPadUs_8015b868, 0x8

glabel SetPadTickMask__4CPadUs_8015b868
    /* 21C70 8015B868 0800E003 */  jr         $ra
    /* 21C74 8015B86C 040085A4 */   sh        $a1, 0x4($a0)
endlabel SetPadTickMask__4CPadUs_8015b868
