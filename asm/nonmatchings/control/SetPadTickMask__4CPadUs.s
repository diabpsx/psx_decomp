.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTickMask__4CPadUs, 0x8

glabel SetPadTickMask__4CPadUs
    /* 27604 80037604 0800E003 */  jr         $ra
    /* 27608 80037608 040085A4 */   sh        $a1, 0x4($a0)
endlabel SetPadTickMask__4CPadUs
