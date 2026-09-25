.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Lambo__Fv, 0x8

glabel Lambo__Fv
    /* 8584C 8009584C 0800E003 */  jr         $ra
    /* 85850 80095850 00000000 */   nop
endlabel Lambo__Fv
