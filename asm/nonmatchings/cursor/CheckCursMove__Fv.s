.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckCursMove__Fv, 0x8

glabel CheckCursMove__Fv
    /* 27D80 80037D80 0800E003 */  jr         $ra
    /* 27D84 80037D84 00000000 */   nop
endlabel CheckCursMove__Fv
