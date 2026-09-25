.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTickMask__4CPadUs_800af0d8, 0x8

glabel SetPadTickMask__4CPadUs_800af0d8
    /* 9F0D8 800AF0D8 0800E003 */  jr         $ra
    /* 9F0DC 800AF0DC 040085A4 */   sh        $a1, 0x4($a0)
endlabel SetPadTickMask__4CPadUs_800af0d8
