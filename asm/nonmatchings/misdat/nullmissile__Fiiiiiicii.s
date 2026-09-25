.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching nullmissile__Fiiiiiicii, 0x8

glabel nullmissile__Fiiiiiicii
    /* 3EA8C 8004EA8C 0800E003 */  jr         $ra
    /* 3EA90 8004EA90 00000000 */   nop
endlabel nullmissile__Fiiiiiicii
