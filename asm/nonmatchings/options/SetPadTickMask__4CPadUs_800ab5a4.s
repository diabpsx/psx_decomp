.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPadTickMask__4CPadUs_800ab5a4, 0x8

glabel SetPadTickMask__4CPadUs_800ab5a4
    /* 9B5A4 800AB5A4 0800E003 */  jr         $ra
    /* 9B5A8 800AB5A8 040085A4 */   sh        $a1, 0x4($a0)
endlabel SetPadTickMask__4CPadUs_800ab5a4
