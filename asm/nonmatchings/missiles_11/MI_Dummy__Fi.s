.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Dummy__Fi, 0x8

glabel MI_Dummy__Fi
    /* 9480 80143078 0800E003 */  jr         $ra
    /* 9484 8014307C 00000000 */   nop
endlabel MI_Dummy__Fi
