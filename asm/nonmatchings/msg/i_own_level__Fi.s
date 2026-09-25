.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching i_own_level__Fi, 0x8

glabel i_own_level__Fi
    /* 3FEF0 8004FEF0 0800E003 */  jr         $ra
    /* 3FEF4 8004FEF4 01000224 */   addiu     $v0, $zero, 0x1
endlabel i_own_level__Fi
